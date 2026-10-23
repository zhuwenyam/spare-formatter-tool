#!/usr/bin/env bash
# spare-formatter-tool — Backend developer · Rust and Actix
# 日常脚本的集中地
set -euo pipefail

collect() { grep -v '^[[:space:]]*$' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//'; }
report() { sort | uniq -c | sort -rn; echo "---"; }
main() {
  local tmp; tmp="$(mktemp)"; trap 'rm -f "$tmp"' EXIT
  cat > "$tmp"
  if [[ ! -s "$tmp" ]]; then echo "no input" >&2; exit 1; fi
  collect < "$tmp" | report
}
main
