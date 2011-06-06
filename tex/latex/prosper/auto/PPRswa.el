(TeX-add-style-hook "PPRswa"
 (lambda ()
    (LaTeX-add-environments
     "bluebox"
     "orangebox"
     "greenbox"
     "graybox")
    (TeX-add-symbols
     '("foot" 1)
     '("fett" 1)
     '("slidetitle" 1)
     "hpititle"
     "HPIlogo")
    (TeX-run-style-hooks
     "gradient"
     "pst-grad"
     "tweaklist"
     "uarial"
     "scaled"
     "fontenc"
     "T1"
     "amssymb"
     "semhelv")))

