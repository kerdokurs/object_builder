import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'src/object_builder_generator.dart';

export './src/object_builder_annotation.dart';

Builder objectBuilderGeneratorBuilder(BuilderOptions options) => SharedPartBuilder([ObjectBuilderGenerator()], "object_builder");
