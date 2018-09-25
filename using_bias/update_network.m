function [bias2, bias3, weight1, weight2] = update_network (mini_batchX, mini_batchY, learning_rate, bias2, bias3, weight1, weight2)
  
  b2 = zeros(size(bias2));
  b3 = zeros(size(bias3));
  w1 = zeros(size(weight1));
  w2 = zeros(size(weight2));
  
  batches = columns(mini_batchX);
  
  for x = 1:batches
    [delta_b2, delta_b3, delta_w1, delta_w2] = backpropagation(mini_batchX(:,x), mini_batchY(:,x), bias2, bias3, weight1, weight2);
    
    % add all weight adjustments
    w1 += delta_w1;
    w2 += delta_w2;
    
    % add all bias adjustments
    b2 += delta_b2;
    b3 += delta_b3;
  endfor
   
   % update the weights of the network
   weight1 = weight1 - ((learning_rate / batches) .* w1);
   weight2 = weight2 - ((learning_rate / batches) .* w2);
   
   % update the biases of the network
   bias2 = bias2 - ((learning_rate / batches) .* b2);
   bias3 = bias3 - ((learning_rate / batches) .* b3);
endfunction