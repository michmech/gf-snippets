concrete TestEng of Test = open (H = HelperEng), SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  lincat Complement = NP;
  lin Me = i_NP;
  lin You = you_NP; 

  lincat Adjunct = H.Adjunct;
  lin NoAdjunct = H.noAdjunct;
  lin Here = H.mkAdjunct here_Adv;
  lin Now = H.mkAdjunct (P.mkAdv "now");

  lincat Sentence = Text;
  lin Help subjNP objNP adjunct1 adjunct2 =
    let 
      help_V2 = (P.mkV2 (P.mkV "help"))
    in 
      H.declarative2 subjNP H.WillDo H.noRaiser help_V2 objNP adjunct1 adjunct2
  ;

}
