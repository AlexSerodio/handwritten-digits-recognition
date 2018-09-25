function answer = check_input (weight1, weight2, image_path)  
  
  image = double(imread(image_path));         # read image
  image = sum(255 - image, 3);                # inverte image colors
  image = image / 255;                        # normalize image
  input = reshape(image,1,[])';               # reshape the matrix image to vector
  
  % feedforward
  z = weight1 * input;
  output = sigmoid(z);
  z = weight2 * output;
  output = sigmoid(z);
    
  max = 0;
  answer = 1;
  for i = 1: size(output, 1)
    if (output(i) > max)
      max = output(i);
      answer = i;
    endif;
  endfor;
  answer -= 1;
  imagesc(reshape(input, 28, 28));
  printf("Hipotese: %d\n", answer);
endfunction