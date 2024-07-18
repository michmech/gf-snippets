abstract Test = {
  flags startcat = Sentence;

  cat Shape;
  fun Did, Does, WillDo, WouldDo : Shape;
  fun WasDoing, IsDoing, WillBeDoing, WouldBeDoing : Shape;
  fun HasDone, HasBeenDoing : Shape;
  fun DidNotDo, DoesNotDo, WillNotDo, WouldNotDo : Shape;
  fun WasNotDoing, IsNotDoing, WillNotBeDoing, WouldNotBeDoing : Shape;
  fun HasNotDone, HasNotBeenDoing : Shape;

  cat Raiser;
  fun NoRaiser, Can, Must, Want : Raiser;

  cat Complement;
  fun Me, We, You, He, She, They : Complement;

  cat Adjunct;
  fun NoAdjunct, Everywhere, Somewhere, Here, There, Now, Always : Adjunct;

  cat Sentence;
  
  --[someone] sleeps
  fun Sleep1_Dec : Complement -> Shape -> Raiser -> Adjunct -> Adjunct -> Sentence;

  --[someone] helps [someone]
  fun Help2_Dec : Complement -> Shape -> Raiser -> Complement -> Adjunct -> Adjunct -> Sentence;
}