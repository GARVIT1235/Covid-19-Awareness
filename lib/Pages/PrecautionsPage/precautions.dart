import 'package:flutter/material.dart';
import 'precautionview.dart';

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
            child: PrecautionView(),
          )
        ],
      ),
    );
  }
}

