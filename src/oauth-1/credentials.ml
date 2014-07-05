module Make (Unit : sig end) : sig
  type id = private string

  type secret = private string

  type t = private
    { id     : id
    ; secret : secret
    }

  val generate : unit -> t

  val secret_to_string : secret -> string
end = struct
  type id = string

  type secret = string

  type t = private
    { id     : id
    ; secret : secret
    }

  let generate () =
    Utils.not_implemented ()

  let secret_to_string s =
    s
end

module Client = Make (struct end)
module Temp   = Make (struct end)
module Token  = Make (struct end)
