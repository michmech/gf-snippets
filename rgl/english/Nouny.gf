resource Nouny = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), (E = ExtendEng), Prelude in {

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

  --my birthday
  oper example03 : NP =
    mkNP
      (mkDet i_Pron singularNum)
      (P.mkN "birthday")
  ;

  --Michal's birthday
  oper example04 : NP =
    mkNP
      (mkDet --"Michal's" as a singular determiner
        (E.GenNP --Quant: "Michal's" as a quantifier
          (mkNP (P.mkPN "Michal"))
        )
        singularNum
      )
      (P.mkN "birthday")
  ;

}