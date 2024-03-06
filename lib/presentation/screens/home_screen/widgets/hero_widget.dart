import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    super.key,
    required this.username,
    required this.height,
    required this.width,
  });

  final String username;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.058,
        vertical: height * 0.026,
      ),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(height * 0.032),
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(40),
          image: const DecorationImage(
            image: AssetImage('assets/images/png/hero_car.png'),
            alignment: Alignment.centerRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Привіт,\n',
                    style: textTheme.displayMedium,
                  ),
                  TextSpan(
                    text: username,
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.026),
            Text(
              'Додавання авто',
              style: textTheme.headlineSmall,
            ),
            SizedBox(height: height * 0.013),
            Text(
              'Завантажте дані про ваше авто для\nкращого використання сервісу.',
              style: textTheme.headlineMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: height * 0.033),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Додати авто',
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
            ),
            SizedBox(height: height * 0.007),
          ],
        ),
      ),
    );
  }
}
