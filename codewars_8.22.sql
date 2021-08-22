-- Dane attempt
SELECT category_id, category, title, views, post_id
FROM (
SELECT 
  posts.category_id,
  categories.category,
  posts.title,
  posts.views,
  posts.id as post_id,
  RANK() OVER (PARTITION BY categories.category
              ORDER BY posts.views DESC) AS rank
FROM posts
LEFT JOIN categories
  ON posts.category_id = categories.id) AS sub
WHERE sub.rank <= 2
ORDER BY sub.category

-- codewars solution
select
  category_id,
  category,
  title,
  views,
  post_id
from
  (select
    c.id as category_id,
    category,
    title,
    views,    
    p.id as post_id,
    rank() over (partition by c.id order by views desc, p.id)
  from categories c
  left join posts p on c.id = p.category_id) as posts
where rank < 3
order by category, views desc, post_id