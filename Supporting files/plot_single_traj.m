%%This code plots a single trajectory (used for testing)
rows = height(ClustTraj);
count = 0;

for row = 1:rows
    if ClustTraj.TRAJECTORY(row) == 3
        count = count +1;
        row_num=row;
        x = ClustTraj.P_NORTH(row);
        y = ClustTraj.P_EAST(row);
        plot(x,y,'r.', 'MarkerSize', 5)
        hold on
        if ClustTraj.TRAJ_POINT_N(row) == 1
            text(x,y,'start');
            hold on
        end
    end
end

text(x,y,'finish');

hold on
%%plotting runways
lat1=[52.197463, 52.197447, 52.186530, 52.186519,52.197463 ];
lon1=[-1.615369, -1.614686  , -1.613438, -1.614142, -1.615369];
h1= [0,0,0,0,0];
%[x1,y1,z1]=geodetic2enu(lat1,lon1,h1,lat0,lon0,h0,wgs84); %transforming to local ENU coordinates
plot(lon1, lat1, "black", 'LineWidth',3)
hold on

%Runway 2
lat2=[52.192900, 52.192694, 52.186931, 52.187281,52.192900];
lon2=[-1.608952, -1.608280, -1.617580, -1.618084, -1.608952];
h2= [0,0,0,0,0];
%[x2,y2,z2]=geodetic2enu(lat2,lon2,h2,lat0,lon0,h0,wgs84); %transforming to local ENU coordinates
plot(lon2, lat2, "black", 'LineWidth',3)

title('Air Traffic Pattern at Wellesbourne Mountford Airfield, May 2022')
xlabel('x-axis, longitude')
ylabel('y-axis, latitude')