#!/bin/sh
echo -ne '\033c\033]0;Midori in the Magic School\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Midori in the Magic School.arm64" "$@"
