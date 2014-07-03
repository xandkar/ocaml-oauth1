type realm = private string

type path = private Uri.path

type query = private Uri.query

type t = private
  { realm : realm
  ; path  : path
  ; query : query
  }

val cons : realm:string -> uri:Uri.t -> t
