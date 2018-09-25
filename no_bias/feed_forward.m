function [output] = feed_forward (input, weight1, weight2)   
  z = weight1 * input;
  output = sigmoid(z);
  z = weight2 * output;
  output = sigmoid(z);
endfunction