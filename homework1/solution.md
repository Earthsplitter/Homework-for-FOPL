
#4. Haskell Map for Trees

#####(a)

```haskell
data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)
maptree f (Leaf a) = Leaf (f a)
maptree f (Node left right) = Node (maptree f left) (maptree f right) 
```

#####(b)

**Line 2** The base case: if the tree is a (Leaf a), return a new Leaf f(a).

**Line 3** If it is a Node, call (maptree f) on its children.

#####(c)

```haskell
    :t maptree
    maptree :: (t -> a) -> Tree t -> Tree a
```

Obviously, it cannot be (t -> t), since we do not require that new Tree store the same type of data as the old one.

For example, we can trans 'a' to 1, 'b' to 2 and so on.

#5. Haskell Reduce for Trees

#####(a)

```haskell
    reduce :: (a -> a -> a) -> Tree a -> a
    reduce f (Leaf a) = a
    reduce f (Node left right) = f (reduce f left) (reduce f right)
```

#####(b)

**Line 2** The base case: if the tree is a (Leaf a), just return this Leaf.

**Line 3** If it is a Node, call f with the results of (reduce f left/right) as parameters(as the tree shows in the problem)