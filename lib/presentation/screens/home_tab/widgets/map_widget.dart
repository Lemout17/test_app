import 'package:flutter/material.dart';
import 'package:test_app/presentation/screens/home_tab/widgets/map_no_connection_widget.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.isServiceAvailable,
  });

  final bool isServiceAvailable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 25,
      ),
      constraints: const BoxConstraints(
        minHeight: 304,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(55),
        ),
        image: DecorationImage(
          image: !isServiceAvailable
              ? const AssetImage('assets/images/png/map_darkened.png')
              : const AssetImage('assets/images/png/map.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: !isServiceAvailable
          ? const MapNoConnectionWidget()
          : const SizedBox(),
    );
  }
}
