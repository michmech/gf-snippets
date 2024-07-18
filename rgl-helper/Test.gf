abstract Test = {
  flags startcat = Sentence;

  cat Complement;
  fun Me, You : Complement;

  cat Adjunct;
  fun NoAdjunct, Here, Now : Adjunct;

  cat Sentence;
  fun Help : Complement -> Complement -> Adjunct -> Adjunct -> Sentence;
}