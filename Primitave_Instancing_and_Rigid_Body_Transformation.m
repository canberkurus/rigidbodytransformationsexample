clear all
clc
close all
axis equal
hold on
%==========================================================================
%                                DEFINITIONS
%==========================================================================
% 1. PURPOSE: Primitave Instancing and Rigid-Body Transformation example --
% Vacuum Cleaner

% 2. INPUT PARAMETERS
% - Design parameters: required parameters in a struct (for 3 designs)

% 3. REQUIRED FUNCTION
% - Plot3D_Vacuum 

% 4. OUTPUT
% - Plot of the Vacuum Cleaner

% 5. HELPFUL RESOURCES:
% [1]. Dr.Recep M.Gorguluarslan,TOBB ETU, MAK420 Course Notes
% [2]. Dr.Recep M.Gorguluarslan,TOBB ETU, MAK420 Windmill Example

% 6. Reference:
% Modifed Date: 25/01/2022
% By : Canberk URUŞ

%==========================================================================
%                              SCRIPT BODY
%==========================================================================


%Structs containing parameters for the vacuum design
design1 = struct('A',1000, 'B',160, 'C',220, 'D',300, 'E',110, 'F',220, 'G',150, 'H',80, 'J',340, 'K',140, 'theta1',30, 'theta2',75);
design2 = struct('A',1200, 'B',180, 'C',250, 'D',310, 'E',100, 'F',260, 'G',180, 'H',85, 'J',410, 'K',150, 'theta1',45, 'theta2',20);
design3 = struct('A',800 , 'B',150, 'C',200, 'D',250, 'E',100, 'F',210, 'G',150, 'H',75, 'J',320, 'K',120, 'theta1',60, 'theta2',30);
designs = [design1,design2,design3];

line_Width = 1; % Can be used to make thicker lines (For visuality)
rotation_flag = 'no'; % 'yes' to rotate, 'no' to not.
%This for loop plots each design in different windows
for i = 1:length(designs)
    thisfig = figure(i);
    Plot3D_Vacuum(designs(i),rotation_flag,line_Width);
end










