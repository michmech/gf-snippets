resource Verby = open SyntaxGer, (P = ParadigmsGer) in {

  --der Radfahrer hat den Hund nicht gesehen! (the cyclist didn't see the dog!)
  oper example00 : Text =
    let
      radfahrer_NP : NP = mkNP theSg_Det (P.mkN "Radfahrer" "Radfahrer" P.masculine);
      hund_NP : NP  = mkNP theSg_Det (P.mkN "Hund" "Hunde" P.masculine);
      sehen_V2 : V2 = P.mkV2 (P.mkV "sehen" "sieht" "sah" "sähe" "gesehen");
    in
      mkText
        (mkPhr
          (mkUtt
            (mkS
              presentTense
              anteriorAnt
              negativePol
              (mkCl
                radfahrer_NP
                (mkVP
                  sehen_V2
                  hund_NP
                )
              )
            )
          )
        )
        exclMarkPunct
  ;

  --sei vernünftig! (be reasonable!)
  oper example01 : Text =
    mkText
      (mkPhr
        (mkUtt
          singularImpForm --du
          positivePol
          (mkImp
            (mkVP --vernünftig sein (to be reasonable)
              (mkAP (P.mkA "vernünftig"))
            )
          )
        )
      )
      exclMarkPunct
  ;

  --sie hält mich für intelligent (she considers me intelligent)
  oper example02 : Text =
    let
      halten_V : V = P.mkV "halten" "hält" "hielt" "hielte" "gehalten";
    in
      mkText
        (mkPhr
          (mkUtt
            (mkS
              presentTense
              simultaneousAnt
              positivePol
              (mkCl
                she_NP
                (mkVP --jemanden für intelligent halten 
                  (P.mkV2A halten_V for_Prep)
                  i_NP
                  (mkAP (P.mkA "intelligent"))
                )
              )
            )
          )
        )
        fullStopPunct
  ;

  --es regnet (it is raining)
  oper example03 : S =
    mkS
      presentTense
      simultaneousAnt
      positivePol
      (mkCl
        (mkVP
          (P.mkV "regnen")
        )
      )
  ;

  --regnet es noch? (is it still raining?)
  oper example04 : Text =
    mkText
      (mkQS
        presentTense
        simultaneousAnt
        positivePol
        (mkQCl
          (mkCl
            (mkVP
              (P.mkAdv "noch")
              (mkVP
                (P.mkV "regnen")
              )
            )
          )
        )
      )
  ;

}