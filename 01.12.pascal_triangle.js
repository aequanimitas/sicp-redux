function isEdge(x, y) {
  return x === y || y === 1;
}

function isOutOfBounds(x, y) {
  return x === 0 || y == 0;
}


function pascal(x, y) {
  function runner(x, y) {
    if (isEdge(x, y)) {
      return 1;
    } else if (isOutOfBounds(x, y)) {
      return 1;
    } else {
      return runner(x - 1, y - 1) + runner (x - 1, y);
    }
  }
  return runner(parseInt(x, 10), parseInt(y, 10));
}
var args = process.argv.slice(2);

// var result = pascal(args[0], args[1]);

// give pascal row
function horizontalSum(x) {
  var mid = x % 2 === 1 ? Math.floor(x/2) + 1 : x/2,
      accu = 0;
  for (var ct = 1; ct <= x; ct += 1) {
    accu += pascal(x, ct);
  }
  return accu;
}

var result = horizontalSum(args[0]);

console.log(result);
