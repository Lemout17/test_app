import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/presentation/screens/login_screen/provider/login_screen_provider.dart';

class UsernameTextFormFieldWidget extends ConsumerStatefulWidget {
  const UsernameTextFormFieldWidget({super.key});

  @override
  ConsumerState<UsernameTextFormFieldWidget> createState() =>
      _UsernameTextFormFieldWidgetState();
}

class _UsernameTextFormFieldWidgetState
    extends ConsumerState<UsernameTextFormFieldWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Ваше ім’я',
        hintStyle: textTheme.bodySmall?.copyWith(
          color: colorScheme.onBackground,
        ),
      ),
      textCapitalization: TextCapitalization.words,
      onChanged: ref.read(loginScreenProvider.notifier).changeUsername,
      cursorColor: colorScheme.secondary,
      style: textTheme.bodySmall,
    );
  }
}
