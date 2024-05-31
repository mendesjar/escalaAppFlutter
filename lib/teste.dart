import 'dart:math';
import 'package:flutter/material.dart';
import 'ButtonEscala.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dotted Rectangle Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final escalasMaioresNaturais = {
    "C": ["C", "D", "E", "F", "G", "A", "B", "C"],
    "D": ["D", "E", "F♯", "G", "A", "B", "C♯", "D"],
    "E": ["E", "F♯", "G♯", "A", "B", "C♯", "D♯", "E"],
    "F": ["F", "G", "A", "B♭", "C", "D", "E", "F"],
    "G": ["G", "A", "B", "C", "D", "E", "F♯", "G"],
    "A": ["A", "B", "C♯", "D", "E", "F♯", "G♯", "A"],
    "B": ["B", "C♯", "D♯", "E", "F♯", "G♯", "A♯", "B"],
  };

  final escalasMenoresNaturais = {
    "C": ["C", "D", "E♭", "F", "G", "A♭", "B♭", "C"],
    "D": ["D", "E", "F", "G", "A", "B♭", "C", "D"],
    "E": ["E", "F♯", "G", "A", "B", "C", "D", "E"],
    "F": ["F", "G", "A♭", "B♭", "C", "D♭", "E♭", "F"],
    "G": ["G", "A", "B♭", "C", "D", "E♭", "F", "G"],
    "A": ["A", "B", "C", "D", "E", "F", "G", "A"],
    "B": ["B", "C♯", "D", "E", "F♯", "G", "A", "B"],
  };
  List<String> notes = ["C", "D", "E", "F", "G", "A", "B"];
  int maxSizeBalls = 10;
  final answers = {
    "note": "C",
    "tipo": "Maior",
  };

  @override
  void initState() {
    super.initState();
  }

  void selectNote(String value) {
    setState(() {
      if (value.length > 1) {
        answers["tipo"] = value;
      } else {
        answers["note"] = value;
      }
    });
  }

  Text getMusicalScaleText() {
    final scaleMap = answers["tipo"] == "Maior"
        ? escalasMaioresNaturais
        : escalasMenoresNaturais;
    final scale = scaleMap[answers["note"]];

    if (scale == null) {
      return const Text('Invalid note or type provided');
    }

    return Text(
      scale.join(' '),
      style: const TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  Color generateRandomColor() {
    return Color.fromRGBO(
      Random.secure().nextInt(256),
      Random.secure().nextInt(256),
      Random.secure().nextInt(256),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          children: <Widget>[
            Expanded(
                child: Row(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonEscalaWidget(
                      labelText: "Maior", pressed: () => selectNote("Maior"))),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonEscalaWidget(
                      labelText: "Menor", pressed: () => selectNote("Menor"))),
            ]))
          ],
        ),
        Wrap(
          spacing: 10,
          children: [
            for (int i = 0; i < notes.length; i++)
              ButtonEscalaWidget(
                  labelText: notes[i], pressed: () => selectNote(notes[i]))
          ],
        ),
        Row(
          children: [getMusicalScaleText()],
        )
      ]),
    ));
  }
}
