import 'package:app/news_layout/cubit/news_cubit.dart';
import 'package:app/news_layout/cubit/news_states.dart';
import 'package:app/shared/component/component.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).business;
        return buildArticleBuilder(list, context);
      },
    );
  }
}