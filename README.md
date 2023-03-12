# Final_Year_Project
MATLAB code for my fyp. For extracting and modelling aircraft trajectories

In the main folder there are 4 main files which need to be used in the following order:
1. DataGrouping_Aircraft_1.m groups raw extracted data based on the aircraft and writes results in a table T1 from an initial table T
2. ExtractingTrajectories_2.m: identifies separate trajectories based on the time difference. It adds 1 or 0 to a column BREAK in the trajectories data file next to each data entry to identify when a new trajectory starts (1). 0 means the data point belongs to the same trajectory 
3. PlottingTrajectories_3.m: file filters the relevant trajectories firstly by checking if it’s not a helicopter and then checking if it passes one of the runways and plots individual trajectories. It also counts how many trajectories have been plotted. The filtered trajectories are extracted into a separate table called “filtered_trajectories” which is further used for trajectory clustering   
4. Trajectory_Clustering_4.m: clusters trajectories rom ClustTraj file based on the runway. The file is divided in the following sections:
    4.1. First and last coordinates of each trajectory are extracted which will be used as features
    4.2. It is identified whether first or last coordinate is closer to the runway (will be used as a feature in the further steps)
    4.3. Plots trajectory first/last points based on which one is closer to the runway
    4.4. Finds to which runway a trajectory corresponds to based on the shortest distance to all the runway points 
    4.5. Extracts trajectories which correspond to runway 1 and 2
    4.6. Plots trajectories which correspond to runway 1 and 2 
