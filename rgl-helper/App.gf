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
  fun Everybody, Nobody, Somebody : Complement;
  fun It, This, That, These, Those : Complement;
  fun Everything, Nothing, Something : Complement; 
  
  cat Adjunct;
  fun NoAdjunct, Everywhere, Somewhere, Here, There, Now, Always : Adjunct;

  cat IComplement;
  fun Who, What : IComplement;

  cat IAdjunct;
  fun Why, Where, When, How : IAdjunct;

  cat Sentence;
  
  --[someone] sleeps
  fun Sleep1_Dec :  Complement -> Shape -> Raiser -> Adjunct -> Adjunct -> Sentence;
  fun Sleep1_Ask :  Complement -> Shape -> Raiser -> Adjunct -> Adjunct -> Sentence;
  fun Sleep1_Wh1 : IComplement -> Shape -> Raiser -> Adjunct -> Adjunct -> Sentence;
  fun Sleep1_Wh9 :  Complement -> Shape -> Raiser -> Adjunct -> Adjunct -> IAdjunct -> Sentence;
  
  --[someone] helps [someone]
  fun Help2_Dec :  Complement -> Shape -> Raiser ->  Complement -> Adjunct -> Adjunct -> Sentence;
  fun Help2_Ask :  Complement -> Shape -> Raiser ->  Complement -> Adjunct -> Adjunct -> Sentence;
  fun Help2_Wh1 : IComplement -> Shape -> Raiser ->  Complement -> Adjunct -> Adjunct -> Sentence;
  fun Help2_Wh2 :  Complement -> Shape -> Raiser -> IComplement -> Adjunct -> Adjunct -> Sentence;
  fun Help2_Wh9 :  Complement -> Shape -> Raiser ->  Complement -> Adjunct -> Adjunct -> IAdjunct -> Sentence;
 
  --[someone] helps [someone] with [something]
  fun Help3_Dec :  Complement -> Shape -> Raiser ->  Complement ->  Complement -> Adjunct -> Adjunct -> Sentence;
  fun Help3_Ask :  Complement -> Shape -> Raiser ->  Complement ->  Complement -> Adjunct -> Adjunct -> Sentence;
  fun Help3_Wh1 : IComplement -> Shape -> Raiser ->  Complement ->  Complement -> Adjunct -> Adjunct -> Sentence;
  fun Help3_Wh9 :  Complement -> Shape -> Raiser ->  Complement ->  Complement -> Adjunct -> Adjunct -> IAdjunct -> Sentence;


}