open Belt

module BookItems = {
  type t = {
    id: string,
    rackId: string,
    purchaseDate: string,
    isLent: bool,
  }
}

module Book = {
  type t = {
    title: string,
    publicationYear: int,
    isbn: string,
    //    publisher: string,
    authorIds: array<string>, // collection
    bookItems: array<BookItems.t>,
  }
}

module Author = {
  type t = {
    name: string,
    bookIsbns: array<string>, // collection
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

let authorNames = (cat: t, book: Book.t) => {
  book.authorIds->Array.map(x => {
    (cat.authorsById->Map.String.get(_, x)->Option.getExn).name
  })
}

module BookInfo = {
  type t = {
    title: string,
    isbn: string,
    authorNames: array<string>,
  }
}

let bookInfo = (cat: t, book: Book.t): BookInfo.t => {
  {
    title: book.title,
    isbn: book.isbn,
    authorNames: authorNames(cat, book),
  }
}

let searchBooksByTitle = (cat: t, query): array<BookInfo.t> => {
  cat.booksByIsbn
  ->Map.String.keep((_, v) => {
    v.title->Js.String2.includes(_, query)
  })
  ->Map.String.map(v => bookInfo(cat, v))
  ->Map.String.valuesToArray
}
