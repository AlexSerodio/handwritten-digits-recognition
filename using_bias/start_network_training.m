function [weight1, weight2, bias2, bias3] = start_network_training ()
  
  addpath('../mnist_dataset');
  
  training_images = loadMNISTImages('../mnist_dataset/train-images.idx3-ubyte');
  trainingY = loadMNISTLabels('../mnist_dataset/train-labels.idx1-ubyte');
  
  training_values = 0 .* ones(10, size(trainingY, 1));
  for n = 1: size(trainingY, 1)
    training_values(trainingY(n) + 1, n) = 1;
  endfor;

  test_images = loadMNISTImages('../mnist_dataset/t10k-images.idx3-ubyte');
  test_values = loadMNISTLabels('../mnist_dataset/t10k-labels.idx1-ubyte');
  
  layers_size = [784, 30, 10];
  epochs = 10;
  batch_size = 10;
  learning_rate = 3.0;
  [bias2, bias3, weight1, weight2] = stochastic_gradient_descent(training_images, 
          training_values, layers_size, epochs, batch_size, learning_rate);
  
  result = validate_hipoteses(test_images, test_values, bias2, bias3, weight1, weight2);
  printf("Result: %d / %d\n", result, size(test_values, 1));
endfunction