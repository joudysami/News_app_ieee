import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/Features/settings/cubit/setting_cubit.dart';
import 'package:news_app/Features/settings/cubit/setting_state.dart';

class DropdownButtonWidget extends StatelessWidget {
  const DropdownButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: state.theme,
          isExpanded: true,
          hint: const Text("Select Theme"),

          items: const [
            DropdownMenuItem(value: 'dark', child: Text('Dark')),
            DropdownMenuItem(value: 'light', child: Text('Light')),
          ],

          onChanged: (value) {
            if (value != null) {
              context.read<SettingsCubit>().changeTheme(value);
            }
          },
        );
      },
    );
  }
}