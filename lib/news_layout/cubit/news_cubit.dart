import 'package:app/modules/business_module/business_screen.dart';
import 'package:app/modules/science_module/science_screen.dart';
import 'package:app/modules/sport_module/sport_screen.dart';
import 'package:app/news_layout/cubit/news_states.dart';
import 'package:app/shared/local/cache_helper.dart';
import 'package:app/shared/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitStates());

  static NewsCubit get(context) =>BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =[
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];
  List<Widget> screens=[
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
  ];
  void changeBottomNavBar(int index){
    currentIndex = index;
    if(currentIndex == 1) {
      getSports();
    }
    if(currentIndex ==2) {
      getScience();
    }
    emit(NewsChangeBottomNavBar());
  }

  List<dynamic> business = [];
  void getBusiness()
  {
    if(business.isEmpty)
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'business',
            'apiKey': '0e915caebb8f487da5fb5b110e61cd6e',
          }).then((value) {
        business= value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error){
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    }
    else
    {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSports()
  {
    if(sports.isEmpty)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'sports',
              'apiKey': '0e915caebb8f487da5fb5b110e61cd6e',
            }).then((value) {
          sports= value.data['articles'];
          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          emit(NewsGetSportsErrorState(error.toString()));
        });
      }
    else
    {
      emit(NewsGetSportsSuccessState());
    }
  }


  List<dynamic> science = [];
  void getScience()
  {
    if(science.isEmpty)
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey': '0e915caebb8f487da5fb5b110e61cd6e',
          }).then((value) {
        science= value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
    else
    {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':value,
          'apiKey': '0e915caebb8f487da5fb5b110e61cd6e',
        }).then((value) {
      search= value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

}