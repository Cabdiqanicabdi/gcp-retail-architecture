#!/bin/bash
# ShopMax Pub/Sub Order Queue Setup

# Create orders topic
gcloud pubsub topics create shopmax-orders

# Create warehouse subscription
gcloud pubsub subscriptions create warehouse-sub \
  --topic=shopmax-orders \
  --ack-deadline=60 \
  --message-retention-duration=7d

# Create email subscription
gcloud pubsub subscriptions create email-sub \
  --topic=shopmax-orders \
  --ack-deadline=30

# Test by publishing an order
gcloud pubsub topics publish shopmax-orders \
  --message='{"orderId":"ORD-001","item":"Nike Air Max","qty":1,"price":150.00}'

# Pull to verify
gcloud pubsub subscriptions pull warehouse-sub \
  --auto-ack --limit=5

echo "Pub/Sub setup complete!"
gcloud pubsub topics list
gcloud pubsub subscriptions list
