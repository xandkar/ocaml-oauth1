module Method = struct
  type t =
    | HMAC_SHA1
  (*| RSA_SHA1*)
  (*| PLAINTEXT*)

  let to_string = function
    | HMAC_SHA1 -> "HMAC_SHA1"
end

module Base_string = struct
  type t = private string

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

module Key = struct
  type t = private string

  let cons
    ~client_shared_secret
    ~token_shared_secret
    =
    Utils.not_implemented ()
end

type value = string

type t =
  { value : value
  ; meth  : Method.t
  }

let digest ~meth ~key ~text =
  Utils.not_implemented ()
