(lang dune 3.0)

(name dream-htmx)

(documentation "https://beajeanm.github.io/dream-htmx/")

(source
 (github beajeanm/dream-htmx))

(license ISC)

(authors "Jean-Michel Bea")

(maintainers "Jean-Michel Bea")

(generate_opam_files true)
(implicit_transitive_deps false)

(package
 (name dream-htmx)
 (synopsis "Htmx utilities for Dream")
 (description "Htmx utilities for Dream.")
 (depends
  (ocaml (>= 4.08.0))
  (dream (>= 1.0.0~alpha4))
  (alcotest (and (>= 1.6.0) :with-test))))
