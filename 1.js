console.log(22);
console.log("p");
console.log(1 + 3);

// 1.1.2, introduce wrapper to avoid corruption
(function(){
  var pi = 3.1415,
      radius = 10;
      circumference = 2 * pi * radius;
  console.log(circumference);
})();

try {
  console.log(p);
} catch (e) {
  console.log(e);
}

// exercise 1.31 - Higher Order Functions
(function() {
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
})();
