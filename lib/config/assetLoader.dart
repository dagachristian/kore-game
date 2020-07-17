import 'dart:convert';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

class CustomAssetLoader extends RootBundleAssetLoader {
  const CustomAssetLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    var loaded = await super.load(path, locale);
    return customDecode(json.encode(loaded));
  }

  String jsonRecurse(Map<String, dynamic> json, String element) {
    if (!element.contains('.')) {
      return json[element];
    }
    List<String> elements = element.split('.');
    json = json[elements[0]];
    elements.map((e) => e + '.');
    element = elements.sublist(1).toString();
    element = element.substring(1, element.length-1);
    return jsonRecurse(json, element);
  }

  Map<String, dynamic> customDecode(String jsonString) {
    Map<String, dynamic> decodedJson = json.decode(jsonString);
    int i1 = jsonString.indexOf('{(');
    int i2 = jsonString.indexOf(')}');
    while (i1 + i2 >= 2) {
      jsonString = jsonString.replaceRange(i1, i2+2, jsonRecurse(decodedJson, jsonString.substring(i1+2, i2)));
      i1 = jsonString.indexOf('{(');
      i2 = jsonString.indexOf(')}');
    }
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}