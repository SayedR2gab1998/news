import 'package:app/news_layout/cubit/news_cubit.dart';
import 'package:app/news_layout/cubit/news_states.dart';
import 'package:app/shared/component/component.dart';
import 'package:app/shared/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search',),
          ),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                    ),
                    prefixIcon: const Icon(IconBroken.Search,color: Colors.deepOrange,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: ( value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: buildArticleBuilder(list, context,isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
