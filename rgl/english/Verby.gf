resource Verby = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  --I love you
  oper example00 : S =
    mkS
      presentTense
      simultaneousAnt
      positivePol
      (mkCl
        i_NP
        (mkVP
          (P.mkV2 (P.mkV "love"))
          you_NP
        )
      )
  ;

  --I am laughing
  oper example01 : S =
    mkS
      presentTense
      simultaneousAnt
      positivePol
      (mkCl
        i_NP
        (progressiveVP --to be laughing
          (mkVP --to laugh
            (P.mkV "laugh")
          )
        )
      )
  ;

  --I am here
  oper example02 : S =
    mkS
      presentTense
      simultaneousAnt
      positivePol
      (mkCl
        i_NP
        (mkVP --to be here
          here_Adv
        )
      )
  ;

}