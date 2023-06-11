import 'package:car_service_app_ui/Pages/home_page.dart';
import 'package:car_service_app_ui/style/color.dart';
import 'package:flutter/material.dart';

import '../component/bottom_nav.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueAccent,
      body: Center(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/car_main.png'))),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/main_logo.png',
                          scale: 1.5,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Premium auto \nrepair shop',
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Quaranteed Quality',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (_)=>BottomNav()));
                        },
                        splashColor: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            'GET STARTED',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: mainColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),




                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
