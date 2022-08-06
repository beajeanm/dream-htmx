(** This module provides utilities to deal with Htmx requests/responses.

    @see <https://htmx.org/docs/#requests> *)

(** Requests *)

val is_htmx : Dream.request -> bool
(** [is_htmx request] will be true if the request has been issued by htmx. *)

val trigger : Dream.request -> string option
(** [trigger request] gives the id of the element which trigger the request if
    available. *)

val trigger_name : Dream.request -> string option
(** [trigger_name request] gives the name of the element which trigger the
    request if available. *)

val target : Dream.request -> string option
(** [target request] gives the id of the target element if available. *)

val prompt : Dream.request -> string option
(** [prompt request] is the value entered by the user when prompted via
    hx-prompt. *)

(** Responses *)

val push : string -> Dream.response -> unit
(** [push url] pushes a new URL into the browser’s address bar. *)

val redirect : string -> Dream.response -> unit
(** [redirect url] triggers a client-side redirect to a new location. *)

val set_location : string -> Dream.response -> unit
(** [set_location url] triggers a client-side redirect to a new location that
    acts as a swap. *)

val refresh : Dream.response -> unit
(** [refresh] triggers a client side full refresh of the page. *)

val set_trigger : string -> Dream.response -> unit
(** [set_trigger event] triggers a client side event. *)

val set_trigger_after_swap : string -> Dream.response -> unit
(** [set_trigger_after_swap event] triggers a client side event after the swap
    step. *)

val set_trigger_after_settle : string -> Dream.response -> unit
(** [set_trigger_after_settle event] triggers a client side event after the
    settle step. *)
