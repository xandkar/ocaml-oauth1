module Method = struct
  type t =
    | HMAC_SHA1
  (*| RSA_SHA1*)
  (*| PLAINTEXT*)

  let to_string = function
    | HMAC_SHA1 -> "HMAC_SHA1"
end

module Base_string :sig
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
end = struct
  type t = string

  let cons
    ~http_req_method
    ~http_req_host
    ~resource_uri_path
    ~resource_uri_query
    ~resource_realm
    ~consumer_key
    ~signature_method
    ~timestamp
    ~nonce
    =
    Utils.not_implemented ()
end

module Key :sig
  type t = private string

  val cons
    : client_shared_secret : Credentials.Client.secret
   -> token_shared_secret  : [ `Client of Credentials.Client.secret
                             | `Temp   of Credentials.Temp.secret
                             | `Token  of Credentials.Token.secret
                             ]
   -> t
end = struct
  type t = private string

  let cons
    ~client_shared_secret
    ~token_shared_secret
    =
    Utils.not_implemented ()
end

module Digest : sig
  type value = private string

  type t = private
    { value : value
    ; meth  : Method.t
    }

  val cons
    : meth : Method.t
   -> key  : Key.t
   -> text : Base_string.t
   -> t
end = struct
  type value = string

  type t =
    { value : value
    ; meth  : Method.t
    }

  let cons ~meth ~key ~text =
    match meth with
    | Method.HMAC_SHA1 ->
      Utils.not_implemented ()
end

type value = Digest.value

type t =
  { value : Digest.value
  ; meth  : Method.t
  }

let cons
  ~meth
  ~http_req_method
  ~http_req_host
  ~resource_uri_path
  ~resource_uri_query
  ~resource_realm
  ~consumer_key
  ~timestamp
  ~nonce
  =
  Utils.not_implemented ()
