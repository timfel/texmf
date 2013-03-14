(TeX-add-style-hook "sig-alternate"
 (lambda ()
    (LaTeX-add-bibliographies
     "sigproc")
    (LaTeX-add-environments
     "theorem")
    (TeX-run-style-hooks
     "latex2e"
     "sig-alternate10")))

