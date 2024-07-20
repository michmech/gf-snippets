resource HelperEng = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), (V = VerbEng), (E = ExtendEng), Prelude in {

  --shapes:
  param Progressivity = Progressive | NotProgressive; 
  oper Shape : Type = {
    s : Str;
    temp : Temp;
    pol : Pol;
    progressivity : Progressivity
  };
  oper mkShape : Temp -> Pol -> Progressivity -> Shape = \temp,pol,progressivity -> {
    s = "";
    temp = temp;
    pol = pol;
    progressivity = progressivity
  };
  oper Did = mkShape (mkTemp pastTense simultaneousAnt) positivePol NotProgressive;
  oper Does = mkShape (mkTemp presentTense simultaneousAnt) positivePol NotProgressive;
  oper WillDo = mkShape (mkTemp futureTense simultaneousAnt) positivePol NotProgressive;
  oper WouldDo = mkShape (mkTemp conditionalTense simultaneousAnt) positivePol NotProgressive;
  oper HadDone = mkShape (mkTemp pastTense anteriorAnt) positivePol NotProgressive;
  oper HasDone = mkShape (mkTemp presentTense anteriorAnt) positivePol NotProgressive;
  oper WillHaveDone = mkShape (mkTemp futureTense anteriorAnt) positivePol NotProgressive;
  oper WouldHaveDone = mkShape (mkTemp conditionalTense anteriorAnt) positivePol NotProgressive;
  oper WasDoing = mkShape (mkTemp pastTense simultaneousAnt) positivePol Progressive;
  oper IsDoing = mkShape (mkTemp presentTense simultaneousAnt) positivePol Progressive;
  oper WillBeDoing = mkShape (mkTemp futureTense simultaneousAnt) positivePol Progressive;
  oper WouldBeDoing = mkShape (mkTemp conditionalTense simultaneousAnt) positivePol Progressive;
  oper HadBeenDoing = mkShape (mkTemp pastTense anteriorAnt) positivePol Progressive;
  oper HasBeenDoing = mkShape (mkTemp presentTense anteriorAnt) positivePol Progressive;
  oper WillHaveBeenDoing = mkShape (mkTemp futureTense anteriorAnt) positivePol Progressive;
  oper WouldHaveBeenDoing = mkShape (mkTemp conditionalTense anteriorAnt) positivePol Progressive;
  oper DidNotDo = mkShape (mkTemp pastTense simultaneousAnt) negativePol NotProgressive;
  oper DoesNotDo = mkShape (mkTemp presentTense simultaneousAnt) negativePol NotProgressive;
  oper WillNotDo = mkShape (mkTemp futureTense simultaneousAnt) negativePol NotProgressive;
  oper WouldNotDo = mkShape (mkTemp conditionalTense simultaneousAnt) negativePol NotProgressive;
  oper HadNotDone = mkShape (mkTemp pastTense anteriorAnt) negativePol NotProgressive;
  oper HasNotDone = mkShape (mkTemp presentTense anteriorAnt) negativePol NotProgressive;
  oper WillNotHaveDone = mkShape (mkTemp futureTense anteriorAnt) negativePol NotProgressive;
  oper WouldNotHaveDone = mkShape (mkTemp conditionalTense anteriorAnt) negativePol NotProgressive;
  oper WasNotDoing = mkShape (mkTemp pastTense simultaneousAnt) negativePol Progressive;
  oper IsNotDoing = mkShape (mkTemp presentTense simultaneousAnt) negativePol Progressive;
  oper WillNotBeDoing = mkShape (mkTemp futureTense simultaneousAnt) negativePol Progressive;
  oper WouldNotBeDoing = mkShape (mkTemp conditionalTense simultaneousAnt) negativePol Progressive;
  oper HadNotBeenDoing = mkShape (mkTemp pastTense anteriorAnt) negativePol Progressive;
  oper HasNotBeenDoing = mkShape (mkTemp presentTense anteriorAnt) negativePol Progressive;
  oper WillNotHaveBeenDoing = mkShape (mkTemp futureTense anteriorAnt) negativePol Progressive;
  oper WouldNotHaveBeenDoing = mkShape (mkTemp conditionalTense anteriorAnt) negativePol Progressive;

  --data type and makers for raisers:
  param RaiserType = NoRaiser | VVRaiser;
  oper Raiser : Type = {
    s : Str;
    type : RaiserType;
    vv : VV
  };
  oper dummy_VV : VV = can_VV;
  oper noRaiser : Raiser = {
    s = "";
    type = NoRaiser;
    vv = dummy_VV
  };
  oper mkRaiser : VV -> Raiser = \vv -> {
    s = "";
    type = VVRaiser;
    vv = vv
  };

  --data type and makers for adjuncts:
  param AdjunctType = NoAdjunct | AdvAdjunct | AdVAdjunct;
  oper Adjunct : Type = {
    s : Str;
    type : AdjunctType;
    adv : Adv;
    adV : AdV
  };
  oper dummy_Adv : Adv = here_Adv;
  oper dummy_AdV : AdV = always_AdV;
  oper noAdjunct : Adjunct = {
    s = "";
    type = NoAdjunct;
    adv = dummy_Adv;
    adV = dummy_AdV
  };
  oper mkAdjunct = overload {
    mkAdjunct : Adv -> Adjunct = \adv -> {
      s = "";
      type = AdvAdjunct;
      adv = adv;
      adV = dummy_AdV
    };
    mkAdjunct : AdV -> Adjunct = \adV -> {
      s = "";
      type = AdVAdjunct;
      adv = dummy_Adv;
      adV = adV
    }
  };

  --build a declarative sentence around a VP:
  oper declarative : NP -> Shape -> Raiser -> VP -> Adjunct -> Adjunct -> Str
  = \subjNP,shape,raiser,vp1,adjunct1,adjunct2 -> 
    let
      --maybe add a raiser to the VP:
      vp2 = case raiser.type of {
        NoRaiser => vp1;
        VVRaiser => mkVP raiser.vv vp1
      };
      --maybe make the VP progressive ("-ing"):
      vp3 = case shape.progressivity of {
        Progressive => progressiveVP vp2;
        NotProgressive => vp2
      };
      --maybe add adjunct1 to the VP:
      vp4 = case adjunct1.type of {
        NoAdjunct => vp3;
        AdvAdjunct => mkVP vp3 adjunct1.adv;
        AdVAdjunct => mkVP adjunct1.adV vp3
      };
      --maybe add adjunct2 to the VP:
      vp5 = case adjunct2.type of {
        NoAdjunct => vp4;
        AdvAdjunct => mkVP vp4 adjunct2.adv;
        AdVAdjunct => mkVP adjunct2.adV vp4
      };
      --add a subject, produce a Cl:
      cl = mkCl subjNP vp5;
      --add temporal/aspectual features and polarity, produce an S:
      s = mkS shape.temp shape.pol cl
    in
      (mkText s).s ++ shape.s ++ raiser.s ++ adjunct1.s ++ adjunct2.s
  ;

  --build a yes/no question around a VP:
  oper yesno : NP -> Shape -> Raiser -> VP -> Adjunct -> Adjunct -> Str
  = \subjNP,shape,raiser,vp1,adjunct1,adjunct2 -> 
    let
      --maybe add a raiser to the VP:
      vp2 = case raiser.type of {
        NoRaiser => vp1;
        VVRaiser => mkVP raiser.vv vp1
      };
      --maybe make the VP progressive ("-ing"):
      vp3 = case shape.progressivity of {
        Progressive => progressiveVP vp2;
        NotProgressive => vp2
      };
      --maybe add adjunct1 to the VP:
      vp4 = case adjunct1.type of {
        NoAdjunct => vp3;
        AdvAdjunct => mkVP vp3 adjunct1.adv;
        AdVAdjunct => mkVP adjunct1.adV vp3
      };
      --maybe add adjunct2 to the VP:
      vp5 = case adjunct2.type of {
        NoAdjunct => vp4;
        AdvAdjunct => mkVP vp4 adjunct2.adv;
        AdVAdjunct => mkVP adjunct2.adV vp4
      };
      --add a subject, produce a Cl:
      cl = mkCl subjNP vp5;
      --turn the Cl into a QCl:
      qcl = mkQCl cl;
      --add temporal/aspectual features and polarity, produce an QS:
      qs = mkQS shape.temp shape.pol qcl
    in
      (mkText qs).s ++ shape.s ++ raiser.s ++ adjunct1.s ++ adjunct2.s
  ;

  --build a wh-subject question around a VP:
  oper whsubj : IP -> Shape -> Raiser -> VP -> Adjunct -> Adjunct -> Str
  = \subjIP,shape,raiser,vp1,adjunct1,adjunct2 -> 
    let
      --maybe add a raiser to the VP:
      vp2 = case raiser.type of {
        NoRaiser => vp1;
        VVRaiser => mkVP raiser.vv vp1
      };
      --maybe make the VP progressive ("-ing"):
      vp3 = case shape.progressivity of {
        Progressive => progressiveVP vp2;
        NotProgressive => vp2
      };
      --maybe add adjunct1 to the VP:
      vp4 = case adjunct1.type of {
        NoAdjunct => vp3;
        AdvAdjunct => mkVP vp3 adjunct1.adv;
        AdVAdjunct => mkVP adjunct1.adV vp3
      };
      --maybe add adjunct2 to the VP:
      vp5 = case adjunct2.type of {
        NoAdjunct => vp4;
        AdvAdjunct => mkVP vp4 adjunct2.adv;
        AdVAdjunct => mkVP adjunct2.adV vp4
      };
      --add the IP subject, produce a QCl:
      qcl = mkQCl subjIP vp5;
      --add temporal/aspectual features and polarity, produce an QS:
      qs = mkQS shape.temp shape.pol qcl
    in
      (mkText qs).s ++ shape.s ++ raiser.s ++ adjunct1.s ++ adjunct2.s
  ;

  --build a wh-object question around a VPSlash:
  oper whobj : NP -> Shape -> Raiser -> VPSlash -> IP -> Adjunct -> Adjunct -> Str
  = \subjNP,shape,raiser,vpslash1,objIP,adjunct1,adjunct2 -> 
    let
      --maybe add a raiser to the VP:
      vpslash2 = case raiser.type of {
        NoRaiser => vpslash1;
        VVRaiser => mkVPSlash raiser.vv vpslash1
      };
      --maybe make the VPSlash progressive ("-ing"):
      vpslash3 = case shape.progressivity of {
        Progressive => E.ProgrVPSlash vpslash2;
        NotProgressive => vpslash2
      };
      --maybe add adjunct1 to the VP:
      vpslash4 = case adjunct1.type of {
        NoAdjunct => vpslash3;
        AdvAdjunct => V.AdvVPSlash vpslash3 adjunct1.adv;
        AdVAdjunct => V.AdVVPSlash adjunct1.adV vpslash3
      };
      --maybe add adjunct2 to the VP:
      vpslash5 = case adjunct2.type of {
        NoAdjunct => vpslash4;
        AdvAdjunct => V.AdvVPSlash vpslash4 adjunct2.adv;
        AdVAdjunct => V.AdVVPSlash adjunct2.adV vpslash4
      };
      --add a subject, produce a ClSlash:
      clslash : ClSlash = mkClSlash subjNP vpslash5;
      --add the interrogative pronoun, turning the ClSlash into a QCl:
      qcl = mkQCl objIP clslash;
      --add temporal/aspectual features and polarity, produce an QS:
      qs = mkQS shape.temp shape.pol qcl
    in
      (mkText qs).s ++ shape.s ++ raiser.s ++ adjunct1.s ++ adjunct2.s
  ;

  --build a wh-adverb question around a VP:
  oper whadv : IAdv -> NP -> Shape -> Raiser -> VP -> Adjunct -> Adjunct -> Str
  = \iadv,subjNP,shape,raiser,vp1,adjunct1,adjunct2 -> 
    let
      --maybe add a raiser to the VP:
      vp2 = case raiser.type of {
        NoRaiser => vp1;
        VVRaiser => mkVP raiser.vv vp1
      };
      --maybe make the VP progressive ("-ing"):
      vp3 = case shape.progressivity of {
        Progressive => progressiveVP vp2;
        NotProgressive => vp2
      };
      --maybe add adjunct1 to the VP:
      vp4 = case adjunct1.type of {
        NoAdjunct => vp3;
        AdvAdjunct => mkVP vp3 adjunct1.adv;
        AdVAdjunct => mkVP adjunct1.adV vp3
      };
      --maybe add adjunct2 to the VP:
      vp5 = case adjunct2.type of {
        NoAdjunct => vp4;
        AdvAdjunct => mkVP vp4 adjunct2.adv;
        AdVAdjunct => mkVP adjunct2.adV vp4
      };
      --add a subject, produce a Cl:
      cl = mkCl subjNP vp5;
      --add the interrogative adverb, turning the Cl into a QCl:
      qcl = mkQCl iadv cl;
      --add temporal/aspectual features and polarity, produce an QS:
      qs = mkQS shape.temp shape.pol qcl
    in
      (mkText qs).s ++ shape.s ++ raiser.s ++ adjunct1.s ++ adjunct2.s
  ;

  oper test : Str =
    let
      help_V2 = (P.mkV2 (P.mkV "help"));
      try_V = (P.mkV "try");
    in
      whadv why_IAdv you_NP IsNotDoing (mkRaiser can_VV) (mkVP help_V2 i_NP) (mkAdjunct always_AdV) (mkAdjunct here_Adv)
  ;

}