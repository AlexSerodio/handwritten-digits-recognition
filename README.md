# trabalhosemestral-octave
Uma rede neural criada em GNU Octave que reconhece imagens de dígitos entre 0 e 9 escritos a mão.

O projeto está dividido em quatro pastas, sendo elas: *mnist_dataset*, *no_bias*, *using_bias* e *samples*. A pasta *mnist_dataset* contém os arquivos do dataset chamado [MNIST](http://yann.lecun.com/exdb/mnist/), o que inclui um arquivo chamado *t10k-images.idx3-ubyte* que contém 60 mil imagens de números escritos a mão utilizados no treinamento da rede e, em conjunto com as imagens, um arquivo chamado *t10k-labels.idx1-ubyte* que contém 60 mil labels que correspondem aos valores escritos em cada imagem. Além disso, possui mais 10 mil imagens (e 10 mil labels) utilizadas para testar a rede, contidos nos arquivos *train-images.idx3-ubyte* e *train-labels.idx1-ubyte*. Essas imagens e labels são lidos, estruturados e retornados pelas funções contidas nos arquivos *loadMNISTImages.m* (que retorna as imagens) e *loadMNISTLabels.m* (que retorna os labels).

Ambas as pastas *no_bias* e *using_bias* possuem implementações da mesma rede neural. A principal diferença entre as duas é que a rede contida na pasta *no_bias* (rede 1) é implementada sem utilizar os vetores de bias enquanto que a rede da pasta *using_bias* (rede 2) utiliza tais vetores.
Os bias são vetores auxiliares aos vetores existentes em cada camada da rede neural e servem para controlar a ativação de cada neurônio da rede. Por exemplo, uma camada com 30 neurônios (ou seja, um vetor de 30 posições) necessitaria de 30 bias, um para cada neurônio (isto é, um vetor auxiliar com o mesmo tamanho que a camada de neurônios).

Por não utilizar esses vetores de bias, a rede 1 utiliza fórmulas mais simples para calcular a taxa de erro da rede, facilitando a implementação dos algoritmos de *backpropagation*. Porém, em consequência da facilitação de implementação, essa rede tende a ter uma precisão menor que a rede 2 (que utiliza os bias), tendo em média 91% de precisão, e requer um maior número de sessões de treino para atingir tal precisão.

No caso da rede 2, a quantidade de sessões de treino necessárias são menores e a precisão é maior, chegando a 95%, porém a complexidade dos algoritmos de *backpropagation* aumenta consideravelmente.

Antes de poder utilizar ambas as redes neurais é preciso treiná-las. Para inicar o treinamento de uma das redes basta, pela linha de comando do Octave, acessar o diretório da rede escolhida (exemplo: "trabalhosemestral-octave/using_bias/") e chamar a função de treinamento da rede.

No caso da rede 1 a função é chamada da seguinte forma:

```
[weight1, weight2] = start_network_training ();
```

e, para a rede 2:

```
[weight1, weight2, bias2, bias3] = start_network_training ();
```

**Obs:** os valores entre colchetes são as matrizes de pesos e vetores de bias (no caso da rede 2) retornados pela função de treinamento.

Quando o treino terminar (esse processo pode levar vários minutos, até meia hora, dependendo do computador) uma mensagem aparecerá, exibindo a quantidade de acertos que a rede teve, utilizando como base de teste as 10 mil imagens de teste disponibilizadas pelo dataset MNIST.

Após o treinamento ter sido finalizado, é possível submeter imagens contendo números para que a rede tente identificá-los. **As imagens submetidas possuem algumas restrições**, sendo elas: precisam ser do tipo '.jpg', possuir fundo branco, dimensões de 28 x 28 pixels e conter apenas um único dígito entre 0 e 9. A pasta *samples* possui algumas imagens de exemplo que podem ser utilizadas para teste, mas fique a vontade para criar suas próprias se quiser.

Para submeter uma imagem basta chamar a função *check_input*, passando como parâmetro os pesos e bias (no caso da rede 2) retornados pela função *start_network_training* na etapa anterior, juntamente com o caminho e nome da imagem de input, dessa forma:

```
answer = check_input (weight1, weight2, bias2, bias3, "../samples/4.jpg")
```

ou, no caso da rede 2:

```
answer = check_input (weight1, weight2, "../samples/4.jpg")
```

onde o último argumento é uma string contendo o caminho e nome da imagem escolhida, podendo ser alterado para o diretório e nome de uma imagem criada por você.

**Obs:** os comandos acima devem ser executados sem o uso de ";" no final da linha para que assim os resultados sejam exibidos no terminal. Caso se utilize ";" o resultado retornado não será mostrado.

Após executar esse comando uma janela contendo a reconstrução da imagem submetida será aberta e a hipótese de resultado alcançado pela rede será exibida no terminal.

Caso queira, algumas das configurações da rede como quantidade de sessões de treino (*epochs*), tamanho da camada interna (*hidden_neurons*), tamanho dos mini batches (*batch_size*) e a taxa de aprendizado (*learning_rate*) podem ser alteradas no arquivo *start_network_training* referente a cada rede. É possível alterar tais valores para conseguir uma melhor combinação entre taxa de acerto e tempo de treino da rede. Por exemplo, atribuir um número menor aos *epochs* fará com que o tempo de treinamento diminua, porém a precisão da rede também poderá diminuir.
