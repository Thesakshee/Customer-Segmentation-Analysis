WITH Customer_RFM AS (
    SELECT 
        Customer_ID,
        MAX(Order_Date) as Last_Purchase,
        COUNT(Order_ID) as Frequency,
        SUM(Sales_Amount) as Total_Spent
    FROM orders
    GROUP BY Customer_ID
)
SELECT *,
    CASE 
        WHEN Total_Spent > 5000 AND Frequency > 10 THEN 'VIP/Loyal'
        WHEN Total_Spent > 1000 AND Frequency > 5 THEN 'Regular'
        WHEN Total_Spent < 500 THEN 'At Risk/Churn'
        ELSE 'New/Occasional'
    END AS Customer_Segment
FROM Customer_RFM;
