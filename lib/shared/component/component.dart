import 'package:app/modules/web_view/web_view_Screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget buildArticleItem(article,context,) => InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>WebViewScreen(url: article['url'])));
  },
  child:   Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children:
      [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ),
        ),
        const SizedBox(width: 15.0,),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
               [
                Expanded(
                  child: Text('${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget buildArticleBuilder(list,context,{isSearch = false})
{
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context)=>ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index)=>buildArticleItem(list[index],context),
      separatorBuilder: (context,index)=>const Divider(color: Colors.grey,),
      itemCount: list.length,
    ),
    fallback: (context)=>isSearch? Container():const Center(child: CircularProgressIndicator(),),
  );
}

