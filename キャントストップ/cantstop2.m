clear
close all

%2を選んだ場合

game=2000000;

prob1=zeros(12,1);
ex1=zeros(12,1);


space=0;
turn=0;
allturn=0;
goal=1;

target=combnk(3:12,2);
target=[2*ones(45,1) target];
true=zeros(45,2);
recieve=zeros(45,1);

%%
for n=1:game
    
    dice=randi(6,[1,4]);

    combi1=[dice(1,1)+dice(1,2) dice(1,3)+dice(1,4)];
    combi2=[dice(1,1)+dice(1,3) dice(1,2)+dice(1,4)];
    combi3=[dice(1,1)+dice(1,4) dice(1,2)+dice(1,3)];

    combi1=sort(combi1);
    combi2=sort(combi2);
    combi3=sort(combi3);

    if dice(1,1)==dice(1,2) && dice(1,1)==dice(1,3) && dice(1,1)==dice(1,4)
       combi2=[1 1];
       combi3=[1 1];
    end

    if combi1==combi2
       combi2=[1 1];     
    end

    if combi2==combi3
       combi3=[1 1];     
    end

    if combi1==combi3
       combi3=[1 1];     
    end
    
    if combi1(1,1) ~= 1
        for m=1:2
        a=combi1(1,m);
        ex1(a,1)= ex1(a,1)+1;
        end
        
        if combi1(1,1) == combi1(1,2)
            a=combi1(1,1);
            prob1(a,1)= prob1(a,1)+1;
        else
            for m=1:2
            a=combi1(1,m);
            prob1(a,1)= prob1(a,1)+1;
            end
        end
    end
    
    if combi2(1,1) ~= 1
        for m=1:2
            a=combi2(1,m);
            ex1(a,1)= ex1(a,1)+1;
        end
        if combi2(1,1) == combi2(1,2)
            a=combi2(1,1);
            prob1(a,1)= prob1(a,1)+1;
        else
            for m=1:2
            a=combi2(1,m);
            prob1(a,1)= prob1(a,1)+1;
            end
        end
    end
    
    if combi3(1,1) ~= 1
        for m=1:2
            a=combi3(1,m);
            ex1(a,1)= ex1(a,1)+1;
        end
        if combi3(1,1) == combi3(1,2)
            a=combi3(1,1);
            prob1(a,1)= prob1(a,1)+1;
        else
            for m=1:2
            a=combi3(1,m);
            prob1(a,1)= prob1(a,1)+1;
            end
        end
    end
    
    %3つの場合
    
    for m=1:2       
        for k=1:45           
            for l=1:3
                if target(k,l)==combi1(1,m) || target(k,l)==combi2(1,m) || target(k,l)==combi3(1,m)
              
                    true(k,1)=1;
                
                     if combi1(1,m)==2 || combi2(1,m)==2 || combi3(1,m)==2
                
                      true(k,2)=1;
                      
                      space=space+1;
                      
                     end
     
                     
                end
                
                
            end            
        end        
    end
        
    turn=turn+1;
    
    if space>=1
        space=0;
        allturn=allturn+turn;
        turn=0;
        goal=goal+1;
    end
    
    recieve=recieve+true;
    true(:,:)=0;
     
        
end

average_turn=allturn/goal;

prob1=prob1/game*100;
ex1=ex1/game*100;
ExValue=ex1;
ExValue(2,1)=ExValue(2,1)/3;
ExValue(3,1)=ExValue(3,1)/5;
ExValue(4,1)=ExValue(4,1)/7;
ExValue(5,1)=ExValue(5,1)/9;
ExValue(6,1)=ExValue(6,1)/11;
ExValue(7,1)=ExValue(7,1)/13;
ExValue(8,1)=ExValue(8,1)/11;
ExValue(9,1)=ExValue(9,1)/9;
ExValue(10,1)=ExValue(10,1)/7;
ExValue(11,1)=ExValue(11,1)/5;
ExValue(12,1)=ExValue(12,1)/3;

for n=1:12
ClearAve(n,1)=1/ExValue(n,1)*100;
end


recieve=recieve/game*100;
excelldata=[target recieve];

