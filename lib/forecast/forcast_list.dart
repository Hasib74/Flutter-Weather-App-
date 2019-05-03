import 'package:flutter/material.dart';
import 'package:weather_app/forecast/radio_list.dart';


final RadialListViewModel forecastRadialList = new RadialListViewModel(
  items: [
    new RadialListItemViewModel(
      icon: new AssetImage('img/storm.png'),
      title: '11:30',
      subtitle: 'Light Rain',
      isSelected: true,
    ),
    new RadialListItemViewModel(
      icon: new AssetImage('img/summer.png'),
      title: '12:30P',
      subtitle: 'Light Rain',
    ),
    new RadialListItemViewModel(
      icon: new AssetImage('img/summer.png'),
      title: '1:30P',
      subtitle: 'Cloudy',
    ),
    new RadialListItemViewModel(
      icon: new AssetImage('img/summer.png'),
      title: '2:30P',
      subtitle: 'Sunny',
    ),
    new RadialListItemViewModel(
      icon: new AssetImage('img/summer.png'),
      title: '3:30P',
      subtitle: 'Sunny',
    ),
  ],
);


