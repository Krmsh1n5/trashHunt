import 'package:junction_project/map.dart';
import 'package:flutter/material.dart';
import 'package:junction_project/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CH4NGE',
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

  // Removed 'const' here because Notifications() can't be constant
  static final List<Widget> _widgetOptions = <Widget>[
    const CarbonMap(),
    PageView(
      children: const [
        TrashReportPage(
          path: 'assets/images/1.jpg', // Placeholder image URL
          reportId: '12345',
          reportDate: '2024-10-12',
          sections: [
            TrashInfoSection(icon: Icons.delete, text: 'Size: Large'),
            TrashInfoSection(icon: Icons.recycling, text: 'Type: Plastic'),
            TrashInfoSection(icon: Icons.public, text: 'Type: Metal'),
          ],
        ),
      ],
    ),
  ];

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
