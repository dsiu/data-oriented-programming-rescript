open Example_Data

let log = Js.Console.log
let r = Catalog.authorNames(sampleCatalog, watchmen)
"authorNames"->log
r->log

let bi = Catalog.bookInfo(sampleCatalog, watchmen)
"bookInfo"->log
bi->log

let s1 = Catalog.searchBooksByTitle(sampleCatalog, "danny")
"searchBooksByTitle s1"->log
s1->log
let s2 = Catalog.searchBooksByTitle(sampleCatalog, "tch")
"searchBooksByTitle s2"->log
s2->log
let s3 = Library.searchBooksByTitleJSON(libraryData, "tch")
"searchBooksByTitleJSON s3"->log
s3->log
