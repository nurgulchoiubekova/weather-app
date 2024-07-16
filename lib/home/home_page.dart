import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/components/custom_drawer_button.dart';
import 'package:flutter_weather_app/components/degree_widget.dart';
import 'package:flutter_weather_app/components/place_and_date_widget.dart';
import 'package:flutter_weather_app/components/scaffold_gradient.dart';
import 'package:flutter_weather_app/components/search_icon_button.dart';
import 'package:flutter_weather_app/components/weather_info.dart';
import 'package:flutter_weather_app/components/weather_tab.dart';
import 'package:flutter_weather_app/models/weather_data.dart';
import 'package:flutter_weather_app/theme/app_text_styles.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart';

//https://www.weatherapi.com/docs/conditions.json

const apiKey = 'cbecf1250e8c4e00ad9184321241507';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  final apiPath = 'https://api.weatherapi.com/v1/current.json?key=$apiKey&q';
  bool isLoading = true;
  WeatherData? data;

  Future<void> _getData(String cityName) async {
    if (!isLoading) {
      isLoading = true;
      setState(() {});
    }
    final uri = Uri.parse('$apiPath=$cityName');
    final response = await Client().get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      data = WeatherData.fromJson(jsonData);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _getData('bishkek');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradient(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        title: Text(
          '-- Weather App --',
          style: AppTextStyles.size22w500,
        ),
        centerTitle: true,
        leading: SearchIconButton(
          onPressed: () async {
            final result = await showDialog<String>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Enter the location'),
                  content: TextField(
                    controller: _textController,
                    autofocus: true,
                    decoration: const InputDecoration(hintText: "Asia-Osh"),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text('Add'),
                      onPressed: () => Navigator.pop(
                        context,
                        _textController.text,
                      ),
                    ),
                  ],
                );
              },
            );
            _textController.clear();
            if (result != null) {
              _getData(result.trim());
            }
          },
        ),
        actions: const [
          CustomDrawerButton(),
          SizedBox(width: 10),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView(
              children: [
                PlaceAndDateWidget(
                  cityName: data?.location.name ?? '',
                  countryName: data?.location.country ?? '',
                  date: formatTime(data?.location.localtime),
                ),
                DegreeWidget(
                  iconPath:
                      'assets/weather/${_getIconName(data?.current.condition.code ?? 1000)}.svg',
                  degree: data?.current.tempC.toString() ?? '',
                  degreeStatus: data?.current.condition.text ?? '',
                ),
                WeatherInfo(
                  iconPath: 'assets/icons/rain_fall.svg',
                  title: 'RainFall',
                  value: data?.current.precipMm.toString() ?? '',
                ),
                WeatherInfo(
                  iconPath: 'assets/icons/wind.svg',
                  title: 'Wind',
                  value: '${data?.current.windKph}km/h',
                ),
                WeatherInfo(
                  iconPath: 'assets/icons/humidity.svg',
                  title: 'Humidity',
                  value: '${data?.current.humidity}64%',
                ),
                const WeatherTab(),
              ],
            ),
    );
  }

  String formatTime(String? date) {
    if (date != null) {
      final dateTime = DateFormat('yyyy-MM-dd hh:mm').parse(date);
      return DateFormat.yMMMMd().format(dateTime);
    } else {
      return '';
    }
  }

  String _getIconName(int code) {
    return switch (code) {
      1000 => 'sunny',
      1003 => 'partly_cloudy',
      1006 || 1009 => 'cloudy',
      1063 ||
      1150 ||
      1153 ||
      1180 ||
      1183 ||
      1186 ||
      1189 ||
      1192 ||
      1195 ||
      1198 ||
      1201 ||
      1240 ||
      1243 ||
      1246 =>
        'rainy',
      1066 ||
      1114 ||
      1117 ||
      1204 ||
      1207 ||
      1210 ||
      1213 ||
      1216 ||
      1219 ||
      1222 ||
      1225 ||
      1255 ||
      1258 =>
        'snowy',
      1087 || 1273 || 1276 => 'storm',
      1279 || 1282 => 'stormrain',
      1069 || 1072 || 1171 || 1237 || 1252 || 1261 || 1264 => 'sunrainy',
      _ => 'sunny',
    };
  }
}
