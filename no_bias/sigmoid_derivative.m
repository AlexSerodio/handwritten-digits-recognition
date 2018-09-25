function [result] = sigmoid_derivative (x)
  result = sigmoid(x) .* (1 - sigmoid(x));
endfunction