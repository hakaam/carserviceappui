import 'package:car_service_app_ui/data/articles_data.dart';
import 'package:car_service_app_ui/data/last_service.dart';
import 'package:car_service_app_ui/data/service.dart';
import 'package:car_service_app_ui/style/color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileContainer(),
              SizedBox(
                height: 25,
              ),
              Text(
                'Last Service',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, color: subText, fontWeight: FontWeight.w600),
              ),
              lastServiceList(),
              SizedBox(
                height: 25,
              ),
              Text(
                'Service List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, color: subText, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              serviceList(),
              SizedBox(
                height: 25,
              ),
              Text(
                'Current Promotions',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, color: subText, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              promotionList(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox promotionList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: articlesData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              AssetImage(articlesData[index].image.toString())),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articlesData[index].title.toString(),
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          articlesData[index].description.toString(),
                          textAlign: TextAlign.left,
                          maxLines: 4,
                          style: TextStyle(
                              color: subText,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  SizedBox lastServiceList() {
    return SizedBox(
      height: 190,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: lastService.length,
          itemBuilder: (context, index) {
            return Container(
              width: 150,
              height: 120,
              margin: EdgeInsets.fromLTRB(0, 15, 15, 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: index == 0 ? Colors.white : lastServiceAccent,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: index == 0
                            ? subText.withOpacity(0.1)
                            : Colors.white.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lastService[index].day.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10,
                                color: subText,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            lastService[index].clock.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: mainColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            lastService[index].serviceTime.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10,
                                color: mainColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        color: subText,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    lastService[index].desc.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 12,
                        color: mainColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Material(
                    color: index == 0 ? blueAccent : mainColor,
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(
                        //     builder: (_)=>BottomNav()));
                      },
                      splashColor: index == 0 ? mainColor : blueAccent,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  SizedBox serviceList() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: serviceData.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                serviceData[index].logo.toString(),
                height: 20,
                width: 40,
              ),
            );
          }),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: subText.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'images/profile_logo.png',
                width: 40,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,James',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: mainColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Premium Members',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        color: subText,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.notifications_outlined),
        ],
      ),
    );
  }
}
