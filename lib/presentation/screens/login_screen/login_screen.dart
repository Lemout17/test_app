import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/presentation/core/navigation/routes_constants.dart';
import 'package:test_app/presentation/core/widgets/button_widget.dart';
import 'package:test_app/presentation/screens/main_screen/main_screen.dart';
import 'package:test_app/presentation/screens/login_screen/provider/login_screen_provider.dart';
import 'package:test_app/presentation/screens/login_screen/widgets/username_text_form_field_widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String username = ref.watch(loginScreenProvider).username;
    final bool isLoading = ref.watch(loginScreenProvider).isLoading;

    ref.listen(loginScreenProvider, (prev, current) {
      //response simulation (if response success, navigate to next page)
      //just for testing

      if (prev?.isLoading != current.isLoading && !current.isLoading) {
        Navigator.of(context).pushNamed(
          RoutesConstants.main,
          arguments: MainScreenArguments(username: username),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 20,
            ),
            child: Column(
              children: [
                const SizedBox(height: 68),
                Text(
                  'Як до вас звертатися?',
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: Text(
                    'Будь ласка, укажіть ваше ім\'я для\nперсоналізації сервісу.',
                    style: textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 28),
                const UsernameTextFormFieldWidget(),
                const Spacer(),
                ButtonWidget(
                  text: 'Продовжити',
                  onPressed: username.isEmpty
                      ? null
                      : () {
                          ref.read(loginScreenProvider.notifier).sendUsername();
                        },
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
