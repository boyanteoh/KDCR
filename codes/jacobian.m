%% RA for May 11
%% Used for Figure 3.13 SCARA manipulator

% 1. Define your robot parameters (lengths in meters)
l1 = 1.2; 
l2 = 0.8;

% 2. Define current joint positions (theta in radians)
t1 = deg2rad(40);
t2 = deg2rad(-79);
% Note: t3 and t4 don't affect the Jacobian entries in this specific SCARA model

% 3. Define joint velocities (theta dot in rad/s or m/s)
dt1 = 0.25;
dt2 = -0.15;
dt3 = 0.35;
dt4 = 0.08;

d_theta = [dt1; dt2; dt3; dt4];

% 4. Construct the Spatial Jacobian (J_s) based on your image
% The matrix is 6x4 (6-twist components, 4 joints)
J_s = [
    0, l1*cos(t1), l1*cos(t1) + l2*cos(t1+t2), 0;  % vx
    0, l1*sin(t1), l1*sin(t1) + l2*sin(t1+t2), 0;  % vy
    0,      0,               0,                1;  % vz
    0,      0,               0,                0;  % wx
    0,      0,               0,                0;  % wy
    1,      1,               1,                0   % wz
];

% 5. Calculate the Spatial Twist
V_s = vpa(J_s * d_theta);

% Display the result
disp('The Spatial Twist (Vs) is:');
disp(V_s);
