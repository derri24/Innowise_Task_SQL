--solution 1
SELECT social_statuses.type, COUNT(cards.account_id) AS 'count'
FROM social_statuses
JOIN clients ON clients.social_status_id = social_statuses.social_status_id
JOIN cards ON clients.account_id = cards.account_id
GROUP BY social_statuses.type


--solution 1
SELECT type,
(SELECT COUNT(*) FROM social_statuses first_social_status 
JOIN clients ON clients.social_status_id = first_social_status.social_status_id
JOIN cards ON clients.account_id = cards.account_id
WHERE first_social_status.social_status_id = second_social_status.social_status_id) AS 'count'
FROM social_statuses second_social_status