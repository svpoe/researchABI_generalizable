% Creating an ABI electrode array which shows the active electrodes based on the given charge data   
function ae_data = ActiveE_Func(center,quartile_cutoffs,e_perc_list) 
%% MAKING PADDLE
e_ID_list = [2:22]'; %e_ID_list = [2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22]
Q1_cutoff = quartile_cutoffs(1);
Q2_cutoff = quartile_cutoffs(2);
Q3_cutoff = quartile_cutoffs(3);

% x_dot = [0 0 4 4];              %making main array
% y_dot = [0 7.5 7.5 0];
x_dot = [0.5 0 0 0.5 3.5 4 4 3.5];              %making main array w shaved edges
y_dot = [0 0.5 7 7.5 7.5 7 0.5 0];
%z_dot = [0 0 0 0];
    
% patch(x_dot,y_dot,z_dot,'k')
patch(x_dot,y_dot,'k')
hold on
    alpha(0.15)
 
x1_dot = [1.75 1.75 2.25 2.25];     %marking proximal end
y1_dot = [0 -0.8 -0.8 0];
%z1_dot = [0 0 0 0];

% patch(x1_dot,y1_dot,z1_dot,'k')
patch(x1_dot,y1_dot,'k')
    alpha(0.15)
    
axis equal
axis off

title(center,' Active electrode distribution')

 %% CREATING ELECTRODES


 
% EXAMPLE-- DELETE LATER
%e_ID = [2; 3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22] %DELETE LATER

for i = 1:21
%     if e_perc_list(i) < quartile_cutoffs(1)
%         mcolor = 'r'
%     elseif e_perc_list(i) < quartile_cutoffs(2)
%         mcolor = 'o'
%     elseif e_perc_list(i) < quartile_cutoffs(3)
%          mcolor = 'y'
%     elseif e_perc_list(i) > quartile_cutoffs(3)
%         mcolor = 'g'
%     end        
 
   if i == 1
       j = 0;
   elseif i < 5
       j = 1;
   elseif i < 8
       j = 2;
   elseif i < 11
       j = 3;
   elseif i < 14  
       j = 4;
   elseif i < 17  
       j = 5;
   elseif i < 20   
       j = 6;
   else
       j = 7;
   end    


    if mod(i+1,3) == 0
        if e_perc_list(i) < quartile_cutoffs(1)
            plot(1,j-0.5,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0.75, 0.75, 0],'MarkerEdgeColor', 'k'); %FIX THIS!!!!!!!
            label = string(e_ID_list(i));
            text(1,j-0.5, label,'VerticalAlignment','middle','HorizontalAlignment','center')
            %mcolor = 'r'
        elseif e_perc_list(i) < quartile_cutoffs(2)
             plot(1,j-0.5,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0.5, 0.7, 0],'MarkerEdgeColor', 'k');
             label = string(e_ID_list(i));
             text(1,j-0.5, label,'VerticalAlignment','middle','HorizontalAlignment','center')
            %mcolor = 'o'
        elseif e_perc_list(i) < quartile_cutoffs(3)
             plot(1,j-0.5,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0,0.5,0],'MarkerEdgeColor', 'k');
             label = string(e_ID_list(i));
             text(1,j-0.5, label,'VerticalAlignment','middle','HorizontalAlignment','center')
             %mcolor = 'y'
        elseif e_perc_list(i) >= quartile_cutoffs(3)
            plot(1,j-0.5,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0,0.3,0],'MarkerEdgeColor', 'k');
            label = string(e_ID_list(i));
            text(1,j-0.5, label,'VerticalAlignment','middle','HorizontalAlignment','center')
            %mcolor = 'g'
        end        

