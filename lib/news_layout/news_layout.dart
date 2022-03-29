import 'package:app/cubit/app_cubit.dart';
import 'package:app/modules/search/search_screen.dart';
import 'package:app/news_layout/cubit/news_cubit.dart';
import 'package:app/news_layout/cubit/news_states.dart';
import 'package:app/shared/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SearchScreen()));
                    },
                    icon: const Icon(IconBroken.Search)),
                IconButton(
                    onPressed: (){
                      AppCubit.get(context).changeTheme();
                    },
                    icon: const Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index){cubit.changeBottomNavBar(index);},
            ),
          );
        },
      ),
    );
  }
}