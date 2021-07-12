open Library
open Catalog
open UserManagement
open Belt

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
      purchaseDate: "1999-01-01",
    },
    {
      id: "book-item-2",
      rackId: "rack-17",
      isLent: false,
      purchaseDate: "1980-01-01",
    },
  ],
}

let sampleCatalog: Catalog.t = {
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
            purchaseDate: "1999-01-01",
          },
          {
            id: "book-item-2",
            rackId: "rack-17",
            isLent: false,
            purchaseDate: "1980-01-01",
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

let userManagementData: UserManagement.t = {
  librariansByEmail: Map.String.empty->Map.String.set(
    "franck@gmail.com",
    (
      {
        email: "franck@gmail.com",
        encryptedPassword: "bXlwYXNzd29yZA==",
      }: Librarian.t
    ),
  ),
  membersByEmail: Map.String.empty->Map.String.set(
    "samantha@gmail.com",
    (
      {
        email: "samantha@gmail.com",
        encryptedPassword: "c2VjcmV0",
        isBlocked: false,
        bookLendings: [
          {
            bookItemId: "book-item-1",
            bookIsbn: "978-1779501127",
            lendingDate: "2020-04-23",
          },
        ],
        isVIP: false,
        isSuper: false,
      }: Member.t
    ),
  ),
}

let libraryData: Library.t = {
  name: "The smallest library on earth",
  address: "Here and now",
  catalog: sampleCatalog,
  userManagement: userManagementData,
}
