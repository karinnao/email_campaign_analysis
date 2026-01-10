# email_campaign_analysis
## Data Structure
###Tables :  
```account                Key columns: `id`, `is_verified`, `is_unsubscribed`  
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

