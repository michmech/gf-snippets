concrete TestEng of Test = open (H = HelperEng), SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  lincat Shape = H.Shape;
  lin Did = H.Did;
  lin Does = H.Does;
  lin WillDo = H.WillDo;
  lin WouldDo = H.WouldDo;
  lin WasDoing = H.WasDoing;
  lin IsDoing = H.IsDoing;
  lin WillBeDoing = H.WillBeDoing;
  lin WouldBeDoing = H.WouldBeDoing;
  lin HasDone = H.HasDone;
  lin HasBeenDoing = H.HasBeenDoing;
  lin DidNotDo = H.DidNotDo;
  lin DoesNotDo = H.DoesNotDo;
  lin WillNotDo = H.WillNotDo;
  lin WouldNotDo = H.WouldNotDo;
  lin WasNotDoing = H.WasNotDoing;
  lin IsNotDoing = H.IsNotDoing;
  lin WillNotBeDoing = H.WillNotBeDoing;
  lin WouldNotBeDoing = H.WouldNotBeDoing;
  lin HasNotDone = H.HasNotDone;
  lin HasNotBeenDoing = H.HasNotBeenDoing;
  
  lincat Raiser = H.Raiser;
  lin NoRaiser = H.noRaiser;
  lin Can = H.mkRaiser can_VV;
  lin Must = H.mkRaiser must_VV;
  lin Want = H.mkRaiser want_VV;

  lincat Complement = NP;
  lin Me = i_NP;
  lin We = we_NP;
  lin You = you_NP; 
  lin He = he_NP; 
  lin She = she_NP; 
  lin They = they_NP; 

  lincat Adjunct = H.Adjunct;
  lin NoAdjunct = H.noAdjunct;
  lin Everywhere = H.mkAdjunct everywhere_Adv;
  lin Somewhere = H.mkAdjunct somewhere_Adv;
  lin Here = H.mkAdjunct here_Adv;
  lin There = H.mkAdjunct there_Adv;
  lin Now = H.mkAdjunct (P.mkAdv "now");
  lin Always = H.mkAdjunct always_AdV;

  lincat Sentence = Str;

--[someone] sleeps
  lin Sleep1_Dec subjNP shape raiser adj1 adj2 =
    let
      sleep_V = P.mkV "sleep";
    in
      H.declarative1 subjNP shape raiser sleep_V adj1 adj2
  ;

  --[someone] helps [someone]
  lin Help2_Dec subjNP shape raiser objNP adj1 adj2 =
    let
      help_V2 = (P.mkV2 (P.mkV "help"));
    in
      H.declarative2 subjNP shape raiser help_V2 objNP adj1 adj2
  ;
}
