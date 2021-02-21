#!/usr/bin/runhaskell
 
import Data.Maybe (fromMaybe)
 
-- given two points, returns the average of them
average :: (Int, Int) -> (Int, Int) -> (Int, Int)
average (x, y) (x_, y_) = ((x + x_) `div` 2, (y + y_) `div` 2)
 
-- given a maze and a tuple of position and wall position, returns
-- true if the wall position is not blocked (first position is unused)
notBlocked :: [String] -> ((Int, Int), (Int, Int)) -> Bool
notBlocked maze (_, (x, y)) = ' ' == (maze !! y) !! x
 
-- given a list, a position, and an element, returns a new list
-- with the new element substituted at the position
-- (it seems such a function should exist in the standard library;
-- I must be missing it)
substitute :: [a] -> Int -> a -> [a]
substitute orig pos el =
  let (before, after) = splitAt pos orig
  in before ++ [el] ++ tail after
 
-- given a maze and a position, draw a '*' at that position in the maze
draw :: [String] -> (Int, Int) -> [String]
draw maze (x, y) =
  let row = maze !! y
  in substitute maze y $ substitute row x '*'
 
-- given a maze, a previous position, and a list of tuples of potential
-- new positions and their wall positions, returns the solved maze, or
-- None if it cannot be solved
tryMoves :: [String]
         -> (Int, Int)
         -> [((Int, Int), (Int, Int))]
         -> Maybe [String]
tryMoves _ _ [] = Nothing
tryMoves maze prevPos ((newPos, wallPos):more) =
  case solve_ maze newPos prevPos of
    Nothing -> tryMoves maze prevPos more
    Just maze_ -> Just $ foldl draw maze_ [newPos, wallPos]

move :: [String] -> [((Int, Int), (Int, Int))]-> [String]

sumaVectores :: (Int, Int) -> (Int, Int) -> (Int, Int)
sumaVectores pos@(x,y)  vec@(x_,y_) = 
  (x + x_, y + y_)

posPosibles :: (Int, Int) -> Int -> [(Int, Int)]
posPosibles pos@(x,y) ori = 
  case ori of 
    0 -> [(x + 4, y), (x, y - 2), (x - 4, y), (x, y + 2)]
    1 -> [(x, y - 2), (x - 4, y), (x, y + 2), (x + 4, y)]
    2 -> [(x - 4, y), (x, y + 2), (x + 4, y), (x, y - 2)]
    3 -> [(x, y + 2), (x + 4, y), (x, y - 2), (x - 4, y)]

{-Recibe:
    -> Laberinto
    -> Posicion Actual
    -> Orientacion 
-}
check_ :: [String] -> (Int, Int) -> Int -> [String]
check_ maze (2, 1) _ = maze 
check_ maze pos ori = 
  let newPositions = posPosibles pos ori
      wallPositions = map (average pos) newPositions
      zipped = zip newPositions wallPositions
      legalMoves = filter (notBlocked maze) zipped
  in move maze (legalMoves !! 0)

{-Recibe:
    -> Laberinto 
-}
check :: [String] -> [String]
check maze = check_ (draw maze start) start 0
  where
    startx = length (head maze) - 3
    starty = length maze - 2
    start = (startx, starty)
    v = [(1,0), (0,1), (-1,0),(0,-1)]
 
main =
  let main_ = unlines . check . lines
  in interact main_