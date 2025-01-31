#!/usr/bin/env bash
set -eo pipefail

echo "append commit messages since last release to notes"

messages=$(git log --oneline "$(git describe --tags --abbrev=0 @^)"..@)
messages=${messages//$'\n'/$'  \n'}

cat <<EOF >> "$OUTFILE"
<details>
<summary>Commits included</summary>
$messages
</details>
EOF