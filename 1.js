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

// exercise 1.42
(function() {

  function inc(x) {
    return function() {
      return x + 1;
    }
  }

  function square(x) {
    return x * x;
  }

  function compose(fn_one, fn_two) {
    return function(x) {
      return fn_one(fn_two(x)());
    }
  }

  console.log(inc(4)())
  console.log(compose(square, inc)(5))
  console.log(compose(square, inc)(6))
  console.log(compose(function(x) { return x * x }, function(x) { return function() { return x + 1}})(6))
})();

(function() {
  console.log('\n');
  console.log('compose');
  
  function compose(fnx, fny) {
    return function(x) {
      return fnx(fny(x));
    }
  }

  function square(x) {
    return x * x;
  }

  function identity(x) {
    return x;
  }

  console.log(compose(identity, square)(6));
  console.log(compose(square, identity)(6));
  console.log('\n');
})();
