import 'package:app/cubit/app_states.dart';
import 'package:app/shared/local/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppSates>
{
  AppCubit():super(AppInitStates());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeTheme({bool? darkTheme})
  {
    if(darkTheme != null)
    {
      isDark = darkTheme;
      emit(ChangeThemeMode());
    }
    else{
      isDark = ! isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeThemeMode());
      });
    }
  }

}