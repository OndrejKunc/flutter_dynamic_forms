import 'package:dynamic_forms/dynamic_forms.dart';

class CustomFormManager extends XmlFormManager {
  Future<void> sendDataToServer() async {
    var properties = getFormProperties();
    print('Simulating server communication...');
    await Future.delayed(Duration(milliseconds: 200));
    for (var property in properties) {
      print("${property.id} ${property.property} ${property.value}");
    }
  }
}
