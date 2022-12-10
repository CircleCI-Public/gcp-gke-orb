#!/usr/bin/env bash

eval "$ORB_SCRIPT_UTILS"
check_gcloud_status || exit $?
expand_env_vars_with_prefix "ORB_EVAL_"

create_command="create"
# shellcheck disable=SC2034
[ "$ORB_EVAL_AUTOPILOT" -eq 1 ] && create_command="create-auto"

set -x
# shellcheck disable=SC2086
gcloud container clusters "$create_command" "$ORB_EVAL_CLUSTER" $ORB_EVAL_ADDITIONAL_ARGS
set +x
