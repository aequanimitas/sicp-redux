function factorial(x) {
 return x === 1 ? x : x * factorial(x - 1);
}
console.log(factorial(9));
