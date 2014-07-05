module Method : sig
  type t = private string

  val to_string : t -> string
end

module Host : sig
  type t = private string
end
