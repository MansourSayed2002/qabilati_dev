import 'package:flutter/material.dart';

class PinKeyboard extends StatelessWidget {
  final Function(String) onNumberTap;
  final VoidCallback onBackspace;
  final VoidCallback onSubmit;

  const PinKeyboard({
    super.key,
    required this.onNumberTap,
    required this.onBackspace,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        if (index == 11) {
          return BuildButtom(
            icon: Icons.backspace,
            onTap: onBackspace,
            color: Colors.red.shade400,
          );
        }
        if (index == 10) {
          return BuildButtom(label: "0", onTap: () => onNumberTap("0"));
        }
        if (index == 9) {
          return BuildButtom(
            icon: Icons.check_circle,
            onTap: onSubmit,
            color: Colors.green.shade400,
          );
        }

        return BuildButtom(
          label: "${index + 1}",
          onTap: () => onNumberTap("${index + 1}"),
        );
      },
    );
  }
}

class BuildButtom extends StatelessWidget {
  const BuildButtom({
    super.key,
    this.label,
    this.icon,
    required this.onTap,
    this.color,
  });
  final String? label;
  final IconData? icon;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child:
            label != null
                ? Text(
                  label.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                )
                : Icon(icon, size: 28, color: Colors.white),
      ),
    );
  }
}
