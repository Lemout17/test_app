import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_app/core/location_provider/location_provider.dart';
import 'package:test_app/core/network_connection_provider/network_connection_provider.dart';
import 'package:test_app/presentation/core/resources/app_icons.dart';
import 'package:test_app/presentation/screens/applications_tab/applications_tab.dart';
import 'package:test_app/presentation/screens/home_tab/home_tab.dart';
import 'package:test_app/presentation/screens/personal_info_tab/personal_info_tab.dart';

import 'widgets/custom_bottom_nav_bar_item.dart';

enum MainScreenTabs {
  applications,
  home,
  personalInfo,
}

class MainScreenArguments {
  MainScreenArguments({required this.username});

  final String username;
}

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({
    super.key,
    required this.username,
  });

  final String username;

  @override
  ConsumerState<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MainScreen> {
  static const Duration duration = Duration(milliseconds: 500);
  static const _initialPage = MainScreenTabs.home;
  static const Curve curve = Curves.decelerate;
  final PageController _pageController =
      PageController(initialPage: _initialPage.index);
  MainScreenTabs _currentPage = _initialPage;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    final LocationPermission permission =
        ref.watch(locationProvider).permission;
    final bool hasConnection =
        ref.watch(networkConnectionProvider).hasConnection;
    final bool isGeolocatorServiceEnabled =
        ref.watch(locationProvider).serviceEnabled;
    final bool isServiceAvailable = (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse) &&
        hasConnection &&
        isGeolocatorServiceEnabled;

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
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomBottomNavBarItem(
            icon: AppIcons.clipboard_list,
            isSelected: _currentPage == MainScreenTabs.applications,
            title: 'Заявки',
            onTap: () => _onIconTabTap(MainScreenTabs.applications),
          ),
          CustomBottomNavBarItem(
            icon: AppIcons.home,
            isSelected: _currentPage == MainScreenTabs.home,
            title: 'Головна',
            onTap: () => _onIconTabTap(MainScreenTabs.home),
          ),
          CustomBottomNavBarItem(
            icon: AppIcons.user,
            isSelected: _currentPage == MainScreenTabs.personalInfo,
            title: 'Особисті дані',
            onTap: () => _onIconTabTap(MainScreenTabs.personalInfo),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: [
            const ApplicationsTab(),
            HomeTab(
              username: widget.username,
              isServiceAvailable: isServiceAvailable,
            ),
            const PersonalInfoTab(),
          ],
        ),
      ),
    );
  }

  void _onIconTabTap(MainScreenTabs value) {
    setState(() {
      _currentPage = value;
      _pageController.animateToPage(
        value.index,
        duration: duration,
        curve: curve,
      );
    });
  }

  void _onPageChanged(int value) {
    setState(() {
      _currentPage = MainScreenTabs.values[value];
    });
  }
}
