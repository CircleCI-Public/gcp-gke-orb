#!/usr/bin/env bash

# Import "utils.sh".
eval "$SCRIPT_UTILS"
expand_env_vars_with_prefix "ORB_PARAM_"

build_args=(
  "--dry-run=$ORB_PARAM_DRY_RUN"
)

[ -n "$ORB_PARAM_NAMESPACE" ] && build_args+=( "--namespace=$ORB_PARAM_NAMESPACE" )

set -x
# shellcheck disable=SC2048,SC2086 # We want word splitting here.
kubectl set image deployment "$ORB_PARAM_DEPLOYMENT" "$ORB_PARAM_CONTAINER"="$ORB_PARAM_IMAGE":"$ORB_PARAM_TAG" ${build_args[*]}
set +x