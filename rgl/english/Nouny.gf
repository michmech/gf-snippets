resource Nouny = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  --many trees
  oper example00 : NP =
    mkNP
      many_Det
      (P.mkN "tree")
    ;

  --all the money
  oper example01 : NP =
    mkNP
      all_Predet
      (mkNP
        theSg_Det
        (P.mkN "money")
      )
    ;

  --a lot of the money
  oper example02 : NP =
    let
      aLotOf_Predet : Predet = Prelude.ss "a lot of"; --same definition as all_Predet
    in
      mkNP
        aLotOf_Predet
        (mkNP
          theSg_Det
          (P.mkN "money")
        )
      ;

}