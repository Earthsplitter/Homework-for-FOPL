
#1. Lambda Calculus Reduction

Right Answer with Renaming Bound Variable:

```haskell
    (λp.λq.λr.p q r)(λp.λq.p q r)
=>  (λa.λb.λc.a b c)(λp.λq.p q r)
=>  λb.λc.(λp.λq.p q r) b c
=>  λb.λc.b c r
```

Wrong Answer without Renaming:

```haskell
    (λp.λq.λr.p q r)(λp.λq.p q r)
=>  λq.λr.(λp.λq.p q r) q r
=>  λq.λr.(λq.q q r) r
=>  λq.λr.r r r
```

#2. Translation into Lambda Calculus

Lambda calculus of function f:

```haskell
    λg.g g
```

apply f to f:

```haskell
    (λg.g g) (λg.g g)
=>  (λg.g g) (λg.g g)
=>  ......   never terminate
```

#3. Lazy Evaluation and Parallelism

#####(a)

It is possible to happen. As we can see from the definition of `g`, the test `x+y = 0` need the result of e<sub>1</sub> and e<sub>2</sub>.

#####(b)

In lazy evaluation mode, this program works well, since it will never need the result of e<sub>2</sub>.

In parallel evaluation mode, It also works fine. The evaluation of `x+y = 0`(need `x` firstly) is behind the evaluation of `x = 0`.

#####(c)

It just evaluate `g` and return (since it do not need e<sub>2</sub>). The error is unimportant if it won't terminate the program.

#####(d)

Cannot do it in parallel. Since the order of expressions will affect the result of the program.

#4. Modifying functional programs

#####(a)

The first element

#####(b)

Of course Haskell. It is much shorter than that of C. It saves my life.

#####(c)

```haskell
qsort []     = []
qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++ qsort
(filter (>= x) xs)
```

#####(d)

Just get a random number m(`m = rand()`), and choose `a[m%a.length]` as pivot.

#####(e)

I think it will be `O(nlogn)` totally. Since every recursion it requires a new array to sort.
Anyway, the minimum is `2n` because of GC will release unused memory.

#5. Operational Semantics

#####(a)

```
    <x + y, σ>
->  <2 + y, σ>      ## a1 → a1' and <x, σ> → <σ(x), σ>
->  <2 + 3, σ>      ## a2 → a2' and <x, σ> → <σ(x), σ>
->  <5, σ>          ## n+m → p
```

#####(b)

```
    <x = x + 3, σ>
->  <x = 1 + 3, σ>      ## a1 → a1' and <x, σ> → <σ(x), σ>
->  <x = 4, σ>          ## n+m → p
->  <4, Put(σ, x, 4)>   ## Put rule
```

#####(c)

```
    <(x = 3) + x, σ>
->  <3 + x, σ' = Put(σ, x, 3)>  ## Put rule
->  <3 + 3, σ'>                 ## a2 → a2' and <x, σ> → <σ(x), σ>
->  <6, σ'>                     ## n+m → p
```

#####(d)

```
    <x = (x = x + 3) + (x = x + 5), σ>
->  <x = (x = 1 + 3) + (x = x + 5), σ>          ## a1 → a1' and <x, σ> → <σ(x), σ>
->  <x = (x = 4) + (x = x + 5), σ>              ## n+m → p
->  <x = 4 + (x = x + 5), σ' = Put(σ, x, 4)>    ## Put rule
->  <x = 4 + (x = 4 + 5), σ'>                   ## a1 → a1' and <x, σ> → <σ(x), σ>
->  <x = 4 + (x = 9), σ'>                       ## n+m → p
->  <x = 4 + 9, σ'' = Put(σ', x, 9)>            ## Put rule
->  <x = 13, σ''>                               ## n+m → p
->  <13, σ''' = Put(σ'', x, 13)>                ## Put rule
```