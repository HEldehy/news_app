import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';
Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
);
Widget articleBuilder(list, context,{isSearch = false}) => list.length > 0
    ? ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            ),
        itemCount: list.length)
    :isSearch?Container(): Center(child: CircularProgressIndicator());
Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required IconData icon,
  @required String label,
  @required Function validate,
  Function onSubmit,
  Function onTap,
  Function onChange,
  Function suffixPressed,
  Function preffixPressed,
  bool isClick = true,
  IconData suffix,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted:onSubmit(),
      onTap: onTap(),
      onChanged: onChange(),
      enabled: isClick,
      validator: validate(),
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(icon),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed(), icon: Icon(suffix))
            : null,
      ),
    );
void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
