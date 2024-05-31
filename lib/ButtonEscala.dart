import 'package:flutter/material.dart';

class ButtonEscalaWidget extends StatelessWidget {
  final VoidCallback pressed;
  final String labelText;
  final int? largura;

  const ButtonEscalaWidget(
      {super.key,
      required this.pressed,
      required this.labelText,
      this.largura});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        iconColor: const WidgetStatePropertyAll<Color>(Colors.black),
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.amber[200]!),
      ),
      onPressed: pressed,
      child: DefaultTextStyle.merge(
          style: const TextStyle(
              fontWeight: FontWeight.normal, color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(labelText),
          )),
    );
  }
}
