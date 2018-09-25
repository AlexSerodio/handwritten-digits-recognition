function output = feed_forward (input, bias2, bias3, weight1, weight2)
  z = (weight1 * input) + bias2;
  output = sigmoid(z);
  z = (weight2 * output) + bias3;
  output = sigmoid(z);
endfunction
