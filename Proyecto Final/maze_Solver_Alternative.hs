#!/usr/bin/runhaskell
 
import Data.Maybe (fromMaybe)
 
average :: (Int, Int) -> (Int, Int) -> (Int, Int)
average (x, y) (x_, y_) = ((x + x_) `div` 2, (y + y_) `div` 2)
 
notBlocked :: [String] -> ((Int, Int), (Int, Int)) -> Bool
notBlocked maze (_, (x, y)) = ' ' == (maze !! y) !! x
 
substitute :: [a] -> Int -> a -> [a]
substitute orig pos el =
  let (before, after) = splitAt pos orig
  in before ++ [el] ++ tail after
 
draw :: [String] -> (Int, Int) -> [String]
draw maze (x, y) =
  let row = maze !! y
  in substitute maze y $ substitute row x '*'
 
posPosibles :: (Int, Int) -> Int -> [(Int, Int)]
posPosibles pos@(x,y) ori = 
  case ori of 
    0 -> [(x + 4, y), (x, y - 2), (x - 4, y), (x, y + 2)]
    1 -> [(x, y - 2), (x - 4, y), (x, y + 2), (x + 4, y)]
    2 -> [(x - 4, y), (x, y + 2), (x + 4, y), (x, y - 2)]
    3 -> [(x, y + 2), (x + 4, y), (x, y - 2), (x - 4, y)]

move :: [String] -> ((Int, Int),(Int, Int)) -> Int -> [String] 
move maze (newPos, wallPos) ori = 
  check_ (draw maze newPos) newPos ori

check_ :: [String] -> (Int, Int) -> Int -> [String]
check_ maze (2, 1) _ = maze 
check_ maze pos ori 
  | notBlocked maze (head zipped) = move maze (head zipped) ((ori + 3) `mod` 4)
  | notBlocked maze (zipped !! 1) = move maze (zipped !! 1) ((ori + 0) `mod` 4)
  | notBlocked maze (zipped !! 2) = move maze (zipped !! 2) ((ori + 1) `mod` 4)
  | notBlocked maze (zipped !! 3) = move maze (zipped !! 3) ((ori + 2) `mod` 4)
  where
    newPositions = posPosibles pos ori
    wallPositions = map (average pos) newPositions
    zipped = zip newPositions wallPositions

check :: [String] -> [String]
check maze = check_ (draw maze start) start 0
  where
    startx = length (head maze) - 3
    starty = length maze - 2
    start = (startx, starty)
 
main =
  let main_ = unlines . check . lines
  in interact main_