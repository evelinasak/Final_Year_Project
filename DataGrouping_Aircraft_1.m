%%PART1 This code groups data based on the aircraft in a separate table (T1) called
%%trajectories 
%setting up some variables
rows = height(T1);
%a = []; %%array for storing all the aircraft 
%a = T1.icao24(1);
c=2;
d = 1;
break_point=3000;
duration = seconds(3);
%% 
%setting up trajectories table
% ICAO24=[];
% TIME=[];
% RTIME=[];
% LAT=[];
% LON=[];
% BREAK=[];
% trajectories = table(TIME, RTIME, ICAO24, LAT, LON, BREAK); 
% trajectories = convertvars(trajectories, 'RTIME', 'string');
% trajectories = convertvars(trajectories,'ICAO24', 'string');

% 
%this loop finds all the aircraft in the list 

% for row= 1:rows
%     icao24 = T1.icao24(row);
%     if ismember(icao24, a) == 1 %%checking if the aircrft was already found
%     else 
%         a(c)=icao24;
%         c=c+1;
%     end
% end   
%a = transpose(a); %%list of all the aircraft observed
size = length(a(:,1)); %%number of aircraft (rows in the array)
% 
%sorting out all data by plane 
for row=1:size
    icao24 = a(row);
    for row2= 1:rows %rows
        row2
        ac = string(T1.icao24(row2)); %%reads aircraft 
        if icao24 == ac %%checks all the aircraft entries and writes into table current aircraft stuff
            trajectories.TIME(d)=T1.time(row2);
            trajectories.RTIME(d)=string(T1.Column2(row2));
            trajectories.ICAO24(d)=icao24;
            trajectories.LAT(d)=T1.lat(row2);
            trajectories.LON(d)=T1.lon(row2);
            trajectories.VELOCITY(d)=T1.velocity(row2);
            d=d+1;
        end
    end         
end

% %% 
% while break_point<10000
%     initial_plot_val = break_point; %initial value used for plotting 
%     b = 0; %counter - how many entries in the table are for a specific aircraft
%     %finding all rows with the same aircraft number
%     a = trajectories.ICAO24(break_point); %%reading aircraft number
%     
%     for row = break_point:rows
%         if trajectories.ICAO24(row) == a
%             b=b+1;
%         end
%     end
% 
%     %%converts the time from unix to normal from recent trajectory 
%     unix_time = trajectories.TIME(break_point:(break_point+b-1));
%     normal_time = datetime(unix_time,'ConvertFrom', 'posixtime');
%     time_height = length(normal_time) %length of the normal time array
%      
%    %separating trajectories which correspond to the same aircraft based on
%     %time difference (assumption: if two consecutive entries are more than
%     %3 seconds apart, it is considered to be a separate trajectory
%     t1 = normal_time(1);
%     break_point2=1;
%     d=1; %row counter for t2
%     initial_plot_val = break_point2; %initial value used for plotting 
%     while break_point2<time_height
%            traj_length=0;
%            for row=d:time_height
%            t2 = normal_time(row);
%            dt = t2-t1; %checking the time difference
%            if dt<duration
%                 traj_length=traj_length+1;
%            end   
%            if dt>duration
%                 break_point2=row+break_point2-1 %breaks the trajectory
%                 t1=t2;
%                 trajectories.BREAK(row)=1;
%                 break;
%            end 
%            t1=t2;
%            d=d+1;
%            end
%            break_point2=time_height %point where the next trajectory of the same aircraft starts
%            trajectories.BREAK(time_height) = 1;
%         %plotting recently extracted trajectory
% %         final_plot_val = initial_plot_val+break_point2;
% %         lat = trajectories.LAT(initial_plot_val:final_plot_val);
% %         lon = trajectories.LON(initial_plot_val:final_plot_val);
% % 
% %         plot(lon, lat)
% %         xlim([-1.75122, -1.48]) %sets axis limits based on the selected airspace frame 
% %         ylim([52.10803, 52.27471])
% %         hold on
%         
%     end
%     
%     
% %     %plotting recently extracted trajectory
% %     final_plot_val = initial_plot_val+b-1;
% %     lat = trajectories.LAT(initial_plot_val:final_plot_val);
% %     lon = trajectories.LON(initial_plot_val:final_plot_val);
% % 
% %     plot(lon, lat)
% %     xlim([-1.75122, -1.48]) %sets axis limits based on the selected airspace frame 
% %     ylim([52.10803, 52.27471])
% %     hold on
%     break_point = break_point + b
% end