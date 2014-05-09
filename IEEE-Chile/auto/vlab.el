(TeX-add-style-hook "vlab"
 (lambda ()
    (LaTeX-add-bibliographies
     "ref1")
    (TeX-add-symbols
     '("figref" 1))
    (TeX-run-style-hooks
     "url"
     "amsmath"
     "graphicx"
     "amssymb"
     "amsfonts"
     "latexsym"
     "cite"
     "latex2e"
     "ieeeconf10"
     "ieeeconf"
     "a4paper"
     "10pt"
     "conference"
     "abstract"
     "intro"
     "LitSurvey"
     "sbhs"
     "vlabarch"
     "expt"
     "2dof"
     "relay"
     "conc")))

