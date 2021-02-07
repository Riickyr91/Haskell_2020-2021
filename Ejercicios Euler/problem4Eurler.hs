palindromo :: Show a => a -> Bool
palindromo x = show x == reverse (show x)

fPalindromos :: Integer
fPalindromos =
    maximum ([x * y | x <- [100..999], y <- [100..999], let n = x*y, palindromo n == True ])