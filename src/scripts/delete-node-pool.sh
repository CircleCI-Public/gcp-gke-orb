#!/usr/bin/env bash

eval "$ORB_SCRIPT_UTILS"
check_gcloud_status || exit $?
expand_env_vars_with_prefix "ORB_EVAL_"

set -x
# shellcheck disable=SC2086
gcloud container node-pools delete "$ORB_EVAL_NODE_POOL" --cluster "$ORB_EVAL_CLUSTER" --quiet $ORB_EVAL_ADDITIONAL_ARGS
set +x
