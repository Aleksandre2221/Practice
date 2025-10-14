

         -- The Best Approach. Using - ROUND / NULLIF / Subquery --  
SELECT 
	ROUND(
      	NULLIF(
				(SELECT COUNT(DISTINCT (accepter_id, requester_id)) FROM request_accepted)::numeric 
  	  			/ (SELECT COUNT(*) FROM friend_request)
          	, 0)
  	, 2) accept_rate
