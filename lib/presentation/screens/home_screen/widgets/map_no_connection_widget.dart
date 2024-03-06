import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/resources/app_icons.dart';

class MapNoConnectionWidget extends StatelessWidget {
  const MapNoConnectionWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(height * 0.023),
          decoration: BoxDecoration(
            color: colorScheme.outline,
            borderRadius: const BorderRadius.all(
              Radius.circular(17),
            ),
          ),
          child: Icon(
            AppIcons.wifi_slash,
            color: colorScheme.secondary,
            size: 30,
          ),
        ),
        SizedBox(height: height * 0.026),
        Text(
          'Відсутній зв\'язок',
          style: textTheme.titleLarge,
        ),
        SizedBox(height: height * 0.026),
        Text(
          'Відсутність доступу до геолокації.\nПереконайтеся, що у додатку увімкнено\nгеолокацію та перевірте з\'єднання з Інтернетом.',
          style: textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 0.026),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Відсутній зв\'язок',
              style: textTheme.displaySmall,
            ),
            SizedBox(width: width * 0.005),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 8,
              color: colorScheme.secondary,
            ),
          ],
        ),
      ],
    );
  }
}
