<h2>Introduction</h2>
<p>Danny seriously loves Japanese food, so in the beginning of 2021, he decided to embark upon a risky venture and open up a cute little restaurant that sells his three favorite foods: sushi, curry, and ramen.</p>

<p>Danny's Diner is in need of your assistance to help the restaurant stay afloat. Although they have captured some basic data from their few months of operation, they have no idea how to utilize this data to improve their business.</p>

<h2>Problem Statement</h2>

<p>Danny wants to use the data to answer a few simple questions about his customers' visiting patterns, expenditure, and favorite menu items. By gaining deeper insights into his customers, he aims to deliver a better and more personalized experience for his loyal patrons.</p>

<p>In addition, Danny plans to use these insights to decide whether to expand the existing customer loyalty program. He also requires help in generating basic datasets for easy data inspection by his team, without the need for SQL.</p>

<h2>Example Datasets</h2>

<p>Danny has shared three key datasets for this case study:</p>

<h3>Table 1: sales</h3>

<p>The sales table captures all customer-level purchases, along with the corresponding order dates and product IDs for the menu items ordered.</p>

<table>
  <tr>
    <th>customer_id</th>
    <th>order_date</th>
    <th>product_id</th>
  </tr>
  <tr>
    <td>A</td>
    <td>2021-01-01</td>
    <td>1</td>
  </tr>
  <tr>
    <td>A</td>
    <td>2021-01-01</td>
    <td>2</td>
  </tr>
  <tr>
    <td>A</td>
    <td>2021-01-07</td>
    <td>2</td>
  </tr>
  <tr>
    <td>A</td>
    <td>2021-01-10</td>
    <td>3</td>
  </tr>
  <tr>
    <td>A</td>
    <td>2021-01-11</td>
    <td>3</td>
  </tr>
  <tr>
    <td>A</td>
    <td>2021-01-11</td>
    <td>3</td>
  </tr>
  <tr>
    <td>B</td>
    <td>2021-01-01</td>
    <td>2</td>
  </tr>
  <tr>
    <td>B</td>
    <td>2021-01-02</td>
    <td>2</td>
  </tr>
  <tr>
    <td>B</td>
    <td>2021-01-04</td>
    <td>1</td>
  </tr>
  <tr>
    <td>B</td>
    <td>2021-01-11</td>
    <td>1</td>
  </tr>
  <tr>
    <td>B</td>
    <td>2021-01-16</td>
    <td>3</td>
  </tr>
  <tr>
    <td>B</td>
    <td>2021-02-01</td>
    <td>3</td>
  </tr>
  <tr>
    <td>C</td>
    <td>2021-01-01</td>
    <td>3</td>
  </tr>
  <tr>
    <td>C</td>
    <td>2021-01-01</td>
    <td>3</td>
  </tr>
  <tr>
    <td>C</td>
    <td>2021-01-07</td>
    <td>3</td>
  </tr>
</table>

<h3>Table 2: menu</h3>

<p>The menu table maps the product ID to the actual product name and price of each menu item.</p>

<table>
  <tr>
    <th>product_id</th>
    <th>product_name</th>
    <th>price</th>
  </tr>
  <tr>
    <td>1</td>
    <td>sushi</td>
    <td>10</td>
  </tr>
  <tr>
    <td>2</td>
    <td>curry</td>
    <td>15</td>
  </tr>
  <tr>
    <td>3</td>
    <td>ramen</td>
    <td>12</td>
  </tr>
</table>

<h3>Table 3: members</h3>

<p>The members table captures the join date when a customer joined the beta version of the Danny's Diner loyalty program.</p>

<table>
  <tr>
    <th>customer_id</th>
    <th>join_date</th>
  </tr>
  <tr>
    <td>A</td>
    <td>2021-01-07</td>
  </tr>
  <tr>
    <td>B</td>
    <td>2021-01-09</td>
  </tr>
</table>

<h2>Case Study Questions</h2>

<p>Each of the following case study questions can be answered using a single SQL statement:</p>

<ol>
  <li>What is the total amount each customer spent at the restaurant?</li>
  <li>How many days has each customer visited the restaurant?</li>
  <li>What was the first item from the menu purchased by each customer?</li>
  <li>What is the most purchased item on the menu and how many times was it purchased by all customers?</li>
  <li>Which item was the most popular for each customer?</li>
  <li>Which item was purchased first by the customer after they became a member?</li>
  <li>Which item was purchased just before the customer became a member?</li>
  <li>What is the total number of items and amount spent for each member before they became a member?</li>
  <li>If each $1 spent equates to 10 points and sushi has a 2x points multiplier, how many points would each customer have?</li>
  <li>In the first week after a customer joins the program (including their join date), they earn 2x points on all items, not just sushi. How many points do customer A and B have at the end of January?</li>
</ol>
