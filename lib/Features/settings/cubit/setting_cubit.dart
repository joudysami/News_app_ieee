import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/settings/cubit/setting_state.dart';


class SettingsCubit extends Cubit<SettingsState>{
 SettingsCubit() : super(SettingsState.initial());

 Future<void>changeTheme(String theme)async {
      emit(state.copyWith(theme: theme));
 }

 Future <void> changeLanguage(String lan)async {
  emit(state.copyWith(language: lan));

 }
}
