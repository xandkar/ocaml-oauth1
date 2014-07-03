module Error = struct
  type bad_request =
    | Parameters_unsupported
    | Parameters_missing
    | Parameters_duplicated
    | Signature_method_unsupported

  type unauthorized =
    | Signature_invalid
    | Client_credentials_invalid
    | Token_invalid
    | Token_expired
    | Nonce_invalid
    | Nonce_used

  type t =
    | Bad_request  of bad_request
    | Unauthorized of unauthorized
end

module Authorization_verifier = struct
  type t = string
end

type callback_confirmed = bool

let register () =
  let creds = Credentials.Client.generate () in
  (* Then store creds on disk somewhere... *)
  creds

let initiate
  ~realm
  ~consumer_key
  ~signature
  ~signature_method
  ~timestamp
  ~nonce
  ~callback
  =
  Utils.not_implemented ()

let authorize ~token =
  Utils.not_implemented ()

let token
  ~realm
  ~consumer_key
  ~token
  ~signature
  ~signature_method
  ~timestamp
  ~nonce
  ~verifier
  =
  Utils.not_implemented ()
