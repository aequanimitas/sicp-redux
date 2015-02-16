def printdocstr(fn):
    def wrap(*args, **kwargs):
        print(fn.__doc__)
        return fn(fn, *args, **kwargs)
    return wrap

def sum_01(term, a, nxt, b):
    if (a > b):
        return 0
    else:
        return term(a) + sum_01(term, nxt(a), nxt, b)

def identity(x):
    return x;

def inc(x):
    return x + 1;

@printdocstr
def si_01(fn,a,b):
    """Just the SICP sample"""
    return sum_01(identity, a, inc, b)

print(si_01(1,10))
