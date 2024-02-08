import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remainder/ui/detail_pages/cubit/store_page_info_states.dart';

class storepageinfocubits extends Cubit<List<storepageinfostates>> {
  storepageinfocubits() : super([]);
 // Color? color = Color.fromARGB(255, 88, 48, 134);

  addpageinfo(String? name, int? index,Color?color) {
    emit([storepageinfostates(name: name, index: index), ...state]);
  }

  updatepageinfo(String? name, int? index,Color?color) {
    var mylist = state;
    for (int i = 0; i < mylist.length; i++) {
      if (mylist[i].name == name) {
        state.removeAt(i);
      }
    }

    emit([
      storepageinfostates(name: name, index: index, color: color),
      ...state
    ]);
  }

  updatepagewish(String? name, int? index, Color? color) {
    var mylist = state;
    for (int i = 0; i < mylist.length; i++) {
      if (mylist[i].name == name) {
        var rem = state.removeAt(i);
      }
    }

    //color = changedcolor;

    emit([
      storepageinfostates(name: name, index: index, color: color),
      ...state
    ]);
  }
}
