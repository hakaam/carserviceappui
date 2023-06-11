import 'package:flutter/material.dart';

import '../data/service.dart';
import '../models/service_models.dart';
import '../style/color.dart';
class ServiceFormPage extends StatefulWidget {
  const ServiceFormPage({super.key});

  @override
  State<ServiceFormPage> createState() => _ServiceFormPageState();
}

class _ServiceFormPageState extends State<ServiceFormPage> {
  List<ServiceModels> serviceDataForm = [];

  List<ServiceModels> selectedService = [];

  @override
  void initState() {
    super.initState();
    serviceDataForm = serviceData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackAccent,
          ),
          title: Text(
            "Service Form",
            style: TextStyle(
                color: blackAccent, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          actions: [SizedBox()],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: subText.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Car Detail",
                        style: TextStyle(
                            color: blackAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Car Name",
                            style: TextStyle(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Avanza",
                            style: TextStyle(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Car Number",
                            style: TextStyle(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "AB 2554 GH",
                            style: TextStyle(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Service List",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: subText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: serviceDataForm.length == 0
                          ? 1
                          : serviceDataForm.length,
                      itemBuilder: ((context, index) {
                        return serviceDataForm.isEmpty
                            ? Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_rounded,
                                        color: mainColor,
                                        size: 40,
                                      ),
                                      Text(
                                        "All Service have been Picked",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: mainColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedService.add(ServiceModels(
                                        id: serviceDataForm[index].id,
                                        logo: serviceDataForm[index].logo));
                                    serviceDataForm.removeAt(index);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: mainColor),
                                  child: Image.asset(
                                    serviceDataForm[index].logo.toString(),
                                    height: 20,
                                    width: 40,
                                  ),
                                ),
                              );
                      })),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Selected Service ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: subText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedService.length == 0
                          ? 1
                          : selectedService.length,
                      itemBuilder: ((context, index) {
                        return selectedService.isEmpty
                            ? Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.close,
                                        color: mainColor,
                                        size: 40,
                                      ),
                                      Text(
                                        "No Service has Picked",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: mainColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    serviceDataForm.add(ServiceModels(
                                        id: selectedService[index].id,
                                        logo: selectedService[index].logo));
                                    selectedService.removeAt(index);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: mainColor),
                                  child: Image.asset(
                                    selectedService[index].logo.toString(),
                                    height: 20,
                                    width: 40,
                                  ),
                                ),
                              );
                      })),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: subText.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service Details",
                        style: TextStyle(
                            color: blackAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Service Date",
                            style: TextStyle(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(children: [
                            Text(
                              "15 Okt 2022",
                              style: TextStyle(
                                  color: blackAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            IconButton(
                                onPressed: (){

                                },
                                icon: Icon(Icons.today)),



                          ])
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Service Type",
                            style: TextStyle(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Service Routines",
                            style: TextStyle(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Estimate Time",
                            style: TextStyle(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "4H 25M",
                            style: TextStyle(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tasks Executor",
                            style: TextStyle(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "John Donny",
                            style: TextStyle(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      splashColor: subText,
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {

                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "SUBMIT FORM",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }
}
