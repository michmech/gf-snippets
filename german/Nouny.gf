resource Nouny = open SyntaxGer, (P = ParadigmsGer), (N = NounGer) in {

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

}
