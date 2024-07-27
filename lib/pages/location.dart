import 'package:flutter/material.dart';
import 'package:timeapp/pages/dataApi.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  // list of DataApi to view in location page
  List<DataApi> country = [
    DataApi(
        name: "Syria - Damascus", flag: "Syria.jpeg", link: "Asia/Damascus"),
    DataApi(name: "Phalastine - Gaza", flag: "gaza.jpeg", link: "Asia/Gaza"),
    DataApi(name: "Egypt - Cairo", flag: "egypt.png", link: "Africa/Cairo"),
    DataApi(
        name: "Algeria - Algiers", flag: "algeria.png", link: "Africa/Algiers"),
    DataApi(
        name: "Australia - Darwin",
        flag: "australia.png",
        link: "Australia/Darwin"),
    DataApi(
        name: "Morocco - ElAaiun",
        flag: "morocco.png",
        link: "Africa/El_Aaiun"),
    DataApi(name: "Tunisia - Tunis", flag: "tunisia.png", link: "Africa/Tunis"),
    DataApi(name: "Saudi - Riyadh", flag: "sa.png", link: "Asia/Riyadh"),
    DataApi(
        name: "Canada - Toronto", flag: "canada.png", link: "America/Toronto"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            // here where user pressed the back button will start getdata with index 0 of array [Country]
            DataApi back = country[0];
            await back.getData(context);
            Navigator.pop(context, {
              "time": back.time,
              "zone": back.zone,
              "status": back.isDay,
            });
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Choose Location",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        color: const Color.fromARGB(62, 0, 0, 0),
        child: ListView.builder(
            itemCount: country.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: EdgeInsets.all(7.0),
                child: Card(
                  child: ListTile(
                    onTap: () async {
                      DataApi click = country[index];
                      await click.getData(context);
                      Navigator.pop(context, {
                        "time": click.time,
                        "zone": click.zone,
                        "status": click.isDay
                      });
                    },
                    title: Text(
                      country[index].name,
                      style: TextStyle(fontSize: 22),
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${country[index].flag}'),
                    ),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
