resource HelperEng = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  --shapes:
  param Shape = 
      Did             | Does            | WillDo               | WouldDo
    | HadDone         | HasDone         | WillHaveDone         | WouldHaveDone
    | WasDoing        | IsDoing         | WillBeDoing          | WouldBeDoing 
    | HadBeenDoing    | HasBeenDoing    | WillHaveBeenDoing    | WouldHaveBeenDoing
    | DidNotDo        | DoesNotDo       | WillNotDo            | WouldNotDo
    | HadNotDone      | HasNotDone      | WillNotHaveDone      | WouldNotHaveDone
    | WasNotDoing     | IsNotDoing      | WillNotBeDoing       | WouldNotBeDoing
    | HadNotBeenDoing | HasNotBeenDoing | WillNotHaveBeenDoing | WouldNotHaveBeenDoing
  ;

  --converts a shape into RGL's Temp:  
  oper shape_Temp : Shape -> Temp = \shape ->
    case shape of {
      Did           | WasDoing           | DidNotDo         | WasNotDoing           => mkTemp pastTense simultaneousAnt;
      Does          | IsDoing            | DoesNotDo        | IsNotDoing            => mkTemp presentTense simultaneousAnt;
      WillDo        | WillBeDoing        | WillNotDo        | WillNotBeDoing        => mkTemp futureTense simultaneousAnt;
      WouldDo       | WouldBeDoing       | WouldNotDo       | WouldNotBeDoing       => mkTemp conditionalTense simultaneousAnt;
      HadDone       | HadBeenDoing       | HadNotDone       | HadNotBeenDoing       => mkTemp pastTense anteriorAnt;
      HasDone       | HasBeenDoing       | HasNotDone       | HasNotBeenDoing       => mkTemp presentTense anteriorAnt;
      WillHaveDone  | WillHaveBeenDoing  | WillNotHaveDone  | WillNotHaveBeenDoing  => mkTemp presentTense anteriorAnt;
      WouldHaveDone | WouldHaveBeenDoing | WouldNotHaveDone | WouldNotHaveBeenDoing => mkTemp conditionalTense anteriorAnt
    }
  ;

  --converts a shape into RGL's Pol:
  oper shape_Pol : Shape -> Pol = \shape ->
    case shape of {
        Did             | Does            | WillDo               | WouldDo
      | HadDone         | HasDone         | WillHaveDone         | WouldHaveDone
      | WasDoing        | IsDoing         | WillBeDoing          | WouldBeDoing 
      | HadBeenDoing    | HasBeenDoing    | WillHaveBeenDoing    | WouldHaveBeenDoing
        => positivePol;
      _ => negativePol
    }
  ;

  --tells you whether a shape is progressive ("-ing") or not:
  param Progressivity = Progressive | NotProgressive; 
  oper shape_Progressivity : Shape -> Progressivity = \shape ->
    case shape of {
        WasDoing        | IsDoing         | WillBeDoing          | WouldBeDoing 
      | HadBeenDoing    | HasBeenDoing    | WillHaveBeenDoing    | WouldHaveBeenDoing
      | WasNotDoing     | IsNotDoing      | WillNotBeDoing       | WouldNotBeDoing
      | HadNotBeenDoing | HasNotBeenDoing | WillNotHaveBeenDoing | WouldNotHaveBeenDoing
        => Progressive;
      _ => NotProgressive
    }
  ;

  --data type and makers for raisers:
  param RaiserType = NoRaiser | VVRaiser;
  oper Raiser : Type = {
    type : RaiserType;
    vv : VV
  };
  oper dummy_VV : VV = can_VV;
  oper noRaiser : Raiser = {
    type = NoRaiser;
    vv = dummy_VV
  };
  oper mkRaiser : VV -> Raiser = \vv -> {
    type = VVRaiser;
    vv = vv
  };

  --data type and makers for adjuncts:
  param AdjunctType = NoAdjunct | AdvAdjunct | AdVAdjunct;
  oper Adjunct : Type = {
    type : AdjunctType;
    adv : Adv;
    adV : AdV
  };
  oper dummy_Adv : Adv = here_Adv;
  oper dummy_AdV : AdV = always_AdV;
  oper noAdjunct : Adjunct = {
    type = NoAdjunct;
    adv = dummy_Adv;
    adV = dummy_AdV
  };
  oper mkAdjunct = overload {
    mkAdjunct : Adv -> Adjunct = \adv -> {
      type = AdvAdjunct;
      adv = adv;
      adV = dummy_AdV
    };
    mkAdjunct : AdV -> Adjunct = \adV -> {
      type = AdVAdjunct;
      adv = dummy_Adv;
      adV = adV
    }
  };

  --build a declarative sentence around a V:
  oper declarative1 : NP -> Shape -> Raiser -> V -> Adjunct -> Adjunct -> Text
  = \subjNP,shape,raiser,v,adjunct1,adjunct2 -> 
    let
      --turn the verb into a VP:  
      vp1 = mkVP v;
    in
      _declarative subjNP shape raiser vp1 adjunct1 adjunct2
  ;

  --build a declarative sentence around a V2:
  oper declarative2 : NP -> Shape -> Raiser -> V2 -> NP -> Adjunct -> Adjunct -> Text
  = \subjNP,shape,raiser,v2,objNP,adjunct1,adjunct2 -> 
    let
      --combine the verb and its object into a VP:  
      vp1 = mkVP v2 objNP;
    in
      _declarative subjNP shape raiser vp1 adjunct1 adjunct2
  ;

  --shared by declarative1 and declarative2:
  oper _declarative : NP -> Shape -> Raiser -> VP -> Adjunct -> Adjunct -> Text
  = \subjNP,shape,raiser,vp1,adjunct1,adjunct2 -> 
    let
      --maybe make the VP progressive ("-ing"):
      vp2 = case shape_Progressivity shape of {
        Progressive => progressiveVP vp1;
        NotProgressive => vp1
      };
      --maybe add a raiser to the VP:
      vp3 = case raiser.type of {
        NoRaiser => vp2;
        VVRaiser => mkVP raiser.vv vp2
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
      s = mkS (shape_Temp shape) (shape_Pol shape) cl
    in
      mkText s
  ;

  oper test : Text =
    let
      help_V2 = (P.mkV2 (P.mkV "help"));
      try_V = (P.mkV "try");
    in
      declarative1 you_NP WillDo (mkRaiser can_VV) try_V (mkAdjunct always_AdV) (mkAdjunct here_Adv)
      -- declarative2 you_NP WillDo (mkRaiser can_VV) help_V2 i_NP (mkAdjunct always_AdV) (mkAdjunct here_Adv)
  ;

}