
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

#3. Modifying functional programs

#####(a)
