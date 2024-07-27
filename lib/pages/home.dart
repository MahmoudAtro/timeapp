import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? time;
   HomePage({super.key, this.time});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // data from loading page
    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    String Image = data["status"] ? "day.png" : "night.png";
    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/${Image}"), fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async{
                // this command to reciving data form location page
                dynamic result = await Navigator.pushNamed(context, '/location');
                // set the data in this page after he sended
                setState(() {
                  data = {
                    "status": result["status"],
                    "zone": result["zone"],
                    "time": result["time"],
                  };
                });
              },
              icon: Icon(
                Icons.edit_location,
                color: Color.fromARGB(255, 255, 129, 129),
                size: 24.0,
              ),
              label: Text(
                "Edit location",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(130, 89, 102, 223)),
                padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
              ),
            ),
            SizedBox(
              height: 300,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 33),
              width: double.infinity,
              color: const Color.fromARGB(103, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${data["time"]}",
                      style: TextStyle(color: Colors.white, fontSize: 55)),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    "${data["zone"]}",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}
