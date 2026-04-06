#!/bin/bash
# ShopMax Cloud CDN Setup

# Create storage bucket
gsutil mb -l us-central1 gs://shopmax-static-abdikanimuh
gsutil iam ch allUsers:objectViewer gs://shopmax-static-abdikanimuh

# Create index.html
cat > index.html << 'HTML'
<html>
<head><title>ShopMax</title></head>
<body style="font-family:sans-serif;text-align:center;padding:50px">
  <h1>ShopMax</h1>
  <p>Welcome to ShopMax - Powered by GCP!</p>
  <p>CDN is serving this page globally</p>
</body>
</html>
HTML

# Upload to bucket
gsutil cp index.html gs://shopmax-static-abdikanimuh/
gsutil web set -m index.html gs://shopmax-static-abdikanimuh

# Create CDN backend
gcloud compute backend-buckets create shopmax-cdn-backend \
  --gcs-bucket-name=shopmax-static-abdikanimuh \
  --enable-cdn

# Create URL map
gcloud compute url-maps create shopmax-url-map \
  --default-backend-bucket=shopmax-cdn-backend

# Create HTTP proxy
gcloud compute target-http-proxies create shopmax-http-proxy \
  --url-map=shopmax-url-map

# Create forwarding rule
gcloud compute forwarding-rules create shopmax-http-rule \
  --global \
  --target-http-proxy=shopmax-http-proxy \
  --ports=80

echo "CDN Live at: http://34.160.116.234/index.html"
