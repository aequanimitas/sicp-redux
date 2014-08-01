var accumulator = 1;
function factorial (x) {
  return x === 1 ? console.log(x) : console.log(factorial(x - 1))
}

factorial (9);

console.log(accumulator);
