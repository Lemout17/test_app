import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_app/core/network_connection_provider/network_connection_provider.dart';
import 'package:test_app/core/network_connection_provider/network_connection_state.dart';
import 'package:test_app/presentation/core/navigation/destinations_route.dart';
import 'package:test_app/presentation/core/resources/app_icons.dart';
import 'package:test_app/presentation/core/widgets/button_widget.dart';
import 'package:test_app/presentation/screens/home_screen/widgets/hero_widget.dart';
import 'package:test_app/presentation/screens/home_screen/widgets/map_widget.dart';

class HomeScreenArguments {
  HomeScreenArguments({required this.username});

  final String username;
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
    required this.username,
  });

  static const String route = '/home_screen';

  final String username;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  StreamSubscription? subscription;
  bool noInternet = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      NetworkConnectionState networkState = ref.read(networkConnectionProvider);

      subscription = networkState.networkStream?.listen((event) {
        if (mounted) {
          setState(() {
            noInternet = event == InternetConnectionStatus.disconnected;
          });
        }
      });

      if (!networkState.hasConnection && mounted) {
        setState(() {
          noInternet = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: colorScheme.secondary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'logo',
          style: textTheme.bodyMedium,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              AppIcons.telephone,
              color: colorScheme.primary,
              size: 20,
            ),
          ),
          SizedBox(
            width: size.width * 0.058,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: DestinationsRoute.destinationsList
            .map(
              (page) => BottomNavigationBarItem(
                icon: Icon(page.icon),
                label: page.title,
              ),
            )
            .toList(),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double height = constraints.maxHeight;
            final double width = constraints.maxWidth;

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeroWidget(
                    username: widget.username,
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
          },
        ),
      ),
    );
  }
}
