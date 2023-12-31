import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool _isDark = true;
  bool get isDark => _isDark;

  void changeTheme() {
    emit(ThemeChangedLoading());
    _isDark = !_isDark;
    emit(ThemeChangedSuccess());
  }
}
