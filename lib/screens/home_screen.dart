import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_covid_19_app_2/constants.dart';
import 'package:flutter_app_covid_19_app_2/screens/detail_screen.dart';
import 'package:flutter_app_covid_19_app_2/widgets/info_card.dart';
import 'package:flutter_app_covid_19_app_2/widgets/line_chart.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 40),
            width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )
              ),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children:<Widget>[
                InfoCard(
                  title: "Confirmed Cases",
                  iconColor: Color(0xFFFF8C00),
                  effecteNum: 1062,
                  press: (){},
                ),
                InfoCard(
                  title: "Total Deaths",
                  iconColor: Color(0xFFFF2D55),
                  effecteNum: 75,
                  press: (){},
                ),
                InfoCard(
                  title: "Total Recovered",
                  iconColor: Color(0xFF50E3C2),
                  effecteNum: 689,
                  press: (){},
                ),
                InfoCard(
                  title: "New Cases",
                  iconColor: Color(0xFF5856D6),
                  effecteNum: 52,
                  press: (){Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context){
                      return DetailsScreen();
                    },
                  ),
                  );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Preventions",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  buildPreventation(),
                  SizedBox(height: 40),
                  buildHelpCard(),
                ],// <Widget>[]
              ),
            ),
          ),
        ],//<Widget>
      ),
    );
  }

  Row buildPreventation() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  PreventitionCard(
                    svgSrc: "assets/icons/hand_wash.svg",
                    title: "Wash Hands",
                  ),
                  PreventitionCard(
                    svgSrc: "assets/icons/use_mask.svg",
                    title: "Use Masks",
                  ),
                  PreventitionCard(
                    svgSrc: "assets/icons/Clean_Disinfect.svg",
                    title: "Clean Disinfect",
                  ),
                ],
              );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: (){},
    ),
      actions:<Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: (){},
        ),
      ],
    );
  }
}

class buildHelpCard extends StatelessWidget {
  const buildHelpCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
//                  color: Colors.black,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children:<Widget>[
          Container(
            padding: EdgeInsets.only(
              //left side padding for 40% of total width
                left:  MediaQuery.of(context).size.width*.4,
              top: 20,
              right: 20,
            ),
            height: 130,
            width: double.infinity,
//                        color: Colors.blue,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF60BE93),
                    Color(0xFF188D59),
                  ],
              ),
              borderRadius:
              BorderRadius.circular(20),
            ),
            child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Dial 999 for \nMedical Help! ",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                    TextSpan(
                      text: "If any symptoms appear",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7)
                      )
                    )
                  ],
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset("assets/icons/nurse.svg"),
          ),
          Positioned(
              top: 30,
              right: 10,
              child: SvgPicture.asset("assets/icons/virus.svg"),
          ),
        ],
      ),
    );
  }
}

class PreventitionCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventitionCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style:  Theme.of(context)
            .textTheme
              .body2
              .copyWith(color: kPrimaryColor),)
      ],
    );
  }
}



