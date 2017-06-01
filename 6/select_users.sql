SELECT * FROM users WHERE id IN
  (SELECT user_id FROM
    (SELECT user_id, count(*) FROM messages GROUP BY user_id ORDER BY count) as a
  ) as ids