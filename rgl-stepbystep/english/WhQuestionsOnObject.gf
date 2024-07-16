--How to build who/what questions about one of the objects of the sentence. 
resource WhQuestionsOnObject = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  --We start with a VPSlash.
  --A VPSlash is like a VP but with one of the complements deliberately left out,
  --so that the VPSlash can eventually be turned into a question about this missing complement.
  oper step001 : VPSlash = 
    mkVPSlash --help an unknown someone
      (P.mkV2 (P.mkV "help"))
  ;

  --You can wrap a VPSlash inside another VPSlash using words like 'must', 'can', 'want to', 'try to':
  oper step002 : VPSlash =
    mkVPSlash --try to help an unknown someone
      (P.mkVV (P.mkV "try"))
      step001 --VPSlash: help an unknown someone
  ;

  --While you have a VPSlash, that is also the right time to add any optional adverbs like 'today', 'here'.
  oper step003 : VPSlash = 
    --TODO: This doesn't work though, see: https://stackoverflow.com/questions/78755288/how-do-i-add-an-adv-to-a-vpslash-in-grammatical-framework-rgl
    --mkVPSlash --try to help an unknown someone today
    --  step002 --VPSlash: try to help an unknown someone
    --  (P.mkAdv "today")
    step002
  ;

  --The next step up is to add a subject, turning the VPSlash into a ClSlash.
  --A ClSlash is like a Cl but with one of the (non-subject) complements deliberately left out.
  --Just like a Cl, a ClSlash still isn't fixed for any tense, polarity or anything like that.
  oper step004 : ClSlash =
    mkClSlash --he try to help an unknown someone today
      he_NP
      step003 --ClSlash: try to help an unknown someone today
  ;

  --Now that we have a ClSlash, we can an IP (interrogatibe pronoun) which asks about the missing complement .
  --This turns the ClSlash into QCl.
  --A QCl is a common supercategory for a couple of types before they can be turned into a QS (in the next step).
  --A QCl is not yet fixed for any tense, polarity or anything like that.
  oper step005 : QCl =
    mkQCl --whom he try to help today?
      whoSg_IP
      step004 --ClSLash: he try to help an unknown someone today
  ;

  --Once you have a QCl, you can fix its tense and polarity, thereby converting it into a QS.
  oper step006 : QS = 
    mkQS --whom will he try to help today?
      futureTense
      simultaneousAnt
      positivePol
      step005 --QCl: whom he try to help today?
  ;

  --Finally, we can turn an QS into an Utt.
  --This doesn't actually make any changes, an Utt is just a common supercategory for S, QS and others.
  oper step007 : Utt =
    mkUtt
      step006 --QS: whom will he try to help today?
  ;

}