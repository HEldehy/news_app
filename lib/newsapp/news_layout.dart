import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/appcubit/app_cubit.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/state.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
    return BlocConsumer<NewsCubit,NewsAppState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=NewsCubit.get(context);
        return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          actions: [
            IconButton(
                onPressed: (){
                  navigateTo(context, SearchScrreen());
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: (){
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(Icons.brightness_4_outlined)),
          ],
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.orange,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
          items: <Widget> [
            Icon(Icons.business, size: 30),
            Icon(Icons.sports, size: 30),
            Icon(Icons.science, size: 30),

          ],
          index: cubit.currentIndex,
          onTap:(index){
            cubit.changeBottomNavBar(index);
          }

        )
        // BottomNavigationBar(
        //   currentIndex: cubit.currentIndex,
        //   onTap: (index){
        //     cubit.changeBottomNavBar(index);
        //   },
        //   items: cubit.bottomItems,
        // ),
      );},
    );
  }
}
