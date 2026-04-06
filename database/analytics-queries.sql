-- Revenue by region
SELECT
  region,
  COUNT(*) as total_orders,
  SUM(price * quantity) as total_revenue
FROM analytics.orders
GROUP BY region
ORDER BY total_revenue DESC;

-- Best selling products
SELECT
  item_name,
  SUM(quantity) as units_sold,
  SUM(price * quantity) as revenue
FROM analytics.orders
GROUP BY item_name
ORDER BY revenue DESC
LIMIT 5;

-- Revenue by hour
SELECT
  EXTRACT(HOUR FROM order_date) as hour,
  COUNT(*) as orders,
  SUM(price * quantity) as revenue
FROM analytics.orders
GROUP BY hour
ORDER BY hour;
