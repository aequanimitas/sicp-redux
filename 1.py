def one_43(x):

    def compose(fna, fnb):
        return lambda x: fna(fnb(x))

    def inc_opt():
        return lambda x: x + 1

    def square(x):
        return x * x

    def inc(x):
        return x + 1

    return compose(square, inc)(x)


print one_43(5)
print one_43(6)
