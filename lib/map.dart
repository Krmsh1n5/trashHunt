import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CarbonMap extends StatefulWidget {
  const CarbonMap({super.key});

  @override
  State<CarbonMap> createState() => _CarbonMapState();
}

class _CarbonMapState extends State<CarbonMap>
    with SingleTickerProviderStateMixin {
  final StreamController<void> _rebuildStream = StreamController.broadcast();
  List<LatLng> points = [];

  var index = 0;
  bool isModalOpen = false;
  String modalName = "";
  late AnimationController _animationController;

  // Updated person details to include activity type (good or bad)
  Map<String, Map<String, dynamic>> personDetails = {
    "Me": {
      "avatarUrl":
          'https://media.licdn.com/dms/image/v2/D4E03AQF0C6P-DVcaaw/profile-displayphoto-shrink_100_100/profile-displayphoto-shrink_100_100/0/1712402998257?e=1733356800&v=beta&t=oqelzWqukJaapwsESvDGEfVvA1gips9G5JSlissBHoA',
      "lastSeen": "Online",
      "carbonIndex": 3,
      "lastActivities": [
        {"label": "Preferred walking over driving", "type": "good"},
        {"label": "Used public transport", "type": "good"},
        {"label": "Ordered food delivery", "type": "bad"}
      ]
    },
    "Rena": {
      "avatarUrl":
          'https://media.licdn.com/dms/image/v2/D4E03AQFBIu9J-kB1vg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1719592835334?e=1733356800&v=beta&t=t7B52BNyOvC-KQ5XQaw8QdvO2jWZCiVnDa5tn9X3tLQ',
      "lastSeen": "Last seen 2 hours ago",
      "carbonIndex": 4,
      "lastActivities": [
        {"label": "Drove to work", "type": "bad"},
        {"label": "Recycled plastic", "type": "good"},
        {"label": "Turned off lights", "type": "good"}
      ]
    },
    "Pavel": {
      "avatarUrl":
          'https://media.licdn.com/dms/image/v2/C4E03AQGrdlO8sT78ug/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1663355766652?e=1733356800&v=beta&t=q3AUdrQxnDJk2HoSFqEGKt17xUJcoXb8tRp2hLiD1eg',
      "lastSeen": "Last seen 1 hour ago",
      "carbonIndex": 5,
      "lastActivities": [
        {"label": "Took a long flight", "type": "bad"},
        {"label": "Planted a tree", "type": "good"},
        {"label": "Rode a bike", "type": "good"}
      ]
    },
    "Suad": {
      "avatarUrl":
          "https://media.licdn.com/dms/image/v2/D4E03AQHhssvw0Qavjw/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1718277083288?e=1733356800&v=beta&t=67DF97zBi57zc0Zk9MTj5I-pj2vjRSdJupNwCJK46f8",
      "lastSeen": "Last seen 30 minutes ago",
      "carbonIndex": 2,
      "lastActivities": [
        {"label": "Walked to grocery store", "type": "good"},
        {"label": "Drove to friend's house", "type": "bad"},
        {"label": "Used reusable bags", "type": "good"}
      ]
    },
    "Sensor": {
      "carbonIndex": 3,
    }
  };

  @override
  void initState() {
    super.initState();
    _loadData();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
  }

  @override
  void dispose() {
    _rebuildStream.close();
    _animationController.dispose();
    super.dispose();
  }

  _loadData() async {
    var str = await rootBundle.loadString('assets/points.json');
    List<dynamic> result = jsonDecode(str);

    setState(() {
      points = result
          .map((e) => e as List<dynamic>)
          .map((e) => LatLng(e[0], e[1]))
          .toList();
    });
  }

  void _toggleModal(String name) {
    if (isModalOpen) {
      _animationController.reverse().then((value) {
        setState(() {
          isModalOpen = false;
          modalName = "";
        });
      });
    } else {
      setState(() {
        modalName = name;
        isModalOpen = true;
      });
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _rebuildStream.add(null);
    });

    var pointMarkers = points
        .map((e) => Marker(
              width: 60,
              height: 60,
              point: e,
              child: GestureDetector(
                onTap: () {
                  _toggleModal("aaa");
                },
                child: const Icon(
                  Icons.delete,
                ),
              ),
            ))
        .toList();

    final map = FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(40.409264, 49.867092),
        initialZoom: 11.5,
        interactionOptions: InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
      ),
      children: [
        TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png"),
        MarkerLayer(
          markers: [
            ...pointMarkers,
          ],
        )
      ],
    );

    return Center(
      child: Stack(
        children: [
          Container(child: map),
          // Animated modal appearance using Fade and Scale
          if (isModalOpen)
            GestureDetector(
              onTap: () => _toggleModal(""),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Stack(
                    children: [
                      // Fade animation for background overlay
                      AnimatedOpacity(
                        opacity: _animationController.value,
                        duration: const Duration(milliseconds: 150),
                        child: Container(
                          color: Colors.black54,
                        ),
                      ),
                      // Scale animation for modal
                      Center(
                        child: AnimatedScale(
                          scale: _animationController.value,
                          duration: const Duration(milliseconds: 150),
                          child: Container(
                            width: 250,
                            height: 400,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () => _toggleModal(""),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
