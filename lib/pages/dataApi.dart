import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class DataApi {
  // set variable for date
  final String name;
  final String flag;
  final String link;
  DataApi({required this.name , required this.flag , required this.link});

  // set variable for include in function 
   String? time;
   String? zone;
   bool? isDay;
  

  // function to get Data for Time of counrtry
  Future<void> getData(BuildContext context) async {
    try {
      // import the date time
      Response response = await get(
          Uri.parse("https://worldtimeapi.org/api/timezone/$link"));
      Map data = jsonDecode(response.body);
      // to improve hour utc from string to integer
      int utcCountry = int.parse(data["utc_offset"].toString().substring(0, 3));
      // to improve date time from string to date
      DateTime realtime = DateTime.parse(data["utc_datetime"]);
      // to add utc to date time
      DateTime countryTime = realtime.add(Duration(hours: utcCountry));
      // to improve the date to format hout:minute periode [PM - AM]
       time = DateFormat("hh:mm a").format(countryTime);
       zone = data["timezone"];
      // check if day or night
      if (realtime.hour > 5 && realtime.hour < 22) {
        isDay = true;
      } else {
        isDay = false;
      }
    } catch (e) {
      print("Error is $e");
    }
  }
}
