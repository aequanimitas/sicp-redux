function z() {
  z();
}

function w(x,y) {
  return x === 0 ? 0 : y;
}

console.log(w(0, z));
console.log(w(1, z));
