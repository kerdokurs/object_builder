# Object builder

Dart object builder generator.

## Usage

### Setup

Define a class and use the `@ObjectBuilder` annotation to generate a builder.

```dart
import 'package:object_builder/object_builder_annotation.dart';

@ObjectBuilder
class SomeClass {
  String name;
  String? middleName;
  int age;

  // Builder supports both positional and named arguments
  SomeClass(this.name, this.age, {this.middleName});

  // Define a static builder method
  static $SomeClassBuilder builder() => $SomeClassBuilder();
}
```

To generate the builder, run `dart pub run build_runner build`.

If using with Flutter, run `flutter pub run build_runner build`.

### Usage

Now you can use the builder like this

```dart
int main() {
  var builder = SomeClass.builder();
  var someObject = builder
    .name('John')
    .age(42)
    .middleName('Doe')
    .build();
  // Now someObject is an instance of SomeClass with the constructed fields
}
```
