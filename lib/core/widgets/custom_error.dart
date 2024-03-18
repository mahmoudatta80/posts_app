import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;

  const CustomError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          errorMessage,
          style: const TextStyle(
            color: Color(0xff082659),
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
