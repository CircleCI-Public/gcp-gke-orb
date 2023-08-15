#!/usr/bin/env bash

eval "$ORB_SCRIPT_UTILS"
check_kubectl_status || exit $?
expand_env_vars_with_prefix "ORB_EVAL_"

build_args=(
  "--dry-run=$ORB_EVAL_DRY_RUN"
)

[ -n "$ORB_EVAL_NAMESPACE" ] && build_args+=( "--namespace=$ORB_EVAL_NAMESPACE" )

set -x
# shellcheck disable=SC2048,SC2086 # We want word splitting here.
kubectl set image "$ORB_EVAL_WORKLOAD_TYPE" "$ORB_EVAL_DEPLOYMENT" "$ORB_EVAL_CONTAINER"="$ORB_EVAL_IMAGE":"$ORB_EVAL_TAG" ${build_args[*]}
set +x
