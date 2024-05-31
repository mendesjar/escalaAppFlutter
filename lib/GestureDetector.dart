import 'package:flutter/material.dart';

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
  List<String> notas = [
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#',
    'A',
    'A#',
    'B'
  ];
  String? escalaSelected;
  String? notaSelected;

  @override
  void initState() {
    super.initState();
  }

  void handleEscolhaEscala(String escala) {
    setState(() => escalaSelected = escala);
  }

  void handleSelectedNota(String nota) {
    setState(() => notaSelected = nota);
  }

  Text getMusicalScaleText() {
    final scaleMap = escalaSelected == "Maior"
        ? escalasMaioresNaturais
        : escalasMenoresNaturais;
    final scale = scaleMap[notaSelected];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'Selecione a Escala',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          handleEscolhaEscala('escalasMaioresNaturais'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                            double.infinity, 10), // Remove fixed height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor:
                            escalaSelected == 'escalasMaioresNaturais'
                                ? Colors.amber[300]
                                : null,
                      ),
                      child: const Text(
                        'MAIOR',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          handleEscolhaEscala('escalasMenoresNaturais'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                            double.infinity, 10), // Remove fixed height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor:
                            escalaSelected == 'escalasMenoresNaturais'
                                ? Colors.amber[300]
                                : null,
                      ),
                      child: const Text(
                        'MENOR',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'Selecione a Nota',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 16.0),
              Wrap(spacing: 16.0, runSpacing: 8.0, children: [
                for (int i = 0; i < notas.length; i++)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor:
                            notaSelected == notas[i] ? Colors.amber[300] : null,
                      ),
                      child: Text(notas[i]),
                      onPressed: () => handleSelectedNota(notas[i]))
              ]),
              const SizedBox(height: 16.0),
              if (escalaSelected != null && notaSelected != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                )
            ])))));
  }
}
