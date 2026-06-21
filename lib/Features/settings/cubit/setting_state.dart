class SettingsState {
  final String theme;
  final String language;
  SettingsState({
    required this.theme, 
    required this.language});
    factory SettingsState.initial(){
        return SettingsState(
      language: 'en',
      theme: 'dark',
    );
    }
     SettingsState copyWith({
    String? language,
    String? theme,
  }) {
    return SettingsState(
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }
}
