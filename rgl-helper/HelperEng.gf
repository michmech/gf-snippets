resource HelperEng = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), (V = VerbEng), (E = ExtendEng), Prelude in {

  --shapes:
  param Progressivity = Progressive | NotProgressive; 
  oper Shape : Type = {
    s : Str; temp : Temp; pol : Pol; progressivity : Progressivity
  };
  oper mkShape : Temp -> Pol -> Progressivity -> Shape = \temp,pol,progressivity -> {
    s = ""; temp = temp; pol = pol; progressivity = progressivity
  };
  oper did = mkShape (mkTemp pastTense simultaneousAnt) positivePol NotProgressive;
  oper does = mkShape (mkTemp presentTense simultaneousAnt) positivePol NotProgressive;
  oper willDo = mkShape (mkTemp futureTense simultaneousAnt) positivePol NotProgressive;
  oper wouldDo = mkShape (mkTemp conditionalTense simultaneousAnt) positivePol NotProgressive;
  oper hadDone = mkShape (mkTemp pastTense anteriorAnt) positivePol NotProgressive;
  oper hasDone = mkShape (mkTemp presentTense anteriorAnt) positivePol NotProgressive;
  oper willHaveDone = mkShape (mkTemp futureTense anteriorAnt) positivePol NotProgressive;
  oper wouldHaveDone = mkShape (mkTemp conditionalTense anteriorAnt) positivePol NotProgressive;
  oper wasDoing = mkShape (mkTemp pastTense simultaneousAnt) positivePol Progressive;
  oper isDoing = mkShape (mkTemp presentTense simultaneousAnt) positivePol Progressive;
  oper willBeDoing = mkShape (mkTemp futureTense simultaneousAnt) positivePol Progressive;
  oper wouldBeDoing = mkShape (mkTemp conditionalTense simultaneousAnt) positivePol Progressive;
  oper hadBeenDoing = mkShape (mkTemp pastTense anteriorAnt) positivePol Progressive;
  oper hasBeenDoing = mkShape (mkTemp presentTense anteriorAnt) positivePol Progressive;
  oper willHaveBeenDoing = mkShape (mkTemp futureTense anteriorAnt) positivePol Progressive;
  oper wouldHaveBeenDoing = mkShape (mkTemp conditionalTense anteriorAnt) positivePol Progressive;
  oper didNotDo = mkShape (mkTemp pastTense simultaneousAnt) negativePol NotProgressive;
  oper doesNotDo = mkShape (mkTemp presentTense simultaneousAnt) negativePol NotProgressive;
  oper willNotDo = mkShape (mkTemp futureTense simultaneousAnt) negativePol NotProgressive;
  oper wouldNotDo = mkShape (mkTemp conditionalTense simultaneousAnt) negativePol NotProgressive;
  oper hadNotDone = mkShape (mkTemp pastTense anteriorAnt) negativePol NotProgressive;
  oper hasNotDone = mkShape (mkTemp presentTense anteriorAnt) negativePol NotProgressive;
  oper willNotHaveDone = mkShape (mkTemp futureTense anteriorAnt) negativePol NotProgressive;
  oper wouldNotHaveDone = mkShape (mkTemp conditionalTense anteriorAnt) negativePol NotProgressive;
  oper wasNotDoing = mkShape (mkTemp pastTense simultaneousAnt) negativePol Progressive;
  oper isNotDoing = mkShape (mkTemp presentTense simultaneousAnt) negativePol Progressive;
  oper willNotBeDoing = mkShape (mkTemp futureTense simultaneousAnt) negativePol Progressive;
  oper wouldNotBeDoing = mkShape (mkTemp conditionalTense simultaneousAnt) negativePol Progressive;
  oper hadNotBeenDoing = mkShape (mkTemp pastTense anteriorAnt) negativePol Progressive;
  oper hasNotBeenDoing = mkShape (mkTemp presentTense anteriorAnt) negativePol Progressive;
  oper willNotHaveBeenDoing = mkShape (mkTemp futureTense anteriorAnt) negativePol Progressive;
  oper wouldNotHaveBeenDoing = mkShape (mkTemp conditionalTense anteriorAnt) negativePol Progressive;

  --imperative shapes:
  oper ImpShape : Type = {
    s : Str; pol : Pol
  };
  oper do : ImpShape = {
    s = ""; pol = positivePol
  };
  oper doNot : ImpShape = {
    s = ""; pol = negativePol
  };

  --imperative targets:
  oper ImpTarget : Type = {
    s : Str; impForm : ImpForm
  };
  oper heyYou : ImpTarget = {
    s = ""; impForm = singularImpForm
  };

  --data type and makers for raisers:
  param RaiserType = NoRaiser | VVRaiser;
  oper Raiser : Type = {
    s : Str; type : RaiserType; vv : VV
  };
  oper dummy_VV : VV = can_VV;
  oper noRaiser : Raiser = {
    s = ""; type = NoRaiser; vv = dummy_VV
  };
  oper mkRaiser : VV -> Raiser = \vv -> {
    s = ""; type = VVRaiser; vv = vv
  };

  --data type and makers for adjuncts:
  param AdjunctType = NoAdjunct | AdvAdjunct | AdVAdjunct;
  oper Adjunct : Type = {
    s : Str; type : AdjunctType; adv : Adv; adV : AdV
  };
  oper dummy_Adv : Adv = here_Adv;
  oper dummy_AdV : AdV = always_AdV;
  oper noAdjunct : Adjunct = {
    s = ""; type = NoAdjunct; adv = dummy_Adv; adV = dummy_AdV
  };
  oper mkAdjunct = overload {
    mkAdjunct : Adv -> Adjunct = \adv -> {
      s = ""; type = AdvAdjunct; adv = adv; adV = dummy_AdV
    };
    mkAdjunct : AdV -> Adjunct = \adV -> {
      s = ""; type = AdVAdjunct; adv = dummy_Adv; adV = adV
    }
  };

  --functions for building sentences around a VP or a VPSlash:
  oper say : NP -> Shape -> Raiser -> VP -> Adjunct -> Str = \subjNP,shape,raiser,vp,adjunct ->
    let _vp = adjunctifyVP adjunct (shapeVP shape (raiseVP raiser vp));
      cl = mkCl subjNP _vp; --add a subject
      s = mkS shape.temp shape.pol cl --add temporal/aspectual features and polarity
    in (mkText s).s ++ shape.s ++ raiser.s ++ adjunct.s; -- declarative sentence
  oper ask : NP -> Shape -> Raiser -> VP -> Adjunct -> Str = \subjNP,shape,raiser,vp,adjunct -> 
    let _vp = adjunctifyVP adjunct (shapeVP shape (raiseVP raiser vp));
      cl = mkCl subjNP _vp; --add a subject
      qcl = mkQCl cl;
      qs = mkQS shape.temp shape.pol qcl --add temporal/aspectual features and polarity
    in (mkText qs).s ++ shape.s ++ raiser.s ++ adjunct.s; --yes/no question
  oper whs : IP -> Shape -> Raiser -> VP -> Adjunct -> Str = \subjIP,shape,raiser,vp,adjunct -> 
    let _vp = adjunctifyVP adjunct (shapeVP shape (raiseVP raiser vp));
      qcl = mkQCl subjIP _vp; --add the IP subject
      qs = mkQS shape.temp shape.pol qcl --add temporal/aspectual features and polarity
    in (mkText qs).s ++ shape.s ++ raiser.s ++ adjunct.s; --wh-question asking about the subject
  oper who : NP -> Shape -> Raiser -> VPSlash -> IP -> Adjunct -> Str = \subjNP,shape,raiser,vps,objIP,adjunct -> 
    let _vps = adjunctifyVPSlash adjunct (shapeVPSlash shape (raiseVPSlash raiser vps));
      clslash : ClSlash = mkClSlash subjNP _vps; --add a subject
      qcl = mkQCl objIP clslash; --add the interrogative pronoun
      qs = mkQS shape.temp shape.pol qcl --add temporal/aspectual features and polarity
    in (mkText qs).s ++ shape.s ++ raiser.s ++ adjunct.s; --wh-question asking about one of the objects
  oper wha : NP -> Shape -> Raiser -> VP -> Adjunct -> IAdv -> Str = \subjNP,shape,raiser,vp,adjunct,iadv -> 
    let _vp = adjunctifyVP adjunct (shapeVP shape (raiseVP raiser vp));
      cl = mkCl subjNP _vp; --add a subject
      qcl = mkQCl iadv cl; --add the interrogative adverb
      qs = mkQS shape.temp shape.pol qcl --add temporal/aspectual features and polarity
    in (mkText qs).s ++ shape.s ++ raiser.s ++ adjunct.s; --wh-question asking about an adverb
  oper imp : ImpTarget -> ImpShape -> Raiser -> VP -> Adjunct -> Str = \impTarget,impShape,raiser,vp,adjunct ->
    let _vp = adjunctifyVP adjunct (raiseVP raiser vp);
      utt = mkUtt impTarget.impForm impShape.pol (mkImp _vp)
    in (mkText utt).s ++ impTarget.s ++ impShape.s ++ raiser.s ++ adjunct.s; --imperative sentence

  --helpers used from the sentence-building functions above:
  oper raiseVP : Raiser -> VP -> VP = \raiser,vp ->
    case raiser.type of {NoRaiser => vp; VVRaiser => mkVP raiser.vv vp};
  oper shapeVP : Shape -> VP -> VP = \shape,vp ->
    case shape.progressivity of {Progressive => progressiveVP vp; NotProgressive => vp};
  oper adjunctifyVP : Adjunct -> VP -> VP = \adjunct,vp -> 
    case adjunct.type of {NoAdjunct => vp; AdvAdjunct => mkVP vp adjunct.adv; AdVAdjunct => mkVP adjunct.adV vp};
  oper raiseVPSlash : Raiser -> VPSlash -> VPSlash = \raiser,vps ->
    case raiser.type of {NoRaiser => vps; VVRaiser => mkVPSlash raiser.vv vps};
  oper shapeVPSlash : Shape -> VPSlash -> VPSlash = \shape,vps -> case shape.progressivity of {Progressive => E.ProgrVPSlash vps; NotProgressive => vps};
  oper adjunctifyVPSlash : Adjunct -> VPSlash -> VPSlash = \adjunct,vps -> 
    case adjunct.type of {NoAdjunct => vps; AdvAdjunct => V.AdvVPSlash vps adjunct.adv; AdVAdjunct => V.AdVVPSlash adjunct.adV vps};

  --finally, a little function for ad-hoc testing:
  oper test : Str =
    let
      help_V2 = (P.mkV2 (P.mkV "help"));
      try_V = (P.mkV "try");
    in
      imp heyYou do (mkRaiser (P.mkVV try_V)) (mkVP help_V2 i_NP) (mkAdjunct here_Adv)
  ; 

}