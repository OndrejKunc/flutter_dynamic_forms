import 'package:dynamic_forms/dynamic_forms.dart';

void main() {
  var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <form id="form1">
          <formGroup id="formgroup1">
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
          </formGroup>
      </form>''';

  var formManagerBuilder =
      FormManagerBuilder(FormParserService(getDefaultParserList()));
  FormManager formManager = formManagerBuilder.build(xml);
  var label2 = formManager.formElementMap["label2"] as Label;
  print(label2.value);
}
