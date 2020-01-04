import 'package:dynamic_forms/dynamic_forms.dart';

import 'components/container/container_parser.dart';
import 'components/label/label.dart';
import 'components/label/label_parser.dart';

void main() {
  var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <container id="container1">
        <label
          id="label1"
          value="John Doe" />
        <label
          id="label2">
          <label.value>
            <expression><![CDATA[
              "Welcome " + @label1 + "!"
            ]]></expression>
          </label.value>
        </label>
      </container>''';

  var formManagerBuilder = FormManagerBuilder(
      XmlFormParserService([ContainerParser(), LabelParser()]));
  var formManager = formManagerBuilder.build(xml);
  var label2 = formManager.formElementMap['label2'] as Label;
  print(label2.value);
}
