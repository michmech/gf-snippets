concrete CapitGer of Capit = open Predef in {
  flags case_sensitive=off;

  lincat Pronoun = Str;
  lin They = "sie";
  lin YouPolite = "Sie";

  lincat Verb = Str;
  lin Sleep = "schlafen";

  lincat Statement = Str;
  lin Say p v = CAPIT ++ p ++ v ++ SOFT_BIND ++ "."; 
  lin Ask p v = CAPIT ++ v ++ p ++ SOFT_BIND ++ "?"; 
}