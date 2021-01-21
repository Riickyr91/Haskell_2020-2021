aprox_pi :: (Floating a, Ord a, Enum a) => a -> a
aprox_pi t = 
    sum [ t*t | x <- [-1+t/2, -1+t/2+t.. 1-t/2], y <- [-1+t/2, -1+t/2+t .. 1-t/2], (sqrt((0-x)^2+(0-y)^2)) <= 1]