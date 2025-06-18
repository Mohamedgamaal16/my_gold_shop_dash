import 'package:flutter/material.dart';

class AddNewAgentButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const AddNewAgentButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.07,
      width: MediaQuery.sizeOf(context).width * 0.18,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(
          Icons.add,
          size: 24,
          color: Colors.white,
        ),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0D4D45),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
