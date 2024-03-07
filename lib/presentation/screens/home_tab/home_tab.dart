import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/widgets/button_widget.dart';
import 'package:test_app/presentation/screens/home_tab/widgets/hero_widget.dart';
import 'package:test_app/presentation/screens/home_tab/widgets/map_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
    required this.username,
    required this.isServiceAvailable,
  });

  final String username;
  final bool isServiceAvailable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroWidget(
              username: username,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  MapWidget(
                    isServiceAvailable: isServiceAvailable,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ButtonWidget(
                    buttonRadius: 19,
                    text: 'Викликати майстра',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
