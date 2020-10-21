#!/bin/sh

wget "$MASTER_URL/jnlpJars/agent.jar" -O /agent.jar || exit $?

java -jar /agent.jar \
    -jnlpUrl "$MASTER_URL/computer/$SLAVE_NAME/slave-agent.jnlp" \
    -secret "$SLAVE_SECRET" \
    -workDir "$SLAVE_ROOT"
