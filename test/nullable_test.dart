import 'package:object_builder/object_builder_annotation.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

part 'nullable_test.g.dart';

@ObjectBuilder()
class NullableWithPositionalArgument {
  String? a;

  NullableWithPositionalArgument(this.a);

  static $NullableWithPositionalArgumentBuilder builder() =>
      $NullableWithPositionalArgumentBuilder();
}

@ObjectBuilder()
class NullableWithNamedArgument {
  String? a;

  NullableWithNamedArgument({this.a});

  static $NullableWithNamedArgumentBuilder builder() =>
      $NullableWithNamedArgumentBuilder();
}

@ObjectBuilder()
class NullableNoConstructorArgument {
  String? a;

  NullableNoConstructorArgument();

  static $NullableNoConstructorArgumentBuilder builder() =>
      $NullableNoConstructorArgumentBuilder();
}

@ObjectBuilder()
class NullableNoConstructorArgumentWithPositionalArgument {
  String? a;
  String? b;

  NullableNoConstructorArgumentWithPositionalArgument(this.a);

  static $NullableNoConstructorArgumentWithPositionalArgumentBuilder
      builder() =>
          $NullableNoConstructorArgumentWithPositionalArgumentBuilder();
}

void main() {
  test("Test nullable variable as positional constructor argument with value",
      () {
    var builder = NullableWithPositionalArgument.builder();
    var obj = builder.a("a").build();
    expect("a", obj.a);
  });

  test(
      "Test nullable variable as positional constructor argument without value",
      () {
    var builder = NullableWithPositionalArgument.builder();
    var obj = builder.build();
    expect(null, obj.a);
  });

  test("Test nullable variable as named constructor argument with value", () {
    var builder = NullableWithNamedArgument.builder();
    var obj = builder.a("a").build();
    expect("a", obj.a);
  });

  test("Test nullable variable as named constructor argument without value",
      () {
    var builder = NullableWithNamedArgument.builder();
    var obj = builder.build();
    expect(null, obj.a);
  });

  test("Test nullable variable as no constructor argument with value", () {
    var builder = NullableNoConstructorArgument.builder();
    var obj = builder.a("a").build();
    expect("a", obj.a);
  });

  test("Test nullable variable as no constructor argument without value", () {
    var builder = NullableNoConstructorArgument.builder();
    var obj = builder.build();
    expect(null, obj.a);
  });

  test(
      "Test nullable variable as no constructor argument with positional argument with values",
      () {
    var builder = NullableNoConstructorArgumentWithPositionalArgument.builder();
    var obj = builder.a("a").b("b").build();
    expect("a", obj.a);
    expect("b", obj.b);
  });

  test(
      "Test nullable variable as no constructor argument with positional argument without values",
      () {
    var builder = NullableNoConstructorArgumentWithPositionalArgument.builder();
    var obj = builder.build();
    expect(null, obj.a);
    expect(null, obj.b);
  });

  test(
      "Test nullable variable as no constructor argument with positional argument with one value",
      () {
    var builder = NullableNoConstructorArgumentWithPositionalArgument.builder();
    var obj = builder.b("b").build();
    expect(null, obj.a);
    expect("b", obj.b);

    builder = NullableNoConstructorArgumentWithPositionalArgument.builder();
    obj = builder.a("a").build();
    expect("a", obj.a);
    expect(null, obj.b);
  });
}
