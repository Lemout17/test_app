import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading,
    this.buttonRadius,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool? isLoading;
  final double? buttonRadius;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius ?? 16),
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: isLoading ?? false
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                ),
              )
            : SizedBox(
                height: 18,
                child: Text(
                  text,
                  style: textTheme.titleMedium,
                ),
              ),
      ),
    );
  }
}
