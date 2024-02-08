import 'package:flutter/material.dart';

class searchpage extends StatefulWidget {
  searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  List<Map<String,dynamic>>listelements=[
    {"id":1,"name":"Balloning"},
    {"id":2,"name":"Hiking"},
    {"id":3,"name":"Kayaking"},
    {"id":4,"name":"Snorkling"},
    {"id":5,"name":"Sky Driving"},
    {"id":6,"name":"Bungee Jumping"},
    {"id":7,"name":"White Water Rafting"},
  ];
    List<Map<String,dynamic>>listelementsxx=[];
    @override
    void initState() {
      listelementsxx=listelements;
    super.initState();
  }
void runfilter(String enteredKeyword){
  List<Map<String,dynamic>>results=[];
  if(enteredKeyword.isEmpty){
    results=listelements;
  }else{
  
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    );
  }
}
