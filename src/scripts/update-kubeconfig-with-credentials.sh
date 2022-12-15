#!/usr/bin/env bash

[ "$ORB_VAL_USE_GKE_GCLOUD_AUTH_PLUGIN" -eq 0 ] && export USE_GKE_GCLOUD_AUTH_PLUGIN=False
[ "$ORB_VAL_USE_GKE_GCLOUD_AUTH_PLUGIN" -eq 1 ] && export USE_GKE_GCLOUD_AUTH_PLUGIN=True

eval "$ORB_SCRIPT_UTILS"
expand_env_vars_with_prefix "ORB_EVAL_"
check_gcloud_status || exit $?
check_auth_plugin_status || exit $?

set -x
# shellcheck disable=SC2086
gcloud container clusters get-credentials "$ORB_EVAL_CLUSTER" $ORB_EVAL_ADDITIONAL_ARGS
set +x
