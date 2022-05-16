import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/state.dart';
import 'package:news_app/shared/components/components.dart';
class SearchScrreen extends StatelessWidget {
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppState>(
      listener: (context,state){},
      builder: (context,state){
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    icon: Icons.search,
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);

                    },
                    label: 'Search',
                    validate: (String value){
                      if(value.isEmpty)
                      {
                        return 'Search Must Not Be Empty';
                      }
                      return null;
                    }),
              ),
              Expanded(child: articleBuilder(list, context))

            ],
          ),
        );
      },

    );
  }
}
