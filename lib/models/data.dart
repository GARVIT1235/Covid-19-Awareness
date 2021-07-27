import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  final List slots;
  Data({Key key, this.slots}) : super(key: key);
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Available Slots'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: widget.slots.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              color: Colors.purple.withOpacity(0.13),
              height: MediaQuery.of(context).size.height*0.3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Center ID -' +
                          widget.slots[index]['center_id'].toString(),
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      'Center Name - ' + widget.slots[index]['name'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.deepPurple),
                    ),
                    Text(
                      'Center Address - ' +
                          widget.slots[index]['address'].toString(),
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Divider(),
                    Text(
                      'Vaccine Name - ' +
                          widget.slots[index]['vaccine'].toString(),
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Divider(),
                    Text(
                      'Slots - ' + widget.slots[index]['slots'].toString(),
                      style: TextStyle(color: Colors.deepPurple),
                      softWrap: true,
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
