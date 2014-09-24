console.log(22);
console.log("p");

try {
  console.log(p);
} catch (e) {
  console.log(e);
}

// exercise 1.31 - Higher Order Functions
function sum_range (x, y, term, next) {
  function iter (a, result) {
     return a > y ? result : iter( next(a), result + term(a));
  }
  return iter (x, 0);
}

function identity(x) {
  return x;
}

function increment1(x) {
  return x + 1;
}

console.log(sum_range(1, 10, identity, increment1));
