resource Nouny = open SyntaxFre, (P = ParadigmsFre), (N = NounFre) in {

  --beacoup d'argent (a lot of money)
  oper example00 : NP =
    mkNP
      much_Det
      (P.mkN "argent")
    ;
  
  --la bière (the beer)
  oper example01 : NP =
    mkNP
      theSg_Det
      (P.mkN "bière" "bières" P.feminine)
    ;

  --un silence absolu (an absolute silence)
  oper example02 : NP =
    mkNP
      aSg_Det
      (mkCN
        (P.mkA "absolu")
        (P.mkN "silence" "silences" P.masculine)
      )
    ;

  --une petite ville sympa (a nice little town)
  oper example03 : NP =
    mkNP
      aSg_Det
      (mkCN
        (P.mkA "sympa" "sympa" "sympa" "sympa")
        (mkCN
          (P.prefixA (P.mkA "petite"))
          (P.mkN "ville" "villes" P.feminine)
        )
      )
    ;

  --du vin (some wine)
  oper example04 : NP =
    mkNP
      (P.mkN "vin" "vins" P.masculine)
    ;

}