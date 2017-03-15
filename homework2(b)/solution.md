# 6. Parameter passing comparison

#### (a) pass-by-value

```
x := x + 1;         // i = 1;
y := x + 1;         // i = 1;
x := y;             // i = 1;
i := i + 1          // i = 2;
```

print **2**

#### (b) pass-by-reference

```
x := x + 1;         // i = 2;
y := x + 1;         // i = 3;
x := y;             // i = 3;
i := i + 1          // i = 4;
```

print **4**

#### (c) pass-by-reference

```
x := x + 1;         // x = 2;
y := x + 1;         // y = 3;
x := y;             // x = 3;
i := i + 1          // i = 2;
//end of the procedure, i = x = 3; i = y = 3;
```

print **4**

# 7. Closures and Access Links

#### (a) Value of w

`w = h(3) = f(3) * q = 8`

#### (b) 

*  (1) x access link (0)
*  (2) f access link (1)
*  (3) q access link (2)
*  (4) h access link (3)
*  (5) w access link (4)
*  (6) h(3) access link (4)
*  (7) f(3) access link (2)

# 8. Recursion in JavaScript

#### (a)

```
    (1)        access link (0)
               f        •
               h        •
    (2)  h(2)  access link (1)
               x        2
    (3)  f(1)  access link (1)
               x        1
```

#### (b)

B

#### (c)

If call `h(2)` after line 2, f = f<sub>1</sub>,it returns 1 and `h(2) = 2*1` 

If call `h(2)` after line 3, f = f<sub>2</sub>,it returns 10 and `h(2) = 2*10`
 
#### (d)

```
    (1)        access link (0)
               f        •
               h        •
    (2)        access link (1)
               g        •
    (3)  h(2)  access link (1)
               x        
    (4)  g(1)  access link (2)
               X
```

#### (e)

Return 2. When x = 1, g always return 1. h(2) = 2*1 = 2