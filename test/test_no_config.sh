#!/bin/bash
set -e

# You can run it from any directory.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Execute common pre-setup, include test functions.
source "$DIR/common.sh"

printTestStarted

# Make sure config does not exist. 
rm -f "$CONFIG_FILE"

set +e

# Run mainframer.sh that noops to make sure that it exits with error.
bash "$REPO_DIR"/mainframer.sh 'echo noop'

if [ "$?" == "0" ]; then
	set -e
	echo "Should have failed because config does not exist."
	exit 1
fi

set -e

printTestEnded
