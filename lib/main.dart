import 'package:flutter/material.dart';
import 'package:flutter_application_1/WeatherProviders/WeatherProvider.dart';
import 'package:flutter_application_1/pages/search.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: Toku(),
    ),
  );
}

class Toku extends StatefulWidget {
  const Toku({super.key});

  @override
  State<Toku> createState() => _TokuState();
}

class _TokuState extends State<Toku> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:
            Provider.of<WeatherProvider>(context).weatherData?.getColor(),
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void upDateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        elevation: .7,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return searchpage(upDateUi: upDateUi);
              }));
            },
            icon: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: weatherData == null
          ? Container(
              color: Colors.white,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Empty.",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              color:
                  Provider.of<WeatherProvider>(context).weatherData?.getColor(),
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Name Of City: ${weatherData.name}",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "Name Of Country: ${weatherData.country}",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "state: ${weatherData.state}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "temp_f: ${weatherData.temp_f}",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "temp_c: ${weatherData.temp_c}",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "id:${weatherData.tz_id}",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
// London
// Cairo
// Makassar
// Dubai