resource Verby = open SyntaxFre, (P = ParadigmsFre), (E = ExtraFre), (X = ExtendFre) in {
  
  --je suis heureux/heureuse (I am happy)
  oper example00 : Text =
    mkText
      (mkS
        presentTense
        simultaneousAnt
        positivePol
        (mkCl
          (mkNP i_Pron) --change to (mkNP E.i8fem_Pron) for female me => "heureuse"
          (mkVP
            (mkAP
              (P.mkA "heureux" "heureuse")
            )
          )
        )
      )
  ;

  --je n'ai pas compris (I have not understood)
  oper example01 : Text =
    mkText
      (mkS
        presentTense
        anteriorAnt
        negativePol
        (mkCl
          (mkNP i_Pron)
          (mkVP
            (P.mkV "comprendre" "comprends" "comprenons" "comprennent" "comprit" "comprendra" "compris")
          )
        )
      )
  ;

  --il n'y a pas de taxi (there isn't a taxi)
  oper example02 : Text =
    mkText 
      (mkS
        presentTense
        simultaneousAnt
        negativePol --"ne...pas"
        (mkCl --"il y a..."
          (mkNP --"de taxi"
            (mkDet X.de_Quant singularNum)
            (P.mkN "taxi")
          )
        )
      )
  ;

  --je suis du Canada (I am from Canada)
  oper example03 : Text =
    mkText
      (mkS
        presentTense
        simultaneousAnt
        positivePol
        (mkCl
          (mkNP i_Pron) --je
          (mkAdv --du Canada
            from_Prep --de
            (mkNP the_Det (P.mkN "Canada")) --le Canada
          )
        )
      )
  ;


}