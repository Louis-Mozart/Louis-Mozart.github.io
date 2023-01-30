clear all


nsim = 10^3;
meanS = []; 
ii = 0;
for K = 1:nsim
    %% i n i t i a l v a l u e s
    s = [ 1 0 0 0 0 ] ; 
    jobtime = [ 2 0 3 4 0 ] ; 
    age = [ 0 0 0 0 0 ] ; 
    timestep = 1 ; 
    finaltime = 10^3; 
    i = 1 : length( s ) - 1; 
    S = [ ] ; 
    
    lambda = 0.625;
    
    for t = 1 : timestep : finaltime
        oc = ( s ( i )>0) ; % f i n d o c c u p i e d s t a t e s
        age( oc ) = age ( oc ) + timestep ; % i n c r e a s e a g e s
         
        age(1) = max(age(1)-(rand()<lambda),0);
    
        jobdone = ( age ( i ) >= jobtime ( i ) ) ; % which j o b s h ave been c om pl e t e d
        nextvacant = ( s ( i +1) == 0 ) ; % f i n d f r e e s t a t e s
        nextvacant(1) = 1 ; % c l i e n t s can a l w a y s e n t e r t h e queue
        move = find( oc & jobdone & nextvacant ) ; % s t a t e s t o move
        
        if isempty ( move ) == 0
            s( move+1) = s ( move+1) + 1 ; % t o t h i s p l a c e . . .
            s( move ) = s ( move ) - 1 ; % . . . f r o m h e r e
            age ( move+1) = 0 ; % i n i t i a l i z e age c o u n t e r
            age ( move ) = 0 ; % ”"
        end
        
        s(1) = 1 ; % keep i n p u t o c c u p i e d
        s(end) = 0 ; % keep e x i t f r e e
        S = [ S ; s ] ; % s t o r e s t a t e s
    end
    
    %stairs( S ( : , 2 ) ) ; xlabel( ' time ' ) ; ylabel( ' queue length ' ) ;
meanS = [meanS;mean(S(:,2))];
ii = ii+1 %See the evolution of the loop
end

meanS = mean(meanS)
