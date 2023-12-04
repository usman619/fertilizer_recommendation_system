import 'package:fertilizer_recommendation_system/pages/crop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Recommendations'),
            centerTitle: true,
            backgroundColor: Colors.green,
            bottom: const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                    text: 'Crop Model',
                    icon: Icon(
                      Icons.eco_sharp,
                    )),
                Tab(text: 'Fertilizer Model', icon: Icon(Icons.agriculture)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              CropModel(),
              Icon(Icons.agriculture),
            ],
          ),
        ),
      ),
    );
  }
}
