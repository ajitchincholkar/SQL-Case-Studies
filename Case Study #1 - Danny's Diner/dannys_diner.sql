-- 1. What is the total amount each customer spent at the restaurant?
SELECT 
	a.customer_id,
	SUM(b.price) AS total_spent
FROM dannys_diner.sales a
JOIN dannys_diner.menu b
ON a.product_id = b.product_id
GROUP BY 1
ORDER BY 2 DESC;

-- 2. How many days has each customer visited the restaurant?
SELECT 
	customer_id,
	COUNT(DISTINCT order_date) AS total_days
FROM dannys_diner.sales
GROUP BY 1
ORDER BY 2 DESC;

-- 3. What was the first item from the menu purchased by each customer?
WITH cte AS (
	SELECT 
		customer_id,
		product_id,
		RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS ranking
	FROM dannys_diner.sales
)
SELECT 
	customer_id,
	a.product_id,
	product_name
FROM cte a
JOIN dannys_diner.menu b
ON a.product_id = b.product_id
WHERE ranking = 1
GROUP BY 1,2,3;

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT 
	a.product_id,
	b.product_name,
	COUNT(*) AS times_ordered
FROM dannys_diner.sales a
JOIN dannys_diner.menu b
ON a.product_id = b.product_id
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 1;

-- 5. Which item was the most popular for each customer?
WITH cte AS (
	SELECT 
		customer_id,
		product_id,
		COUNT(*) AS times_ordered,
		RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(*) DESC) AS ranking
	FROM dannys_diner.sales
	GROUP BY 1,2
	ORDER BY 1, 3 DESC
)
SELECT 
	a.customer_id,
	a.product_id,
	b.product_name,
	a.times_ordered
FROM cte a
JOIN dannys_diner.menu b
ON a.product_id = b.product_id
WHERE ranking = 1
ORDER BY 1;

-- 6. Which item was purchased first by the customer after they became a member?
WITH cte AS (
	SELECT 
		a.customer_id,
		a.product_id,
		a.order_date,
		ROW_NUMBER() OVER(PARTITION BY a.customer_id ORDER BY a.order_date) AS ranking
	FROM dannys_diner.sales a
	JOIN dannys_diner.members b
	ON a.customer_id = b.customer_id
	WHERE a.order_date > b.join_date
)
SELECT 
	a.customer_id,
	a.product_id,
	b.product_name
FROM cte a
JOIN dannys_diner.menu b
ON a.product_id = b.product_id
WHERE ranking = 1
ORDER BY 1;

-- 7. Which item was purchased just before the customer became a member?
WITH cte AS (
	SELECT 
		a.customer_id,
		a.product_id,
		a.order_date,
		ROW_NUMBER() OVER(PARTITION BY a.customer_id ORDER BY a.order_date DESC) AS ranking
	FROM dannys_diner.sales a
	JOIN dannys_diner.members b
	ON a.customer_id = b.customer_id
	WHERE a.order_date < b.join_date
)
SELECT 
	a.customer_id,
	a.product_id,
	b.product_name
FROM cte a
JOIN dannys_diner.menu b
ON a.product_id = b.product_id
WHERE ranking = 1
ORDER BY 1;

-- 8. What is the total items and amount spent for each member before they became a member?
SELECT 
	a.customer_id,
	COUNT(b.product_id) AS total_items,
	SUM(c.price) AS total_spent
FROM dannys_diner.members a
JOIN dannys_diner.sales b
ON a.customer_id = b.customer_id
JOIN dannys_diner.menu c
ON b.product_id = c.product_id
WHERE b.order_date < a.join_date
GROUP BY 1;

-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
SELECT 
	a.customer_id,
	SUM(CASE WHEN c.product_name = 'sushi' THEN c.price * 20 ELSE c.price * 10 END) AS total_points
FROM dannys_diner.members a
JOIN dannys_diner.sales b
ON a.customer_id = b.customer_id
JOIN dannys_diner.menu c
ON b.product_id = c.product_id
GROUP BY 1;

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
WITH cte AS (
	SELECT
		a.customer_id,
		SUM(CASE WHEN c.product_name = 'sushi' THEN c.price * 20
			 	 WHEN b.order_date BETWEEN a.join_date AND (a.join_date + 6) THEN c.price * 20
			 	 ELSE c.price * 10
			END) AS total_points
	FROM dannys_diner.members a
	JOIN dannys_diner.sales b
	ON a.customer_id = b.customer_id
	JOIN dannys_diner.menu c
	ON b.product_id = c.product_id
	WHERE EXTRACT(MONTH FROM b.order_date) = 1
	GROUP BY 1
)
SELECT 
	customer_id,
	total_points
FROM cte
ORDER BY 1;