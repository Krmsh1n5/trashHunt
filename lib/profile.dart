import 'package:junction_project/add_activity.dart';
import 'package:junction_project/add_bill.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String userName = "Kamal Ahmadov";
  final int kmDriven = 12;
  final int electricityUsage = 150;
  final int flightsTaken = 3;

  // Variable for Carbon Index (value between 1-5)
  final int myCarbonIndex = 2; // You can change this value (1-5)

  const Profile({super.key});

  // Function to determine the color based on myCarbonIndex
  Color getColorForIndex(int index) {
    if (index < myCarbonIndex) {
      // Color based on the myCarbonIndex
      if (myCarbonIndex <= 2) {
        return Colors.green; // 1-2: Green
      } else if (myCarbonIndex == 3) {
        return Colors.orange; // 3: Orange
      } else {
        return Colors.red; // 4-5: Red
      }
    }
    return Colors.grey; // Remaining squares should be grey
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username
            Text(
              'Welcome, $userName!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Carbon Index (Squares)
            Row(
              children: [
                const Text(
                  'Carbon Index',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                    width: 10), // Add some space between the text and the icons
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.square,
                      size: 30,
                      color: getColorForIndex(index),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const AddActivity(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('+ Add Activity'),
                  ),
                ),
                const SizedBox(width: 10), // Add some space between the buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const AddBill(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('+ Add Bill'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Clickable Fields
            ClickableField(
              label: "Km driven: ",
              value: "$kmDriven",
              onTap: () {
                // Navigate to the relevant view or action
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          title: "Kilometers Driven", value: "$kmDriven")),
                );
              },
            ),
            ClickableField(
              label: "Electricity usage: ",
              value: "$electricityUsage kWh",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          title: "Electricity Usage",
                          value: "$electricityUsage kWh")),
                );
              },
            ),
            ClickableField(
              label: "Flights taken: ",
              value: "$flightsTaken",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          title: "Flights Taken", value: "$flightsTaken")),
                );
              },
            ),
          ],
        ));
  }
}

class ClickableField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const ClickableField(
      {super.key,
      required this.label,
      required this.value,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String value;

  const DetailScreen({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          value,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
