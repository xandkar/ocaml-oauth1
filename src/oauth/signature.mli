module Method : sig
  type t =
    | HMAC_SHA1
  (*| RSA_SHA1*)
  (*| PLAINTEXT*)

  val to_string : t -> string
end

type value = private string

type t = private
  { value : value
  ; meth  : Method.t
  }

val cons
  : meth               : Method.t
 -> http_req_method    : Http_request.Method.t
 -> http_req_host      : Http_request.Host.t
 -> resource_uri_path  : Resource.path
 -> resource_uri_query : Resource.query
 -> resource_realm     : Resource.realm
 -> consumer_key       : Credentials.Client.id
 -> timestamp          : Timestamp.t
 -> nonce              : Nonce.t
 -> t
