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
 -> resource_uri       : Resource.uri
 -> resource_realm     : Resource.realm
 -> consumer_key       : Credentials.Client.id
 -> client_shared_secret : Credentials.Client.secret
 -> token_shared_secret  : [ `Client of Credentials.Client.secret
                           | `Temp   of Credentials.Temp.secret
                           | `Token  of Credentials.Token.secret
                           ]
 -> timestamp          : Timestamp.t
 -> nonce              : Nonce.t
 -> t
