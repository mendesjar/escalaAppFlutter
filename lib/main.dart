import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List<String> notas = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  String? escalaSelected = 'MAIOR';
  String? notaSelected = "C";

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
    final scaleMap = escalaSelected == "MAIOR"
        ? escalasMaioresNaturais
        : escalasMenoresNaturais;
    final scale = scaleMap[notaSelected];

    if (scale == null) {
      return const Text('');
    }

    return Text(
      scale.join(' '),
      style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w700),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Selecione a Escala',
                    style: GoogleFonts.sora(fontSize: 15),
                  ),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => handleEscolhaEscala('MAIOR'),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: escalaSelected == 'MAIOR'
                          ? Colors.amber
                          : Colors.amber[200],
                    ),
                    child: DefaultTextStyle.merge(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      child: Text(
                        'MAIOR',
                        style: GoogleFonts.sora(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => handleEscolhaEscala('MENOR'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                          double.infinity, 60), // Remove fixed height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: escalaSelected == 'MENOR'
                          ? Colors.amber
                          : Colors.amber[200],
                    ),
                    child: DefaultTextStyle.merge(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      child: Text(
                        'MENOR',
                        style: GoogleFonts.sora(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    'Selecione a Nota',
                    style: GoogleFonts.sora(fontSize: 15),
                  ),
                )),
            const SizedBox(height: 20),
            Center(
              child: Wrap(spacing: 20, runSpacing: 20, children: [
                for (int i = 0; i < notas.length; i++)
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(80, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: notaSelected == notas[i]
                            ? Colors.amber
                            : Colors.amber[200],
                      ),
                      child: DefaultTextStyle.merge(
                        style: const TextStyle(color: Colors.black),
                        child: Text(
                          notas[i],
                          style: GoogleFonts.sora(),
                        ),
                      ),
                      onPressed: () => handleSelectedNota(notas[i]))
              ]),
            ),
            const SizedBox(height: 20),
            if (escalaSelected != null && notaSelected != null)
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.amber[400],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: getMusicalScaleText(),
                  )),
          ]),
        )))));
  }
}
