concrete AppEng of App = open (H = HelperEng), SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), (R = ResEng), Prelude in {

  lincat Shape = H.Shape;
  lin Did = H.did;
  lin Does = H.does;
  lin WillDo = H.willDo;
  lin WouldDo = H.wouldDo;
  lin WasDoing = H.wasDoing;
  lin IsDoing = H.isDoing;
  lin WillBeDoing = H.willBeDoing;
  lin WouldBeDoing = H.wouldBeDoing;
  lin HasDone = H.hasDone;
  lin HasBeenDoing = H.hasBeenDoing;
  lin DidNotDo = H.didNotDo;
  lin DoesNotDo = H.doesNotDo;
  lin WillNotDo = H.willNotDo;
  lin WouldNotDo = H.wouldNotDo;
  lin WasNotDoing = H.wasNotDoing;
  lin IsNotDoing = H.isNotDoing;
  lin WillNotBeDoing = H.willNotBeDoing;
  lin WouldNotBeDoing = H.wouldNotBeDoing;
  lin HasNotDone = H.hasNotDone;
  lin HasNotBeenDoing = H.hasNotBeenDoing;

  lincat ImpShape = H.ImpShape;
  lin Do = H.do;
  lin DoNot = H.doNot;

  lincat ImpTarget = H.ImpTarget;
  lin HeyYou = H.heyYou;
  
  lincat Raiser = H.Raiser;
  lin NoRaiser = H.noRaiser;
  lin Can = H.mkRaiser can_VV;
  lin Must = H.mkRaiser must_VV;
  lin WantTo = H.mkRaiser want_VV;
  lin TryTo = H.mkRaiser (P.mkVV (P.mkV "try"));
  
  lincat Complement = NP;
  lin Me = i_NP;
  lin We = we_NP;
  lin You = you_NP; 
  lin He = he_NP; 
  lin She = she_NP; 
  lin They = they_NP; 
  lin Everybody = everybody_NP;
  lin Nobody = nobody_NP;
  lin Somebody = somebody_NP;
  lin It = it_NP;
  lin This = this_NP;
  lin That = that_NP;
  lin These = these_NP;
  lin Those = those_NP;
  lin Everything = everything_NP;
  lin Nothing = nothing_NP;
  lin Something = something_NP;

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
  lin What = what_IP;

  lincat IAdjunct = IAdv;
  lin Why = why_IAdv;
  lin When = when_IAdv;
  lin Where = where_IAdv;
  lin How = how_IAdv;

  lincat Sentence = Str;
  
  oper sleep_V = P.mkV "sleep";
  oper help_V2 = (P.mkV2 (P.mkV "help"));
  oper help_V3 = (P.mkV3 (P.mkV "help") P.noPrep with_Prep);

  --[someone] sleeps
  lin Sleep1_Dec subjNP shape raiser adj = H.say subjNP shape raiser (mkVP sleep_V) adj;
  lin Sleep1_Ask subjNP shape raiser adj = H.ask subjNP shape raiser (mkVP sleep_V) adj;
  lin Sleep1_Wh1 subjIP shape raiser adj = H.whs subjIP shape raiser (mkVP sleep_V) adj;
  lin Sleep1_Wh9 subjNP shape raiser adj iadv = H.wha subjNP shape raiser (mkVP sleep_V) adj iadv;
  lin Sleep1_Imp impTarget impShape raiser adj = H.imp impTarget impShape raiser (mkVP sleep_V) adj;
  
  --[someone] helps [someone]
  lin Help2_Dec subjNP shape raiser objNP adj = H.say subjNP shape raiser (mkVP help_V2 objNP) adj;
  lin Help2_Ask subjNP shape raiser objNP adj = H.ask subjNP shape raiser (mkVP help_V2 objNP) adj;
  lin Help2_Wh1 subjIP shape raiser objNP adj = H.whs subjIP shape raiser (mkVP help_V2 objNP) adj;
  lin Help2_Wh2 subjNP shape raiser objIP adj = H.who subjNP shape raiser (mkVPSlash help_V2) objIP adj;
  lin Help2_Wh9 subjNP shape raiser objNP adj iadv = H.wha subjNP shape raiser (mkVP help_V2 objNP) adj iadv;
  lin Help2_Imp impTarget impShape raiser objNP adj = H.imp impTarget impShape raiser (mkVP help_V2 objNP) adj;

  --[someone] helps [someone] with [something]
  lin Help3_Dec subjNP shape raiser obj1NP obj2NP adj = H.say subjNP shape raiser (mkVP help_V3 obj1NP obj2NP) adj;
  lin Help3_Ask subjNP shape raiser obj1NP obj2NP adj = H.ask subjNP shape raiser (mkVP help_V3 obj1NP obj2NP) adj;
  lin Help3_Wh1 subjIP shape raiser obj1NP obj2NP adj = H.whs subjIP shape raiser (mkVP help_V3 obj1NP obj2NP) adj;
  lin Help3_Wh3 subjNP shape raiser obj1NP obj2IP adj = H.who subjNP shape raiser (mkVPSlash help_V3 obj1NP) obj2IP adj;
  lin Help3_Wh9 subjNP shape raiser obj1NP obj2NP adj iadv = H.wha subjNP shape raiser (mkVP help_V3 obj1NP obj2NP) adj iadv;
  lin Help3_Imp impTarget impShape raiser obj1NP obj2NP adj = H.imp impTarget impShape raiser (mkVP help_V3 obj1NP obj2NP) adj;

}
