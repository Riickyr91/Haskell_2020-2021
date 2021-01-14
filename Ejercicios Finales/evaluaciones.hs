doble :: Num a => a -> a
doble a = 2 * a

triple :: Num a => a -> a
triple a = 3 * a

evaluaciones::[a]->[(a->b)]->[[b]]
evaluaciones [] _ = []
evaluaciones (x:xs) f = 
    [w x | w <- f] : (evaluaciones xs f) 