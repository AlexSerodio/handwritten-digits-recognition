function [b2, b3, w1, w2] = backpropagation(x, y, bias2, bias3, weight1, weight2)
  w1 = zeros(size(weight1));
  w2 = zeros(size(weight2));
  b2 = zeros(size(bias2));
  b3 = zeros(size(bias3));
  
  #FEEDFORWARD
  activation = x;  
  activations{1} = x;
  
  z = (weight1 * activation) + bias2;
  zs{1} = z;
  activation = sigmoid(z);
  activations{2} = activation;
  
  z = (weight2 * activation) + bias3;
  zs{2} = z;
  activation = sigmoid(z);
  activations{3} = activation;
      
  % BACKWARD PASS
  
  % update last layer
  delta = (activations{3} - y) .* sigmoid_derivative(zs{2});
  b3 = delta;
  w2 = delta * activations{2}';
  
  % update middle layer
  z = zs{1};
  sp = sigmoid_derivative(z);
  delta = (weight2' * delta) .* sp;
  b2 = delta;
  w1 = delta * activations{1}';
endfunction