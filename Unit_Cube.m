clear all
clc
close all
axis equal
hold on
%==========================================================================
%                                DEFINITIONS
%==========================================================================
% 1. PURPOSE: Shows the position of the unit cube

% 2. OUTPUT
% - Plot of the Unit Cube

% 3. Reference:
% Modifed Date: 25/01/2022
% By : Canberk URUŞ

%==========================================================================
%                              SCRIPT BODY
%==========================================================================

%  Plot 3D Isometric view of the Cube.
figure(1);
axis ('equal');
view([1,1,1])
grid on
hold on
val_xlim = 2; val_ylim = 2; val_zlim = 2;
% xlim([-val_xlim val_xlim]); ylim([-val_ylim val_ylim]) ; zlim([0 val_zlim])

% Plot global coordinate system
GCSx = [0 1; 0 0; 0 0];
GCSy = [0 0; 0 1; 0 0];
GCSz = [0 0; 0 0; 0 1];
GCS = [GCSx;GCSy;GCSz];
quiver3 (GCSx(1,1), GCSx(2,1), GCSx(3,1), val_xlim*GCSx(1,2), GCSx(2,2), GCSx(3,2), 'k',LineWidth=2);
quiver3 (GCSy(1,1), GCSy(2,1), GCSy(3,1), GCSy(1,2), val_ylim*GCSy(2,2), GCSy(3,2), 'k',LineWidth=2);
quiver3 (GCSz(1,1), GCSz(2,1), GCSz(3,1), GCSz(1,2), GCSz(2,2), val_zlim*GCSz(3,2), 'k',LineWidth=2);
text(val_xlim*1.01,val_ylim*0.1,val_zlim*0.2,'X',FontWeight='bold')
text(0,val_ylim,1,'Y',FontWeight='bold')
text(0,0,val_zlim+0.1,'Z',FontWeight='bold')


windmill_cube = [-0.5,-0.5,-0.5,-0.5,-0.5,0.5,0.5,0.5,0.5,0.5,0.5,-0.5,-0.5,0.5,0.5,-0.5;
           0,0,1, 1,0,0,0,1,1,0,0,0,1,1,1,1;
        -0.5,0.5,0.5,-0.5,-0.5,-0.5,0.5,0.5,-0.5,-0.5,0.5,0.5,0.5,0.5,-0.5,-0.5;
           1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];

unit_cube = [-0.5,-0.5,-0.5,-0.5,-0.5,0.5,0.5,0.5,0.5,0.5,0.5,-0.5,-0.5,0.5,0.5,-0.5
                0,0,1,1,0,0,0,1,1,0,0,0,1,1,1,1
                0,1,1,0,0,0,1,1,0,0,1,1,1,1,0,0
                1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
                ];


plot3(unit_cube(1,:),unit_cube(2,:),unit_cube(3,:),color='blue',LineWidth=2);


