#!/bin/bash
# ShopMax Cloud Run Deployment

gcloud run deploy shopmax-app \
  --image=us-docker.pkg.dev/cloudrun/container/hello \
  --platform=managed \
  --region=us-central1 \
  --min-instances=1 \
  --max-instances=20 \
  --concurrency=80 \
  --cpu=1 \
  --memory=512Mi \
  --allow-unauthenticated

echo "App deployed successfully!"
gcloud run services list