%             plot3(3,j+0.5,0,'Marker','o','MarkerSize',25,'MarkerFaceColor', 'b');
    elseif mod(i,3) == 0
        %plot3(2,j,0,'Marker','o','MarkerSize',25,'MarkerFaceColor', 'r');
         if e_perc_list(i) < quartile_cutoffs(1)
            plot(2,j,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0.75, 0.75, 0],'MarkerEdgeColor', 'k');
            label = string(e_ID_list(i));
            text(2,j, label,'VerticalAlignment','middle','HorizontalAlignment','center')
            %mcolor = 'r'
        elseif e_perc_list(i) < quartile_cutoffs(2)
             plot(2,j,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0.5, 0.7, 0],'MarkerEdgeColor', 'k');
             label = string(e_ID_list(i));
             text(2,j, label,'VerticalAlignment','middle','HorizontalAlignment','center')
            %mcolor = 'o'
        elseif e_perc_list(i) < quartile_cutoffs(3)
             plot(2,j,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0,0.5,0],'MarkerEdgeColor', 'k');
             label = string(e_ID_list(i));
             text(2,j, label,'VerticalAlignment','middle','HorizontalAlignment','center')
             %mcolor = 'y'
        elseif e_perc_list(i) >= quartile_cutoffs(3)
            plot(2,j,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0,0.3,0],'MarkerEdgeColor', 'k');
            label = string(e_ID_list(i));
            text(2,j, label,'VerticalAlignment','middle','HorizontalAlignment','center')
            %mcolor = 'g'
        end        
    else
        %plot3(1,j-0.5,0,'Marker','o','MarkerSize',25,'MarkerFaceColor', 'g');
        if e_perc_list(i) < quartile_cutoffs(1)
            plot(3,j+0.5,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0.75, 0.75, 0],'MarkerEdgeColor', 'k');
            label = string(e_ID_list(i));
            text(3,j+0.5, label,'VerticalAlignment','middle','HorizontalAlignment','center')
            %mcolor = 'r'
        elseif e_perc_list(i) < quartile_cutoffs(2)
             plot(3,j+0.5,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0.5, 0.7, 0],'MarkerEdgeColor', 'k');
             label = string(e_ID_list(i));
             text(3,j+0.5, label,'VerticalAlignment','middle','HorizontalAlignment','center')
            %mcolor = 'o'
        elseif e_perc_list(i) < quartile_cutoffs(3)
             plot(3,j+0.5,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0,0.5,0],'MarkerEdgeColor', 'k');
             label = string(e_ID_list(i));
             text(3,j+0.5, label,'VerticalAlignment','middle','HorizontalAlignment','center')
             %mcolor = 'y'
        elseif e_perc_list(i) >= quartile_cutoffs(3)
            plot(3,j+0.5,'Marker','o','MarkerSize',25,'MarkerFaceColor', [0,0.3,0],'MarkerEdgeColor', 'k');
            label = string(e_ID_list(i));
            text(3,j+0.5, label,'VerticalAlignment','middle','HorizontalAlignment','center')
            %mcolor = 'g'
            
        end  

   end
end

%p1 = plot(0,0,'Marker','o','MarkerSize',0.1,'MarkerFaceColor', [0.75, 0.75, 0],'MarkerEdgeColor', 'k');
p1 = plot(0,0,'Color', [0.75, 0.75, 0]);
p2 = plot(0,0,'Color', [0.5, 0.7, 0]);
p3 = plot(0,0,'Color', [0, 0.5, 0]);
p4 = plot(0,0,'Color', [0, 0.3, 0]);


% p2 = plot(0,0.01,'Marker','o','MarkerSize',0.1,'MarkerFaceColor', [0.5, 0.7, 0],'MarkerEdgeColor', 'k');
% p3 = plot(0,0.02,'Marker','o','MarkerSize',0.1,'MarkerFaceColor', [0, 0.5, 0],'MarkerEdgeColor', 'k');
% p4 = plot(0,0.03,'Marker','o','MarkerSize',0.1,'MarkerFaceColor', [0, 0.3, 0],'MarkerEdgeColor', 'k');
% 

%Q1 = string('<',quartile_cutoffs*100,'%')
Q1 = '< '+string(Q1_cutoff*100)+' %';
Q2 = '< '+string(Q2_cutoff*100)+' %';
Q3 = '< '+string(Q3_cutoff*100)+' %';
Q4 = '>= '+string(Q3_cutoff*100)+' %';
legend([p1,p2,p3,p4],{Q1,Q2,Q3,Q4})

