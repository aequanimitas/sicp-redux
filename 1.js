function sum_range (x, y, term, next) {
  function iter (a, result) {
    a > y ? return result : iter( next(a), result + term(a));
  }
  iter (x, 0);
}

function identity(x) {
  return x;
}
