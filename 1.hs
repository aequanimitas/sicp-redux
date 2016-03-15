exercise_oneptwo = (5 + 4 + (2 - (3 - (6 + (4/5)))))/(3 * (6 -2) * (2 - 7))

exercise_onepthree x y z = 
  if x > z && y > z then (x * x) + (y * y)
    else if z > x && y > x then (z*z) + (y*y)
      else if z > y && x > y then (z*z) + (x*x)
        else z

ex1P3 :: Integer -> Integer -> Integer -> Integer
ex1P3 0 0 0 = 0
ex1P3 x y z | (x == y) && (y == z) && (x == z)    = z 
            | x > z && y > z                      = (x * x) + (y * y)
            | z > y && x > y                      = (z * z) + (x * x)
            | z > x && y > x                      = (z * z) + (y * y)


pascal :: Integer -> Integer -> Integer
pascal x y | x == 0 || y == 0 = 0
           | x == y || y == 1 = 1
           | y > x            = 0
           | x > 0 && y > 0   = pascal (x - 1) (y - 1) + pascal (x - 1) y

pascalRowSum :: Integer -> Integer
pascalRowSum x | x <= 0  = 1
               | x == 1  = 2
               | x >  1  = 2 * pascalRowSum (x - 1)

pascalSumHelper :: Integer -> Integer -> Integer
pascalSumHelper x depth | depth == 0 = (pascal x x) + (pascalSumHelper x (depth + 1))
                        | depth == x = pascal x 0
                        | depth > 0  = (pascal x (x - depth)) + (pascalSumHelper x (depth + 1))
                         
