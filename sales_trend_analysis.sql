
--  Monthly Revenue & Order Volume (Filtered to 2020)


SELECT
    EXTRACT(YEAR FROM order_date) AS YEAR,
    EXTRACT(MONTH FROM order_date) AS MONTH,
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
    YEAR, MONTH;


--  Monthly Revenue & Order Volume (All Time Data)


SELECT
    EXTRACT(YEAR FROM order_date) AS YEAR,
    EXTRACT(MONTH FROM order_date) AS MONTH,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    YEAR, MONTH;


--  Top 3 Months by Total Revenue


SELECT
    EXTRACT(YEAR FROM order_date) AS YEAR,
    EXTRACT(MONTH FROM order_date) AS MONTH,
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
