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

  final List<Widget> rankingContainers = users.map((user) {
    return RankingContainer(
      rank: user.rank,
      name: user.name,
      score: user.score,
      profileImageUrl: user.imageUrl,
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      children: rankingContainers,
    ));
  }
}
