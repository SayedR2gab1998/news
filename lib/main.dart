import 'package:app/cubit/app_cubit.dart';
import 'package:app/cubit/app_states.dart';
import 'package:app/news_layout/cubit/news_cubit.dart';
import 'package:app/news_layout/news_layout.dart';
import 'package:app/shared/local/cache_helper.dart';
import 'package:app/shared/remote/dio_helper.dart';
import 'package:app/shared/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  late bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp( MyApp(isDark??false));
}

class MyApp extends StatelessWidget {
  final bool isDark;
   MyApp( this.isDark,) ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>NewsCubit()..getScience()..getSports()..getBusiness()),
        BlocProvider(create: (BuildContext context)=>AppCubit()..changeTheme(darkTheme: isDark))
      ],
      child: BlocConsumer<AppCubit,AppSates>(
        listener: (context, state){},
        builder: (context, state)
        {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home:  NewsLayout(
            ),
          );
        },
      ),
    );
  }
}
