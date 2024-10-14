-- __/\\\\\\\\\\\__/\\\\\_____/\\\__/\\\\\\\\\\\\\\\_____/\\\\\_________/\\\\\\\\\_________/\\\\\\\________/\\\\\\\________/\\\\\\\________/\\\\\\\\\\________________/\\\\\\\\\_______/\\\\\\\\\_____        
--  _\/////\\\///__\/\\\\\\___\/\\\_\/\\\///////////____/\\\///\\\_____/\\\///////\\\_____/\\\/////\\\____/\\\/////\\\____/\\\/////\\\____/\\\///////\\\_____________/\\\\\\\\\\\\\___/\\\///////\\\___       
--   _____\/\\\_____\/\\\/\\\__\/\\\_\/\\\_____________/\\\/__\///\\\__\///______\//\\\___/\\\____\//\\\__/\\\____\//\\\__/\\\____\//\\\__\///______/\\\_____________/\\\/////////\\\_\///______\//\\\__      
--    _____\/\\\_____\/\\\//\\\_\/\\\_\/\\\\\\\\\\\____/\\\______\//\\\___________/\\\/___\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\_________/\\\//_____________\/\\\_______\/\\\___________/\\\/___     
--     _____\/\\\_____\/\\\\//\\\\/\\\_\/\\\///////____\/\\\_______\/\\\________/\\\//_____\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\________\////\\\____________\/\\\\\\\\\\\\\\\________/\\\//_____    
--      _____\/\\\_____\/\\\_\//\\\/\\\_\/\\\___________\//\\\______/\\\______/\\\//________\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\___________\//\\\___________\/\\\/////////\\\_____/\\\//________   
--       _____\/\\\_____\/\\\__\//\\\\\\_\/\\\____________\///\\\__/\\\______/\\\/___________\//\\\____/\\\__\//\\\____/\\\__\//\\\____/\\\___/\\\______/\\\____________\/\\\_______\/\\\___/\\\/___________  
--        __/\\\\\\\\\\\_\/\\\___\//\\\\\_\/\\\______________\///\\\\\/______/\\\\\\\\\\\\\\\__\///\\\\\\\/____\///\\\\\\\/____\///\\\\\\\/___\///\\\\\\\\\/_____________\/\\\_______\/\\\__/\\\\\\\\\\\\\\\_ 
--         _\///////////__\///_____\/////__\///_________________\/////_______\///////////////_____\///////________\///////________\///////_______\/////////_______________\///________\///__\///////////////__

-- Your Name: Hanzhang Chen
-- Your Student Number: 1173968
-- By submitting, you declare that this work was completed entirely by yourself.

-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q1
SELECT generaluser.Id AS userID
FROM generaluser
LEFT JOIN friendof
ON generaluser.Id = friendof.user 1
WHERE friendof.WhenRequested IS NOT NULL
AND friendof.WhenConfirmed IS NULL;


-- END Q1
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q2
SELECT forum.Id, forum.Topic, COUNT(Forum) AS numSubs
FROM subscribe
RIGHT JOIN forum
ON subscribe.Forum = forum.Id
WHERE subscribe.WhenSubscribed IS NOT NULL;


-- END Q2
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q3
SELECT forum.Id, post.Id, post.WhenPosed
FROM forum
LEFT JOIN post
ON post.Forum = forum.Id
WHERE MAX(post.WhenPosed);


-- END Q3
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q4
SELECT eneraluser.Id, following.follower
FROM following
LEFT JOIN generaluser
ON generaluser.Id = following.following
WHERE following.WhenStartedFollowing IS NOT NULL;



-- END Q4
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q5
SELECT forum.Id, admin.Id, COUNT(WhenUpvoted) AS numberOfUpvotesInForum
FROM upvote
RIGHT JOIN post
ON post.Id = upvote.Post
WHERE MAX(upvote.WhenUpvote);


-- END Q5
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q6
SELECT user.Id, user.Username
FROM user
LEFT JOIN generaluser
ON generaluser.Id = user.Id
WHERE following.follower IS NULL
AND friendof.user 2 IS NULL


-- END Q6
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q7
SELECT user.Id, AVG(sumUpvotes) AS avgUpvotes
FROM user
LEFT JOIN 
	(SELECT upvote.User, COUNT(*) AS sumUpvotes
    FROM upvote
    RIGHT JOIN post
    ON post.Id = upvote.Post
    WHERE WhenUpvoted IS NOT NULL)
ON user.Id = upvote.User
WHERE WhenUpvoted IS NOT NULL;


-- END Q7
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q8
SELECT post.Id AS PostOrCommendId
FROM post
LEFT JOIN upvote
ON upvote.Post = post.Id
WHERE
	(SELECT COUNT(WhenUpvoted) AS ParentUpvotenum
    FROM post
    LEFT JOIN upvote
    ON upvote.Post = post.ParentPost
    WHERE WhenUpvoted IS NOT NULL)
>
	(SELECT COUNT(WhenUpvoted) AS Upvotenum
    FROM post
    LEFT JOIN upvote
    ON upvote.Post = post.Id
    WHERE WhenUpvoted IS NOT NULL);


-- END Q8
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q9
SELECT user.Id
FROM user
LEFT JOIN upvote
ON upvote.User = user.Id
WHERE
	(SELECT generaluser.Id
	FROM generaluser
	LEFT JOIN friendof
	ON generaluser.Id = friendof.user 1
    WHERE friendof.WhenConfirmed IS NOT NULL
    AND friendof.WhenUnfriended IS NULL)
= post.PostedBy
OR admin.Id = post.PostBy;


-- END Q9
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q10
SELECT admin.Id, forum.Id, COUNT(WhenSubscribed) AS numSubscriptions
FROM 
	(SELECT forum.Id, subscribe.WhenSubscribed, forum.CreatedBy
    FROM forum
    LEFT JOIN subscribe
    ON forum.Id = subscribe.forum
    WHERE MAX(WhenSubscribed))
RIGHT JOIN admin
ON forum.CreatedBy = admin.Id
WHERE MAX(WhenSubscribed)


-- END Q10
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- END OF ASSIGNMENT Do not write below this line