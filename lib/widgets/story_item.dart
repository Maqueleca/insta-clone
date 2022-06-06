import 'package:flutter/material.dart';
import 'package:istan/theme/colors.dart';

class StoryItem extends StatelessWidget {
  final String img;
  final String name;
  const StoryItem({
    Key? key, 
    required this.img, 
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        children: <Widget>[
          Container(
            width: 68.0,
            height: 68.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: storyBorderColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 65.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: black, width: 2.0),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(img,),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  width: 70.0,
                  child: Text(name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: white),
              ),
            )
        ],
      ),
    );
  }
}