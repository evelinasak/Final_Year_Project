%%PART 4 This code clusters trajectories into two clusters based on the runway 

%%Firstly, we need to extract first and last coordinates of each trajectory
%%from ClustTraj table because they will be used as features (independent of direction)
rows = height(ClustTraj);
N = ClustTraj.TRAJECTORY(rows); %gets total number of trajectories

% %N=4; %for testing
% n = 1; %n is trajectory number - starting from one 
% i = 1; %row in the traj_for_clust file count 
% count = 0; %count for trajectory points in a trajectory (reset to 0 before every loop)
length1 = 0; %same as count just without reset to 0
% for row = 1:N
%     if (ClustTraj.TRAJECTORY(length1+1) == row) && (ClustTraj.TRAJ_POINT_N(length1+1)==1) %%check where a new trajectory starts 
%         traj_for_clust.TRAJECTORY(i) = row;
%         traj_for_clust.TRAJ_POINT_N(i) = 1;
%         traj_for_clust.P_EAST(i) = ClustTraj.P_EAST(length1+1);
%         traj_for_clust.P_NORTH(i) = ClustTraj.P_NORTH(length1+1);
%         traj_for_clust.VELOCITY(i) = ClustTraj.VELOCITY(length1+1);
%         traj_for_clust.ROW(i) = length1+1;
%     end
%     
%     i = i+1;
%     
%     for row2 = 1:rows
%         if (ClustTraj.TRAJECTORY(row2) == row) 
%             count = count+1
%         end
%     end
%     length = length+count;
%     
%     traj_for_clust.TRAJECTORY(i) = row;
%     traj_for_clust.TRAJ_POINT_N(i) = ClustTraj.TRAJ_POINT_N(length1);
%     traj_for_clust.P_EAST(i) = ClustTraj.P_EAST(length1);
%     traj_for_clust.P_NORTH(i) = ClustTraj.P_NORTH(length1);
%     traj_for_clust.VELOCITY(i) = ClustTraj.VELOCITY(length1);
%     traj_for_clust.ROW(i) = length1;
%     
%     i= i+1;
%     count = 0;
% end
%% 

%%Find which coordinate (first or last one) is closer to the runway
%Origin of the ENU coordinates 
x1 = -1.614444; %x coordinate lon0
y1 = 52.192222; %y coordinate lat0

x2 = traj_for_clust.P_NORTH(2);
y2 = traj_for_clust.P_EAST(2); 

distance = sqrt((x2_1-x1)^2+(y2_1-y1)^2);

% for row = 1:N
%     x2_1 = traj_for_clust.P_NORTH(row*2-1); %longitude of the first trajectory point
%     y2_1 = traj_for_clust.P_EAST(row*2-1); %latitude of the first trajectory point
%     
%     x2_2 = traj_for_clust.P_NORTH(row*2); %longitude of the last trajectory point
%     y2_2 = traj_for_clust.P_EAST(row*2); %latitude of the last trajectory point
%     
%     %finding distances from the first and last trajectory points to the
%     %centre of runways
%     distance1 = sqrt((x2_1-x1)^2+(y2_1-y1)^2) 
%     distance2 = sqrt((x2_2-x1)^2+(y2_2-y1)^2)
%     
%     %checking which point is closer to the runway centres 
%     if distance1<distance2
%         traj_for_clust.USE(row*2-1) = 1; %write 1 if first point is closer
%         traj_for_clust.USE(row*2) = 0; %write 0 if last is further
%     else
%         traj_for_clust.USE(row*2) = 1; %write 1 if last point is closer 
%         traj_for_clust.USE(row*2-1) = 0; %write 0 if first point is further
%     end
%     
% end
%% 

%%Plot trajectories first/last point which are closer to the runway
 rows = height(traj_for_clust);
% for row = 1:rows
%     if traj_for_clust.USE(row) ==1
%         plot(traj_for_clust.P_NORTH(row), traj_for_clust.P_EAST(row), 'g.', 'MarkerSize', 10);
%         hold on
%     end
% end
%% 

