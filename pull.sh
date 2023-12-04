#! /bin/bash
dir="${PWD##*/}"
dir="$((10#$dir))"
curl --cookie "session=$(cat ../cookie)" -A "github:PenguinOwl/aoc2023" https://adventofcode.com/2023/day/$dir/input > input.txt
