clear
close all

game=2000000;
fourdice=0;
yacht=0;


for p=1:game


    dice=randi(6,[1,5]);

    dice=sort(dice);
    judge=0;

    dice_quan=zeros(1,6);

        for n=1:5
           m=dice(1,n);
           dice_quan(1,m)=dice_quan(1,m)+1;
        end

  [dice_max,dice_index]=max(dice_quan);
  
  %ダイスの役判定パート
  
  if dice_max==4
     fourdice=fourdice+1; 
     judge=1;
        if dice_max==5
           yacht=yacht+1; 
            continue
        end
    
  end

    for l=1:2

        dice_quan=zeros(1,6);

        for n=1:5
           m=dice(1,n);
           dice_quan(1,m)=dice_quan(1,m)+1;
        end

        [dice_max,dice_index]=max(dice_quan);


        if dice_max==1
            dice=randi(6,[1,5]);  
        else

            for k=1:dice_max
                if k==1
                   dice1=dice_index;
                else
                   dice1=[dice1 dice_index]; 
                end
            end

            dice2=randi(6,[1,5-dice_max]);
            dice=[dice1 dice2];
        end
        
        dice=sort(dice);

  
      if dice_max==4 && judge==0
             fourdice=fourdice+1; 
             judge=1;
  
      end
      
      if dice_max==5
                   yacht=yacht+1; 
                   continue
      end
    end

end

fourdice_rate=fourdice/game*100;
yacht_rate=yacht/game*100;