{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}
#!/usr/bin/runhaskell

{- Imports Generator -} 
import Data.Array.ST
       (STArray, freeze, newArray, readArray, writeArray)
import Data.STRef (STRef, newSTRef, readSTRef, writeSTRef)
import System.Random (Random(..), getStdGen, StdGen)
import Control.Monad (forM_, unless)
import Control.Monad.ST (ST, stToIO)
import Data.Array (Array, (!), bounds)
import Data.Bool (bool)

{- Imports Solving -}
import Data.Maybe (fromMaybe)

{- Generator -}

rand
  :: Random a
  => (a, a) -> STRef s StdGen -> ST s a
rand range gen = do
  (a, g) <- randomR range <$> readSTRef gen
  gen `writeSTRef` g
  return a
 
data Maze = Maze
  { rightWalls, belowWalls :: Array (Int, Int) Bool
  }
 
maze :: Int -> Int -> StdGen -> ST s Maze
maze width height gen = do
  visited <- mazeArray False
  rWalls <- mazeArray True
  bWalls <- mazeArray True
  gen <- newSTRef gen
  (,) <$> rand (0, maxX) gen <*> rand (0, maxY) gen >>=
    visit gen visited rWalls bWalls
  Maze <$> freeze rWalls <*> freeze bWalls
  where
    visit gen visited rWalls bWalls here = do
      writeArray visited here True
      let ns = neighbors here
      i <- rand (0, length ns - 1) gen
      forM_ (ns !! i : take i ns ++ drop (i + 1) ns) $
        \there -> do
          seen <- readArray visited there
          unless seen $
            do removeWall here there
               visit gen visited rWalls bWalls there
      where
        removeWall (x1, y1) (x2, y2) =
          writeArray (bool rWalls bWalls (x1 == x2)) (min x1 x2, min y1 y2) False
    neighbors (x, y) =
      bool [(x - 1, y)] [] (0 == x) ++
      bool [(x + 1, y)] [] (maxX == x) ++
      bool [(x, y - 1)] [] (0 == y) ++ bool [(x, y + 1)] [] (maxY == y)
    maxX = width - 1
    maxY = height - 1
    mazeArray =
      newArray ((0, 0), (maxX, maxY)) :: Bool -> ST s (STArray s (Int, Int) Bool)
 
printMaze :: Maze -> IO ()
printMaze (Maze rWalls bWalls) = do
  putStrLn $ '+' : concat (replicate (maxX + 1) "---+")
  forM_ [0 .. maxY] $
    \y -> do
      putStr "|"
      forM_ [0 .. maxX] $
        \x -> do
          putStr "   "
          putStr $ bool " " "|" (rWalls ! (x, y))
      putStrLn ""
      forM_ [0 .. maxX] $
        \x -> do
          putStr "+"
          putStr $ bool "   " "---" (bWalls ! (x, y))
      putStrLn "+"
  where
    maxX = fst (snd $ bounds rWalls)
    maxY = snd (snd $ bounds rWalls)
 
generator :: IO ()
generator = getStdGen >>= stToIO . maze 11 8 >>= printMaze

{- Solving -}

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
 
tryMoves :: [String]
         -> (Int, Int)
         -> [((Int, Int), (Int, Int))]
         -> Maybe [String]
tryMoves _ _ [] = Nothing
tryMoves maze prevPos ((newPos, wallPos):more) =
  case solve_ maze newPos prevPos of
    Nothing -> tryMoves maze prevPos more
    Just maze_ -> Just $ foldl draw maze_ [newPos, wallPos]
 
solve_ :: [String] -> (Int, Int) -> (Int, Int) -> Maybe [String]
solve_ maze (2, 1) _ = Just maze
solve_ maze pos@(x, y) prevPos =
  let newPositions = [(x, y - 2), (x + 4, y), (x, y + 2), (x - 4, y)]
      notPrev pos_ = pos_ /= prevPos
      newPositions_ = filter notPrev newPositions
      wallPositions = map (average pos) newPositions_
      zipped = zip newPositions_ wallPositions
      legalMoves = filter (notBlocked maze) zipped
  in tryMoves maze pos legalMoves
 
solve :: [String] -> Maybe [String]
solve maze = solve_ (draw maze start) start (-1, -1)
  where
    startx = length (head maze) - 3
    starty = length maze - 2
    start = (startx, starty)
 
solving :: IO ()
solving =
  let solving_ = unlines . fromMaybe ["can_t solve"] . solve . lines
  in interact solving_