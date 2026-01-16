WITH accdataa AS (
  SELECT
    ss.date AS date,
    sp.country AS country,
    acc.is_unsubscribed as is_unsubscribed,
    acc.is_verified as is_verified,
    acc.send_interval as send_interval,
    COUNT(acc.id) AS account_cnt
  FROM `data-analytics-mate.DA.account_session` AS acs
  JOIN `data-analytics-mate.DA.session` AS ss
    ON acs.ga_session_id = ss.ga_session_id
  JOIN `data-analytics-mate.DA.session_params` AS sp
    ON sp.ga_session_id = ss.ga_session_id
  JOIN `data-analytics-mate.DA.account` AS acc
    ON acc.id = acs.account_id
  GROUP BY ss.date, sp.country, acc.is_unsubscribed, acc.is_verified, acc.send_interval),
emdataa AS (
  SELECT
    DATE_ADD (ss.date, interval es.sent_date day) AS date,
    sp.country AS country,
    COUNT(distinct es.id_message) AS sent_msg,
    COUNT(distinct eo.id_message) AS open_msg,  
    COUNT(distinct ev.id_message) AS visit_msg,
    acc.is_unsubscribed as is_unsubscribed,
    acc.is_verified as is_verified,
    acc.send_interval as send_interval,
  FROM `data-analytics-mate.DA.email_sent` AS es
  JOIN `data-analytics-mate.DA.account_session` AS acs
    ON es.id_account = acs.account_id
JOIN `data-analytics-mate.DA.account` AS acc
    ON acc.id = acs.account_id
  JOIN `data-analytics-mate.DA.session` AS ss
    ON acs.ga_session_id = ss.ga_session_id
  JOIN `data-analytics-mate.DA.session_params` AS sp
    ON sp.ga_session_id = ss.ga_session_id
  LEFT JOIN `data-analytics-mate.DA.email_open` AS eo
    ON eo.id_message = es.id_message
  LEFT JOIN `data-analytics-mate.DA.email_visit` AS ev
    ON ev.id_message = es.id_message
    group by DATE_ADD (ss.date, interval es.sent_date day),sp.country, acc.is_unsubscribed, acc.is_verified, acc.send_interval),
   unionn as (
    select  
     date,
     country,
    0 AS sent_msg,
    0 AS open_msg,  
   0 AS visit_msg,
     is_unsubscribed,
    is_verified,
     send_interval,
    account_cnt
    from accdataa
    union all
    select
     date,
     country,
     sent_msg,
     open_msg,  
     visit_msg,
     is_unsubscribed,
     is_verified,
     send_interval,
    0 as account_cnt
    FROM emdataa) ,
    aggregation as (
      select
    date,
    country,
    SUM(sent_msg) AS sent_msg,
    SUM(open_msg) AS open_msg,
    SUM(visit_msg) AS visit_msg,
    is_unsubscribed,
    is_verified,
    send_interval,
    SUM(account_cnt) AS account_cnt,
    sum(unionn.sent_msg) over ( partition by country) AS total_country_sent_cnt,
    sum(unionn.account_cnt) over (partition by country) AS total_country_account_cnt
  FROM unionn
  GROUP BY date, country, is_unsubscribed, is_verified, send_interval,unionn.sent_msg,unionn.account_cnt
    ),
ranking AS (
  SELECT
    *,
     dense_rank() over (order by total_country_account_cnt DESC) as rank_total_country_account_cnt ,
     dense_rank () over (order by total_country_sent_cnt DESC) as rank_total_country_sent_cnt
    from aggregation)


    select
    date, account_cnt,ranking.country, sent_msg, open_msg, visit_msg, is_unsubscribed,is_verified,send_interval,total_country_account_cnt,
     total_country_sent_cnt,rank_total_country_account_cnt,
    rank_total_country_sent_cnt
    from ranking
    where rank_total_country_account_cnt <= 10 or
    rank_total_country_sent_cnt <= 10