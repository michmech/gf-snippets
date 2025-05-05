# Using the `CAPIT` token in GF

The `CAPIT` token (which comes from the module `Predef`) can be used for run-time capitalization.
It capitalizes the first letter of the next orthographic word.

I am explaining it here on the example of the German pronouns "sie" and "Sie" which differ only in capitalization
but have different meanings:

- The uncapitalized one, "sie", means either 'they' or 'she', in nominative and accusative.
- The capitalized one, "Sie", means 'you' (as a polite form of address), in nominative and accusative.

While reading a text in German, when you encounter one of these two pronouns in the middle of a sentence,
the presence or absence of capitalization helps you disambiguate which pronoun you're looking at. 
But when you encounter "Sie" at the start of a sentence you won't know which one you're looking at:
is it a "sie" capitalized because it happens to be at the start of a sentence, or is it a "Sie"?

Now, let's see if GF's `CAPIT` token, in interplay with or without the `case_sensitive` flag, can help me 
with this pesky German "sie"/"Sie".

## How it works

**Warning.** The behaviour described here only behaves as described here if you're using the (newer) C runtime (as opposed to the older Haskell runtime). The C runtime is what you're using if you launch your GF shell with `gf --cshell` (as opposed to just `gf` which gives you the older Haskell runtime). The C runtime is also what you're (probably) using if you're embedding GF grammars inside applications written in other languages -- for example, [here](https://github.com/michmech/pgfsharp) is my solution for using GF grammars inside .NET (C#) applications.

Without `flags case_sensitive=off`:

| When the grammar has this | it linearizes into this | and accepts this when parsing |
|---------------------------|-------------------------|-------------------------------|
| `"sie"`                   | `sie`                   | `sie`                         |
| `"Sie"`                   | `Sie`                   | `Sie`                         |
| `CAPIT ++ "sie"`          | `Sie`                   | `sie`                         |
| `CAPIT ++ "Sie"`          | `Sie`                   | `Sie`                         |

With `flags case_sensitive=off`:

| When the grammar has this | it linearizes into this | and accepts this when parsing |
|---------------------------|-------------------------|-------------------------------|
| `"sie"`                   | `sie`                   | `sie` and `Sie`               |
| `"Sie"`                   | `Sie`                   | `sie` and `Sie`               |
| `CAPIT ++ "sie"`          | `Sie`                   | `sie` and `Sie`               |
| `CAPIT ++ "Sie"`          | `Sie`                   | `sie` and `Sie`               |

In other words:
- `CAPIT` is always ignored in parsing (regardless of what `flags case_sensitive` says),
- `flags case_sensitive=off` causes all capitalization to be ignored in parsing: capitalization caused by `CAPIT`, and hardcoded capitalization.

**Note.** The 2015 paper [Orthography Engineering in Grammatical Framework](https://aclanthology.org/W15-3305.pdf) by Krasimir Angelov, which introduces these features, says that `flags case_sensitive=off` only converts all input into lower-case before parsing, and nothing else. It says that, for case-insensitive parsing to work, all hard-coded tokens in your grammar must be in lower-case. This is not true, according to my tests (using the C runtime included in GF version 3.11.0). What `flags case_sensitive=off` actually does is more than that: it really does compare everything in a case-insensitive manner, regardless of whether the tokens in the grammar are hard-coded as lower-case or capitalized. Maybe this is an improvement that has been introduced *after* the 2015 paper.

## Discussion

I am forced to conclude that the `CAPIT` token, with or without the `case_sensitive` flag, does not work the way
I would like it to. It is good for what it was intended for: to produce correctly capitalized output, and to accept
input even when it is capitalized incorrectly. What it isn't good for, however, is for helping me as a grammar author to distinguish between situations when capitalization is meaning-carrying (and therefore unambiguous in parsing) versus situations when capitalization is only a sentence-initial artifact (and therefore ambiguous in parsing).

There are situations -- typically in the middle of a sentence -- where capitalization is unambiguous:
- when the grammar expects "sie" it should accept only "sie",
- when the grammar expects "Sie" it should accept only "Sie".

Then there are situations -- typically at the beginning of a sentence -- where capitalization is ambiguous,
but only one way, such that upper-case input is ambiguous but lower-case input isn't:
- when the grammar expects "sie" it should accept both "sie" and "Sie",
- when the grammar expects "Sie" it should accept only "Sie".

So, in my ideal GF runtime, the `CAPIT` token would behave like this:

Without `flags case_sensitive=off`:

| When the grammar has this | it linearizes into this | and accepts this when parsing |
|---------------------------|-------------------------|-------------------------------|
| `"sie"`                   | `sie`                   | `sie`                         |
| `"Sie"`                   | `Sie`                   | `Sie`                         |
| `CAPIT ++ "sie"`          | `Sie`                   | `Sie` (this is the only difference I'm proposing) |
| `CAPIT ++ "Sie"`          | `Sie`                   | `Sie`                         |

With `flags case_sensitive=off`:

| When the grammar has this | it linearizes into this | and accepts this when parsing |
|---------------------------|-------------------------|-------------------------------|
| `"sie"`                   | `sie`                   | `sie` and `Sie`               |
| `"Sie"`                   | `Sie`                   | `sie` and `Sie`               |
| `CAPIT ++ "sie"`          | `Sie`                   | `sie` and `Sie`               |
| `CAPIT ++ "Sie"`          | `Sie`                   | `sie` and `Sie`               |

In other words, I think it would be more reasonable to ignore `CAPIT` 
*only* when parsing with `flags case_sensitive=off`, and to *not* ignore it otherwise.
But hey, that's just me.
