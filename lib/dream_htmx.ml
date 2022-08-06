(* Requests *)
let is_htmx req =
  Dream.header req "HX-Request"
  |> Option.map String.lowercase_ascii
  |> Option.map (String.equal "true")
  |> Option.value ~default:false

let trigger req = Dream.header req "HX-Trigger"
let trigger_name req = Dream.header req "HX-Trigger-Name"
let target req = Dream.header req "HX-Target"
let prompt req = Dream.header req "HX-Prompt"

(* Responses *)
let push url response = Dream.set_header response "HX-Push" url
let redirect url response = Dream.set_header response "HX-Redirect" url
let set_location url response = Dream.set_header response "HX-Location" url
let refresh response = Dream.set_header response "HX-Refresh" "true"
let set_trigger event response = Dream.add_header response "HX-Trigger" event

let set_trigger_after_swap event response =
  Dream.add_header response "HX-Trigger-After-Swap" event

let set_trigger_after_settle event response =
  Dream.add_header response "HX-Trigger-After-Settle" event
