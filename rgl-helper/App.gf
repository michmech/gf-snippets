abstract App = {
  flags startcat = Sentence;

  cat Shape;
  fun Did, Does, WillDo, WouldDo : Shape;
  fun WasDoing, IsDoing, WillBeDoing, WouldBeDoing : Shape;
  fun HasDone, HasBeenDoing : Shape;
  fun DidNotDo, DoesNotDo, WillNotDo, WouldNotDo : Shape;
  fun WasNotDoing, IsNotDoing, WillNotBeDoing, WouldNotBeDoing : Shape;
  fun HasNotDone, HasNotBeenDoing : Shape;

  cat Raiser;
  fun NoRaiser, Can, Must, Want, Try : Raiser;

  cat Complement;
  fun Me, We, You, He, She, They : Complement;

  cat Adjunct;
  fun NoAdjunct, Everywhere, Somewhere, Here, There, Now, Always : Adjunct;

  cat IComplement;
  fun Who : IComplement;

  cat IAdjunct;
  fun Why, Where, When, How : IAdjunct;

  cat Sentence;
  
  --[someone] sleeps
  fun Sleep1_Dec : Complement -> Shape -> Raiser -> Adjunct -> Adjunct -> Sentence;
  fun Sleep1_Ask : Complement -> Shape -> Raiser -> Adjunct -> Adjunct -> Sentence;
  fun Sleep1_WhSubj : IComplement -> Shape -> Raiser -> Adjunct -> Adjunct -> Sentence;
  fun Sleep1_WhAdv : IAdjunct -> Complement -> Shape -> Raiser -> Adjunct -> Adjunct -> Sentence;
  
  --[someone] helps [someone]
  fun Help2_Dec : Complement -> Shape -> Raiser -> Complement -> Adjunct -> Adjunct -> Sentence;
  fun Help2_Ask : Complement -> Shape -> Raiser -> Complement -> Adjunct -> Adjunct -> Sentence;
  fun Help2_WhSubj : IComplement -> Shape -> Raiser -> Complement -> Adjunct -> Adjunct -> Sentence;
  fun Help2_WhObj : Complement -> Shape -> Raiser -> IComplement -> Adjunct -> Adjunct -> Sentence;
  fun Help2_WhAdv : IAdjunct -> Complement -> Shape -> Raiser -> Complement -> Adjunct -> Adjunct -> Sentence;
 
}