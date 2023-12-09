PROJECT_ID= xxx
REGION= xxx

gcloud config set project $PROJECT_ID

echo "\nSubmit cloud build job to build ai_stock_image_slim image"
echo "-----------------------------------------------------"
gcloud builds submit . --async --suppress-logs --region $REGION --config "scripts/docker/cloudbuild.yaml"



