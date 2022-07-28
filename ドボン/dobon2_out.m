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

target_end=(target_end)';

judge=zeros(13,91);


for b=1:91
   for a=1:4
        for c=1:13
            if target_end(a,b)==c
                judge(c,b)=1;
            end
        end
        c=1;
   end
   a=1;
end
    

potential=zeros(13);

for k=1:91
   for l=1:13 
    if judge(l,k)==0
       for m=1:13
         if judge(m,k)==0
           potential(l,m)=potential(l,m)+100/91;
         end
       end
       
       m=1;
       
    end
   end
   l=1;
end
    
    mesh(potential)
    

