// procedures as arguments
function sum(term, a, next, b) {
  if (a > b) {
    return 0;
  } else {
    return term(a) + sum(term, next(a), next, b);
  }
}

function identity(x) {
  return x;
}

function inc(x) {
  return x + 1;
}

function sum_integers_01(a,b) {
  return sum(identity, a, inc, b);
}

function sum_integers_02(a,b) {
  return sum(function(a) { return a; }, a,
             function(a) { return a + 1; }, b)
}

console.log(sum_integers_01(1,10));
console.log(sum_integers_02(1,10));

console.log(sum_integers_01(1,10) === sum_integers_01(1,10));
