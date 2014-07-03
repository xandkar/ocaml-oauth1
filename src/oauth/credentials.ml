module Make (Unit : sig end) : sig
  type id = private string

  type secret = private string

  type t = private
    { id     : id
    ; secret : secret
    }

  val generate : unit -> t
end = struct
  type id = string

  type secret = string

  type t = private
    { id     : id
    ; secret : secret
    }

  let generate () =
    Utils.not_implemented ()
end

module Client = Make (struct end)
module Temp   = Make (struct end)
module Token  = Make (struct end)
