//
// System is a singleton stateful class that implements the mutations.
// SystemState is a singleton stateful class that manages the system state
//
// see : Data-Oriented Programming Page 113
//

module SystemState = {
  type t = {systemState: Library.t}

  let get = t => t.systemState

  let validate = (previous, next): Belt.Result.t<Library.t, string> => {
    previous->ignore
    Ok(next)
  }

  let commit = (previous, next) => {
    switch validate(previous, next) {
    | Ok(s) => {systemState: s}
    | Error(e) => raise(e->Js.Exn.raiseError)
    }
  }

  let make = library => {systemState: library}
}

let globalState = ref(({systemState: Example_Data.libraryData}: SystemState.t))

let wrapWithState = (f, arg1) => {
  let previous = globalState.contents->SystemState.get
  let next = previous->f(_, arg1)
  globalState.contents = globalState.contents->SystemState.commit(_, next)
}

let addMember = member => wrapWithState(Library.addMember, member)
