import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/widgets/button_widget.dart';
import 'package:test_app/presentation/screens/home_tab/widgets/hero_widget.dart';
import 'package:test_app/presentation/screens/home_tab/widgets/map_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
    required this.username,
    required this.noInternet,
  });

  final String username;
  final bool noInternet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double height = constraints.maxHeight;
      final double width = constraints.maxWidth;

      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroWidget(
              username: username,
              height: height,
              width: width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.058),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.032,
                  ),
                  MapWidget(
                    height: height,
                    width: width,
                    noInternet: noInternet,
                  ),
                  SizedBox(
                    height: height * 0.032,
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
      );
    });
  }
}
