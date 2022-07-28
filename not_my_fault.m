clear
close all


black=30;%枚数の指標兼マスメ
deck=[0 0 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 6 6 6 6 6];

total=zeros(black,1);
game=20000;


for m=1:game

rand=randperm(32);
rand_pool=deck(rand);

    for n=1:black   

    sum=0;

        for k=1:n
        sum=sum+rand_pool(k);
        end
    
        if sum>black
       total(n)=total(n)+1; 
        
        end

    end

end

total=total/game*100;