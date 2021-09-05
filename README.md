## Running the Code and the Tests

You need Ruby 2.7.4 to run the code and the tests. Development environment Ubuntu 20.04.

1. Running the Code
    In the root of the project, run:

```
	ruby src/client.rb "./data/brothers-karamazov.txt" "./data/moby-dick.txt"
```

	The program also accepts input via stdin: 

```
	cat data/*.txt | ruby src/client.rb
```

2. Running the Tests
	From the project root, run:

```
		ruby -Itest -e 'ARGV.each {|f| require f}' ./test/*_test.rb
```     

## Known Issues

1. Cannot handle single quote that is in brothers-kramazov.txt like: don’t know. The regex
   replaces it to form the word: don t know. It can handle: don't know.
2. Unicode characters are not handled.
3. No exploratory testing is provided.
4. The output frequency is not verified by counting the ngrams manually or by using another tool.
5. If more time was given, then NLTK Python library could be used to check the accuracy of results.
6. Taking multiple files as standard input will take more than 2.5 seconds. Using threads can
   improve the performance.

## Design Decisions

1. Text processing logic is encapsulated in the Normalizer class. 
   There is only one reason to change this class:  text processing.
2. Given more time, multiple threads can be used to process each file independently. 
   This will improve the performance.
3. Large files can be split into smaller files to speed up processing with multiple threads. 
4. File.read loads the entire file contents to memory. File.foreach can be used to process the 
   text one line at a time without loading entire contents to memory.
5. The display logic is encapsulated in the Output.display method. Display related changes 
    is localized in the Output class.
6. The client.rb is not part of the library. It shows how a developer can use this library.
7. The Trigram class has the logic related to generating the trigrams. It can be easily
   extended to generate ngrams of any size. The current design avoids over engineering and
   is kept simple.

## Extra

Tested on Docker Version: 20.10.8 on Ubuntu 20.04. The Ruby version used in the image is 3.0.2.

1. Build the Docker image. From the root of the project, run:

```
   docker build -t trigram .
```

   All the tests will run as part of the Docker image build.

2. Run the container:

```
   docker run -it --rm --name trigram
```

   The run.sh will execute and the output will be seen in the standard output.



