import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/type.dart';

class ObjectBuilderVisitor extends SimpleElementVisitor {
  List<ParameterElement> _constructorArgs = [];

  final Map<String, DartType> _fields = {};

  @override
  visitConstructorElement(ConstructorElement element) {
    if (element.isFactory) {
      return;
    }

    _constructorArgs = element.parameters;
  }

  @override
  visitFieldElement(FieldElement element) {
    _fields[element.name] = element.type;
  }

  Map<String, DartType> get fields => _fields;
  List<ParameterElement> get constructorArgs => _constructorArgs;
}
