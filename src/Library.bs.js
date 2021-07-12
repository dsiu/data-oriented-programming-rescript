// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Caml_exceptions = require("rescript/lib/js/caml_exceptions.js");
var Catalog$DopRescript = require("./Catalog.bs.js");
var UserManagement$DopRescript = require("./UserManagement.bs.js");

function searchBooksByTitleJSON(library, query) {
  return JSON.stringify(Catalog$DopRescript.searchBooksByTitle(library.catalog, query));
}

var AlreadyExist = /* @__PURE__ */Caml_exceptions.create("Library-DopRescript.AlreadyExist");

function addMember(library, member) {
  var currentUserManagement = library.userManagement;
  var u = UserManagement$DopRescript.addMember(currentUserManagement, member);
  var nextUserManagement;
  if (u.TAG === /* Ok */0) {
    nextUserManagement = u._0;
  } else {
    throw {
          RE_EXN_ID: AlreadyExist,
          Error: new Error()
        };
  }
  return {
          name: library.name,
          address: library.address,
          catalog: library.catalog,
          userManagement: nextUserManagement
        };
}

exports.searchBooksByTitleJSON = searchBooksByTitleJSON;
exports.AlreadyExist = AlreadyExist;
exports.addMember = addMember;
/* No side effect */
