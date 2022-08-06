(* Requests Tests *)

let not_htmx () =
  Alcotest.(check bool) "Not htmx" false (Dream_htmx.is_htmx @@ Dream.request "")

let is_htmx () =
  Alcotest.(check bool)
    "Is Htmx" true
    (Dream_htmx.is_htmx @@ Dream.request ~headers:[ ("HX-Request", "true") ] "")

let get_trigger_id () =
  Alcotest.(check @@ option string)
    "Trigger id" (Some "my_id")
    (Dream_htmx.trigger @@ Dream.request ~headers:[ ("HX-Trigger", "my_id") ] "")

let get_trigger_name () =
  Alcotest.(check @@ option string)
    "Trigger name" (Some "my_name")
    (Dream_htmx.trigger_name
    @@ Dream.request ~headers:[ ("HX-Trigger-Name", "my_name") ] "")

let get_target () =
  Alcotest.(check @@ option string)
    "Target" (Some "target_id")
    (Dream_htmx.target
    @@ Dream.request ~headers:[ ("HX-Target", "target_id") ] "")

let get_prompt () =
  Alcotest.(check @@ option string)
    "Promt" (Some "the_prompt")
    (Dream_htmx.prompt
    @@ Dream.request ~headers:[ ("HX-Prompt", "the_prompt") ] "")

(* Responses Tests *)

let set_htmx_header fn expected_header =
  let response = Dream.response "" in
  fn response;
  Dream.header response expected_header

let push () =
  Alcotest.(check @@ option string)
    "Header is set" (Some "my_url")
    (set_htmx_header (Dream_htmx.push "my_url") "HX-Push")

let redirect () =
  Alcotest.(check @@ option string)
    "Header is set" (Some "my_url")
    (set_htmx_header (Dream_htmx.redirect "my_url") "HX-Redirect")

let set_location () =
  Alcotest.(check @@ option string)
    "Header is set" (Some "my_url")
    (set_htmx_header (Dream_htmx.set_location "my_url") "HX-Location")

let refresh () =
  Alcotest.(check @@ option string)
    "Header is set" (Some "true")
    (set_htmx_header Dream_htmx.refresh "HX-Refresh")

let trigger () =
  Alcotest.(check @@ option string)
    "Header is set" (Some "event")
    (set_htmx_header (Dream_htmx.set_trigger "event") "HX-Trigger")

let trigger_swap () =
  Alcotest.(check @@ option string)
    "Header is set" (Some "event")
    (set_htmx_header
       (Dream_htmx.set_trigger_after_swap "event")
       "HX-Trigger-After-Swap")

let trigger_settle () =
  Alcotest.(check @@ option string)
    "Header is set" (Some "event")
    (set_htmx_header
       (Dream_htmx.set_trigger_after_settle "event")
       "HX-Trigger-After-Settle")

let () =
  Alcotest.run "Utils"
    [
      ( "Requests",
        [
          Alcotest.test_case "Default request" `Quick not_htmx;
          Alcotest.test_case "Is Htmx" `Quick is_htmx;
          Alcotest.test_case "Trigger" `Quick get_trigger_id;
          Alcotest.test_case "Trigger Name" `Quick get_trigger_name;
          Alcotest.test_case "Target" `Quick get_target;
          Alcotest.test_case "Prompt" `Quick get_prompt;
        ] );
      ( "Responses",
        [
          Alcotest.test_case "Push" `Quick push;
          Alcotest.test_case "Redirect" `Quick redirect;
          Alcotest.test_case "Location" `Quick set_location;
          Alcotest.test_case "Refresh" `Quick refresh;
          Alcotest.test_case "Trigger" `Quick trigger;
          Alcotest.test_case "Trigger after swap" `Quick trigger_swap;
          Alcotest.test_case "Trigger after settle" `Quick trigger_settle;
        ] );
    ]
