/*
table name								column name

news_article					@article_id       article_title		 	article_content 			publication_date		 source

sm_post							@post_id 	    	user_id 			 post_content				post_date				platfrom

companies						company_id			cmp_nam		    	  @score_id	

sentiment_score					#stock_id 		  #article_id			 #post_id					sm_score

@----primary key				#----foreign key


q1- retrive all article and coresponding sentiment scores
q2- list all social media posts and there associated sentiment score
q3- how many positive sentiment articles are there for each company
q4- find average sentiment score for each company articles and posts
q5- which company have the highest average sentiment scores in there articles
q6- identify the top 5 articles which have most positive sentiment
q7-list the social media post with sentiment score greater than 0.8 and having the 3rd decimal digit greter than 5
q8- show articles that have sentiment score lower than avg sentiment score
q9- how many articles and social media post are there for each company
q10- find artcles with negative sentiment score and publication date
q11- list the artcles and social media post which sentiment scores greater than 1.1 and within the month august to october
q12- show the company that dont have any associated sentiment score
q13- retrive the article that have sentiment score and where pubished by sources whose 3rd character is vowels(aeiou)
q14- find the company with highest total sentiment scores
q15- list the social media post and article that have same sentiment score
q16- show the company with articles and social media post on a platfrom whose length should be 8 character and its should contain one lower and and upper
q17- retrive article with lowest and highest sentiment score
q18- list articles and social media posts for a specific users base on there sentiment scores
q19- find the companies with  more positive sentiment score than negative sentiment score
q20- show articles and social media post which sentiment score above avg score
q21- retrive the companies and there associated articles shorted by sentiment score in decending order
q22- list the social media post with sentiment score higher than median score
q23- find the companies that have article and social media post publish on same date
q24- show the social media post and article with sentiment score less than   -1.9   and greter than +1.9 with values upto four decimal digit
q25- retrive the companies and there articles which sentiment score news article and social media post tables are same
q26- retrive the article and siocial media post which sentiment scores higher than mode for their respective companies
q27- list the companies that dont have any associated sentiment scores and update it with the varience of the top five positive sentiment scores

*/



create database sql_project3;
use sql_project3;
show tables;



create table news_article
(
article_id int,
article_title text,
article_content text,
publication_date date,
source text,
primary key(article_id)
);
insert into news_article (article_id,article_title,article_content,publication_date,source)
values(25,'IIFL Securities gains after huge block deal','For the June quarter, the company reported a 71.3 YoY percent increase in net profit at Rs 74.7 crore.','2021-07-07','news paper'),
(27,'Vodafone sinks as Q1 net loss widens to Rs 7,840 crore','The cash-strapped company said that it had received communication from a promoter group entity promising financial support of up to Rs 2,000 crore if required to meet payment obligations.','2020-04-07','social media'),
(39,'IndiGo shares fly down 4.5% after Rs 4,837-cr share sale likely by Gangwal family','The Gangwal Family s ongoing stake negative exercise began in September last year after Rakesh Gangwal stepped down from the board of Interglobe Aviation in February 2022','2020-04-29','news paper'),
(34,'Tejas Networks shares up 6% on purchase order of Rs 7,492 crore from TCS','Tejas Networks shares were up 6 percent in early trade after the company executed the master contract with Tata Consultancy Services (TCS) towards supply, support, and annual maintenance services of Radio Access Network equipment for BSNL’s Pan-India 4G/5G network for approximately 100,000 sites.','2020-07-13','Television news'),
(42,'ITC shares gain on positive net profit numbers, valuations keep brokerages bullish on the stock','ITC shares were up 1.37 percent at Rs 455.35 after the FMCG conglomerate ITC reported a 17 percent increase in net profit for the June quarter over the last year at Rs 4,902.74 crore.','2022-11-26','social media'),
(35,'Adani stocks decline, group market cap falls by Rs 25,000 crore','Shares of Adani Enterprises, the group flagship company, fell as much as 5.4% in early trades Monday before closing 3.3% lower at ₹2,456. Adani Ports & SEZ shares banned almost 2% to close at ₹787.','2022-08-07','google source'),
(47,'Subhash Chandra, Punit Goenka cannot hold director position in group cos: Sebi','The Zee stock has climbed more than 13% in the past five trading sessions after the NCLT approved its merger with Sony. The bulk of the recent gains at Zee, which has a market capitalization in excess of ₹26,000 crore, is attributed to investor optimism that regulators would approve the merger.','2021-05-27','google source'),
(37,'Popular cough syrups banned shelves after India bans 14 fixed dose drug combinations','In a move which was in the making for the past few months, the government citing lack of therapeutic rationale banned several medicines used to treat coughs, colds and respiratory infections. It clamped down mainly on cough syrups, banning at least 10 combinations available in the market including all those that contain codeine, an opioid pain reliever.','2021-05-11','news paper'),
(41,'Double-digit growth could become difficult this year, see momentum once uncertainty ends: TCS CEO Krithivasan','The TCS CEO expects growth momentum to return once uncertainty ends in major markets such as the US and added that they will have better visibility in the second half of the year in a quarter or two.','2022-12-13','news paper'),
(45, 'New Research Findings on Climate Change', 'A team of scientists has published a groundbreaking study on the effects of climate change...','2023-04-25','magazine'),
(29, 'Local Artists Exhibition Opens at Art Gallery', 'The works of the renowned local artist John Smith are now on display at the city art gallery...','2023-02-17','newspaper'),
(33,'Bharat Biotech recalls batch of its rabies vaccine due to theft of several vials','Bharat Biotech stressed that this voluntary action is being taken in accordance with the principle of abundant precaution, keeping patient safety and the public interest in mind.','2020-06-09','Television'),
(32,'copy that IIFL Securities gains after huge block deal','For the June quarter, the company reported a 71.3 YoY percent increase in net profit at Rs 74.7 crore.','2021-07-09','Mobile messages');


