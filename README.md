# GCP: GKE Orb [![CircleCI Build Status](https://circleci.com/gh/cci-orbs/gcp-gke.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/cci-orbs/gcp-gke) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/circleci/gcp-gke)][reg-page] [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/cci-orbs/gcp-gke/master/LICENSE)

A GKE Orb for CircleCI.
It allows you to interact with Google Cloud Platform's (GCP) Google Kubernetes Engine (GKE) from within a CircleCI build job.


## Prerequisites

The following environment variables need to be set in CircleCI either directly or via a context:

- GCLOUD_SERVICE_KEY (required)
- GOOGLE_PROJECT_ID
- GOOGLE_COMPUTE_ZONE

See [CircleCI Documentation](https://circleci.com/docs/2.0/env-vars) for instructions on how you would set this up.


## Usage

Example use as well as a list of available executors, commands, and jobs are available on this orb's [registry page][reg-page].


## Resources

[CircleCI Orb Registry Page][reg-page] - The official registry page for this orb will all versions, executors, commands, and jobs described.  
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.  
[Google Cloud Platform (GCP) Docs](https://cloud.google.com/docs/) - General docs for GCP.
[GCP: Google Kubernetes Engine (GKE) Docs](https://cloud.google.com/kubernetes-engine/docs/) - GCP Docs specifically on GKE.


## Contributing
We welcome [issues](https://github.com/cci-orbs/gcp-gke/issues) to and [pull requests](https://github.com/cci-orbs/gcp-gke/pulls) against this repository!
For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).

### Publishing

New versions of this orb are published by pushing a SemVer git tag by the Community & Partner Engineering Team.



[reg-page]: https://circleci.com/orbs/registry/orb/circleci/gcp-gke
