import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final Color color;
  final String buttonText;
  final buttonTapped;
  const CButton({super.key, required this.color, required this.buttonText, required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 62,
          width: 62,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
          child: Center(
            child: Text(
              buttonText,
              style: buttonText == '='
                  ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black)
                  : const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
