import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/presentation/core/widgets/button_widget.dart';
import 'package:test_app/presentation/screens/home_screen/home_screen.dart';
import 'package:test_app/presentation/screens/login_screen/provider/login_screen_provider.dart';
import 'package:test_app/presentation/screens/login_screen/widgets/username_text_form_field_widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const String route = '/preview_screen';

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
          HomeScreen.route,
          arguments: HomeScreenArguments(username: username),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double height = constraints.maxHeight;
            final double width = constraints.maxWidth;

            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.058,
                  vertical: height * 0.026,
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.088),
                    Text(
                      'Як до вас звертатися?',
                      style: textTheme.titleLarge,
                    ),
                    SizedBox(height: height * 0.026),
                    SizedBox(
                      width: width * 0.685,
                      child: Text(
                        'Будь ласка, укажіть ваше ім\'я для персоналізації сервісу.',
                        style: textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: height * 0.036),
                    const UsernameTextFormFieldWidget(),
                    const Spacer(),
                    ButtonWidget(
                      text: 'Продовжити',
                      onPressed: username.isEmpty
                          ? null
                          : () {
                              ref
                                  .read(loginScreenProvider.notifier)
                                  .sendUsername();
                            },
                      isLoading: isLoading,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
