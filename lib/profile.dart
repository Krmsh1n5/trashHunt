import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:junction_project/users.dart';

class StandingsTable extends StatefulWidget {
  const StandingsTable({super.key});

  @override
  State<StandingsTable> createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable> {
  int _selectedIndex = 2;

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
        child: Expanded(
                    child: DataTable2(
                  isVerticalScrollBarVisible: true,
                  fixedTopRows: 1,
                  columns: const <DataColumn>[
                                        DataColumn2(
                        label: Text('Rank',
                            )),
                    DataColumn2(
                        label: Text(
                      'User Name',
                    )),
                    DataColumn2(
                        label: Text(
                      'Score',
                    )),
                  ],
                  rows: [
                    for (var user in users)
                      DataRow(
                        cells: [
                          DataCell(Text(user.rank.toString(),
                             )),
                          DataCell(
                            Text(
                              user.name
                            ),
                          ),
                          DataCell(Text(user.score.toString(),
                             )),
                        ],
                      ),
                  ],
                )),
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
