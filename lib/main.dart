import 'dart:math';
import 'package:flutter/material.dart';
import 'package:junction_project/map.dart';
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
        fontFamily: 'Now', // Set the default font
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'Now', fontSize: 57, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              fontFamily: 'Now', fontSize: 45, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(
              fontFamily: 'Now', fontSize: 36, fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(
              fontFamily: 'Now', fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              fontFamily: 'Now', fontSize: 28, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(
              fontFamily: 'Now', fontSize: 24, fontWeight: FontWeight.w600),
          titleLarge: TextStyle(
              fontFamily: 'Now', fontSize: 22, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              fontFamily: 'Now', fontSize: 16, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(
              fontFamily: 'Now', fontSize: 14, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              fontFamily: 'Now', fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(
              fontFamily: 'Now', fontSize: 14, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(
              fontFamily: 'Now', fontSize: 12, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(
              fontFamily: 'Now', fontSize: 14, fontWeight: FontWeight.w600),
          labelMedium: TextStyle(
              fontFamily: 'Now', fontSize: 12, fontWeight: FontWeight.w500),
          labelSmall: TextStyle(
              fontFamily: 'Now', fontSize: 11, fontWeight: FontWeight.w400),
        ),
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        elevation: 2,
        centerTitle: true,

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
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensures the bar stays compact
        showUnselectedLabels:
            false, // Keeps it clean by only showing selected labels
      ),
    );
  }
}
