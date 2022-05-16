import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/state.dart';
import 'package:news_app/shared/components/components.dart';
class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).science;
          return articleBuilder(list,context);
        } );
  }
}
