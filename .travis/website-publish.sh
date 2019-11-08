#!/usr/bin/env sh

set -e

export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION
#export DITA_OT_DEV=$(find $PWD -name 'dita-ot-*+*' -type d | head -1)
export SITE_DIR=$PWD/dita-draft-website

# Remove target output directory before generating new output
#find "$SITE_DIR/dev" -type f -delete

# Re-create /dev folder & generate site output there
#./gradlew site -PditaHome=$DITA_HOME -PoutputDir=$SITE_DIR/dev -PditaHomeSrc=$DITA_OT_DEV --info --stacktrace --no-daemon
$DITA_HOME/bin/dita -i $PWD/specification/dita-2.0-specification.ditamap -f org.dita-ot.html -o $SITE_DIR --args.html5.toc=index -v