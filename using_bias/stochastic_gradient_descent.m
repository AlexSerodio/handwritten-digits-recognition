function [bias2, bias3, weight1, weight2] = stochastic_gradient_descent (training_dataX, training_dataY, layers_size, epochs, batch_size, learning_rate)
  batch_size -= 1;
  training_size = size(training_dataX, 2);

  bias2 = randn(layers_size(2), 1);
  bias3 = randn(layers_size(3), 1);
  weight1 = randn(layers_size(2), layers_size(1));
  weight2 = randn(layers_size(3), layers_size(2));

  for j = 1:epochs
    for i = 1:batch_size+1:training_size-batch_size
      mini_batchX = training_dataX(:, [i:batch_size+i]);
      mini_batchY = training_dataY(:, [i:batch_size+i]);
      [bias2, bias3, weight1, weight2] = update_network(mini_batchX, mini_batchY, learning_rate, bias2, bias3, weight1, weight2);
    endfor
  endfor
endfunction