%%Finding to which runway a trajectory corresponds to (based on shortest
%%distance to all the runway points)
%Runway points
R1_P1 = [-1.6150, 52.1975];
R1_P2 = [-1.6138, 52.1865];
R2_P1 = [-1.6086, 52.1928];
R2_P2 = [-1.6178, 52.1871];

% for row = 1:rows
%     
%     if traj_for_clust.USE(row) == 1
%         dist(1,1) = sqrt((R1_P1(1,1)-traj_for_clust.P_NORTH(row))^2+(R1_P1(1,2)-traj_for_clust.P_EAST(row))^2) %distance corresponding to R1_P1
%         dist(1,2) = sqrt((R1_P2(1,1)-traj_for_clust.P_NORTH(row))^2+(R1_P2(1,2)-traj_for_clust.P_EAST(row))^2) %distance corresponding to R1_P2
%         dist(1,3) = sqrt((R2_P1(1,1)-traj_for_clust.P_NORTH(row))^2+(R2_P1(1,2)-traj_for_clust.P_EAST(row))^2) %distance corresponding to R2_P1
%         dist(1,4) = sqrt((R2_P2(1,1)-traj_for_clust.P_NORTH(row))^2+(R2_P2(1,2)-traj_for_clust.P_EAST(row))^2) %distance corresponding to R2_P2
%         [M, I] = min(dist) %returns the minimum distance (M) and index of min value (I)
%         if I == 1 || I == 2
%             traj_for_clust.RUNWAY(row) = 1;
%         else 
%             traj_for_clust.RUNWAY(row) = 2;
%         end 
%    end
% end
%% 

%%Extracting trajectories which correspond to runway 1 
% runway_1 = zeros(1, numel(row)); %an array to hold trajectory numbers which correspond to runway 1
% i = 1; 
% for row = 1:rows
%     if traj_for_clust.RUNWAY(row) == 1
%         runway_1(i,1) = traj_for_clust.TRAJECTORY(row);
%         i = i+1;
%     end
% end

%%Extracting trajectories which correspond to runway 2
% runway_2 = zeros(1, numel(row)); %an array to hold trajectory numbers which correspond to runway 2
% i = 1; 
% for row = 1:rows
%     if traj_for_clust.RUNWAY(row) == 2
%         runway_2(i,1) = traj_for_clust.TRAJECTORY(row);
%         i = i+1;
%     end
% end
%% 

%%Plotting runways which correspond to runway 1
% rows1 = length(runway_1);
% rows2 = height(ClustTraj);
% count = 0;
% for row1 = 1:rows1
%     number  = runway_1(row1); %reading trajectory number 
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
% end
%%Plotting runways which correspond to runway 2
rows1 = length(runway_2);
rows2 = height(ClustTraj);
count = 0;
for row1 = 1:rows1
    number  = runway_2(row1); %reading trajectory number 
    for row2 = 1:rows2
        if ClustTraj.TRAJECTORY(row2) == number %find the right trajectory in ClustTraj
            count = count+1; %counting points in a trajectory
            row_num = row2;  %to find the last trajectory entry
        end
    end 
     x = ClustTraj.P_NORTH(row_num-count+1:row_num);
     y = ClustTraj.P_EAST(row_num-count+1:row_num);
     %plot(x,y,'b.', 'MarkerSize', 2)
     plot(x,y,'LineWidth',0.1)
     hold on 
     count = 0;
end

xlabel('Longitude')
ylabel('Latitude')
title('Runway 2 trajectories')
hold on 
%Runway 1
lat1=[52.197463, 52.197447, 52.186530, 52.186519,52.197463 ];
lon1=[-1.615369, -1.614686, -1.613438, -1.614142, -1.615369];
plot(lon1, lat2, "black", 'LineWidth',3)
hold on

%Runway 2
lat2=[52.192900, 52.192694, 52.186931, 52.187281,52.192900];
lon2=[-1.608952, -1.608280, -1.617580, -1.618084, -1.608952];
plot(lon2, lat2, "black", 'LineWidth',3)


