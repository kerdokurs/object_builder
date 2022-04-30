set -xe

dart run build_runner build
dart test -r expanded
