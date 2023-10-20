import System.IO
import Data.Char (toLower, isAlpha)
import Control.DeepSeq
import Text.Printf

isVowel :: Char -> Bool
isVowel x = x `elem` "aeiou"

countVowels :: String -> Int
countVowels = length . filter isVowel . map toLower

vowelPercentage :: String -> Float
vowelPercentage str = fromIntegral (countVowels str) / fromIntegral (length (filter isAlpha str))

getPrintPercentage :: Float -> String
getPrintPercentage num = (printf "%0.f" (num * 100)) ++ "%"

main :: IO ()
main = do
    putStrLn "Please enter text (press Ctrl-D twice when done):"
    input <- getContents
    input `deepseq` putStrLn ("\n\nResult is: " ++ (getPrintPercentage . vowelPercentage) input)

