import 'package:flutter/material.dart';
import 'package:flutter_engineering_example/stream_logic.dart';

class StreamExample extends StatefulWidget {

  const StreamExample({super.key});

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {

  final TextEditingController submitController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // Print "I am building to the console to see when the entire widget is being rebuild"
    print("I am building!");

    return Scaffold(
      appBar: AppBar(title: const Text("StreamLogic")),
      body: Column(
        children: [
          // Create a textield with the submitController as its controller so we
          // can use it to retrieve the value entered in the text field
          TextField(
            controller: submitController,
          ),
          // Create an ElevatedButtion that when pressed, will submit our current
          // value of the textfield to our StreamLogic
          ElevatedButton(
            onPressed: () async {
              // Get teh value from the TextEditingController assigned to the textfield
              final value = submitController.text;

              // Check if the textfield is empty
              if(value.isEmpty) {
                // If the textfield is empty, show a dialog with a message providing the user
                // with an apropriate error message.
                // We call await here to continue the function after the dialog has been closed
                await showDialog(
                  context: context, 
                  builder: (context) => const AlertDialog(
                    title: Text("ERROR!"),
                    content: Text("No value specified!"),
                  )
                );
                // Call return to break out of the onPressed function
                return;
              }

              // If the function was not breaked out early, we can submit our input to our StreamLogic
              StreamLogic.submitInput(value);

            },
            // The widget to display on the button
            child: const Text("Submit"),
          ),

          // Create a new StreamBuilder widget, this widget will be updated everytime our stream has changed
          StreamBuilder(
            // Specify the stream we want to listen to
            stream: StreamLogic.getStream(),

            // Define the function that gets called everytime the stream is updated, the context variable contains the
            // buildcontext of our flutter application. The snapshot contains the data from the stream. The snapshot can
            // also contains errors. So if your stream can error, make sure to check here for errors aswell!
            builder: (context, snapshot) {

              // Check if the snapshot has data and if the data is not empty.
              // If the snapshot does not contain any data or the data in the snapshot is empty,
              // we return a Text widget that displays the text "No input yet!".
              if(!snapshot.hasData || snapshot.data!.isEmpty) return const Text("No input yet!");

              // Define an empty list of widgets. This list of widgets will be added to our column displaying all
              // our input that we have added to our stream
              List<Widget> inputWidgets = [];
              
              // Iterate over all the data from the snapshot.
              for(final input in snapshot.data!) {

                // Add a text widget with the input as its value
                inputWidgets.add(Text(input));
              }

              // Return a column with the Text widget displaying "All our inputs" with some whitespace
              // and all the input widgets we have created from the data of our snapshot
              return Column(
                children: [
                  const Text("All our inputs:\n"),
                  ...inputWidgets
                ],
              );
            },
          )
        ],
      ),
    );
  }
}