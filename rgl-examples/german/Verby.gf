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

  --ich habe keine Zeit (I have no time)
  oper example07 : S = 
    mkS
      presentTense
      simultaneousAnt
      positivePol
      (mkCl
        (mkNP i_Pron)
        (mkVP
          (P.mkV2 (P.mkV "haben") P.accusative)
          (mkNP
            (mkDet no_Quant singularNum)
            (P.mkN "Zeit" P.feminine)
          )
        )
      )
  ;

  --wann wird es fertig sein? (when will it be ready?)
  oper example08 : Utt =
    mkUtt
      (mkQS --wann wird es fertig sein?
        futureTense
        simultaneousAnt
        positivePol
        (mkQCl --wann + es + fertig sein?
          when_IAdv
          (mkCl --es + fertig sein
            it_NP
            (mkVP --fertig sein
              (P.mkA "fertig")
            )
          )
        )
      )
  ;

  --ich habe dich überall gesucht (I have been looking for you everywhere)
  oper example09 : Utt =
    let
      suchen_V2 : V2 = P.mkV2 (P.mkV "suchen" "sucht" "suchte" "süchte" "gesucht");
    in
      mkUtt
        (mkS --ich habe dich überall gesucht
          presentTense
          anteriorAnt
          positivePol
          (mkCl --ich + dich überall suchen
            i_NP
            (mkVP --dich überall suchen
              everywhere_Adv
              (mkVP --dich suchen
                suchen_V2
                you_NP
              )
            )
          )
        )
  ;

  --wieviel kostet es? (how much does it cost?)
  oper example10 : Utt =
    let
      kosten_V : V = P.mkV "kosten" "kostet" "kostete" "köstete" "gekostet";
    in
      mkUtt
        (mkQS
          presentTense
          simultaneousAnt
          positivePol
          (mkQCl --wieviel + es + kosten
            how8much_IAdv
            (mkCl --es + kosten
              it_NP
              (mkVP kosten_V)
            )
          )
        )
  ;

}