--How to build who/what questions about the subject of the sentence. 
resource WhQuestionsOnSubject = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  --We start with a VP.
  --A VP represents a verb with all its complements (direct object, indirect object etc.) except the subject.
  --See Declaratives.gf for more details on building VPs.
  oper step001 : VP = 
    mkVP --try to help her today
      (mkVP --try to help her
        (P.mkVV (P.mkV "try"))
        (mkVP --help her
          (P.mkV2 (P.mkV "help"))
          she_NP
        )
      )
      (P.mkAdv "today")
  ;

  --Then we add an IP (interrogative pronoun) and turn the VP into a QCl.
  --A QCl is a common supercategory for a couple of types before they can be turned into a QS (in the next step).
  --A QCl is not yet fixed for any tense, polarity or anything like that.
  oper step002 : QCl =
    mkQCl --who try to help her?
      whoSg_IP
      step001 --VP: try to help her
  ;

  --Once you have a QCl, you can fix its tense and polarity, thereby converting it into a QS.
  oper step003 : QS = 
    mkQS --who will try to help her today?
      futureTense
      simultaneousAnt
      positivePol
      step002 --QCl: who try to help her today?
  ;

  --Finally, we can turn an QS into an Utt.
  --This doesn't actually make any changes, an Utt is just a common supercategory for S, QS and others.
  oper step004 : Utt =
    mkUtt
      step003 --QS: who will try to help her today?
  ;

}