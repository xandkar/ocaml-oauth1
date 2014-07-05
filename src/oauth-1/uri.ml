type t =
  { scheme : string
  ; host   : string
  ; port   : int
  ; path   : string
  }

type parsing_error =
  | Parsing_error

let of_string s =
  Utils.not_implemented ()

let to_string _ =
  Utils.not_implemented ()
