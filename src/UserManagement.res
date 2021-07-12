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
