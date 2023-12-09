# This shell script will create the required services/objects in gcp as the initialisation of a new project
# This script is for manual testing, in the future, the services and objects will be created using Terraform

set -e

# Setting variables
PROJECT_ID=xxx
REGION=xxx
BQ_LOCATION=xxx
USE_CASE_NAME=xxx
GCS_BUCKET_NAME_PREFIX=$PROJECT_ID
GAR_REPO_NAME=docker-registry
SERVICE_ACCOUNT=xxx@$PROJECT_ID.iam.gserviceaccount.com


# Set default project and region
gcloud config set project $PROJECT_ID
gcloud config set compute/region $REGION

# Enabling the APIs
gcloud services enable bigquery.googleapis.com
gcloud services enable aiplatform.googleapis.com
gcloud services enable notebooks.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable ml.googleapis.com
gcloud services enable pubsub.googleapis.com
gcloud services enable run.googleapis.com
gcloud services enable cloudscheduler.googleapis.com
gcloud services enable cloudtasks.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com

# Create Google Storage Buckets
gsutil mb -l $REGION -p $PROJECT_ID gs://$PROJECT_ID-test
gsutil mb -l $REGION -p $PROJECT_ID gs://$PROJECT_ID-pipeline
gsutil mb -l $REGION -p $PROJECT_ID gs://$PROJECT_ID-experiment

# Create Artifact Registry repo
gcloud artifacts repositories create $GAR_REPO_NAME --location=$REGION --repository-format=docker

# Create BigQuery Datasets
bq mk --location=$BQ_LOCATION input_dataset
bq mk --location=$BQ_LOCATION staging_dataset
bq mk --location=$BQ_LOCATION output_dataset
bq mk --location=$BQ_LOCATION operational_dataset

# Create Pub/Sub Topics