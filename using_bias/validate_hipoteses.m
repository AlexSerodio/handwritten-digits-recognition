function result = validate_hipoteses (test_dataX, test_dataY, bias2, bias3, weight1, weight2)
  result = 0;
  test_size = size(test_dataX, 2);
  
  for i = 1: test_size
    output = feed_forward(test_dataX(:,i), bias2, bias3, weight1, weight2);
    output_size = size(output, 1);
    
    max = 0;
    answer = 0;
    for n = 1: output_size
      if (output(n) > max)
        max = output(n);
        answer = n;
      endif
    endfor
    
    if (answer == test_dataY(i)+1)
      result += 1;
    endif
  endfor
endfunction