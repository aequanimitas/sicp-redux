function show() {
  var x = 10;
  console.log(square(x));
  try {
    console.log(square_pt2);
  } catch (e) {
    console.log(e);
  }
}

show();

var square_pt2 = function (x) {
  return x * x;
}

function square (x) { 
  return x * x; 
}
