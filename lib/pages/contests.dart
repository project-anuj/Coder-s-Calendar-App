import 'dart:convert';
import 'package:coders_calendar/pages/contestList.dart';
import 'package:http/http.dart' as http;
import 'package:coders_calendar/other_pages/api_keys.dart';
import 'package:coders_calendar/widgets/myItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Contests extends StatefulWidget {
  const Contests({Key? key}) : super(key: key);

  @override
  State<Contests> createState() => _ContestsState();
}

class _ContestsState extends State<Contests> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              axisDirection: AxisDirection.down,
              children: [
                StaggeredGridTile.extent(
                  crossAxisCellCount: 2,
                  mainAxisExtent: 130,
                  child: staggeredItems('', 'All in One', 0xffed622b, 'All in One', 'allInOneList',API_KEY().allInOneUrl),
                ),
                StaggeredGridTile.extent(
                    crossAxisCellCount: 1,
                    mainAxisExtent: 130,
                    child: staggeredItems('lib/assets/images/code-forces.png', 'CodeForces', 0xff26cb3c, "CODEFORCES", 'codeforcesList',API_KEY().codeforcesUrl)),
                StaggeredGridTile.extent(
                    crossAxisCellCount: 1,
                    mainAxisExtent: 130,
                    child: staggeredItems('lib/assets/images/topcoder.png', 'Topcoder', 0xffff3266, "TOPCODER", 'topcoderList',API_KEY().topcoderUrl)),

                StaggeredGridTile.extent(
                    crossAxisCellCount: 1,
                    mainAxisExtent: 130,
                    child: staggeredItems('lib/assets/images/atcoder.png', 'atcoder', 0xff3399fe, "ATCODER", 'atcoderList',API_KEY().atcoderUrl)),
                StaggeredGridTile.extent(
                    crossAxisCellCount: 1,
                    mainAxisExtent: 130,
                    child: staggeredItems('lib/assets/images/codechef.png', 'codechef', 0xfff4c83f, "CODECHEF", 'codechefList',API_KEY().codechefUrl)),
                StaggeredGridTile.extent(
                    crossAxisCellCount: 1,
                    mainAxisExtent: 130,
                    child: staggeredItems('lib/assets/images/hackerrank.png', 'hackerrank', 0xffad61f1, "HACKERRANK", 'hackerrankList',API_KEY().hackerrankUrl)),
                StaggeredGridTile.extent(
                    crossAxisCellCount: 1,
                    mainAxisExtent: 130,
                    child: staggeredItems('lib/assets/images/hackerearth.png', 'hackerearth',0xff7297ff, "HACKEREARTH", 'hackerearthList',API_KEY().hackerearthUrl)),
                StaggeredGridTile.extent(
                    crossAxisCellCount: 1,
                    mainAxisExtent: 130,
                    child: staggeredItems('', 'KickStart', 0xff000000, 'KICKSTART', 'kickstartList',API_KEY().kickstartUrl)),
                StaggeredGridTile.extent(
                    crossAxisCellCount: 1,
                    mainAxisExtent: 130,
                    child: staggeredItems('lib/assets/images/leetcode.png', 'leetcode', 0xff26992b, 'LEETCODE', 'leetcodeList',API_KEY().leetcodeUrl)),

              ],

            ),
          ],
        )
      ),
    );
  }
  Widget staggeredItems(String image,String heading,int color,String platform,String contestList,String url)
  {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContestList(
              platformName: platform,
              url: url,
              contestList: contestList,
            )));
      },
      child: MyItems(image: image,heading: heading,color: color).myItems(),
    );
  }
}
