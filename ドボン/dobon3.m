clear
close all

game_count=50000;

pat=[1;2;3;4;5;6;7;8;9;10;11;12;13];
judge=[pat zeros(13,1)];
judge2=judge;

%%デッキの生成
deck=ones(1,52);

for n=1:12
    
    deck=deck+[zeros(1,4*n) ones(1,52-4*n)];
    
end





for pick=1:13
   for m=1:game_count 
       
       %%デッキのシャッフル
% 
%     rand=randperm(52);
%     rand_pool=deck(rand);
%     
    rand_pool=randi([1,13],1,3);
    total=rand_pool(1,1)+rand_pool(1,2)+rand_pool(1,3);
    
    if total==pick
    
        judge(pick,2)=judge(pick,2)+1/game_count*100;
        
    end
   end
end

judge2=[1,33.3333333333333;2,24.3589743589744;3,20.5128205128205;4,20.5128205128205;5,16.6666666666667;6,17.9487179487180;7,14.1025641025641;8,15.3846153846154;9,14.1025641025641;10,14.1025641025641;11,11.5384615384615;12,14.1025641025641;13,10.2564102564103];



figure(1)
plot(judge(1:end,2),'-r')
hold on
plot(judge2(1:end,2),'-b')
xlim([1 13])
ylim([0 35])
ylabel('probability[%]')
xlabel('hand')