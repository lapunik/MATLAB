clear
close all

omega_0 = 2*pi*50;   % rad/sec
omega_c = 0.5;       % rad/sec

%% Step 1: Vytvoření dynamického modelu 

L_i = 1.2e-3;        % H
L_g = 0.7e-3;        % H
C_f = 9e-6;             % F
R_d = 8;             % Ohms

T_S = 1e-6;          % s

s = tf('s');
 T_D = (1/(1+T_S*s));
 G_F = ((1/(L_i*s))*(((s^2)+(s*R_d/L_g)+(1/(L_g*C_f)))/((s^2)+(s*((L_i*R_d+L_g*R_d)/(L_i*L_g)))+((L_i+L_g)/(L_i*L_g*C_f)))))*T_D;
% G_F = ((1/(L_i*s))*(((s^2)+(s*R_d/L_g)+(1/(L_g*C_f)))/((s^2)+(s*((L_i*R_d+L_g*R_d)/(L_i*L_g)))+((L_i+L_g)/(L_i*L_g*C_f)))));
% G_F.IODelay = T_S;

%% Step 1.5: Vytvoření dynamického modelu PR filtru


% Calculate ultimate gain and ultimate period
[Gm, Pm] = margin(G_F);
Ku = Gm;
Pu = Pm;

% Calculate Kp and Kr values using Ziegler-Nichols tuning method
K_P = 0.5*Ku;
K_I = 0.5*Ku/Pu;

% K_P = 6.8;
% K_I = 1498.72;

G_PR = K_P+(K_I*((2*omega_c*s)/((s^2)+(2*omega_c*s)+(omega_0^2))));

K_I1 = 1056.04;
K_I2 = 754.8;
K_I3 = 816.68;
  
G_Hk = @(h,KI) (KI*2*omega_c*s)/(((s^2)+(2*omega_c*s)+((h*omega_0)^2)));  

G_H = G_Hk(3,K_I1) + G_Hk(5,K_I2) + G_Hk(7,K_I3);

G_C = G_PR + G_H;

%% Step 2: Spuštění Control System Designeru  

% controlSystemDesigner();
% controlSystemDesigner(G_F,G_PR);
controlSystemDesigner(G_F,G_C);

% C = pid();

