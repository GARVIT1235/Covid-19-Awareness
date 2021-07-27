import 'package:flutter/material.dart';
import 'ByDistrict.dart';
import 'ByPinCode.dart';

class SlotPage extends StatefulWidget {
  @override
  _SlotPageState createState() => _SlotPageState();
}

class _SlotPageState extends State<SlotPage> {

  int _selectedIndex = 0;
  final List<Widget> _list =[
    ByPinCode(),
    ByDistrict()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.4),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: 'By PinCode',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_location_rounded),
            label: 'By District',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        backgroundColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        title: Text('Vaccination Slots'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: _list[_selectedIndex]
    );
  }
}