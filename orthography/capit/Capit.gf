abstract Capit = {
  flags startcat = Statement;
  
  cat Pronoun;
  fun They, YouPolite : Pronoun;

  cat Verb;
  fun Sleep : Verb;

  cat Statement;
  fun Say : Pronoun -> Verb -> Statement; --someone sleeps
  fun Ask : Pronoun -> Verb -> Statement; --does someone sleep?
}