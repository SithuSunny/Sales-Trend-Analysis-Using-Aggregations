
#  Sales Trend Analysis Using Aggregations

###  Objective
Analyze monthly revenue and order volume using SQL, and identify the top-performing months by sales. This task strengthens skills in SQL aggregation, date functions, and trend analysis.

---

##  Tools Used
- PostgreSQL (via Valentina Studio)
- CSV dataset (`sales.csv`)
- SQL Editor

---

##  Dataset Info
The dataset simulates an online sales table named `sales` with the following important columns:
- `order_id` (used for unique order count)
- `order_date` (used for month/year extraction)
- `total` (used as `amount` for revenue)
- `sku` (used as `product_id`)

---

##  SQL Tasks Completed

###  Monthly Revenue & Order Volume (Filtered to 2020)
```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    sales
WHERE
    order_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;
```

###  Monthly Revenue & Order Volume (All Time Data)
```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;
```

###  Top 3 Months by Total Revenue
```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    total_revenue DESC
LIMIT 3;
```

---

##  Deliverables

| File | Description |
|------|-------------|
| `sales_trend_analysis.sql` | SQL script containing all 3 queries |
| `monthly_revenue_volume_2020.csv` | Output of 2020-specific monthly trend |
| `monthly_revenue_alltime.csv` | Output showing all-time monthly trend |
| `top_3_months_by_sales.csv` | Output showing top 3 months by revenue |
| `README.md` | This documentation file |
|sales.csv| Sales data|

---

## ✅ Outcome
This task demonstrates how to derive time-based insights from raw transactional data using SQL — a key skill for any data analyst. Both filtered and full-range insights are provided to show flexibility in reporting.
