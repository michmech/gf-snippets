concrete BindEng of Bind = open Predef in {
  lincat Word = Str;
  lincat Statement = Str;
 
  lin One = "one";
  lin Two = "two";

  --outputs zero spaces in linearization, accepts zero spaces in parsing:
  lin UseBind w1 w2 = w1 ++ BIND ++ w2; 

  --outputs zero spaces in linearization, accepts zero or more spaces in parsing:
  lin UseSoftBind w1 w2 = w1 ++ SOFT_BIND ++ w2; 

  --outputs one space in linearization, accepts one or more space in parsing:
  lin UseSpace w1 w2 = w1 ++ w2; 
 
  --outputs one space in linearization, accepts zero or more spaces in parsing:
  lin UseSoftSpace w1 w2 = w1 ++SOFT_SPACE ++ w2; 
}