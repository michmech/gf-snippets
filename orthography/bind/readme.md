# Using `BIND` and its friends in GF

The `BIND` token (which comes from the module `Predef`) can be used for run-time concatenation of tokens without a space between them, into a single orthographic word. This is handy for building compound nouns, for adding prefixes to words, and for doing agglutinative morphology. The nice thing about `BIND` is that it not only linearizes but also parses:
the GF runtime can guess where the `BIND` token should be in an orthographic word, and break it down into tokens correctly as your grammar wants it. For more information about `BIND` and its friends see the 2015 paper [Orthography Engineering in Grammatical Framework](https://aclanthology.org/W15-3305.pdf) by Krasimir Angelov.

**Warning.** The behaviour described here only behaves as described here if you're using the (newer) C runtime (as opposed to the older Haskell runtime). The C runtime is what you're using if you launch your GF shell with `gf --cshell` (as opposed to just `gf` which gives you the older Haskell runtime). The C runtime is also what you're (probably) using if you're embedding GF grammars inside applications written in other languages -- for example, [here](https://github.com/michmech/pgfsharp) is my solution for using GF grammars inside .NET (C#) applications.


| When the grammar has this | it puts this between `a` and `b`  | and accepts this between `a` and `b` |
|---------------------------|-----------------------------------|--------------------------------------|
| `a ++ BIND ++ b`          | no space                          | no space                             |
| `a ++ SOFT_BIND ++ b`     | no space                          | zero or more spaces                  |
| `a ++ SOFT_SPACE ++ b`    | one space                         | zero or more spaces                  |
| `a ++ b`                  | one space                         | one or more spaces                   |