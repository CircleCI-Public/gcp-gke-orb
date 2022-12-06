#!/usr/bin/env sh

if [ "$ORB_VAL_ENABLE_AUTOPILOT" = "0" ]; then
    CLUSTER_CREATE_MODE="create"
else
    CLUSTER_CREATE_MODE="create-auto"
fi

# shellcheck disable=SC2086
gcloud container clusters "$CLUSTER_CREATE_MODE" "$ORB_VAL_CLUSTER_NAME" $ORB_ENV_ADDITIONAL_ARGS
