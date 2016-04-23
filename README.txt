Christian Daniel
CPSC 411
10073726

Code generation for M+. Tested on all test examples in the M+ test folder, as well as a few of my own examples (included in the folder). To compile and run, do make, and then do ./TestMp <<input source file>> <<output code file>>

*Note: You’ll need to cabal install MissingH for this to run. In particular, you need access to Data.List.Utils, as I use a replace function just to clean things up (replacing haskell’s built in boolean types with lower case letters, so they work on the AM machine). I’m sure there’s a more efficient way to do this, but this was quick and worked without any other modifications to my source code.