import 'package:carros/network/loreipsum.dart';
import 'package:carros/pages/simple_bloc.dart';

class LoripsumBloc extends SimpleBloc<String>{
static String loripsum;
  fetch() async{
    try {
      String s = loripsum  ?? await LoripsumApi.getLoripsum();
      loripsum = s;
      add(s);
    } on Exception catch (e) {
      addError(e);
      print("$e");

    }
  }
}