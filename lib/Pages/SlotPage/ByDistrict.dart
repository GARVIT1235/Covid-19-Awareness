import 'dart:convert';
import 'package:covid_19_awareness/models/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ByDistrict extends StatefulWidget {
  @override
  _ByDistrictState createState() => _ByDistrictState();
}

class _ByDistrictState extends State<ByDistrict> {
  String DDv = '623 Aligarh';
  TextEditingController date = TextEditingController();
  TextEditingController nvaccine = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List slots = [];

  FetchData() async {
    await http.get(Uri.parse(
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id='+ DDv.substring(0,3) +
            '&date=' + date.text)).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
      });
      if(slots.isEmpty || slots == null)
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Comming Soon',style: TextStyle(
          color: Colors.deepPurple,
            fontWeight: FontWeight.bold
        ),)));
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
              child: Column(children: [
                Container(
                  height:MediaQuery.of(context).size.height*0.4,
                  child: Image.asset(
                      'assets/images/logo.png'
                  ),
                ),
                Container(
                   child: DropdownButton<String>(
                          isExpanded: true,
                          value: DDv,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          underline: Container(
                          color: Colors.grey.shade400,
                          height: 2,
                          ),
                         onChanged: (String newValue) {
                         setState(() {
                               DDv = newValue;
                         });
                         },
                         items: <String>[
                           '622 Agra',
                           '623 Aligarh',
                           '625 Ambedkar Nagar',
                           '626 Amethi',
                           '627 Amroha',
                           '628 Auraiya',
                           '646 Ayodhya',
                           '629 Azamgarh',
                           '630 Badaun ',
                           '631 Baghpat ',
                           '632 Bahraich ',
                           '633 Balarampur',
                           '634 Ballia',
                           '635 Banda',
                           '636 Barabanki',
                           '637 Bareilly',
                           '638 Basti',
                           '687 Bhadohi',
                           '639 Bijnour',
                           '640 Bulandshahr',
                           '641 Chandauli',
                           '642 Chitrakoot',
                           '643 Deoria',
                           '644 Etah',
                           '645 Etawah',
                           '647 Farrukhabad',
                           '648 Fatehpur',
                           '649 Firozabad',
                           '650 Gautam Buddha Nagar',
                           '651 Ghaziabad',
                           '652 Ghazipur',
                           '653 Gonda',
                           '654 Gorakhpur',
                           '655 Hamirpur',
                           '656 Hapur',
                           '657 Hardoi',
                           '658 Hathras',
                           '659 Jalaun',
                           '660 Jaunpur',
                           '661 Jhansi',
                           '662 Kannauj',
                           '663 Kanpur Dehat',
                           '664 Kanpur Nagar',
                           '665 Kasganj',
                           '666 Kaushambi',
                           '667 Kushinagar',
                           '668 Lakhimpur Kheri',
                           '669 Lalitpur',
                           '670 Lucknow',
                           '671 Maharajganj',
                           '672 Mahoba',
                           '673 Mainpuri',
                           '674 Mathura',
                           '675 Mau',
                           '676 Meerut',
                           '677 Mirzapur',
                           '678 Moradabad',
                           '679 Muzaffarnagar',
                           '680 Pilibhit',
                           '682 Pratapgarh',
                           '624 Prayagraj',
                           '681 Raebareli',
                           '683 Rampur',
                           '684 Saharanpur',
                           '685 Sambhal',
                           '686 Sant Kabir Nagar',
                           '688 Shahjahanpur',
                           '689 Shamli',
                           '690 Shravasti',
                           '691Siddharthnagar',
                           '692 Sitapur',
                           '693 Sonbhadra',
                           '694 Sultanpur',
                           '695 Unnao',
                           '696 Varanasi'
                           ].map<DropdownMenuItem<String>>((String value) {
                             return DropdownMenuItem<String>(
                             value: value,
                             child: Text(value),
                             );
                           }).toList(),
                       )
                ),
                SizedBox(height: MediaQuery.of(context).size.height *0.01),
                Form(
                  key: _formKey,
                  child: Row(
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
                            decoration: InputDecoration(hintText: 'Enter Date(DD/MM/YYYY)'),
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
          ],
        )
    );
  }
}