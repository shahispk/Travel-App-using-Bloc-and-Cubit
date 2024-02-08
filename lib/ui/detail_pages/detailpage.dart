import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remainder/cubit/cubit_states.dart';
import 'package:remainder/cubit/cubits.dart';
import 'package:remainder/ui/detail_pages/cubit/store_page_info_cubits.dart';
import 'package:remainder/widgets/appbuttons.dart';
import 'package:remainder/widgets/boldtext.dart';
import 'package:remainder/widgets/litetext.dart';
import 'package:remainder/widgets/responsivebutton.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int gottenstars = 4;
  int selectedindex = -1;
  Color? color = Color.fromARGB(255, 88, 48, 134);
  List imagex = ["mountain.jpg", "mountain2.jpg", "mountain3.jpg"];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      var list = BlocProvider.of<storepageinfocubits>(context).state;
      for (int i = 0; i < list.length; i++) {
        if (list[i].name == detail.place.name) {
          selectedindex = list[i].index!;
          color = list[i].color;
        }
      }

      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" +
                                  detail.place.img),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                  left: 20,
                  top: 40,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 32,
                            ),
                          color: Colors.black),
                    ],
                  )),
              Positioned(
                top: 310,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          boldtext(
                            text: detail.place.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          boldtext(
                            text: "\$" + detail.place.price.toString(),
                            color: Color.fromARGB(255, 88, 48, 134),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 88, 48, 134),
                          ),
                          SizedBox(width: 5),
                          litetext(
                            text: detail.place.location,
                            color: Color.fromARGB(255, 102, 61, 149),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: index < detail.place.stars
                                          ? Color.fromARGB(255, 203, 155, 0)
                                          : Colors.grey,
                                    )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          litetext(
                            text: "(5.0)",
                            color: Color.fromARGB(255, 102, 61, 149),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      boldtext(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      litetext(
                        text: "Number of people in your group",
                        color: Color.fromARGB(235, 50, 49, 49),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => InkWell(
                                  onTap: () {
                                    var data = state.place;
                                    var list =
                                        BlocProvider.of<storepageinfocubits>(
                                                context)
                                            .state;
                                    for (int i = 0; i < list.length; i++) {
                                      if (list[i].name == data.name) {
                                        if (list[i].index == index) {
                                          print(
                                              "we found a match ${selectedindex}");
                                        } else {
                                          print("updating info");
                                          BlocProvider.of<storepageinfocubits>(
                                                  context)
                                              .updatepageinfo(detail.place.name,
                                                  index, color);
                                          selectedindex = index;
                                        }
                                      }
                                    }
                                    if (selectedindex == -1) {
                                      print("adding pageinfo");
                                      BlocProvider.of<storepageinfocubits>(
                                              context)
                                          .addpageinfo(
                                              detail.place.name, index, color);
                                    }
                                    setState(() {
                                      selectedindex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: AppButtons(
                                      size: 50,
                                      color: selectedindex == index
                                          ? Colors.white
                                          : Colors.black,
                                      bgcolor: selectedindex == index
                                          ? Colors.black
                                          : Colors.grey,
                                      bordercolor: selectedindex == index
                                          ? Colors.black
                                          : Colors.grey,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      boldtext(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      litetext(
                        text:
                            "Travel to something by something I travel to work by train. He travelled over 1,000 miles to be at the wedding.",
                        color: Color.fromARGB(235, 50, 49, 49),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          var list =
                              BlocProvider.of<storepageinfocubits>(context)
                                  .state;
                          if (list.isEmpty) {
                            setState(() {
                              color = Colors.red;
                            });
                            BlocProvider.of<storepageinfocubits>(context)
                                .updatepagewish(
                                    detail.place.name, selectedindex, color);
                          } else {
                            for (int i = 0; i < list.length; i++) {
                              if (list[i].name == detail.place.name) {
                                if (list[i].color == Colors.red) {
                                  setState(() {
                                    color = Color.fromARGB(255, 88, 48, 134);
                                  });
                                  Future.delayed(Duration.zero, () {
                                    BlocProvider.of<storepageinfocubits>(
                                            context)
                                        .updatepagewish(detail.place.name,
                                            selectedindex, color);
                                  });
                                  return;
                                } else {
                                  setState(() {
                                    color = Colors.red;
                                  });
                                  BlocProvider.of<storepageinfocubits>(context)
                                      .updatepagewish(detail.place.name,
                                          selectedindex, color);
                                  return;
                                }
                              } else {
                                if (color == Color.fromARGB(255, 88, 48, 134)) {
                                  color = Colors.red;
                                  BlocProvider.of<storepageinfocubits>(context)
                                      .updatepagewish(detail.place.name,
                                          selectedindex, color);
                                }else{
                                  color = Color.fromARGB(255, 88, 48, 134);
                                  BlocProvider.of<storepageinfocubits>(context)
                                      .updatepagewish(detail.place.name,
                                          selectedindex, color);
                                }
                              }
                            }
                          }
                        },
                        child: AppButtons(
                          size: 60,
                          color: color!,
                          bgcolor: Colors.white,
                          bordercolor: color!,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      responsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
