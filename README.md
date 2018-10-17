A neural network that recognizes handwritten digits between 0 and 9 in images, developed using the Octave language.

<p align="center">
  <img width="640" height="480" src="https://user-images.githubusercontent.com/23726229/47057552-9f703d00-d197-11e8-9df3-f9d4d371cfa6.png">
</p>

**Note**: Before we start, be aware that inside the folder *documents* you can find an article and a banner (both written in portuguese) explaining the project in a more detailed way. 

### Understanding the project

The project is separeted into four folders: *mnist_dataset*, *no_bias*, *using_bias*, and *samples*. The *mnist_dataset* folder contains the files from the [MNIST dataset](http://yann.lecun.com/exdb/mnist/), which includes a file called *t10k-images.idx3-ubyte*, that contains 60 thousand images of handwritten digits used in the network training and another file called *t10k-labels.idx1-ubyte*, which contains 60 thousand labels that match the values written in each image. Besides that, the dataset has an additional 10 thousand images (and 10 thousand labels) used to test the network, stored in the files *train-images.idx3-ubyte* and *train-labels.idx1-ubyte*. These images and labels are read, structured and returned by the functions from the files *loadMNISTImages.m* (which returns the images) and *loadMNISTLabels.m* (which returns the labels).

Both *no_bias* and *using_bias* folders have implementations of the same neural network. The main difference between the two is that the network implemented in the *no_bias* folder doesn't use the biases vectors whereas the network from the *using_bias* folder uses such vectors. The biases vectors work as auxiliary vectors for each layer of the neural network, controlling the activation of each neuron of the network. For example, a layer with 30 neurons (i.e., a 30-position vector) would require 30 bias, one for each neuron (i.e., an auxiliary vector with the same size of the layer).

By not using these biases vectors, the *no_bias* network uses easier formulas to calculate the network error rate, simplifying the implementation of the *backpropagation* algorithm. However, as a result of simplifying the implementation, this network tends to have a lower accuracy than the *using_bias* network, having an average accuracy of 91%, and requires a larger number of training sessions to achieve such accuracy.

In the case of the *using_bias* network, the amount of training sessions required is smaller and the accuracy is higher, reaching an average accuracy of 95%, but the complexity of the *backpropagation* algorithm increases considerably.

### Running the project

To run this project you will need to download the GNU Octave [here](https://www.gnu.org/software/octave/).

Before you be able to use both neural networks you need to train them. To start the training of one of the networks, simply access the directory of the chosen network (for example: "./handwritten-digits-recognition/using_bias/") and call the network training function from the Octave command line.

For the *no_bias* network the function is called as follows:

```
[weight1, weight2] = start_network_training ();
```

and, for the *using_bias* network:

```
[weight1, weight2, bias2, bias3] = start_network_training ();
```

** Note:** the values in brackets are the weights matrices and biases vectors returned by the training function.

When the training is finished (this process may take several minutes, up to half an hour) a message will appear, showing how many images the network classified correctly, using as a test base the 10 thousand test images provided by the MNIST dataset.

After the training has been finalized, it is possible to submit images containing numbers for the network to try to identify them. **The submitted images have some restrictions**, they must be of '.jpg' format, have a white background, dimensions of 28 x 28 pixels and have only a single digit between 0 and 9. The *samples* folder has some sample images that can be used for testing, but feel free to create your own if you want.

In order to submit an image, just call the function *check_input*, passing as a parameter the weights and biases (in the case of *using_bias* network) returned by the function *start_network_training* in the previous step, together with the path and name of the input image, like this:

```
answer = check_input (weight1, weight2, "../samples/4.jpg")
```

or, for the *using_bias* network:

```
answer = check_input (weight1, weight2, bias2, bias3, "../samples/4.jpg")
```

After executing this command, a window showing the reconstruction of the submitted image will be opened and the hypothesis of the result reached by the network will be displayed in the terminal.

## Acknowledgments
This project was made during a class called Programming Languages taught by Professor Luciana Pereira de Araújo Kohler, at FURB College in the city of Blumenau-SC, Brazil. For the most part of the project I used the book Neural Networks and Deep Learning written by Michael Nielsen avaliable [here](http://neuralnetworksanddeeplearning.com/index.html) as a reference material.


