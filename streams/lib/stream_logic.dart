import 'dart:async';

class StreamLogic {

  // Create an empty list of inputs, this will store all our inputs that have been submitted
  // to our StreamLogic trough the submitInput function.
  static final List<String> _submittedInputs = [];

  // Create a StreamController to manage our Stream object. Since we want out Stream to only contain data of
  // the type List<String>, define the type of our like this: StreamController<List<String>>
  static final StreamController<List<String>> _streamController = StreamController<List<String>>();

  // Define a private constructor to make sure nothing outside of this file will
  // be able to create an instance of this class.
  StreamLogic._constructor();

  static void initialize() {}

  // Declare a function that handles our input. Our input is a String and the input will first
  // be added to our list of submitted inputs. After the input is added to our list, we 
  // add the entire list to our stream controller. This will notify all the listeners to the stream
  // (in our case our StreamBuilder widget defined in the StreamExampleState) so they can handle the
  // new data
  static void submitInput(String value) {
    // Add our input value to our list of submitted inputs
    _submittedInputs.add(value);

    // Add our entire list of inputs to our StreamController. We need to add the entire list
    // because a Stream does not remember the last value added to it. It is up to the listener
    // to handle the value as they see fit.
    _streamController.add(_submittedInputs);
  }

  // Define a getter to get the Stream object from our StreamController. We do not want to
  // allow another file to access the controller itself since they can then control the stream itself.
  // This can lead to unwanted behaviour and can potentially break our entire program. Therefor we isolate
  // the StreamController and only exposed the Stream itself. A stream object itself cannot be modified, it
  // can only be listened to.
  static Stream<List<String>> getStream() => _streamController.stream;
}
