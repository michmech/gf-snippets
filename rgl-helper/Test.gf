abstract Test = {
  flags startcat = Sentence;

  cat Argument;
  fun Me, You : Argument;

  cat Adverbial;
  fun NoAdverbial, Here, Now : Adverbial;

  cat Sentence;
  fun Help : Argument -> Argument -> Adverbial -> Adverbial -> Sentence;
}