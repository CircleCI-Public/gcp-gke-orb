#!/usr/bin/env bash

# Public: Expand the value from environment variables with prefix.
#
# Takes a prefix as an argument and expands the value of the environment variables
# with the prefix. The expansion is done by using the eval command.
#
# $1 - Prefix used to filter the envinronment variables.
#
# Examples
#
#   expand_env_vars_with_prefix "ORB_PARAM_"
#   expand_env_vars_with_prefix "PARAM_"
#
# Returns nothing.
expand_env_vars_with_prefix() {
  if [ "$#" -eq 0 ]; then
    printf '%s\n' "Please provide a prefix to filter the envinronment variables."
    return 1
  fi
  
  # Fetch parameters from the environment variables.
  local -r prefix="$1"
  local -r env_vars="$(printenv | grep "^$prefix")"

  if [ -z "$env_vars" ]; then
    printf '%s\n' "No environment variables found with the prefix: \"$prefix\"."
    return 1
  fi

  while IFS= read -ra line; do
    # Split the line into key and value.
    var_value="${line#*=}"
    var_name="${line%="$var_value"}"

    # Expand the value.
    expanded_value="$(eval echo "$var_value")"

    # The -v option assignes the output to a variable rather than printing it.
    printf -v "$var_name" "%s" "$expanded_value"
  done <<< "$env_vars"

  return 0
}

export CIRCLECI_BASE_DIR="${CIRCLE_WORKING_DIRECTORY/\~/$HOME}"