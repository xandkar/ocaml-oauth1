module Method = struct
  type t =
    | HMAC_SHA1
  (*| RSA_SHA1*)
  (*| PLAINTEXT*)

  let to_string = function
    | HMAC_SHA1 -> "HMAC_SHA1"
end

module Base_string_uri : sig
  type t = string

  val cons : scheme:string -> host:string -> port:int -> path:string -> t
end = struct
  type t = string

  let cons ~scheme ~host ~port ~path =
    Utils.not_implemented ()
end

module Base_string :sig
  type t = private string

  val cons
    : http_req_method    : Http_request.Method.t
   -> http_req_host      : Http_request.Host.t
   -> resource_uri       : Resource.uri
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
    ~resource_uri
    ~resource_realm
    ~consumer_key
    ~signature_method
    ~timestamp
    ~nonce
    =
    let meth =
      Utils.percent_encode (Http_request.Method.to_string http_req_method)
    in
    let uri =
      let scheme = Utils.not_implemented () in
      let host   = Utils.not_implemented () in
      let port   = Utils.not_implemented () in
      let path   = Utils.not_implemented () in
      Base_string_uri.cons ~scheme ~host ~port ~path
    in
    let parameters =
      Utils.not_implemented ()
    in
    meth ^ "&" ^ uri ^ "&" ^ parameters
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
  type t = string

  let cons
    ~client_shared_secret
    ~token_shared_secret
    =
    let client_shared_secret =
      Credentials.Client.secret_to_string client_shared_secret
    in
    let token_shared_secret =
      match token_shared_secret with
      | `Client s -> Credentials.Client.secret_to_string s
      | `Temp   s -> Credentials.Temp.secret_to_string s
      | `Token  s -> Credentials.Token.secret_to_string s
    in
    (Utils.percent_encode client_shared_secret)
    ^ "&" ^
    (Utils.percent_encode token_shared_secret)
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
  ~resource_uri
  ~resource_realm
  ~consumer_key
  ~client_shared_secret
  ~token_shared_secret
  ~timestamp
  ~nonce
  =
  let key = Key.cons ~client_shared_secret ~token_shared_secret in
  let text =
    Base_string.cons
      ~http_req_method
      ~http_req_host
      ~resource_uri
      ~resource_realm
      ~consumer_key
      ~signature_method:meth
      ~timestamp
      ~nonce
  in
  let digest = Digest.cons ~meth ~key ~text in
  { value = digest.Digest.value
  ; meth  = digest.Digest.meth
  }
