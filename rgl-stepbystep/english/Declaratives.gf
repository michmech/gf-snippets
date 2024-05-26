--How to build simple declarative sentences.

resource Declaratives = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  --We start with a VP.
  --A VP represents a verb with all its complements (direct object, indirect object etc.) except the subject.
  --A VP is not yet fixed for any tense, polarity or anything like that.
  oper step001 : VP = 
    mkVP --help her
      (P.mkV2 (P.mkV "help"))
      she_NP
  ;

  --You can wrap a VP inside another VP using words like 'must', 'can', 'want to', 'try to':
  oper step002 : VP =
    mkVP --try to help her
      (P.mkVV (P.mkV "try"))
      step001 --VP: help her
  ;

  --While you have a VP, that is also the right time to add any optional adverbs like 'today', 'here'.
  oper step003 : VP = 
    mkVP --try to help her today
      step002 --VP: try to help her
      (P.mkAdv "today")
  ;

  --The next step up is to add a subject, turning the VP into a Cl.
  --A Cl is a VP with a subject. It still isn't fixed for any tense, polarity or anything like that.
  oper step004 : Cl =
    mkCl --he try to help her today
      he_NP
      step003 --VP: try to help her today
  ;

  --Once you have a Cl, you can fix its tense and polarity, thereby converting it into an S.
  oper step005 : S =
    mkS --he tried to help her today
      pastTense
      simultaneousAnt
      positivePol
      step004 --Cl: he try to help her today
  ;

  --Finally, we can turn an S into an Utt.
  --This doesn't actually make any changes, an Utt is just a common supercategory for S and others.
  oper step006 : Utt =
    mkUtt
      step005 --S: he tried to help her today
  ;

  --And that's it!
}
