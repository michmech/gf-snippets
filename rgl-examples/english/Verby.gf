resource Verby = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), (V = VerbEng), (E = ExtendEng), Prelude in {

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

  --it is my birthday today
  oper example03 : S = 
    mkS
      presentTense
      simultaneousAnt
      positivePol
      (mkCl --it be my birthday today
        (mkVP --to be my birthday today
          (mkVP --to be my birthday
            (mkNP --my birthday
              (mkDet i_Pron)
              (P.mkN "birthday")
            )
          )
          (P.mkAdv "today")
        )
      )
  ; 

  --I have no time
  oper example05 : S = 
    mkS
      presentTense
      simultaneousAnt
      positivePol
      (mkCl
        (mkNP i_Pron)
        (mkVP
          (P.mkV2 (P.mkV "have"))
          (mkNP
            (mkDet no_Quant singularNum)
            (P.mkN "time")
          )
        )
      )
  ;

  --I want to help you
  oper example06 : S =
    mkS
      presentTense
      simultaneousAnt
      positivePol
      (mkCl
        i_NP
        (mkVP --want to help you
          want_VV
          (mkVP --help you
            (P.mkV2 (P.mkV "help"))
            you_NP
          )
        )
      )
  ;

  --I am trying to help you
  oper example07 : S =
    mkS
      presentTense
      simultaneousAnt
      positivePol
      (mkCl
        i_NP
        (progressiveVP --be trying to help you
          (mkVP --try to help you
            (P.mkVV (P.mkV "try"))
            (mkVP --help you
              (P.mkV2 (P.mkV "help"))
              you_NP
            )
          )
        )
      )
  ;

  --who will help me?
  oper example08 : QS =
    mkQS
      futureTense
      simultaneousAnt
      positivePol
      (mkQCl --who + help me?
        whoSg_IP
        (mkVP --help me
          (P.mkV2 (P.mkV "help"))
          i_NP
        )
      )
  ;

  --what will you do?
  oper example09 : QS =
    mkQS
      futureTense
      simultaneousAnt
      positivePol
      (mkQCl --what you do?
        what_IP
        (mkClSlash --you do *an unknown something*
          you_NP
          (mkVPSlash -- do *an unknown something*
            (P.mkV2 (P.mkV "do" "does" "did" "done" "doing"))
          )
        )
      )
  ;

  --what will you do today?
  oper example10 : QS =
    mkQS
      futureTense
      simultaneousAnt
      positivePol
      (mkQCl --what you do today?
        what_IP
        (mkClSlash --you do *an unknown something*  today
          you_NP
          (V.AdvVPSlash --[not in API] VPSlash: do *an unknown something* today
            (mkVPSlash -- do *an unknown something*
              (P.mkV2 (P.mkV "do" "does" "did" "done" "doing"))
            )
            (P.mkAdv "today")
          )
        )
      )
  ;

  --what do you always do?
  oper example11 : QS =
    mkQS
      presentTense
      simultaneousAnt
      positivePol
      (mkQCl --what you always do?
        what_IP
        (mkClSlash --you always do *an unknown something* 
          you_NP
          (V.AdVVPSlash --[not in API] VPSlash: always do *an unknown something*
            always_AdV
            (mkVPSlash -- do *an unknown something*
              (P.mkV2 (P.mkV "do" "does" "did" "done" "doing"))
            )
          )
        )
      )
  ;

  --what do you work with?
  oper example12 : QS =
    mkQS
      presentTense
      simultaneousAnt
      positivePol
      (mkQCl --you + work with + what?
        what_IP
        (mkClSlash --you + work with *an unknown something*
          you_NP
          (mkVPSlash -- work with *an unknown something*
            (P.mkV2 (P.mkV "work") with_Prep)
          )
        )
      )
  ;

  --why did you hit him?
  oper example13 : QS =
    mkQS
      pastTense
      simultaneousAnt
      positivePol
      (mkQCl --why + you + hit him?
        why_IAdv
        (mkCl --you + hit + him
          you_NP
          (mkVP --hit him
            (P.mkV2 (P.mkV "hit" "hit" "hit"))
            he_NP
          )
        )
      )
  ;

  --don't try to sleep
  oper example14 : Utt =
    mkUtt
      singularImpForm --addressed to one person
      negativePol
      (mkImp --try to sleep
        (mkVP --to try to sleep
          (P.mkVV (P.mkV "try"))
          (mkVP (P.mkV "sleep"))
        )
      )
  ;

  --try not to sleep
  oper example15 : Utt =
    mkUtt
      singularImpForm --addressed to one person
      positivePol
      (mkImp --try to sleep!
        (E.ComplGenVV --[not in API] VP: to try not to sleep
          (P.mkVV (P.mkV "try"))
          simultaneousAnt
          negativePol
          (mkVP (P.mkV "sleep"))
        )
      )
  ;

}