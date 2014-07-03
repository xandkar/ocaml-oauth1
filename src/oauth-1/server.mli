module Error : sig
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

module Authorization_verifier : sig
  type t = private string
end

type callback_confirmed = bool

val register : unit -> Credentials.Client.t

val initiate
  : realm            : Resource.realm
 -> consumer_key     : Credentials.Client.id
 -> signature        : Signature.value
 -> signature_method : Signature.Method.t
 -> timestamp        : Timestamp.t
 -> nonce            : Nonce.t
 -> callback         : Client.callback
 -> [ `Ok    of Credentials.Temp.t * callback_confirmed
    | `Error of Error.t
    ]

val authorize
  : token:Credentials.Temp.id
 -> [ `Ok    of Credentials.Temp.id * Authorization_verifier.t
    | `Error of Error.t  (* Should actually be just a subset of errors *)
    ]

val token
  : realm            : Resource.realm
 -> consumer_key     : Credentials.Client.id
 -> token            : Credentials.Temp.id
 -> signature        : Signature.value
 -> signature_method : Signature.Method.t
 -> timestamp        : Timestamp.t
 -> nonce            : Nonce.t
 -> verifier         : Authorization_verifier.t
 -> [ `Ok    of Credentials.Token.t
    | `Error of Error.t
    ]
