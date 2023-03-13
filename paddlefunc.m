%FINDING 4 COORDINATES to draw circumference of rectangle. Starting  line
    %is the midline of the rectangle from distal and proximal array tip
    %coordinates

function output = paddlefunc(D2pP, D2dP, D2pL, D2dL, D1p, D1d, rank, center)

%c = 1108*0.2;    % chosen radius of array rectangle (short side)
%c = 0.2;
c = 15;

theta = atan((D2dL - D2pL)/(D2dP - D2pP)); %atan((y1-y)/(x1-x))
a = c*sin(theta);    % displacement in posterior horizontal (to find corner x coord)
b = c*cos(theta);    % displacement in lateral horizontal (to find corner y coord)

%Lateral & Posterior
% Corner 1 (proximal) 
x1 = D2pP+a;      % Posterior proximal coordinate corner1 --> proximal corner coordinates (assume z coordinate does not change)
y1 = D2pL-b;      % Lateral proximal coordinate corner1
% Corner 2 (proximal)
x2 = D2pP-a;      % Posterior proximal coordinate corner2
y2 = D2pL+b;      % Lateral proximal coordinate corner2
% Corner 3 (distal)
x3 = D2dP+a;     % Posterior distal coordinate corner3
y3 = D2dL-b;     % Lateral distal coordinate corner3
% Corner 4 (distal) 
x4 = D2dP-a;     % Posterior distal coordinate corner4
y4 = D2dL+b;     % Lateral distal coordinate corner4

%Vertical position
% Corners 1 and 2 (proximal) 
z12 = D1p;      % Vertical proximal coordinate corners 1 and 2
% Corners 3 and 4 (distal) 
z34 = D1d;      % Vertical distal coordinate corners 3 and 4

%plotting the array's 4 corners & connecting back to point 1
i = [x1,x2,x4,x3,x1];
j = [y1,y2,y4,y3,y1];
k = [z12,z12,z34,z34,z12];

% Plotting paddle with color code to show speech perception rank
if center == 1
      plot3(D2pP,D2pL,D1p,'Marker','.','MarkerSize',15, 'MarkerEdgeColor','k','MarkerFaceColor','k'); % plotting the proximal tip given coordinate 
    if rank == 7
        plot3(i,j,k,'--g','LineWidth',1);
    elseif rank == 6
        plot3(i,j,k,'--g','LineWidth',1);
    elseif rank == 5
        plot3(i,j,k,'--c','LineWidth',1);
    elseif rank == 4
        plot3(i,j,k,'--c','LineWidth',1);
    elseif rank == 3
        plot3(i,j,k,'--m','LineWidth',1);
    elseif rank == 2
        plot3(i,j,k,'--r','LineWidth',1);
    elseif rank == 1
        plot3(i,j,k,'--k','LineWidth',1);
    end
else % center = 2 
    plot3(D2pP,D2pL,D1p,'Marker','.','MarkerSize',15, 'MarkerEdgeColor','k','MarkerFaceColor','k'); % plotting the proximal tip given coordinate 
    if rank == 7
        plot3(i,j,k,'g','LineWidth', 1);
    elseif rank == 6
        plot3(i,j,k,'g','LineWidth', 1);
    elseif rank == 5
        plot3(i,j,k,'c','LineWidth', 1);
    elseif rank == 4
        plot3(i,j,k,'c','LineWidth', 1);
    elseif rank == 3
        plot3(i,j,k,'m','LineWidth', 1);
    elseif rank == 2
        plot3(i,j,k,'r','LineWidth', 1);
    elseif rank == 1
        plot3(i,j,k,'k','LineWidth', 1);
    end
end

grid on
axis('equal')
hold on

end
