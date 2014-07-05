type realm = private string

type uri = private Uri.t

type t = private
  { realm : realm
  ; uri   : uri
  }

val cons : realm:string -> uri:Uri.t -> t

val get_uri : t -> Uri.t
