function result = validate_hipoteses (test_dataX, test_dataY, weight1, weight2)
  test_dataX = double(test_dataX);
  result = 0;
  for i = 1:columns(test_dataX)
    
    input = test_dataX(:,i);
    
    % feedforward
    z1 = weight1 * input;
    output = sigmoid(z1);
    z2 = weight2 * output;
    output = sigmoid(z2);
    
    max = 0;
    answer = 1;
    for n = 1: size(output, 1)
      if (output(n) > max)
        max = output(n);
        answer = n;
      endif
    endfor
    
    if (answer == test_dataY(i) + 1)
      result = result + 1;
    endif
  endfor
endfunction