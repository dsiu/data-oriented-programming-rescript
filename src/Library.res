type t = {
  name: string,
  address: string,
  catalog: Catalog.t,
  userManagement: UserManagement.t,
}

let searchBooksByTitleJSON = (library: t, query): option<string> => {
  library.catalog->Catalog.searchBooksByTitle(_, query)->Js.Json.stringifyAny
}
