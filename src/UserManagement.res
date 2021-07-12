open Belt

module Users = {

}

module BookLending = {
  type t = {
    lendingDate: string,
    bookItemId: string,
    bookIsbn: string,
  }
}

module Member = {
  type t = {
    email: string,
    encryptedPassword: string,
    isBlocked: bool,
    bookLendings: array<BookLending.t>,
    // feature fields
    isVIP: bool,
    isSuper: bool,
  }
}

module Librarian = {
  type t = {
    email: string,
    encryptedPassword: string,
  }
}

type t = {
  librariansByEmail: Map.String.t<Librarian.t>,
  membersByEmail: Map.String.t<Member.t>,
}

let isVIPMember = (userManagement: t, email) => {
  (userManagement.membersByEmail->Map.String.get(_, email)->Option.getExn).isVIP
}

let isSuperMember = (userManagement: t, email) => {
  (userManagement.membersByEmail->Map.String.get(_, email)->Option.getExn).isSuper
}

type error = AlreadyExist

type result = Belt.Result.t<t, error>

let addMember = (userManagement: t, member: Member.t): result => {
  switch userManagement.membersByEmail->Map.String.get(_, member.email) {
  | Some(u) =>
    u->ignore // so slient compiler warning
    Error(AlreadyExist)
  | None =>
    Ok({
      librariansByEmail: userManagement.librariansByEmail,
      membersByEmail: Map.String.set(userManagement.membersByEmail, member.email, member),
    })
  }
}
