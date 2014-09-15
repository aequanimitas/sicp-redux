function sum_range (x, y, term, next) {
  function iter (a, result) {
     return a > y ? result : iter( next(a), result + term(a));
  }
  return iter (x, 0);
}

function identity(x) {
  return x;
}

function increment(x) {
  return x + 1;
}

console.log(sum_range(1, 10, identity, increment));
