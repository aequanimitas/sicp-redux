exercise_oneptwo = (5 + 4 + (2 - (3 - (6 + (4/5)))))/(3 * (6 -2) * (2 - 7))

exercise_onepthree x y z = 
  if x > z && y > z then (x * x) + (y * y)
    else if z > x && y > x then (z*z) + (y*y)
      else if z > y && x > y then (z*z) + (x*x)
        else z

