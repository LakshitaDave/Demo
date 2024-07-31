import 'package:demo/screen/Charts/barchart.dart';
import 'package:demo/screen/Charts/pie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Charts/linechart.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Charts',style: TextStyle(fontSize: 30),),
            centerTitle: true,
            backgroundColor: Colors.grey,
            bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.stacked_line_chart_outlined),),
                  Tab(icon: Icon(Icons.bar_chart_outlined),),
                  Tab(icon: Icon(Icons.pie_chart_outline_outlined),),

                ]),
          ),
          body: const TabBarView(
            children: [
              lineChart(),
              barChart(),
              pieChart(),
            ],
          ),
        )
    );
  }
}
