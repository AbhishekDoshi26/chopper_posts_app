import 'package:chopper_posts/bloc/post_bloc.dart';
import 'package:chopper_posts/model/constants.dart';
import 'package:chopper_posts/model/posts.dart';
import 'package:flutter/material.dart';

class PostsData extends StatelessWidget {
  final PostLoadedState state;
  PostsData({this.state});
  @override
  Widget build(BuildContext context) {
    List<Posts> postlist = state.post.body.asList();
    return ListView.separated(
      itemBuilder: (context, index) => PostHome(
        postlist: postlist,
        index: index,
      ),
      separatorBuilder: (context, index) => Divider(
        thickness: 2.0,
        height: 40.0,
      ),
      itemCount: postlist.length,
    );
  }
}

class PostHome extends StatelessWidget {
  PostHome({
    this.postlist,
    this.index,
  });

  final List<Posts> postlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: ' + postlist[index].id.toString(),
                  style: kHeadingStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Text(
                    'Title: ' + postlist[index].title,
                    style: kHeadingStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              postlist[index].body,
              style: kBodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
