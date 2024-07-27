import 'package:timeapp/pages/dataApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // class getDate for loading page
  DataApi data =
      DataApi(name: "Syria", flag: "Syria.jpeg", link: "Asia/Damascus");

  // function to wait improve the date from class
  void setupData() async {
    await data.getData(context);
    // send data to home page
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": data.time,
      "zone": data.zone,
      "status": data.isDay,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: SpinKitFadingCircle(
      color: Colors.grey,
      size: 80.0,
    ))));
  }
}
