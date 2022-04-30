import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:analyzer/dart/element/element.dart';

import '../object_builder_annotation.dart';
import 'object_builder_visitor.dart';

class ObjectBuilderGenerator extends GeneratorForAnnotation<ObjectBuilder> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    return _generateWidgetSource(element);
  }

  String _generateWidgetSource(Element element) {
    var visitor = ObjectBuilderVisitor();
    element.visitChildren(visitor);

    var buffer = StringBuffer();

    List<String> assertedFields = [];

    buffer.writeln("class \$${element.name}Builder {");
    visitor.fields.forEach((key, value) {
      var isRequired = !value.toString().endsWith("?");
      if (isRequired) {
        assertedFields.add(key);
      }

      var varType = value.toString().replaceAll("?", "") + "?";

      buffer.writeln("  $varType _$key;");

      // setter with return this
      buffer.writeln("  \$${element.name}Builder $key($varType value) {");
      buffer.writeln("    _$key = value;");
      buffer.writeln("    return this;");
      buffer.writeln("  }");
    });

    Set<String> variablesSet = {};

    buffer.writeln("  ${element.name} build() {");
    for (var field in assertedFields) {
      buffer.writeln("    assert(_$field != null);");
    }
    buffer.writeln("    return ${element.name}(");
    for (var arg in visitor.constructorArgs) {
      var paramName = arg.name;
      var isRequired = !arg.type.toString().endsWith("?");

      if (variablesSet.contains(paramName)) {
        continue;
      }
      variablesSet.add(paramName);
      if (arg.isNamed) {
        buffer
            .writeln("      $paramName: _$paramName${isRequired ? '!' : ''},");
      } else {
        buffer.writeln("      _$paramName${isRequired ? '!' : ''},");
      }
    }
    buffer.write("    )");
    visitor.fields.forEach((variable, variableType) {
      if (variablesSet.contains(variable)) {
        return;
      }
      var isRequired = !variableType.toString().endsWith("?");
      buffer.writeln("    ..$variable = _$variable${isRequired ? '!' : ''}");
    });
    buffer.writeln(";");
    buffer.writeln("  }");

    buffer.writeln("}");

    return buffer.toString();
  }
}
