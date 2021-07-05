open Belt

module BookItems = {
  type t = {
    id: string,
    rackId: string,
    //  purchaseDate: string,
    isLent: bool,
  }
}

module Book = {
  type t = {
    title: string,
    publicationYear: int,
    isbn: string,
    //    publisher: string,
    authors: array<string>, // collection
    bookItems: array<BookItems.t>,
  }
}

module Author = {
  type t = {
    name: string,
    books: array<string>, // collection
  }
}

module BookLendings = {
  type t = {lendingDate: string}
}

// needs bookByISBN index
// needs Author index (author name in lower case with dashes joined

type t = {
  booksByIsbn: Map.String.t<Book.t>, // indexes
  authorsById: Map.String.t<Author.t>, // iindexes
}

let watchmen: Book.t = {
  isbn: "978-1779501127",
  title: "Watchmen",
  publicationYear: 1987,
  authors: ["alan-moore", "dave-gibbons"],
  bookItems: [
    {
      id: "book-item-1",
      rackId: "rack-17",
      isLent: true,
    },
    {
      id: "book-item-2",
      rackId: "rack-17",
      isLent: false,
    },
  ],
}
