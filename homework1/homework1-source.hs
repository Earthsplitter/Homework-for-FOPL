-- 4.
data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)

maptree f (Leaf a) = Leaf (f a)
maptree f (Node left right) = Node (maptree f left) (maptree f right) 

-- 5.
reduce :: (a -> a -> a) -> Tree a -> a
reduce f (Leaf a) = a
reduce f (Node left right) = f (reduce f left) (reduce f right)

-- 6.
curry :: ((a,b) -> c) -> a -> b -> c
curry f a b = f (a,b)

uncurry :: (a -> (b -> c)) -> (a,b) -> c
uncurry f (a,b) = f a b

-- 7.
evens :: [Int]
evens = [ 2*x | x <- [1..]]
odds :: [Int]
odds = [2*x+1 | x <- [0..]]

merge :: [Int] -> [Int] -> [Int]
merge a [] = a
merge [] b = b
merge (x:xs) (y:ys)
    | x <= y = x:merge xs (y:ys)
    | otherwise = y:merge (x:xs) ys
