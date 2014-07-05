(* We actually want the type of the verifier to be
 * Server.Authorization_verifier.t, but referencing Server results in a circular
 * build. Can we handle this better somehow? *)
val ready : token:Credentials.Temp.id -> verifier:string -> unit
