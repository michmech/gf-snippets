resource Verby = open SyntaxFre, (P = ParadigmsFre), (E = ExtraFre) in {
  
  --je suis heureux/heureuse (I am happy)
  oper example00 : S =
    mkS
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
  ;

}