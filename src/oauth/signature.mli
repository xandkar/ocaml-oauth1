module Method : sig
  type t =
    | HMAC_SHA1
  (*| RSA_SHA1*)
  (*| PLAINTEXT*)

  val to_string : t -> string
end

module Base_string : sig
  type t = private string

  val cons
    : http_req_method    : Http_request.Method.t
   -> http_req_host      : Http_request.Host.t
   -> resource_uri_path  : Resource.path
   -> resource_uri_query : Resource.query
   -> resource_realm     : Resource.realm
   -> consumer_key       : Credentials.Client.id
   -> signature_method   : Method.t
   -> timestamp          : Timestamp.t
   -> nonce              : Nonce.t
   -> t
end

module Key : sig
  type t = private string

  val cons
    : client_shared_secret : Credentials.Client.secret
   -> token_shared_secret  : [ `Client of Credentials.Client.secret
                             | `Temp   of Credentials.Temp.secret
                             | `Token  of Credentials.Token.secret
                             ]
   -> t
end

type value = private string

type t = private
  { value : value
  ; meth  : Method.t
  }

val digest
  : meth : Method.t
 -> key  : Key.t
 -> text : Base_string.t
 -> t
