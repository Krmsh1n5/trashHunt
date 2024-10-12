import 'package:flutter/material.dart';
import 'dart:math';

class TrashReportPageView extends StatelessWidget {
  const TrashReportPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trash Report'),
      ),
      body: PageView(
        children: [
          TrashReportPage(
            path: 'assets/images/1.jpg', // Placeholder image URL
            reportId: random.nextInt(10000).toString(),
            reportDate: '2024-10-12',
            sections: const [
              TrashInfoSection(icon: Icons.delete, text: 'Size: Large'),
              TrashInfoSection(icon: Icons.recycling, text: 'Type: Plastic'),
              TrashInfoSection(icon: Icons.public, text: 'Type: Metal'),
            ],
          ),
        ],
      ),
    );
  }
}

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
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          section.text,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Icon(
                          section.icon,
                          size: 32,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
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
