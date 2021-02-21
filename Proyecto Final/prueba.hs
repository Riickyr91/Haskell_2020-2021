sumaVectores :: (Int, Int) -> (Int, Int) -> (Int, Int)
sumaVectores pos@(x,y)  vec@(x_,y_) = 
  (x + x_, y + y_)

average :: (Int, Int) -> (Int, Int) -> (Int, Int)
average (x, y) (x_, y_) = ((x + x_) `div` 2, (y + y_) `div` 2)

posPosibles :: (Int, Int) -> Int -> [(Int, Int)]
posPosibles pos@(x,y) ori = 
  case ori of 
    0 -> [(x + 4, y), (x, y - 2), (x - 4, y), (x, y + 2)]
    1 -> [(x, y - 2), (x - 4, y), (x, y + 2), (x + 4, y)]
    2 -> [(x - 4, y), (x, y + 2), (x + 4, y), (x, y - 2)]
    3 -> [(x, y + 2), (x + 4, y), (x, y - 2), (x - 4, y)]