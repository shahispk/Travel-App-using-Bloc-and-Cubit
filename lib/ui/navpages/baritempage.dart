import 'package:flutter/material.dart';

import '../../widgets/boldtext.dart';

class baritempage extends StatefulWidget {
  const baritempage({super.key});

  @override
  State<baritempage> createState() => _baritempageState();
}

class _baritempageState extends State<baritempage> {
  var image = {
    "Balloning.jpg": "Balloning",
    "Hiking.jpg": "Hiking",
    "kayaking.jpg": "Kayaking",
    "snorkling.jpg": "Snorkling",
    "skydriving.jpg": "Sky diving",
    "bungee.jpg": "Bungee Jumping",
    "waterrafting.jpg": "White-Water Rafting"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: boldtext(text: "List of items"),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          width: 400,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "images/" + image.keys.elementAt(index)),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            child: Text(
                          image.values.elementAt(index),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
