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
  --see also: https://stackoverflow.com/questions/76990676/how-to-build-v-np-prep-ap-in-grammatical-framework-rgl
  oper example02 : S =
    let
      halten_V : V = P.mkV "halten" "hält" "hielt" "hielte" "gehalten";
    in
      mkS
        presentTense
        simultaneousAnt
        positivePol
        (mkCl
          she_NP
          (mkVP --mich für intelligent halten (to hold me for intelligent)
            (P.mkAdv "für intelligent")
            (mkVP --mich halten (to hold me)
              (P.mkV2 halten_V P.accusative)
              i_NP
            )
          )
        )
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

  --sei nicht unhöfflich zu mir! (don't be impolite to me!)
  oper example05 : Text =
    mkText
      (mkUtt
        singularImpForm --du (you singular informal)
        negativePol
        (mkImp
          (mkVP --unhöflich zu mir sein (to be impolite to me)
            (mkAP --unhöflich zu mir (impolite to me)
              (P.mkA2 --unhöflich zu... (impolite to...)
                (P.mkA "unhöflich")
                P.zu_Prep
              )
              i_NP
            )
          )
        )
      )
      exclMarkPunct
  ;

  --du benimmst dich unhöfflich (you are behaving impolitely)
  oper example06 : Text =
    mkText
      (mkS
        presentTense
        simultaneousAnt
        positivePol
        (mkCl
          you_NP --du (you singular informal)
          (mkVP --sich unhöfflich benehmen (to behave impolitely)
            (mkVP
              (P.reflV --sich benehmen (to behave)
                (P.mkV "benehmen" "benimmt" "benimm" "benahm" "benähme" "benommen")
                P.accusative
              )
            )
            (P.mkAdv "unhöfflich")
          )
        )
      )
  ;



}