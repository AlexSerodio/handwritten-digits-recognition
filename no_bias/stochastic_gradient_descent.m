% Stochastic Gradient Descent function
% training_dataX is a 60000x784 matrix containing the training inputs
% training_dataY is a 1x60000 matrix containing the results for each training input
% test_dataX is a 10000x784 matrix containing the tests inputs
% test_dataY is a 1x10000 matrix containing the tests results
function [weight1, weight2] = stochastic_gradient_descent (training_dataX, training_dataY, hidden_neurons, epochs, batch_size, learning_rate, test_dataX, test_dataY)
  
  training_size = size(training_dataX, 2);
  test_size =  size(test_dataX, 2);
  
  input_size = size(training_dataX, 1);
  output_size = size(training_dataY, 1);
  
  weight1 = rand(hidden_neurons, input_size);
  weight2 = rand(output_size, hidden_neurons);
  
  weight1 = weight1 ./ size(weight1, 2);
  weight2 = weight2 ./ size(weight2, 2);
  
  n = zeros(batch_size);
  
  for j = 1:epochs
    for k = 1:batch_size    
      % shuffle the training data
      n(k) = floor(rand(1) * training_size + 1);
      input_layer = training_dataX(:, n(k));
      training_value = training_dataY(:, n(k));      
      
      % feed forward
      z1 = weight1 * input_layer;
      activation_value2 = sigmoid(z1);
      z2 = weight2 * activation_value2;
      output_layer = sigmoid(z2);
            
      % update the weights
      delta_output = sigmoid_derivative(z2) .* (output_layer - training_value);
      delta_hidden = sigmoid_derivative(z1) .* (weight2' * delta_output);
          
      weight2 = weight2 - learning_rate .* delta_output * activation_value2';
      weight1 = weight1 - learning_rate .* delta_hidden * input_layer';
%      weight2 = weight2 - (learning_rate / batch_size) .* delta_output * activation_value2';
%      weight1 = weight1 - (learning_rate / batch_size) .* delta_hidden * input_layer';
    endfor
%    result = validate_hipoteses(test_dataX, test_dataY, weight1, weight2);
%    printf("Epoch %d: %d / %d\n", j, result, test_size);
  endfor
endfunction