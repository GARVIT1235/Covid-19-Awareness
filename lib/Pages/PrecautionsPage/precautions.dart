import 'package:flutter/material.dart';

final imgPath = "assets/images/prevention.png";
// ignore: must_be_immutable
class PrecautionsPage extends StatefulWidget {
  final Color color = Colors.purple;

  @override
  _PrecautionsPageState createState() => _PrecautionsPageState();
}

class _PrecautionsPageState extends State<PrecautionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: widget.color,
              size: 28,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          //image container
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
            ),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: widget.color.withOpacity(0.2)),
              width: MediaQuery.of(context).size.width,
              child: LayoutBuilder(
                builder: (ctx, constraint) => Stack(
                  children: <Widget>[
                    //Name
                    Positioned(
                      top: constraint.maxHeight * 0.4,
                      left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: constraint.maxWidth * 0.55,
                          child: Text(
                            "Precautions",
                            style: TextStyle(
                              color: widget.color,
                              fontFamily: "Montserrat",
                              fontSize: 31,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      bottom: -25.0,
                      right: -6.0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: imgPath,
                            child: Image(
                              image: AssetImage(imgPath),
                              height: constraint.maxHeight * 0.93,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: PrecautionCardGrid(),
          )
        ],
      ),
    );
  }
}

class PrecautionCardGrid extends StatefulWidget {
  @override
  _PrecautionCardGridState createState() => _PrecautionCardGridState();
}

class _PrecautionCardGridState extends State<PrecautionCardGrid> {
  int selectedIndex=0;
  final List<Map<String, String>> preventions = const [
    {
      "prevention": "Protective Mask",
      "desc":
      "Always remember to wear a protective mask when stepping out.",
      "imgPath": "assets/prevention/mask.png",
    },
    {
      "prevention": "Wash Hands",
      "desc": "Wash your hands often with soap and water and for 20 seconds atleast.",
      "imgPath": "assets/prevention/wash.png",
    },
    {
      "prevention": "Cover Cough",
      "desc": "Cough or sneeze into your elbow or cover your mouth with a disposable napkin.",
      "imgPath": "assets/prevention/coughCover.png",
    },
    {
      "prevention": "Sanitize Often",
      "desc": "Use alchohol based sanitizer if water and soap are unavailable.",
      "imgPath": "assets/prevention/sanitizer.png",
    },
    {
      "prevention": "No Face Touching",
      "desc": "Don't touch your eyes, nose or mouth often and with unwashed hands.",
      "imgPath": "assets/prevention/touch.png",
    },
    {
      "prevention": "Social Distancing",
      "desc":
      "Keep 7m distance from other people. Stay at home and avoid gatherings.",
      "imgPath": "assets/prevention/socialDistance.png",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding:
        const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 15.0,
          crossAxisCount: 2,
          childAspectRatio: 0.70,
        ),
        scrollDirection: Axis.vertical,
        itemCount: preventions.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex=index;
              });
            },
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 5,
              child: AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  color: index==selectedIndex? Colors.teal[50]:Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
                child: LayoutBuilder(
                  builder: (ctx, constraint) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image(
                        image: AssetImage(imgPath),
                        height: constraint.maxHeight * 0.46,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight * 0.1,
                        child: Text(
                            "${preventions[index]["prevention"]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight*0.30,
                        child: Text(
                          "${preventions[index]['desc']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 4,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
