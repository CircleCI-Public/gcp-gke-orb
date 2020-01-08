# Notes for Internal Contributors

The notes here are primarily targeted at internal (CircleCI) contributors to the orb but could be of reference to fork owners who wish to run the tests with their own GCP account.

## Building

### Required Project Environment Variables

The following [project environment variables](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project) must be set for the project on CircleCI via the project settings page, before the project can be built successfully.

| Variable                       | Description                      |
| -------------------------------| ---------------------------------|
| `GCLOUD_SERVICE_KEY`           | GCP service key in JSON format, for the service account named `machine`|
| `GOOGLE_COMPUTE_ZONE`          | Set as `us-central1-a`           |
| `GOOGLE_PROJECT_ID`            | Set as `gcp-gke-orb`             |

### Required Context and Context Environment Variables

The `orb-publishing` context is referenced in the build. In particular, the following [context environment variables](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-context) must be set in the `orb-publishing` context, before the project can be built successfully.

| Variable                       | Description                      |
| -------------------------------| ---------------------------------|
| `CIRCLE_TOKEN`                 | CircleCI API token used to publish the orb  |


### GCP Resource Cleanup

The tests configured in `.circleci/config.yml` should normally be able to successfully clean up the GCP resources that they use.

However, you may encounter situations where resource cleanup is not properly done (e.g. if the workflow fails for some reason after the cluster has been created but before it could be deleted).

When that happens, one option is to clean up the GCP resources manually using the CLI.

You need an authorized account in order to do so. Here is an example of using the `machine` service account in a local environment, but it should also be possible to SSH into a rerun job that performs a login. Note that the example requires the service key to be downloaded.

```
GOOGLE_PROJECT_ID=gcp-gke-orb
GOOGLE_COMPUTE_ZONE=us-central1-a
gcloud auth activate-service-account --key-file=/Users/myuser/gcp-gke-orb-machine-service-account.json
```

After login, you can delete the GCP resources as necessary. For example, these commands will completely clean up the resources used in the integration tests:

```
gcloud --quiet config set project $GOOGLE_PROJECT_ID
gcloud --quiet config set compute/zone $GOOGLE_COMPUTE_ZONE
gcloud container node-pools delete my-pool-windows --cluster my-cluster-windows --quiet
gcloud container clusters delete my-cluster-windows --quiet
gcloud container clusters delete my-cluster --quiet
```
