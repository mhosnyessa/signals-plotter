import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signals_plotter/result_screen.dart';

// List inputList =
//     List.filled(2, List.filled(4, 0.0, growable: true), growable: false);
int initialSize = 4;
List degreesList = List.filled(initialSize, null);
List voltsList = List.filled(initialSize, null);

bool isValid = false;
void validate() {
  if (degreesList.contains(null) || voltsList.contains(null)) isValid = false;

  isValid = true;
}

void autoFill() {
  for (int i = 0; i < degreesList.length; i++) {
    if (degreesList[i] == null) {
      double val = Random().nextDouble() * 360 * (Random().nextBool() ? 1 : -1);
      if (i == 0) {
      } else {
        if (val > degreesList[i - 1]) {
        } else {
          val = degreesList[i - 1] + val;
        }
      }
      degreesList[i] = val;
    }
  }
  degreesList.sort();
  print(degreesList);
  for (int i = 0; i < voltsList.length; i++) {
    if (voltsList[i] == null)
      voltsList[i] =
          Random().nextDouble() * 60 * (Random().nextBool() ? 1 : -1);
  }
  validate();
}

void clear() {
  for (int i = 0; i < degreesList.length; i++) {
    degreesList[i] = null;
  }
  for (int i = 0; i < voltsList.length; i++) {
    voltsList[i] = null;
  }
  validate();
}

class InputScreen extends StatefulWidget {
  InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // rebuildAllChildren(context);
    var gradient = const LinearGradient(colors: [
      Color.fromARGB(255, 68, 203, 221),
      Color.fromARGB(255, 175, 3, 255)
    ]);
    BorderRadiusGeometry borderRadius = BorderRadius.circular(10);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals Plotter'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              // height: 400,
              child: ListView(
                children: () {
                  List<Widget> renderedChildren = [];
                  for (int i = 0; i < degreesList.length; i++) {
                    renderedChildren.add(OneEntry(index: i));
                  }
                  return renderedChildren;
                }(),
              ),
            ),
            Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: borderRadius,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape:
                            RoundedRectangleBorder(borderRadius: borderRadius),
                      ),
                      onPressed: () {
                        setState(() {
                          if (isValid) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ResultScreen(
                                data: [degreesList, voltsList],
                              );
                            }));
                          } else {
                            Fluttertoast.showToast(
                                msg: 'please fill in all fields');
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          // horizontal: 70,
                        ),
                        child: Text(
                          'See your signal graph',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        autoFill();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          // vertical: 16.0,
                          // horizontal: 70,
                          ),
                      child: Text('auto fill with random values?'),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      clear();
                    });
                  },
                  child: Text('or clear?'),
                ),
                Container(
                  width: double.infinity,
                  // color: Color.fromARGB(255, 243, 242, 255),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 247, 215, 255)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Color.fromARGB(255, 56, 59, 81),
                      ),
                      children: [
                        TextSpan(text: 'By'),
                        TextSpan(
                          text: ' Muhammed Hosny',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 46, 52, 90),
                          ),
                        ),
                        TextSpan(
                            text:
                                '\nFor a college project under the supervision of professor '),
                        TextSpan(
                          text: 'Micheal Nasef',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 46, 52, 90),
                          ),
                        ),
                        TextSpan(
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                            ),
                            text:
                                '\n© 2022 El-Obour Egypt, All rights reserved.'),
                      ],
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}

class OneEntry extends StatelessWidget {
  const OneEntry({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30,
      // width: 30,
      child: Row(
        children: [
          Flexible(child: OneCoordinateEntry(isDegrees: true, index: index)),
          Flexible(child: OneCoordinateEntry(isDegrees: false, index: index)),
        ],
      ),
    );
  }
}

class OneCoordinateEntry extends StatelessWidget {
  const OneCoordinateEntry({
    Key? key,
    required this.isDegrees,
    required this.index,
  }) : super(key: key);

  final bool isDegrees;
  final int index;

  @override
  Widget build(BuildContext context) {
    double? dataPiece = isDegrees ? degreesList[index] : voltsList[index];

    TextEditingController _controller = TextEditingController();
    dataPiece != null ? _controller.text = dataPiece.toString() : null;
    print(degreesList);
    print(voltsList);
    void saveData() {
      // inputList[isDegrees ? 0 : 1][index] = dataPiece;
      if (isDegrees) {
        degreesList[index] = dataPiece;
      } else {
        voltsList[index] = dataPiece;
      }
    }
    // TODO: see why the value is rendered on the entire row

    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: TextFormField(
          controller: _controller,
          onChanged: (e) {
            dataPiece = double.parse(
                (e == '' || e == null || e == '.' || e == '-')
                    ? 0.0.toString()
                    : e);
            saveData();
            validate();
          },
          keyboardType: TextInputType.number,
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
