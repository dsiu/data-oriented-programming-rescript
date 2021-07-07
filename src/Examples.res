open Belt
open Catalog

//
//Data Oriented Map initialized by data
//
let watchmen: Book.t = {
  isbn: "978-1779501127",
  title: "Watchmen",
  publicationYear: 1987,
  authorIds: ["alan-moore", "dave-gibbons"],
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

let sampleCatalog: t = {
  booksByIsbn: Map.String.empty->Map.String.set(
    "978-1779501127",
    (
      {
        isbn: "978-1779501127",
        title: "Watchmen",
        publicationYear: 1987,
        authorIds: ["alan-moore", "dave-gibbons"],
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
      }: Book.t
    ),
  ),
  authorsById: Map.String.empty
  ->Map.String.set(
    "alan-moore",
    (
      {
        name: "Alan Moore",
        bookIsbns: ["978-1779501127"],
      }: Author.t
    ),
  )
  ->Map.String.set(
    "dave-gibbons",
    {
      name: "Dave Gibbons",
      bookIsbns: ["978-1779501127"],
    },
  ),
}

let log = Js.Console.log
let r = authorNames(sampleCatalog, watchmen)
"authorNames"->log
r->log

let bi = bookInfo(sampleCatalog, watchmen)
"bookInfo"->log
bi->log

let s1 = searchBooksByTitle(sampleCatalog, "danny")
"searchBooksByTitle s1"->log
s1->log
let s2 = searchBooksByTitle(sampleCatalog, "tch")
"searchBooksByTitle s2"->log
s2->log
