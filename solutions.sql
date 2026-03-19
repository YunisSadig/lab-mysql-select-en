

-- Challange 1:
select a.author_id as "AUTHOR ID",
 a.last_name as "LAST NAME",
 a.first_name as "FIRST NAME",
 t.title as "TITLE",
 p.publisher_name as "PUBLISHER"
FROM authors a
JOIN author_title at on a.author_id=at.author_id
Join titles t on at.title_id=t.title_id
Join publishers p on t.publisher_id=p.publisher_id
order by a.author_id,t.title ;
-- Challange 2:
select a.author_id as "AUTHOR ID",
a.last_name as "LAST NAME",
a.first_name as "FIRST NAME",
p.publisher_name as "PUBLISHER",
COUNT(t.title_id)as"NUMBER OF TITLES"
FROM authors a
JOIN author_title at on a.author_id=at.author_id
JOIN titles t on at.title_id=t.title_id
JOIN publishers p on t.publisher_ID=p.publisher_id
GROUP BY a.author_id ,a.last_name,a.first_name,p.publisher_name
Order By a.author_id,p.publisher_name;	
-- Challange 3:
select a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    SUM(s.copies_sold) AS "TOTAL"
FROM authors a
JOIN author_title at ON a.author_id = at.author_id
JOIN titles t ON at.title_id = t.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY a.author_id, a.last_name, a.first_name
ORDER BY TOTAL DESC
LIMIT 3;
-- Challange 4:
select a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    COALESCE(SUM(s.copies_sold), 0) AS "TOTAL"
FROM authors a
LEFT JOIN author_title at ON a.author_id = at.author_id
LEFT JOIN titles t ON at.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
Group BY a.author_id, a.last_name, a.first_name
Order BY TOTAL DESC;
