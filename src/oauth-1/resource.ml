type realm = string

type path = Uri.path

type query = Uri.query

type t = private
  { realm : realm
  ; path  : path
  ; query : query
  }

let cons ~realm ~uri =
  Utils.not_implemented ()
