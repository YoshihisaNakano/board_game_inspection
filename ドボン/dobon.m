clear
close all

game_count=20000;

pat=[1;2;3;4;5;6;7;8;9;10;11;12;13];
judge=[pat zeros(13,1)];
judge2=judge;
% 
% %%デッキの生成
% deck=ones(1,52);
% 
% for n=1:12
%     
%     deck=deck+[zeros(1,4*n) ones(1,52-4*n)];
%     
% end
% 
% %%デッキのシャッフル
% n=1;
% rand=randperm(52);
% rand_pool=deck(rand);
% 
% 
% 
% % for n=1:game_count


target=combnk(1:13,2);
t=ones(13,2);
 for n=1:12
    
    t=t+[zeros(n,2);ones(13-n,2)];
    
 end

 target=[target;t];

target_plus=target(1:end,2)+target(1:end,1);
target_minus=target(1:end,2)-target(1:end,1);
target_multi=target(1:end,2).*target(1:end,1);
target_division=target(1:end,2)./target(1:end,1);

target_end=[target_plus target_minus target_multi target_division];


count=0;
for n=1:13
    for m=1:91
        for o=1:4
          if judge(n,1) == target_end(m,o)
              
              count=1;
   
          end
          
          if count==1
          
              judge(n,2)=judge(n,2)+1;
              count=0;
          
          end
        end
    end
end

judge(1:end,2)=judge(1:end,2)/78*100;

figure(1)
plot(judge(1:end,2))
xlim([1 13])
ylim([0 35])

