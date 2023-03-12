%%This code plots velocity envelope for a single trajectory rows = height(ClustTraj);
%count = 0;
x = 0;
i=1;
count = 0; 
traj_points = [];
for row = 1:rows
    if ClustTraj.TRAJECTORY(row) == 3 %select trajectory
        ClustTraj.TRAJECTORY(row)
        x = x+1;
        count = count+1;
        traj_points(i) = x;
        row_num=row;
        i=i+1;
    end
end
x = traj_points';
y = ClustTraj.VELOCITY(row_num-count+1:row_num);
plot(x,y,'LineWidth',0.1)
hold on
xlabel('Time stamps, k')
ylabel('Velocity')
title ('Velocity profile')

% for row1 = 1:rows1
%     number  = runway_2(row1); %reading trajectory number 
%     for row2 = 1:rows2
%         if ClustTraj.TRAJECTORY(row2) == number %find the right trajectory in ClustTraj
%             count = count+1; %counting points in a trajectory
%             row_num = row2;  %to find the last trajectory entry
%         end
%     end 
%      x = ClustTraj.P_NORTH(row_num-count+1:row_num);
%      y = ClustTraj.P_EAST(row_num-count+1:row_num);
%      %plot(x,y,'b.', 'MarkerSize', 2)
%      plot(x,y,'LineWidth',0.1)
%      hold on 
%      count = 0;