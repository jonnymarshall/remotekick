const developmentSlider = () => {
  console.log(`hello from development slider`)

	var parent = document.querySelector("#rangeSlider");
	if(!parent) return;

	var
  // rangeS = parent.querySelectorAll("input[type=range]")
  range = parent.querySelector("input[type=range]"),
		numberS = parent.querySelectorAll("input[type=number]");

	// rangeS.forEach(function(el) {
	// 	el.oninput = function() {
	// 		var slide1 = parseFloat(rangeS[0].value),
	// 			slide2 = parseFloat(rangeS[1].value);

	// 		if (slide1 > slide2) {
	// 			[slide1, slide2] = [slide2, slide1];
	// 			// var tmp = slide2;
	// 			// slide2 = slide1;
	// 			// slide1 = tmp;
	// 		}

	// 		numberS[0].value = slide1;
	// 		numberS[1].value = slide2;
	// 	}
  // });
  
  // range.forEach(function(el) {
  range.oninput = function() {
    var slide = parseFloat(range.value);
    // console.log(range.value)
      // slide2 = parseFloat(rangeS[1].value);

    // if (slide1 > slide2) {
    //   [slide1, slide2] = [slide2, slide1];
    //   // var tmp = slide2;
    //   // slide2 = slide1;
    //   // slide1 = tmp;
    // }
    numberS[0].value = slide;
    // numberS[1].value = slide2;
  }
	// });

	numberS.forEach(function(el) {
		el.oninput = function() {
			var number1 = parseFloat(numberS[0].value),
				number2 = parseFloat(numberS[1].value);

			if (number1 > number2) {
				var tmp = number1;
				numberS[0].value = number2;
				numberS[1].value = tmp;
			}

			rangeS[0].value = number1;
			rangeS[1].value = number2;

		}
	});

};

export {developmentSlider}