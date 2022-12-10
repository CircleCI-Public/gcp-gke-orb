#!/usr/bin/env bash

eval "$ORB_SCRIPT_UTILS"
check_gcloud_status || exit $?
check_auth_plugin_status || exit $?
expand_env_vars_with_prefix "ORB_EVAL_"

# https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
if [ -z "$USE_GKE_GCLOUD_AUTH_PLUGIN" ] || [ "$USE_GKE_GCLOUD_AUTH_PLUGIN" != "False" ]; then
 export USE_GKE_GCLOUD_AUTH_PLUGIN=True
fi

set -x
# shellcheck disable=SC2086
gcloud container clusters get-credentials "$ORB_EVAL_CLUSTER" $ORB_EVAL_ADDITIONAL_ARGS
set +x
