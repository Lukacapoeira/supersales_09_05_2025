# supersales_09_05_2025
# Above-Average Revenue Products in Each Group

🧠 This SQL query identifies products whose total revenue exceeds the average revenue of their respective product group.

### 🧾 Task description:
For each product group:
- Calculate revenue = SUM(item_quantity × product_price) per product
- Calculate average revenue within the group
- Return only products with revenue > average

### 💡 Used SQL techniques:
- Aggregation (`SUM`)
- Nested subqueries
- Window function `AVG(...) OVER (PARTITION BY ...)`
- Filtering via outer `WHERE` (not `HAVING`!)

### ✅ Output columns:
- product_group
- category
- product_id
- product_price
- revenue
- avg_group_revenue
