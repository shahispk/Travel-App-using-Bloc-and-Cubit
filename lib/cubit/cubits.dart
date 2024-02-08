import 'package:bloc/bloc.dart';
import 'package:remainder/cubit/cubit_states.dart';
import 'package:remainder/model/datamodel.dart';
import 'package:remainder/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final Dataservices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getinfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailpage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
