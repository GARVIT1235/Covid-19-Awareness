import 'package:covid_19_awareness/Pages/MythsPage/myths.dart';
import 'package:covid_19_awareness/Pages/PrecautionsPage/precautions.dart';
import 'package:covid_19_awareness/Pages/SlotPage/slot.dart';
import 'package:covid_19_awareness/Pages/SymptomsPage/symptoms.dart';
import 'package:covid_19_awareness/Pages/VirusDetailsPage/virus_details.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cardveiw extends StatelessWidget {
  final img, tab, Desc, height, left, bottom;
  final Color color;

  const Cardveiw(
      {this.img,
        this.tab,
        this.color,
        this.Desc,
        this.height = 150.0,
        this.left = 15.0,
        this.bottom = -8.0,
      }
      );

  @override
  Widget build(BuildContext context) {
    final X = MediaQuery
        .of(context)
        .size
        .width;
    final Y = MediaQuery
        .of(context)
        .size
        .height;
    return InkWell(
      onTap: getPage(tab, context),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        height: Y*0.2,
        child: Stack(
          children: <Widget>[
            //Title Container
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(left: 150, right: 20),
                  width: X,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color.withOpacity(0.13),
                  ),
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                          "$tab",
                          style: TextStyle(
                            color: color,
                            fontFamily: "Montserrat",
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1
                      ),
                      Text(
                        "$Desc",
                        style: TextStyle(
                          color: color,
                          fontFamily: "Montserrat",
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: left,
              bottom: bottom,
              child: Container(
                height: height,
                child: Hero(
                    tag: img, child: Image(image: AssetImage(img))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Function getPage(tabName, context) {
  switch (tabName) {
    case ("Symptoms"):
      return () => Navigator.of(context).push(MaterialPageRoute(
          builder : (context) =>
              SymptomsPage()));
    case ("Precautions"):
      return () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PrecautionsPage()));
    case ("Myths"):
      return () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MythsPage()));
    case ("Virus"):
      return () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              VirusDetailsPage()));
    case ("Slots"):
      return () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SlotPage()));
  }
  return () {};
}
