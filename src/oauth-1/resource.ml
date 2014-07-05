type realm = string

type uri = Uri.t

type t = private
  { realm : realm
  ; uri   : uri
  }

let cons ~realm ~uri =
  Utils.not_implemented ()

let get_uri {uri} =
  uri
