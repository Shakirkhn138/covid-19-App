import 'package:c_virus/screen/world_state.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered, test;
   DetailScreen({   required this.image,
     required this.name,
     required this.totalCases,
     required this.totalDeaths,
     required this.totalRecovered,
     required this.active,
     required this.critical,
     required this.todayRecovered,
     required this.test,
   });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Card(
                child: Column(
                  children: [
                    ReUsableRow(value: 'Cases', title: widget.totalCases.toString()),
                    ReUsableRow(value: 'image', title: widget.image.toString()),
                    ReUsableRow(value: 'Total Deaths', title: widget.totalDeaths.toString()),
                    ReUsableRow(value: 'Total Recovered', title: widget.totalRecovered.toString()),
                    ReUsableRow(value: 'Today Recovered', title: widget.todayRecovered.toString()),
                    ReUsableRow(value: 'Active', title: widget.active.toString()),
                    ReUsableRow(value: 'Critical', title: widget.critical.toString()),
                    ReUsableRow(value: 'Test', title: widget.test.toString()),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image.toString()),
              )
            ],
          )

        ],
      ),
    );
  }
}
