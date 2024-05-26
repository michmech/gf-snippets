--How to build imperative sentences.

resource Imperatives = open SyntaxEng, (P = ParadigmsEng), (M = MorphoEng), Prelude in {

  --We start with a VP.
  --A VP represents a verb with all its complements (direct object, indirect object etc.) except the subject.
  --(See Declaratives.gf for more details on building VPs.)
  oper step001 : VP = 
    mkVP --try to help her today
      (mkVP --try to help her
        (P.mkVV (P.mkV "try"))
        (mkVP --help her
          (P.mkV2 (P.mkV "help"))
          she_NP
        )
      )
      (P.mkAdv "today")
  ;

  --Turn the VP into an Imp.
  --An Imp represents a command, not yet fixed for polarity or for who it is being said to.
  oper step002 : Imp =
    mkImp
      step001 --VP: try to help her today
  ;

  --Once we have an Imp, we can fix its polarity and the addressee, thereby turning it into an Utt.
  --Remember that Utt is a common supercategory for S and others. Imp is one of those others.
  oper step003 : Utt =
    mkUtt --don't try to help her today
      singularImpForm
      negativePol
      step002 --Imp: try to help her today
  ; 

}
