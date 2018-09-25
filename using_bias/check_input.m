function answer = check_input (weight1, weight2, bias2, bias3, image_path)  
  
  image = double(imread(image_path));
  image = sum(255 - image, 3);
  image = image / 255;
  input = reshape(image,1,[])';
  
  % feedforward
  z = weight1 * input + bias2;
  output = sigmoid(z);
  z = weight2 * output + bias3;
  output = sigmoid(z);
  
  [max, answer] = max(output);
  answer -= 1;
  imagesc(reshape(input, 28, 28));
  printf("Hipotese: %d\n", answer);
endfunction