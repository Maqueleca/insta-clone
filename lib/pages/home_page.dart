import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istan/constant/post_json.dart';
import 'package:istan/constant/story_json.dart';
import 'package:istan/theme/colors.dart';
import 'package:istan/widgets/story_item.dart';
import 'package:line_icons/line_icons.dart';
import 'package:line_icons/line_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, left: 15.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 65.0,
                        height: 65.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 65.0,
                              height: 65.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(profile),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                bottom: 0.0,
                                right: 0.0,
                                child: Container(
                                  width: 19.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: white),
                                  child: Icon(Icons.add_circle,
                                      color: buttonFollowColor, size: 19.0),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      SizedBox(
                        width: 70.0,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                    children: List.generate(stories.length, (index) {
                  return StoryItem(
                    img: stories[index]['img'],
                    name: stories[index]['name'],
                  );
                })),
              ],
            ),
          ),
          Divider(
            color: white.withOpacity(0.3),
          ),
          Column(
            children: List.generate(posts.length, (index) {
              return PostItem(
                postImg: posts[index]['postImg'],
                profileImg: posts[index]['profileIm'],
                name: posts[index]['name'],
                caption: posts[index]['caption'],
                isLoved: posts[index]['isLoved'],
                viewCount: posts[index]['commentCount'],
                LikedBy: posts[index]['likedBy'],
                dayAgo: posts[index]['timeAgo']
              );
            }),
          )
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final String caption;
  final isLoved;
  final String LikedBy;
  final String viewCount;
  final String dayAgo;
  const PostItem({
    Key? key,
    required this.profileImg,
    required this.name,
    required this.postImg,
    this.isLoved,
    required this.LikedBy,
    required this.viewCount,
    required this.dayAgo,
    required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(profileImg),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      LineIcons.values['ellipsis-h'],
                      //LineIcons.ellipsis_h,
                      color: white,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
              height: 400.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(postImg), fit: BoxFit.cover),
              )),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    isLoved
                        ? SvgPicture.asset(
                            "assets/images/loved_icon.svg",
                            width: 27.0,
                          )
                        : Container(),
                    SizedBox(
                      width: 20.0,
                    ),
                    SvgPicture.asset(
                      "assets/images/comment_icon.svg",
                      width: 27.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    SvgPicture.asset(
                      "assets/images/message_icon.svg",
                      width: 27.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/images/save_icon.svg",
                  width: 27.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: "Liked by",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "$LikedBy",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700)),
                TextSpan(
                    text: "And",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700)),
                TextSpan(
                    text: "Other",
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700))
              ],
            )),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: "$name",
                      style:
                          TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: "$caption",
                      style:
                          TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500))
                ],
              ))),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              "View $viewCount comments",
              style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(posts[0]['profileImg']),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        "add a comment...",
                        style: TextStyle(
                            color: white.withOpacity(0.5),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "😊",
                        style: TextStyle(fontSize: 22.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "😍",
                        style: TextStyle(fontSize: 22.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(Icons.add_circle,
                          color: white.withOpacity(0.5), size: 18.0)
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              "1 day Ago",
              style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
