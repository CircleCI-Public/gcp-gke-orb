#!/usr/bin/env bash

# Import "utils.sh".
eval "$SCRIPT_UTILS"
expand_env_vars_with_prefix "ORB_PARAM_"

create_command="create"

# shellcheck disable=SC2034
[ "$ORB_PARAM_ENABLE_AUTOPILOT" -eq 1 ] && create_command="create-auto"

set -x
# shellcheck disable=SC2086 # We want to split the words.
gcloud container clusters "$create_command" "$ORB_PARAM_CLUSTER_NAME" $ORB_PARAM_ADDITIONAL_ARGS
set +x