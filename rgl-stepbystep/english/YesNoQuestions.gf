--How to build yes/no questions.
resource YesNoQuestions = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  --We start with a Cl.
  --A Cl is a VP with a subject. It isn't fixed for any tense, polarity or anything like that.
  --See Declaratives.gf for more details on building a Cl.
  oper step001 : Cl =
    mkCl --he try to help her today
      he_NP
      (mkVP --try to help her today
        (mkVP --try to help her
          (P.mkVV (P.mkV "try"))
          (mkVP --help her
            (P.mkV2 (P.mkV "help"))
            she_NP
          )
        )
        (P.mkAdv "today")
      )
  ;

  --Convert the Cl to a QCl.
  --This doesn't make any changes. A QCl is a common supercategory for a couple of types
  --before they can be turned into a QS (in the next step).
  oper step002 : QCl =
    mkQCl --he try to help her today?
      step001 --Cl: he try to help her today
  ;

  --Once you have a QCl, you can fix its tense and polarity, thereby converting it into a QS.
  oper step003 : QS = 
    mkQS --will he try to help her today?
      futureTense
      simultaneousAnt
      positivePol
      step002 --QCl: he try to help her today?
  ;

  --Finally, we can turn an QS into an Utt.
  --This doesn't actually make any changes, an Utt is just a common supercategory for S, QS and others.
  oper step004 : Utt =
    mkUtt
      step003 --QS: will he try to help her today?
  ;
}