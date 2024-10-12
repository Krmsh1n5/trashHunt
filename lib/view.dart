import 'package:flutter/material.dart';

class TrashReportPage extends StatelessWidget {
  final String path;
  final String reportId;
  final String reportDate;
  final List<TrashInfoSection> sections;

  const TrashReportPage({
    super.key,
    required this.path,
    required this.reportId,
    required this.reportDate,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Trash Report')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              // Image with overlay
              Stack(
                children: [
                  Image.asset(
                    path,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Text(
                        'ID: $reportId | Date: $reportDate',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Update this report text
              const Text(
                'Update this report',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // CLEANED Button
              ElevatedButton(
                onPressed: () {
                  // Handle CLEANED action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'CLEANED',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),

              // STILL THERE Button
              ElevatedButton(
                onPressed: () {
                  // Handle STILL THERE action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'STILL THERE',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 32),

              // Information section title
              const Text(
                'Information',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Information sections
              Column(
                children: sections.map((section) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          section.icon,
                          size: 48, // Bigger icon size
                        ),
                        const SizedBox(
                            width: 16), // Space between icon and text
                        Text(
                          section.text,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Cleaning Events',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'No cleaning events yet',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle STILL THERE action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: const Text(
                  'ADD EVENT',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Share this report",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Send to local authorities or environmental NGOs",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle STILL THERE action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: const Text(
                  'SEND NOTIFICATION',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Report Spam",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Report this report as spam",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle STILL THERE action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: const Text(
                  'REPORT SPAM',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ));
  }
}

class TrashInfoSection {
  final IconData icon;
  final String text;

  const TrashInfoSection({
    required this.icon,
    required this.text,
  });
}
