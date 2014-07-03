(* We actually want the type of the verifier to be
 * Server.Authorization_verifier.t, but referencing Server results in a circular
 * build. Can we handle this better somehow? *)
type callback = (token:Credentials.Temp.id -> verifier:string -> unit)

val ready : callback
