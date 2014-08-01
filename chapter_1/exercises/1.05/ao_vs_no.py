def p():
  p()

def x(y,z):
  return 0 if y == 0 else z

def a(b,c):
    if b == 0:
        d = 0
    else:
        c
    return d

# this is by using a function object,
# still unsure on how to call function objects in py
print x(1, p)


# uncomment next line to see applicative order evaluation
# since there is a 'trigger/signal' for 'immediate' evaluation
# print x(0, p())
