abstract Bind = {
  flags startcat = Statement;  

  cat Word;
  fun One, Two : Word;

  cat Statement;
  fun UseBind : Word -> Word -> Statement;
  fun UseSoftBind : Word -> Word -> Statement;
  fun UseSpace : Word -> Word -> Statement;
  fun UseSoftSpace : Word -> Word -> Statement;
}