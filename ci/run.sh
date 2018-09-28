#!/bin/sh

set -ex

echo "toolchain versions\n------------------"

rustc -vV
cargo -vV

cargo build --locked -v --release --target $TARGET

if [ -z "$SKIP_TESTS" ]; then
  cargo test --release -p download --target $TARGET -- --test-threads=1
  cargo test --release -p rustup-dist --target $TARGET -- --test-threads=1
  cargo test --release --target $TARGET -- --test-threads=1
fi
