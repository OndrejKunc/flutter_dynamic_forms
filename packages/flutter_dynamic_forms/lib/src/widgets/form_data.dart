import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';

class FormData extends InheritedWidget {
  final FormManager formManager;

  FormData({
    Key key,
    @required Widget child,
    @required this.formManager,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