create table sm_post
(
post_id int,
user_id text,
post_content text,
post_date date,
platform text,
primary key(post_id)
);
insert into sm_post(post_id,user_id,post_content,post_date,platform)
values(551,'25AMZ44721','IIFL Securities gains after huge block deal','2023-05-13','facebook'),
(624,'29AMZ98745','Vodafone sinks as Q1 net loss widens to Rs 7,840 crore','2022-11-04','tweeter'),
(678,'27AMZ45874','IndiGo shares fly down 4.5% after Rs 4,837-cr share sale likely by Gangwal family','2022-10-13','instagram'),
(657,'26AMZ75486','Tejas Networks shares up 6% on purchase order of Rs 7,492 crore from TCS','2023-01-24','facebook'),
(758,'28AMZ14754','ITC shares gain on positive net profit numbers, valuations keep brokerages bullish on the stock','2023-05-09','tweeter'),
(553,'25AMZ44721','Adani stocks decline, group market cap falls by Rs 25,000 crore','2023-05-13','facebook'),
(428,'25AMZ97581','Subhash Chandra, Punit Goenka cannot hold director position in group cos: Sebi','2023-05-14','instagram'),
(963,'24AMZ24785','Popular cough syrups banned shelves after India bans 14 fixed dose drug combinations','2023-01-23','facebook'),
(414,'27AMZ45874','Double-digit growth could become difficult this year, see momentum once uncertainty ends: TCS CEO Krithivasan','2022-12-28','tweeter'),
(458,'26AMZ75486','Bharat Biotech recalls batch of its rabies vaccine due to theft of several vials','2020-06-09','instagram'),
(559,'25AMZ44721','Networks shares up 6% on purchase recalls batch of its rabies share sale likely by Gangwal family','2022-12-26','tweeter'),
(754,'26AMZ47896','Annual Fashion Show Highlights Local Designer Creations','2023-02-17','tweeter'),
(799,'27AMZ54781','Best-Selling Author Releases New Fantasy Novel','2023-01-24','facebook'),
(765,'26AMZ47896','IIFL Securities gains after huge block deal','2021-07-09','Mobile messages');


create table companies
(
company_id int,
cmp_name text,
score_id int primary key
);
insert into companies(company_id,cmp_name,score_id)
values(57984,'IIFL',114),(59741,'VODAFONE',126),
(64785,'INDIGO',119),(54789,'TEJAS NETWORK',112),(56745,'ITC',117),
(58421,'ADANI GROUP',131),(56421,'ZEE COMPANY',134),(53247,'NACTO PHARMA',128),
(59647,'TCS',137),(64723,'BHARAT BIOTECH',123),(67845,'Construction Enterprises',127),
(79415, 'Financial Services Ltd.', 111),(53810, 'Fashion Forward Brands', 120),
(61441, 'Logistics Solutions Inc.', 139),(67944,'infosys',122);


