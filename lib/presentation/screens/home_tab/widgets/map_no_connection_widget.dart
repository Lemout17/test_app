import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/resources/app_icons.dart';

class MapNoConnectionWidget extends StatelessWidget {
  const MapNoConnectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
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
        const SizedBox(height: 20),
        Text(
          'Відсутній зв\'язок',
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        Text(
          'Відсутність доступу до геолокації.\nПереконайтеся, що у додатку увімкнено\nгеолокацію та перевірте з\'єднання з Інтернетом.',
          style: textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Налаштування геолокації',
              style: textTheme.displaySmall,
            ),
            const SizedBox(width: 2),
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
