import 'package:coders_calendar/constants/strings.dart';
import 'package:coders_calendar/web_view/webview.dart';
import 'package:coders_calendar/widgets/myItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  late String codeForcesUrl = "";
  late String topCoderUrl = "";
  late String atCoderUrl = "";
  late String codeChefUrl = "";
  late String hackerRankUrl = "";
  late String hackerEarthUrl = "";
  late String kickStartUrl = "";
  late String leetCodeUrl = "";

  @override
  void initState() {
    super.initState();
    getSharedPref();
    print(codeForcesUrl);
  }

  getSharedPref()async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
      codeForcesUrl = pref.getString("codeForcesHandle")??"";
      topCoderUrl = pref.getString("topCoderHandle")??"";
      atCoderUrl = pref.getString("atCoderHandle")??"";
      codeChefUrl = pref.getString("codeChefHandle")??"";
      hackerRankUrl = pref.getString("hackerRankHandle")??"";
      hackerEarthUrl = pref.getString("hackerEarthHandle")??"";
      kickStartUrl = pref.getString("kickStartHandle")??"";
      leetCodeUrl = pref.getString("leetCodeHandle")??"";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Profiles"),),
          body: Stack(
            children:[
              if(codeForcesUrl=="" && topCoderUrl==""&&atCoderUrl==""&&codeChefUrl==""&&hackerRankUrl==""&&hackerEarthUrl==""&& leetCodeUrl=="")
              Center(child: Text(Strings().profilePageTextWhenNoHandleAdded,
              style: TextStyle(
                fontSize: 20,
              ),
              ),),
              Container(
                child: ListView(
                  children: [
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      axisDirection: AxisDirection.down,
                      children: [

                        if(codeForcesUrl!="")StaggeredGridTile.extent(
                            crossAxisCellCount: 2,
                            mainAxisExtent: 117,
                            child: staggeredItems('lib/assets/images/code-forces.png', 'CodeForces', 0xff26cb3c,"https://codeforces.com/profile/"+codeForcesUrl)),
                        if(topCoderUrl!="")StaggeredGridTile.extent(
                            crossAxisCellCount: 2,
                            mainAxisExtent: 117,
                            child: staggeredItems('lib/assets/images/topcoder.png', 'TopCoder', 0xffff3266,"https://www.topcoder.com/members/"+topCoderUrl)),

                        if(atCoderUrl!="")StaggeredGridTile.extent(
                            crossAxisCellCount: 2,
                            mainAxisExtent: 117,
                            child: staggeredItems('lib/assets/images/atcoder.png', 'AtCoder', 0xff3399fe,"https://atcoder.jp/users/"+atCoderUrl)),
                        if(codeChefUrl!="")StaggeredGridTile.extent(
                            crossAxisCellCount: 2,
                            mainAxisExtent: 117,
                            child: staggeredItems('lib/assets/images/codechef.png', 'CodeChef', 0xfff4c83f,"https://www.codechef.com/users/"+codeChefUrl)),
                        if(hackerRankUrl!="")StaggeredGridTile.extent(
                            crossAxisCellCount: 2,
                            mainAxisExtent: 117,
                            child: staggeredItems('lib/assets/images/hackerrank.png', 'HackerRank', 0xffad61f1,"https://www.hackerrank.com/"+hackerRankUrl)),
                        if(hackerEarthUrl!="")StaggeredGridTile.extent(
                            crossAxisCellCount: 2,
                            mainAxisExtent: 117,
                            child: staggeredItems('lib/assets/images/hackerearth.png', 'HackerEarth',0xff7297ff,"https://www.hackerearth.com/"+hackerEarthUrl)),
                        if(kickStartUrl!="")StaggeredGridTile.extent(
                            crossAxisCellCount: 2,
                            mainAxisExtent: 117,
                            child: staggeredItems('', 'KickStart', 0xff000000,kickStartUrl)),
                        if(leetCodeUrl!="")StaggeredGridTile.extent(
                            crossAxisCellCount: 2,
                            mainAxisExtent: 117,
                            child: staggeredItems('lib/assets/images/leetcode.png', 'LeetCode', 0xff26992b,"https://leetcode.com/"+leetCodeUrl)),
                        SizedBox(height:1 ,),
                      ],

                    ),
                  ],
                ),
              ),
            ]
          )
      ),
    );
  }
  Widget staggeredItems(String image,String heading,int color,String url)
  {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebViewPage(url: url, title: heading)));
      },
      child: MyItems(image: image,heading: heading,color: color).myItems(),
    );
  }
}
