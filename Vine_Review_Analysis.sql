Create TABLE high_votes AS
SELECT * FROM vine_table
WHERE total_votes >20;

Create TABLE helpful_review AS
SELECT * FROM high_votes
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

CREATE TABLE paid_review AS
SELECT * from helpful_review
WHERE vine = 'Y';

CREATE TABLE unpaid_review AS
SELECT * FROM helpful_review
WHERE vine = 'N';

SELECT COUNT(star_rating)
FROM paid_review;

SELECT COUNT(star_rating)
FROM paid_review where star_rating = 5;

SELECT 100 * COUNT(star_rating)/(SELECT COUNT(helpful_votes) FROM paid_review)
FROM paid_review
where star_rating = 5;

SELECT COUNT(star_rating)
FROM unpaid_review;

SELECT COUNT(star_rating)
FROM unpaid_review where star_rating = 5;

SELECT 100 * COUNT(star_rating)/(SELECT COUNT(helpful_votes) FROM unpaid_review)
FROM unpaid_review
where star_rating = 5;