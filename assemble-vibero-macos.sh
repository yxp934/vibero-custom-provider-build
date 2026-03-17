#!/usr/bin/env bash
set -euo pipefail

base="Vibero-macOS-custom-provider-20260317.zip"
expected_sha="640a7e59f657131981b15582f5a7f62dd817d95cc4a90fa6629d6c7e82a95ff5"

parts=( "${base}.part-"* )
if [[ ! -e "${parts[0]}" ]]; then
  echo "No split parts found for ${base}" >&2
  exit 1
fi

cat "${base}.part-"* > "${base}"

actual_sha="$(shasum -a 256 "${base}" | awk '{print $1}')"
if [[ "${actual_sha}" != "${expected_sha}" ]]; then
  echo "SHA-256 mismatch for ${base}" >&2
  echo "Expected: ${expected_sha}" >&2
  echo "Actual:   ${actual_sha}" >&2
  exit 1
fi

echo "Reassembled ${base}"
echo "SHA-256 verified: ${actual_sha}"
