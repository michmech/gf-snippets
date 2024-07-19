concrete AppEng of App = open (H = HelperEng), SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), (R = ResEng), Prelude in {

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
  lin Try = H.mkRaiser (P.mkVV (P.mkV "try"));

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

  lincat IComplement = IP;
  lin Who = R.mkIP "who" "who" "whose" P.singular; --override RGL's own who_IP which has "whom"

  lincat IAdjunct = IAdv;
  lin Why = why_IAdv;
  lin When = when_IAdv;
  lin Where = where_IAdv;
  lin How = how_IAdv;

  lincat Sentence = Str;
  
  oper sleep_V = P.mkV "sleep";
  oper help_V2 = (P.mkV2 (P.mkV "help"));

  --[someone] sleeps
  lin Sleep1_Dec subjNP shape raiser adj1 adj2 = H.declarative1 subjNP shape raiser sleep_V adj1 adj2;
  lin Sleep1_Ask subjNP shape raiser adj1 adj2 = H.yesno1 subjNP shape raiser sleep_V adj1 adj2;
  lin Sleep1_WhSubj subjIP shape raiser adj1 adj2 = H.whsubj1 subjIP shape raiser sleep_V adj1 adj2;
  lin Sleep1_WhAdv iadv subjNP shape raiser adj1 adj2 = H.whadv1 iadv subjNP shape raiser sleep_V adj1 adj2;
  
  --[someone] helps [someone]
  lin Help2_Dec subjNP shape raiser objNP adj1 adj2 = H.declarative2 subjNP shape raiser help_V2 objNP adj1 adj2;
  lin Help2_Ask subjNP shape raiser objNP adj1 adj2 = H.yesno2 subjNP shape raiser help_V2 objNP adj1 adj2;
  lin Help2_WhSubj subjIP shape raiser objNP adj1 adj2 = H.whsubj2 subjIP shape raiser help_V2 objNP adj1 adj2;
  lin Help2_WhObj subjNP shape raiser objIP adj1 adj2 = H.whobj2 subjNP shape raiser help_V2 objIP adj1 adj2;
  lin Help2_WhAdv iadv subjNP shape raiser objNP adj1 adj2 = H.whadv2 iadv subjNP shape raiser help_V2 objNP adj1 adj2;
}
