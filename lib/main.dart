import 'dart:math';

import 'package:junction_project/map.dart';
import 'package:flutter/material.dart';
import 'package:junction_project/profile.dart';
import 'package:junction_project/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sick Tree',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Random random = Random();

  // Removed 'const' here because Notifications() can't be constant
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const TrashMap(),
      TrashReportPage(
        path: 'assets/images/1.jpg', // Placeholder image URL
        reportId: random.nextInt(10000).toString(),
        reportDate: '2024-10-12',
        sections: const [
          TrashInfoSection(icon: Icons.inventory_2, text: 'Large'),
          TrashInfoSection(icon: Icons.local_drink, text: 'Plastic'),
          TrashInfoSection(icon: Icons.settings, text: 'Metal'),
        ],
      ),
      const StandingsTable()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sick Tree'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
