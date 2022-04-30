import 'package:object_builder/object_builder_annotation.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

part 'non_nullable_test.g.dart';

@ObjectBuilder()
class NonNullableWithPositionalArgument {
  String a;

  NonNullableWithPositionalArgument(this.a);

  static $NonNullableWithPositionalArgumentBuilder builder() =>
      $NonNullableWithPositionalArgumentBuilder();
}

void main() {
  test(
      "Test non-nullable variable as positional constructor argument with value",
      () {
    var builder = NonNullableWithPositionalArgument.builder();
    var test2 = builder.a("a").build();
    expect("a", test2.a);
  });

  test(
      "Test non-nullable variable as positional constructor argument without value",
      () {
    var builder = NonNullableWithPositionalArgument.builder();
    expect(() {
      builder.build();
    }, throwsA(isA<AssertionError>()));
  });
}
