(lang dune 3.0)

(name dream-htmx)

(documentation "https://beajeanm.github.io/dream-htmx/")

(source
 (github beajeanm/dream-htmx))

(license ISC)

(authors "Jean-Michel Bea")

(maintainers "Jean-Michel Bea")

(generate_opam_files true)

(package
 (name dream-htmx)
 (synopsis "Htmx utilities for Dream")
 (description "Htmx utilities for Dream.")
 (depends
  (ocaml
   (>= 4.08.0))
  (dream
   (>= 1.0.0~alpha4))
  ))
