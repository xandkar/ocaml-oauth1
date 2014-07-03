type callback = (token:Credentials.Temp.id -> verifier:string -> unit)

let ready ~token ~verifier =
  Utils.not_implemented ()
