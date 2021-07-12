type t = {
  name: string,
  address: string,
  catalog: Catalog.t,
  userManagement: UserManagement.t,
}

let searchBooksByTitleJSON = (library: t, query): option<string> => {
  library.catalog->Catalog.searchBooksByTitle(_, query)->Js.Json.stringifyAny
}

exception AlreadyExist

let addMember = (library: t, member) => {
  let currentUserManagement = library.userManagement
  let nextUserManagement = switch currentUserManagement->UserManagement.addMember(member) {
  | Ok(u) => u
  | Error(AlreadyExist) => raise(AlreadyExist) // convert an error to exception
  }
  let nextLibrary = {...library, userManagement: nextUserManagement}
  nextLibrary
}
