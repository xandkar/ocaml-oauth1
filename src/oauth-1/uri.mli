type t = private
  { scheme : string
  ; host   : string
  ; port   : int
  ; path   : string
  }

type parsing_error =
  | Parsing_error

val of_string : string -> [`Ok of t | `Error of parsing_error]

val to_string : t -> string
