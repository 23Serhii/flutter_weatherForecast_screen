// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';

void main() => runApp(const WeatherForecastApp());

class WeatherForecastApp extends StatelessWidget {
  const WeatherForecastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        body: _buildBody(),
        appBar: AppBar(
          title: const Text("Weather Forecast"),
          centerTitle: true,
        ),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        SafeArea(
          child: Column(
            children: [
              _searchBar(),
              _cityDetail(),
              const SizedBox(
                height: 45,
              ),
              _temperatureDetail(),
              const SizedBox(
                height: 45,
              ),
              _extraWeatherDetail(),
              const SizedBox(
                height: 50,
              ),
              _sevenDayWeatherForecast(),
            ],
          ),
        ),
      ],
    ),
  );
}

Row _searchBar() {
  return const Row(
    children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: OutlineInputBorder(),
            hintText: 'Enter city name',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

Column _cityDetail() {
  return const Column(
    children: [
      Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'Zolotonosha, UA',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Friday, Mar 20, 2020',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    ],
  );
}

Row _temperatureDetail() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wb_sunny,
        color: Colors.white,
        size: 100,
      ),
      SizedBox(
        width: 30,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '14 *F',
            style: TextStyle(color: Colors.white, fontSize: 75),
          ),
          Text(
            'LIGHT SNOW',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ],
      )
    ],
  );
}

Row _extraWeatherDetail() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(Icons.snowing, color: Colors.white, size: 50),
          Text(
            '5',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'km/hr',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      Column(
        children: [
          Icon(Icons.snowing, color: Colors.white, size: 50),
          Text(
            '5',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'km/hr',
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
      Column(
        children: [
          Icon(Icons.snowing, color: Colors.white, size: 50),
          Text(
            '5',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            'km/hr',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ],
  );
}

Column _sevenDayWeatherForecast() {
  return const Column(
    children: [
      Text(
        '7-DAY WEATHER FORECAST',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      SevenDaysListView(),
    ],
  );
}

class SevenDaysListView extends StatelessWidget {
  const SevenDaysListView({super.key});

  @override
  Widget build(BuildContext context) {
    return _sevenDaysListView();
  }
}

Widget _sevenDaysListView() {
  return SizedBox(
    height: 120,
    child: ListView(
      padding: const EdgeInsets.all(5),
      scrollDirection: Axis.horizontal,
      itemExtent: 190,
      shrinkWrap: true,
      children: [
        _dayOfWeekWithInfo(dayOfWeek: "Monday"),
        _dayOfWeekWithInfo(dayOfWeek: "Tuesday"),
        _dayOfWeekWithInfo(dayOfWeek: "Wednesday"),
        _dayOfWeekWithInfo(dayOfWeek: "Thursday"),
        _dayOfWeekWithInfo(dayOfWeek: "Friday"),
        _dayOfWeekWithInfo(dayOfWeek: "Saturday"),
        _dayOfWeekWithInfo(dayOfWeek: "Sunday")
      ],
    ),
  );
}

Card _dayOfWeekWithInfo({required String dayOfWeek}) {
  return Card(
    margin: EdgeInsets.all(6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
    ),
    color: Colors.grey.shade300.withOpacity(0.45),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dayOfWeek,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '6 *F',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            Icon(Icons.sunny, color: Colors.white, size: 45),
          ],
        ),
      ],
    ),
  );
}
