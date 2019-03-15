

superheros([likes(bryan, _, _), likes(tony, _, _), likes(sean,_, _)]).
who_likes(X) :- superheros(X), 
		member(likes(bryan, spidey, 6),X), 
		member(likes(Z, superman, 8),X), Z\=tony, 
		member(likes(Y, batman, A),X),
 		member(likes(B , C, 10), X).  
		

