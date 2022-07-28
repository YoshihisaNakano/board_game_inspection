clear
close all



    dice=randi(6,[1,5]);

    dice=sort(dice);
    judge=0;

    dice_quan=zeros(1,6);

        for n=1:5
           m=dice(1,n);
           dice_quan(1,m)=dice_quan(1,m)+1;
        end

  [dice_max,dice_index]=max(dice_quan);
  


    for l=1:2

        dice_quan=zeros(1,6);

        for n=1:5
           m=dice(1,n);
           dice_quan(1,m)=dice_quan(1,m)+1;
        end

        [dice_max,dice_index]=max(dice_quan);


        

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

