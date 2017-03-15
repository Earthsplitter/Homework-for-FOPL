
# 4. Haskell Map for Trees

##### (a)

```haskell
data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)
maptree f (Leaf a) = Leaf (f a)
maptree f (Node left right) = Node (maptree f left) (maptree f right) 
```

##### (b)

**Line 2** The base case: if the tree is a (Leaf a), return a new Leaf f(a).

**Line 3** If it is a Node, call (maptree f) on its children.

##### (c)

```haskell
    :t maptree
    maptree :: (t -> a) -> Tree t -> Tree a
```

Obviously, it cannot be (t -> t), since we do not require that new Tree store the same type of data as the old one.

For example, we can trans 'a' to 1, 'b' to 2 and so on.

# 5. Haskell Reduce for Trees

##### (a)

```haskell
    reduce :: (a -> a -> a) -> Tree a -> a
    reduce f (Leaf a) = a
    reduce f (Node left right) = f (reduce f left) (reduce f right)
```

#####(b)

**Line 2** The base case: if the tree is a (Leaf a), just return this Leaf.

**Line 3** If it is a Node, call f with the results of (reduce f left/right) as parameters(as the tree shows in the problem)

# 6. Currying

##### (a)

```haskell
curry :: ((a,b) -> c) -> a -> b -> c
curry f a b = f (a,b)

uncurry :: (a -> (b -> c)) -> (a,b) -> c
uncurry f (a,b) = f a b
```

##### (b)
Demonstration as following, using lambda calculus:
```
let f: λa.λb.a+b(any operation is ok)

curry: λf.λa.λb.f (a,b)
uncurry: λf.λ(a,b).f a b

uncurry f = λ(a,b).f a b               
curry(uncurry f) = λf.λa.λb.f (a,b) (λ(a,b).f a b)
                 = λa.λb.λ(a,b).f a b (a,b)
                 = λa.λb.f a b
                 = λa.λb.a+b
                 = f
```

# 7. Infinite Data Structures

##### (a)

```haskell
evens :: [Int]
evens = [ 2*x | x <- [1..]]
odds :: [Int]
odds = [2*x+1 | x <- [0..]]
```

##### (b)

```haskell
merge :: [Int] -> [Int] -> [Int]
merge a [] = a
merge [] b = b
merge (x:xs) (y:ys)
    | x <= y = x:merge xs (y:ys)
    | otherwise = y:merge (x:xs) ys

```

##### (c)

Obviously, the call will never terminate. For infinite list, it will never
achieve the base case, namely, `merge a []` or `merge b []`, so it will keep running
until you click the close button.