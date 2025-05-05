abstract App = {
  flags startcat = Sentence;

  cat Shape;
  fun Did, Does, WillDo, WouldDo : Shape;
  fun WasDoing, IsDoing, WillBeDoing, WouldBeDoing : Shape;
  fun HasDone, HasBeenDoing : Shape;
  fun DidNotDo, DoesNotDo, WillNotDo, WouldNotDo : Shape;
  fun WasNotDoing, IsNotDoing, WillNotBeDoing, WouldNotBeDoing : Shape;
  fun HasNotDone, HasNotBeenDoing : Shape;

  cat ImpShape;
  fun Do, DoNot : ImpShape;

  cat ImpTarget;
  fun HeyYou : ImpTarget;

  cat Raiser;
  fun NoRaiser, Can, Must, WantTo, TryTo : Raiser;

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
  fun Sleep1_Dec :  Complement ->    Shape -> Raiser -> Adjunct -> Sentence; --I am sleeping.
  fun Sleep1_Ask :  Complement ->    Shape -> Raiser -> Adjunct -> Sentence; --are you sleeping?
  fun Sleep1_Wh1 : IComplement ->    Shape -> Raiser -> Adjunct -> Sentence; --who is sleeping?
  fun Sleep1_Wh9 :  Complement ->    Shape -> Raiser -> Adjunct -> IAdjunct -> Sentence; --where are you sleeping?
  fun Sleep1_Imp :   ImpTarget -> ImpShape -> Raiser -> Adjunct -> Sentence; --don't sleep.
  
  --[someone] helps [someone]
  fun Help2_Dec :  Complement ->    Shape -> Raiser ->  Complement -> Adjunct -> Sentence; --I am helping you.
  fun Help2_Ask :  Complement ->    Shape -> Raiser ->  Complement -> Adjunct -> Sentence; --are you helping me?
  fun Help2_Wh1 : IComplement ->    Shape -> Raiser ->  Complement -> Adjunct -> Sentence; --who will help me?
  fun Help2_Wh2 :  Complement ->    Shape -> Raiser -> IComplement -> Adjunct -> Sentence; --who am I going to help?
  fun Help2_Wh9 :  Complement ->    Shape -> Raiser ->  Complement -> Adjunct -> IAdjunct -> Sentence; --why are you helping me?
  fun Help2_Imp :   ImpTarget -> ImpShape -> Raiser ->  Complement -> Adjunct -> Sentence; --help me.
 
  --[someone] helps [someone] with [something]
  fun Help3_Dec :  Complement ->    Shape -> Raiser ->  Complement ->  Complement -> Adjunct -> Sentence; --I will help you with that.
  fun Help3_Ask :  Complement ->    Shape -> Raiser ->  Complement ->  Complement -> Adjunct -> Sentence; --will you help me with that? 
  fun Help3_Wh1 : IComplement ->    Shape -> Raiser ->  Complement ->  Complement -> Adjunct -> Sentence; --who helped you with it?
  fun Help3_Wh3 :  Complement ->    Shape -> Raiser ->  Complement -> IComplement -> Adjunct -> Sentence; --what are you trying to help me with?
  fun Help3_Wh9 :  Complement ->    Shape -> Raiser ->  Complement ->  Complement -> Adjunct -> IAdjunct -> Sentence; --why didn't you help them? 
  fun Help3_Imp :   ImpTarget -> ImpShape -> Raiser ->  Complement ->  Complement -> Adjunct -> Sentence; --help me with this.

}