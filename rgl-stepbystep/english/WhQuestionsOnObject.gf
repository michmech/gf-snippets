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
  --TODO: This doesn't work, see: https://stackoverflow.com/questions/78755288/how-do-i-add-an-adv-to-a-vpslash-in-grammatical-framework-rgl
  oper step003 : VPSlash = 
    mkVPSlash --try to help an unknown someone today
      step002 --VPSlash: try to help an unknown someone
      (P.mkAdv "today")
  ;

}