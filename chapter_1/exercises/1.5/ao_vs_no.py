def p():
  p()

def x(y,z):
  return 0 if y == 0 else z

def a(b,c):
    if b == 0:
        d = 0
    else:
        d = c
    return d

print x(0, p)
print a(1, p)
