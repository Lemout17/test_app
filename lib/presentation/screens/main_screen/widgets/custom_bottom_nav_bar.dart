import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18.5,
          bottom: 13.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIconWidget(colorScheme),
            const SizedBox(height: 7),
            _buildTitleWidget(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWidget(ColorScheme colorScheme) {
    return Icon(
      icon,
      color: isSelected ? colorScheme.primary : colorScheme.surface,
    );
  }

  Widget _buildTitleWidget(ColorScheme colorScheme) {
    return Text(
      title,
      style: TextStyle(
        color: isSelected ? colorScheme.primary : colorScheme.surface,
        fontFamily: 'SF Pro Display',
        fontSize: 9,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
