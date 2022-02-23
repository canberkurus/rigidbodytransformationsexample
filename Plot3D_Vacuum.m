function Plot3D_Vacuum(design,rotation_flag,line_Width)
    %==========================================================================
    %                                DEFINITIONS
    %==========================================================================
    % 1. PURPOSE: Primitave Instancing and Rigid-Body Transformation example --
    % Vacuum Cleaner
    
    % 2. INPUT
    % Cube             : coordinates of a unit cube
    % Design parameters: required parameters (A,B,C,D,E,F,G,H,J,K,theta1,theta2)
    % Line Width
    % Rotation Flag
    
    % 3. REQUIERED FUNCTIONS
    % - scale3D             [2]    
    % - translate3D         [2] 
    % - rotate3Dx           [2]
    % - rotate3Dz           [2]
    % - degree_to_radian    [2]
    
    % 4. OUTPUT
    % Plot of the Vacuum Cleaner

    % 5. HELPFUL RESOURCES:
    % [1]. Dr.Recep M.Gorguluarslan,TOBB ETU, MAK420 Course Notes
    % [2]. Dr.Recep M.Gorguluarslan,TOBB ETU, MAK420 Windmill Example

    % 6. Reference:
    % Modifed Date: 25/01/2022
    % By : Canberk URUŞ

    %==========================================================================
    %                              FUNCTION BODY
    %==========================================================================
    
    % Decide rotation
    if strcmpi(rotation_flag,'no')
        design.theta1 = 0;
        design.theta2 = 0;
    end

    %  Requiered primitive shape: cube
    cube = [-0.5,-0.5,-0.5,-0.5,-0.5,0.5,0.5,0.5,0.5,0.5,0.5,-0.5,-0.5,0.5,0.5,-0.5
            0,0,1,1,0,0,0,1,1,0,0,0,1,1,1,1
            0,1,1,0,0,0,1,1,0,0,1,1,1,1,0,0
            1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
            ];

    %  Plot 3D Isometric view of the Vacuum.
    axis ('equal');
    view([1,1,1])
    grid on
    hold on
    %val_xlim = 1000; val_ylim = 1000; val_zlim = 1500;
    val_xlim = 300; val_ylim = 600; val_zlim = 1500;
    % xlim([-val_xlim val_xlim]); ylim([-val_ylim val_ylim]) ; zlim([0 val_zlim])
    
    % Plot global coordinate system
    GCSx = [0 1; 0 0; 0 0];
    GCSy = [0 0; 0 1; 0 0];
    GCSz = [0 0; 0 0; 0 1];
    %GCS = [GCSx;GCSy;GCSz];
    quiver3 (GCSx(1,1), GCSx(2,1), GCSx(3,1), val_xlim*GCSx(1,2), GCSx(2,2), GCSx(3,2), 'k',LineWidth=line_Width);
    quiver3 (GCSy(1,1), GCSy(2,1), GCSy(3,1), GCSy(1,2), val_ylim*GCSy(2,2), GCSy(3,2), 'k',LineWidth=line_Width);
    quiver3 (GCSz(1,1), GCSz(2,1), GCSz(3,1), GCSz(1,2), GCSz(2,2), val_zlim*GCSz(3,2), 'k',LineWidth=line_Width);

    text(val_xlim*1.01,val_ylim*0.1,val_zlim*0.1,'X')
    text(0,val_ylim,1,'Y')
    text(0,2,val_zlim-2,'Z')
    %%% Uncomment to create -X -Y axes
    %     GCSx = [0 -1; 0 0; 0 0];
    %     GCSy = [0 0; 0 -1; 0 0];
    %     quiver3 (GCSx(1,1), GCSx(2,1), GCSx(3,1), val_xlim*GCSx(1,2), GCSx(2,2), GCSx(3,2), 'k',LineWidth=line_Width);
    %     quiver3 (GCSy(1,1), GCSy(2,1), GCSy(3,1), GCSy(1,2), val_ylim*GCSy(2,2), GCSy(3,2), 'k',LineWidth=line_Width);
    %     text(-val_xlim*1.01,-val_ylim*0.1,-val_zlim*0.1,'-X')
    %     text(0,-val_ylim,1,'-Y')

    %======================================
    % PARTS LIST (RESPECTIVELY)
    % - Bottom
    % - Dirty Water (Can Rotate)
    % - Seperator
    % - Clean Water
    % - Handle (Constructed from 2 cubes)
    % - Cover (Can Rotate)
    %======================================

    %=======--===============================================================
    % Bottom 
    %=======--===============================================================
    S_b = scale3D(design.F,design.J,design.B);
    T_b = translate3D(0,0,0);
    b = T_b;
    bottom = b * S_b*cube;
    plot3(bottom(1,:),bottom(2,:),bottom(3,:),color='black',LineWidth=line_Width)
       
    
    %============
    % Dirty Water
    %============
    S_dw = scale3D(design.G,190,design.C);
    T_dw = translate3D(0,0,design.B*0.75);
    R_dw = rotate3Dx(degree_to_radian(design.theta1));
    dw = T_dw * R_dw;
    Dirty_Water = b * dw * S_dw * cube;
    plot3(Dirty_Water(1,:),Dirty_Water(2,:),Dirty_Water(3,:),color='red',LineWidth=line_Width)
    
    
    %==========
    % Seperator
    %==========
    S_s = scale3D(design.G,160,30);
    T_s = translate3D(0,0,design.C);
    %If rotation is needed,Rotation matrix should be added to the matrix below 
    %R_s = rotate3Dx(degree_to_radian(0));
    s = T_s;
    Seperator = b * dw * s * S_s * cube;
    plot3(Seperator(1,:),Seperator(2,:),Seperator(3,:),color='green',LineWidth=line_Width)
    
    
    %============
    % Clean Water
    %============
    S_cw = scale3D(design.G,160,design.D);
    T_cw = translate3D(0,0,30);
    %If rotation is needed,Rotation matrix should be added to the matrix below
    %R_cw = rotate3Dx(degree_to_radian(0));
    cw = T_cw;
    Clean_Water = b * dw * s * cw * S_cw * cube;
    plot3(Clean_Water(1,:),Clean_Water(2,:),Clean_Water(3,:),color='cyan',LineWidth=line_Width)
    
    
    %=====================--=================================
    % Handle (Lower-part)
    %=====================--=================================
    S_hl = scale3D(design.H,60,design.D+design.C+30);
    T_hl = translate3D(0,0,0); %Notice there is no actual translation applied.
    %R_hl = rotate3Dx(degree_to_radian(design.theta1));
    hl = T_hl;
    Handle_lower = b* dw * hl * S_hl * cube;
    plot3(Handle_lower(1,:),Handle_lower(2,:),Handle_lower(3,:),color='blue',LineWidth=line_Width)
    
    %====================
    % Handle (Upper-part)
    %====================
    Handle_upper_height = design.A-(design.D+design.C+design.B*0.75+30);
    S_hu = scale3D(design.H,design.K,Handle_upper_height);
    T_hu = translate3D(0,0,design.D+design.C+30);
    %If rotation is needed,Rotation matrix should be added to the matrix below
    %R_hu = rotate3Dx(degree_to_radian(0));
    hu = T_hu;
    Handle_upper = b * dw * hl * hu * S_hu * cube;
    plot3(Handle_upper(1,:),Handle_upper(2,:),Handle_upper(3,:),color='blue',LineWidth=line_Width)   
   

    %=============
    % Cover 
    %=============
    S_c = scale3D(design.H,30,design.E);
    T_c = translate3D(-design.H/2,design.K,40);
    R_c = rotate3Dz(degree_to_radian(design.theta2));
    T = translate3D(0.5,-1,0);
    c = T_c * R_c;
    Cover = b * dw * hl * hu * c * S_c * (T*cube);
    plot3(Cover(1,:),Cover(2,:),Cover(3,:),color='magenta',LineWidth=line_Width)
   
end