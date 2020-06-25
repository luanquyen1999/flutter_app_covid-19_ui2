import 'package:flutter/material.dart';
import 'package:flutter_app_covid_19_app_2/constants.dart';
import 'package:flutter_app_covid_19_app_2/widgets/weekly_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 53,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  buildTitleWithMoreIcon(),
                  buildCaseNumber(context),
                  SizedBox(height: 15),
                  Text(
                      "From Health Center",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: kTextMediumColor,
                    fontSize: 18,
                  ),
                  ),
                  SizedBox(height: 15),
                  WeeklyChart(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                      buildInfoTextWithPercentage(
                          percentage: "6.43",
                        title: "From Last Week",
                      ),
                      buildInfoTextWithPercentage(
                        percentage: "9.43",
                        title: "Recovery Rate",
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 54,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                children:<Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                      Text(
                        "Global Map",
                        style: TextStyle(
                            fontSize: 15,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/more.svg"),
                    ],
                  ),
                  SizedBox(height: 10),
                  SvgPicture.asset("assets/icons/map.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage({String title, String percentage}) {
    return RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: "$percentage% ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kPrimaryColor,
                                )
                              ),
                              TextSpan(
                                text: title,
                                style: TextStyle(
                                  color: kTextMediumColor,
                                  height: 1.5,
                                ),
                              ),
                            ],
                        ),
                    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
                  children:<Widget>[
                    SizedBox(height: 15),
                      Text(
                          "547 ",
                        style: Theme.of(context)
                            .textTheme
                            .display3
                            .copyWith(color: kPrimaryColor,height: 1.2),
                      ),
                    Text(
                      "5.9%",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    SvgPicture.asset("assets/icons/increase.svg"),
                  ],
                );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    Text(
                        "New Cases",
                    style: TextStyle(
                      color: kTextMediumColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    ),
                    SvgPicture.asset("assets/icons/more.svg")
                  ],
                );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,
        color: kPrimaryColor,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions:<Widget>[
        IconButton(icon: SvgPicture.asset(
          "assets/icons/search.svg"),
            onPressed: (){},
        ),
      ],
    );
  }
}
