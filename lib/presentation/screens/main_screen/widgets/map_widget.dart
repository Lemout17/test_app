import 'package:flutter/material.dart';
import 'package:test_app/presentation/screens/main_screen/widgets/map_no_connection_widget.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.height,
    required this.width,
    required this.noInternet,
  });

  final double height;
  final double width;
  final bool noInternet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.065,
        horizontal: width * 0.066,
      ),
      constraints: BoxConstraints(
        minHeight: height * 0.395,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(55),
        ),
        image: DecorationImage(
          image: noInternet
              ? const AssetImage('assets/images/png/map_darkened.png')
              : const AssetImage('assets/images/png/map.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: noInternet
          ? MapNoConnectionWidget(
              height: height,
              width: width,
            )
          : const SizedBox(),
    );
  }
}
