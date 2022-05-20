import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  InputScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals Plotter'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            OneEntry(),
            OneEntry(),
            OneEntry(),
            OneEntry(),
          ],
        ),
        // child: ListView(
        //   children: const [
        //        OneCoordinateEntry(
        //         isDegrees: true,
        //       ),
        //   ],
        // ),
      ),
    );
  }
}

class OneEntry extends StatelessWidget {
  const OneEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30,
      // width: 30,
      child: Row(
        children: [
          Flexible(child: OneCoordinateEntry(isDegrees: true)),
          Flexible(child: OneCoordinateEntry(isDegrees: false)),
        ],
      ),
    );
  }
}

class OneCoordinateEntry extends StatelessWidget {
  const OneCoordinateEntry({
    Key? key,
    required this.isDegrees,
  }) : super(key: key);

  final bool isDegrees;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            // icon: Icon(Icons.send),
            hintText: isDegrees ? 'degree (0:360)' : 'Voltage (v)',
            // helperText: 'Helper Text',
            // counterText: '0 characters',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
        ),
      ),
    );
  }
}
