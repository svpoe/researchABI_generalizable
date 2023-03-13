% OBJECTIVE: By calling a function paddlefunc, this script will plot the position of auditory brainstem implant electrode arrays/paddles in 3D space. 
    % A color code will allow for comparison between ABI performance outcomes (ABI recipient's speech perception) and position of the electrode array. 
    % ABI paddle positions will be compared between two ABI cohorts 1 & 2.
    % Paddle position is measured in relation to a chosen landmark, the
    % basion. 
% Measurements  were performed from 3D CT scan reconstruction. Measurements
    % include horizontal distance from the basion (D2) in the lateral and
    % posterior views (D2L, D2P) and vertical distance from the basion (D1) which is the same
    % in lateral and posterior views). All measurements were performed from
    % the proximal array tip (connected to wire) and the distal array tip
% Inputs: 
    % A) Proximal array position (point x,y,z) --> Posterior D2, Lateral
    % D2 and D1. 
    % B) Distal array position (point x1,y1,z1) 
    % C) selected array radius (c)
% Strategy: 
    % Create a rectangular representation of the electrode array/paddle
    % using the midline coordinates of the proximal and distal array
    % tips
    % This code accounts for rotation in x and y, but does not account for
    % rotation in z (z rotation unknown)

% loading skull background

clear; clc
% 
clearvars -except gm

if ~exist('gm', 'var')

    model = createpde(3);

    gm = importGeometry(model, 'Skull_Smooth.stl');
    
end

filename = 'blank.xlsx';          % loading excel data
data = readmatrix(filename);
fig = figure; hold on; grid on;
axis('equal')
title('3D position of ABI arrays - Both Centers','FontSize',12)
title('Center 1 3D position of ABI arrays')
%title('Center 2 3D position of ABI arrays','FontSize',12)

%basion location
basion = plot3(0,0,0,'Marker','s','MarkerSize',12, 'MarkerEdgeColor','k','MarkerFaceColor','r');

xlabel('D2 (P)')
ylabel('D2 (L)')
zlabel('D1')


var = 1108/14.5;
%var = 1

for i = 1:size(data,1);     % create a paddle for each patient (i = patient)
    d2pP = data(i,9) * var; 
    d2dP = data(i,11)* var;
    d2pL = data(i,8)* var;
    d2dL = data(i,10)* var;
    d1p =  data(i,6)* var;
    d1d = data(i,7)* var;
    Rank = data(i,3);
    Center = data(i,2);
    
    paddlefunc(d2pP, d2dP, d2pL, d2dL, d1p, d1d, Rank, Center);     % calling function paddlefunc from seperate script

end

% creating invisible points in different colors to make color key in legend 
g_point = plot3(NaN,NaN,NaN,'g');
c_point = plot3(NaN,NaN,NaN,'c');
m_point = plot3(NaN,NaN,NaN,'m');
r_point = plot3(NaN,NaN,NaN,'r');
k_point = plot3(NaN,NaN,NaN,'k');

%creating a line to make dashed and solid MEE and MEE keys in legend
t1 = [NaN,NaN];
t2 = [NaN,NaN];
t3 = [NaN,NaN];
Center1_line = plot3(t1,t2,t3,'--k');
Center2_line = plot3(t1,t2,t3,'k');

%legend([g_point,c_point,m_point,r_point,k_point],{'OS monosyllabic/CNC', 'vowel/monosyllabic', 'number/spondee', 'number/pattern', 'some perception'});
legend([Center1_line, Center2_line, basion, g_point,c_point,m_point,r_point,k_point],{'Center 1 (dashed line)', 'Center 2 (solid line)', 'basion (reference point)','Speech perception score 7 & 6: Open set monosyllables/CNC', 'Score 5 & 4: vowels/ consonants/ ESP monosyllables/ ESP spondee >50%', 'Score 3: numbers > 50% /spondee <50%', 'Score 2: numbers < 50% /pattern > 50%', 'Score 1: some perception/ pattern < 50%'});
lgd.FontSize = 20;

pdegplot(gm,'FaceAlpha',0.2)

%axis off
% Setting view 
% v = [37.5 37.5];
% view(v)