import 'package:flutter/material.dart';

final imgPath = "assets/images/symptoms.png";
//ignore: must_be_immutable
class SymptomsPage extends StatefulWidget {
  final Color color = Colors.redAccent;

  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
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
          //Image container
          Container(
            height: 230,
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
                  //title
                  Positioned(
                    top: constraint.maxHeight * 0.4,
                    left: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: constraint.maxWidth * 0.5,
                        child: Text(
                          "Symptoms",
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

                  //image
                  Positioned.fill(
                    bottom: -20.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 20.0),
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
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: SymptomCardGrid(),
          )
        ],
      ),
    );
  }
}

class SymptomCardGrid extends StatefulWidget {
  @override
  _SymptomCardGridState createState() => _SymptomCardGridState();
}

class _SymptomCardGridState extends State<SymptomCardGrid> {
  int selectedIndex=0;
  final List<Map<String, String>> symptoms = const [
    {
      "symptom": "Fever",
      "desc":
      "A temperature that's higher than normal.\nTypically around 98.6°F (37°C)",
      "imgPath": "assets/symptoms/high_fever.png",
    },
    {
      "symptom": "Sore Throat",
      "desc":
      "A sore throat is a painful, dry, or scratchy feeling in the throat.",
      "imgPath": "assets/symptoms/sore_throat.png",
    },
    {
      "symptom": "Dry Cough",
      "desc": "A cough that doesn't bring up mucus.",
      "imgPath": "assets/symptoms/cough.png",
    },
    {
      "symptom": "Fatigue",
      "desc":
      "You have no energy, no motivation and overall feeling of tiredeness.",
      "imgPath": "assets/symptoms/headache.png",
    },
    {
      "symptom": "Runny Nose",
      "desc": "Mucus draining or dripping from the nostril.",
      "imgPath": "assets/symptoms/high_fever.png",
    },
    {
      "symptom": "Tough Breathing",
      "desc":
      "You feel shortness of breath and a tight sensation in your chest",
      "imgPath": "assets/symptoms/sore_throat.png",
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
        itemCount: symptoms.length,
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
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 650),
                decoration: BoxDecoration(
                  color: selectedIndex==index? Colors.teal[50]:Colors.white,
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
                          "${symptoms[index]["symptom"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight*0.30,
                        child: Text(
                          "${symptoms[index]['desc']}",
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
