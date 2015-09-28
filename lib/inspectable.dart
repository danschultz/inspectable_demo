library inspectable_demo.inspectable;

import 'package:reflectable/reflectable.dart';

class ReflectSubtypes extends Reflectable {
  const ReflectSubtypes() : super(declarationsCapability, instanceInvokeCapability, subtypeQuantifyCapability);
}

const _inspector = const ReflectSubtypes();

@ReflectSubtypes()
class Inspectable {
  Map<String, dynamic> inspectValues() {
    var mirror = _inspector.reflect(this);
    var valueMirrors = mirror.type.declarations.values.where((value) => value is VariableMirror);
    var valueMap = new Map.fromIterable(valueMirrors,
        key: (value) => value.simpleName,
        value: (value) => mirror.invokeGetter(value.simpleName));
    return valueMap;
  }

  String inspect() {
    return _inspectWithOptions();
  }

  String _inspectWithOptions({String indent: ""}) {
    var mirror = _inspector.reflect(this);
    var buffer = new StringBuffer();
    buffer.writeln("$indent${mirror.type.qualifiedName} {");

    inspectValues().forEach((key, value) {
      if (value is Inspectable) {
        value = value._inspectWithOptions(indent: "$indent  ").trim();
      }

      buffer.writeln("$indent  $key: $value");
    });

    buffer.writeln("$indent}");
    return buffer.toString();
  }
}