create table sentiment_score
(
stock_id int,
article_id int,
post_id int,
sm_score decimal(6,4),
foreign key (article_id) REFERENCES news_article(article_id),
foreign key (post_id) REFERENCES sm_post(post_id),
foreign key (stock_id) REFERENCES companies(score_id)
);
insert into sentiment_score(stock_id,article_id,post_id,sm_score)
values(112,25,null,-1.71),(126,null,559,3.27),
(119,34,null,0.571),(134,35,null,2.797),(128,37,null,-5.547),
(131,47,null,-3.24),(111,42,null,-3.429),(123,null,551,7.57),
(111,null,428,-10.114),(126,41,null,12.75),(128,null,624,-7.27),
(112,null,553,8.675),(119,null,458,3.245),(114,null,657,9.671),
(117,39,null,-1.776),(123,27,null,1.7571),(114,33,null,-6.71),
(117,null,963,-9.1785),(131,null,414,4.996),(134,null,678,-1.7227),
(139,45,null,2.75),(137,null,799,2.991),(120,29,null,4.141),(127,null,754,5.145),
(112,25,null,-1.29),(122,null,null,null),(127,null,414,-1.29),(120,32,765,2.29);



select* from sentiment_score; 		 #	news_article		sm_post			companies			sentiment_score
drop table news_article;


#q1- retrive all article and coresponding sentiment scores

select na.article_id , na.article_title , ss.sm_score from news_article na
inner join sentiment_score ss on ss.article_id = na.article_id;


#q2- list all social media posts and there associated sentiment score

select sp.post_id , sp.user_id , ss.sm_score from sm_post sp
inner join sentiment_score ss on ss.post_id= sp.post_id 
order by sm_score desc;


#q3- how many positive sentiment articles are there for each company




#q4- find average sentiment score for each company articles and posts

select c.company_id,avg(ss.sm_score) as avgs, c.cmp_name,ss.article_id,ss.post_id
from sentiment_score ss 
inner join companies c on c.score_id = ss.stock_id
group by c.cmp_name ,ss.article_id,ss.post_id,c.company_id
order by c.company_id  ;


#q5- which company have the highest average sentiment scores in there articles

SELECT c.cmp_name,avg(ss.sm_score) AS avgs,na.article_title
FROM sentiment_score ss
inner join companies c on c.score_id = ss.stock_id
inner join news_article na on na.article_id=ss.article_id
GROUP BY c.cmp_name,na.article_title
ORDER BY avgs DESC limit 1;


#q6- identify the top 5 articles which have most positive sentiment

SELECT na.article_id, na.article_title, ss.sm_score
FROM sentiment_score ss
inner join companies c on c.score_id = ss.stock_id
inner join news_article na on na.article_id=ss.article_id
where ss.sm_score >= 0
ORDER BY ss.sm_score DESC
LIMIT 5;


#q7-list the social media post with sentiment score greater than 0.8 and having the 3rd decimal digit greter than 5

SELECT ss.sm_score,sp.post_id,sp.user_id
FROM sentiment_score ss
inner join sm_post sp on ss.post_id = sp.post_id
WHERE sm_score > 0.8
  AND FLOOR(sm_score * 1000)%10 > 3;


#q8- show articles that have sentiment score lower than avg sentiment score

SELECT ss.article_id, ss.sm_score,na.article_title
FROM sentiment_score ss
inner join news_article na on na.article_id=ss.article_id
WHERE ss.sm_score < ( select AVG(sm_score) from sentiment_score)  
order by sm_score ;


#q9- how many articles and social media post are there for each company

SELECT 
    c.company_id,c.cmp_name,
    count(na.article_id)as article_count,
    count(sp.post_id)as post_count
FROM sentiment_score ss
left join sm_post sp ON ss.post_id = sp.post_id
left join companies c on ss.stock_id = c.score_id
left join news_article na on ss.article_id = na.article_id
GROUP BY c.company_id, c.cmp_name 
order by c.company_id ;


#q10- find artcles with negative sentiment score and publication date

select na.article_title,na.publication_date,ss.sm_score
from sentiment_score ss
inner join news_article na on na.article_id=ss.article_id
where ss.sm_score < 0
order by na.article_id;


#q11- list the artcles and social media post which sentiment scores greater than 1.1 and within the month august to october




#q12- show the company that dont have any associated sentiment score

select c.company_id,c.cmp_name,ss.sm_score
from sentiment_score ss
inner join companies c on c.score_id=ss.stock_id
where ss.sm_score is null ;


