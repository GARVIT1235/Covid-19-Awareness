import 'dart:convert';
import 'package:covid_19_awareness/models/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ByPinCode extends StatefulWidget {
  @override
  _ByPinCodeState createState() => _ByPinCodeState();
}

class _ByPinCodeState extends State<ByPinCode> {
  TextEditingController pin = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController nvaccine = TextEditingController();
  List slots = [];
  final _formKey = GlobalKey<FormState>();


   FetchData() async {
    await http.get(Uri.parse(
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' + pin.text +
            '&date=' + date.text)).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
      });
      if(slots.isEmpty || slots == null)
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Comming Soon',style: TextStyle(
            color: Colors.deepPurple,fontWeight: FontWeight.bold
        ))));
      else
        Navigator.push(context, MaterialPageRoute(builder: (context) => Data(slots: slots)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.4,
                child: Image.asset('assets/images/covid 19.jpeg',
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                    height:MediaQuery.of(context).size.height*0.4,
                    child: Image.asset(
                        'assets/images/logo.png'
                    ),
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      controller: pin,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter PinCode';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: InputDecoration(hintText: 'Enter PIN Code'),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height *0.01),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          child: TextFormField(
                            controller: date,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Date';
                              }
                              return null;
                            },
                            decoration: InputDecoration(hintText: 'Enter Date'),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: Container(
                              height: 60,
                              child: TextFormField(
                                controller: nvaccine,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter number';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(hintText: 'Number of vaccines needed'),
                              )
                          ))
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05, bottom: MediaQuery.of(context).size.height*0.02),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState.validate())
                              FetchData();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 2)
                              ),
                              child: Text("Find Slots",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                          ),
                        ),
                      )
                  ),
                ]),
              ),
            ),
          ],
        )
    );
  }
}