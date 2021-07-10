open Belt

module Users = {

}

module BookLending = {
  type t = {
    bookItemId: string,
    bookIsbn: string,
    lendingDate: string,
  }
}
module Member = {
  type t = {
    email: string,
    encryptedPassword: string,
    isBlocked: bool,
    bookLendings: array<BookLending.t>,
  }
}

module Librarian = {
  type t = {
    email: string,
    encryptedPassword: string,
  }
}

type t = {
  librarians: Map.String.t<Librarian.t>,
  members: Map.String.t<Member.t>,
}