#q13- retrive the article that have sentiment score and where pubished by sources whose 3rd character is vowels(aeiou)

SELECT na.article_id, na.article_title, ss.sm_score, na.source
FROM sentiment_score ss
INNER JOIN news_article na ON na.article_id = ss.article_id
WHERE LENGTH(na.source) >= 3 AND
      LOWER(SUBSTRING(na.source, 3, 1)) IN ('a', 'e', 'i', 'o', 'u');


#q14- find the company with highest total sentiment scores

SELECT c.company_id, c.cmp_name, SUM(ss.sm_score) AS total_sentiment
FROM sentiment_score ss
inner JOIN companies c ON c.score_id = ss.stock_id
GROUP BY c.company_id, c.cmp_name
ORDER BY total_sentiment DESC
LIMIT 1;


#q15- list the social media post and article that have same sentiment score




#q16- show the company with articles and social media post on a platfrom whose length should be 8 character and its should contain one lower and and upper

SELECT  c.cmp_name ,c.score_id
FROM sentiment_score ss
inner join sm_post sp ON ss.post_id = sp.post_id
inner join companies c on ss.stock_id = c.score_id
inner join news_article na on ss.article_id = na.article_id
WHERE LENGTH(na.source) >= 8
      AND na.source REGEXP '[a-z]'
      AND na.source REGEXP '[A-Z]'
      AND LENGTH(sp.platform) >= 8
      AND sp.platform REGEXP '[a-z]'
      AND sp.platform REGEXP '[A-Z]';


#q17- retrive article with lowest and highest sentiment score




#q18- list articles and social media posts for a specific users base on there sentiment scores




#q19- find the companies with  more positive sentiment score than negative sentiment score




#q20- show articles and social media post which sentiment score above avg score

SELECT sp.post_content,
 na.article_title , ss.sm_score as sss
FROM sentiment_score ss
left join sm_post sp ON ss.post_id = sp.post_id
left join news_article na on ss.article_id = na.article_id
WHERE ss.sm_score > (SELECT AVG(sm_score) FROM sentiment_score)
order by sss;


#q21- retrive the companies and there associated articles shorted by sentiment score in decending order

select c.cmp_name,na.article_title,ss.sm_score
from sentiment_score ss
inner join news_article na on ss.article_id = na.article_id
inner join companies c on ss.stock_id = c.score_id
order by ss.sm_score desc;


#q22- list the social media post with sentiment score higher than median score



#23 find the companies that has article  and social media post on the same date
SELECT
    c.cmp_name,na.publication_date,sp.post_date,na.article_id,sp.post_id
FROM sentiment_score ss
inner join sm_post sp ON ss.post_id = sp.post_id
inner join companies c on ss.stock_id = c.score_id
inner join news_article na on ss.article_id = na.article_id
WHERE
    DATE(na.publication_date) = DATE(sp.post_date);
    
    
#24 show the social media post and articles with a sent score < -1.9 and > 1.9 with values up to 4 decimal digit

SELECT
    'Social Media Post' AS content_type,
    sp.post_content AS content_title,
    ROUND(ss.sm_score, 4) AS score
FROM
    sm_post AS sp
JOIN
    sentiment_score AS ss ON sp.post_id = ss.post_id
WHERE
    ss.sm_score < -1.9 OR ss.sm_score > 1.9
UNION
SELECT
    'Article' AS content_type,
    na.article_title AS content_title,
    ROUND(ss.sm_score, 4) AS score
FROM
    news_article AS na
JOIN
    sentiment_score AS ss ON na.article_id = ss.article_id
WHERE
        ss.sm_score < -1.9 OR ss.sm_score > 1.9
order by score 
;
   
#25 retrieve company and there article with sentiment score in both  news articles and social media post table are same

SELECT
    c.cmp_name,
    'Article' AS content_type,
    na.article_title AS content_title,
    ss.sm_score
FROM sentiment_score ss
inner join companies c on ss.stock_id = c.score_id
inner join news_article na on ss.article_id = na.article_id
UNION
SELECT
    c.cmp_name,
    'Social Media Post' AS content_type,
    sp.post_content AS content_title,
    ss.sm_score
FROM sentiment_score ss
inner join sm_post sp ON ss.post_id = sp.post_id
inner join companies c on ss.stock_id = c.score_id
;
   
   
   
#26  retrieve the article and social media post with sentiment score higher than mode  for their respective comp



#27 list the companies that don't have any associated sentiment score and update it with the variance of the top 5 positive sentiment scores 
