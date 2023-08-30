resource Nouny = open Prelude, SyntaxGer, (P = ParadigmsGer), (N = NounGer), (M = MorphoGer) in {

  --der Afang des Jahres (the beginning of the year)
  oper example00 : NP = 
    mkNP
      theSg_Det
      (mkCN --Anfang des Jahres
        (P.mkN2 (P.mkN "Anfang" P.masculine) P.genPrep) --Anfang + genitive
        (mkNP --das Jahr
          theSg_Det
          (P.mkN "Jahr" P.neuter)
        )
      )
  ;

  --zwölf Jahre und fast sechs Jahre (twelve years and almost six years)
  oper example01 : NP =
    mkNP
      and_Conj
      (mkNP --zwölf Jahre
        (mkNumeral "12")
        (P.mkN "Jahr" "Jahre" P.neuter)
      )
      (mkNP --fast sechs Jahre
        (mkCard --fast sechs
          almost_AdN
          (mkCard "6")
        )
        (P.mkN "Jahr" "Jahre" P.neuter)
      )
  ;

  --zwölf Jahre Diktatur (twelve years of dictatorship)
  oper example02 : NP =
    mkNP
      (mkNumeral "12")
      (N.ApposCN --Jahr Diktatur (apposition)
        (mkCN (P.mkN "Jahr" "Jahre" P.neuter))
        (mkNP (P.mkN "Diktatur" P.feminine))
      )
  ;

  --ein Land im Chaos (a country in chaos)
  oper example03 : NP =
    mkNP
      (mkNP --ein Land
        aSg_Det
        (P.mkN "Land" P.neuter)
      )
      (mkAdv --im Chaos
        in_Prep
        (mkNP --das Chaos
          theSg_Det
          (P.mkN "Chaos" P.neuter)
        )
      )
  ;

  --eine Zeit ohne Gesetz (a time without law, a lawless time)
  oper example04 : NP =
    mkNP
      (mkNP --eine Zeit
        aSg_Det
        (P.mkN "Zeit" P.feminine)
      )
      (mkAdv --ohne Gesetz
        without_Prep --ohne
        (mkNP
          (P.mkN "Gesetz" P.neuter)
        )
      )
  ;

  --bei schlechtem Wetter (in bad whether, when the weather is bad)
  oper example05 : Adv =
    mkAdv
      (P.mkPrep "bei" P.dative)
      (mkNP
        (mkCN
          (P.mkA "schlecht")
          (P.mkN "Wetter" P.neuter)
        )
      )
  ;

  --solches schöne Wetter (such nice weather, with "solch" as determiner)
  oper example06 : NP =
    mkNP
      (M.detLikeAdj False P.singular "solch")
      (mkCN
        (P.mkA "schön")
        (P.mkN "Wetter" P.neuter)
      )
  ;

  --solch ein schönes Wetter (such nice weather, with "solch" as predeterminer)
  oper example07 : NP =
    let
      solch_Predet : Predet = lin Predet {s = \\_,_,_ => "solch" ; c = M.noCase ; a = M.PAgNone};
      --same definition as only_Predet
      --it would be nice if the RGL had domething like mkPredet : Str -> Predet but it doesn't
    in
      mkNP
        solch_Predet
        (mkNP
          aSg_Det
          (mkCN
            (P.mkA "schön")
            (P.mkN "Wetter" P.neuter)
          )
        )
  ;

}
