# email_campaign_analysis

#### Project Dashboard: (https://public.tableau.com/views/email_analysis_dashboard/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
 
## Data Structure
```
Tables :

account                Key columns: `id`, `is_verified`, `is_unsubscribed`  
account_session        Shows which users participated in which sessions. Key columns: `account_id`, `ga_session_id`    
email_open             Tracks when users open emails and the type of email opened. Key columns: `open_date`, `letter_type`, `id_message`, `id_account`  
email_sent             Key columns: `sent_date`, `letter_type`, `id_message`, `id_account`  
email_visit            Tracks when users click links in emails, recording the visit date and email type. Key columns: `visit_date`, `letter_type`, `id_message`, `id_account`  
event_params           Stores event information for sessions. Key columns: `event_date`, `ga_session_id`, `event_timestamp`, `event_name`, `event_params`  
order                  Stores information about user purchases.Key columns: `ga_session_id`, `item_id`  
paid_search_cost       Contains data on paid search marketing expenses by date. Key columns: `date`, `cost`  
product                Key columns: `item_id`, `name`, `category`, `price`, `short_description`  
revenue_predict        Predicted revenue values by date.Key columns: `date`, `predict`  
session                Key columns: `ga_session_id`, `date`  
session_params         Key columns: `ga_session_id`, `device`, `operating_system`, `browser`, `country`, `channel`, `medium`, `language````


 Project Overview

The goal of this project is to collect and analyze data related to user account creation and email campaign activity.
A single SQL query was developed to create a unified analytical dataset combining account-level and email-level data.
The analysis covers key email activity metrics, including sent emails, opens, and link visits, as well as account creation metrics.
All metrics are calculated across consistent dimensions such as date, country, email send interval, account verification status, and subscription status.
This approach enables meaningful segmentation of users and comparison of engagement patterns across different markets.
Additionally, country-level totals and rankings are calculated to identify the most active and strategically important regions.
The resulting dataset is used to build an interactive dashboard, allowing exploration of time-based trends, country rankings, and user engagement behavior to support data-driven email marketing decisions.

 **Key Insights**

1. Strong Top-of-Funnel Performance
The campaign demonstrates strong top-of-funnel effectiveness, with an open rate of 35.51%, indicating solid subject line performance and overall brand engagement across key markets

2. Conversion Gap Identified
A significant drop-off is observed between the “open” and “visit” stages. While user interest is high, the visit rate of 3.91% suggests friction in conversion, likely due to suboptimal call-to-action (CTA) design or landing page alignment

3. High-Performing Markets
The United Kingdom stands out as the most efficient market, achieving a 13.83% Click-to-Open Rate (CTOR), indicating strong content relevance and effective user targeting

4. Volume vs Engagement Trade-off
The United States leads in total account volume but shows average engagement levels compared to smaller markets. In contrast, countries like China (41.22% open rate) and the United Kingdom (4.65% CTR) demonstrate deeper user engagement despite lower volumes

5. Growth Opportunities in Emerging Markets
India, as the second-largest market by account volume, shows moderate engagement levels, making it a strong candidate for targeted optimization strategies to improve conversion rates

6. Signs of Market Saturation
In the United States, increased messaging frequency did not lead to proportional growth in account acquisition, suggesting potential subscriber fatigue and the need for more personalized or less frequent communication strategies

7. Efficient Growth in EMEA Markets
Markets such as Germany, France, and Italy demonstrate stable and efficient growth with relatively lower messaging volume, indicating strong ROI and effective audience targeting
