import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/appcubit/app_states.dart';
import 'package:news_app/network/local/cache_helper.dart';
class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark=false;
  ThemeMode mode=  ThemeMode.dark;
  void changeAppMode( { bool fromShared}){
    if(fromShared !=null)
    {
      isDark=fromShared;
    emit(AppChangeModeState());

    }else{
      isDark=!isDark;
      CacheHelper.putBool(key: 'isDark', value: isDark).then((value){
        emit(AppChangeModeState());
      });

    }


  }

}