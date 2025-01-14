%Mục tiêu của đoạn mã này là phân tích các điểm đặc trưng trên các dạng sóng này và tính toán các chỉ số liên quan
function [error_code,ppg_feature] = ppg_feature_calculation(error_code,sample_time,PPG_Loc,VPG_Loc,APG_Loc,ppg,vpg,apg)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ppg_feature_calculation.m
% Defination and Calculation of PPG Features
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input:
%error_code————Extracted PPG feature points or not. ( 0 :YES, 1: NO)
%sample_time————The sample time of PPG signal
%PPG_Loc————The location of PPG feature points
%VPG_Loc————The location of VPG feature points
%APG_Loc————The location of APG feature points
%ppg————PPG waveform of two adjacent heartbeat cycles
%vpg————VPG waveform of two adjacent heartbeat cycles
%apg————APG waveform of two adjacent heartbeat cycles
%% Output:
%error_code————Updated error code for calculation. ( 0 :YES, 1: NO)
%ppg_feature————A Structure of PPG features
%% Dilive PPG feature point location to variables
num_O = PPG_Loc(1);
num_S = PPG_Loc(2);
num_N = PPG_Loc(3);
num_D = PPG_Loc(4);
num_O_next = PPG_Loc(5);
num_w = VPG_Loc(1);
num_y = VPG_Loc(2);
num_z = VPG_Loc(3);
num_w_next = VPG_Loc(4);
num_a = APG_Loc(1);
num_b = APG_Loc(2);
num_c = APG_Loc(3);
num_d = APG_Loc(4);
num_e = APG_Loc(5);
num_b2 = APG_Loc(6);
ppg_feature.Total = zeros(1,125);
if error_code == 0
%% PPG Feature Type 1: Time Span
Tm_Oa = (num_a - num_O)* sample_time;
Tm_Ow = (num_w - num_O)* sample_time;
Tm_Ob = (num_b - num_O)* sample_time;
Tm_OS = (num_S - num_O)* sample_time;
Tm_Oc = (num_c - num_O)* sample_time;
Tm_Oy = (num_y - num_O)* sample_time;
Tm_ON = (num_N - num_O)* sample_time;
Tm_OD = (num_D - num_O)* sample_time;
Tss = (num_w_next - num_w)*sample_time;
Tm_Sc = (num_c-num_S)* sample_time;
Tm_Sd = (num_d-num_S)* sample_time;
Tm_Se = (num_e-num_S)* sample_time;
Tm_SD = (num_D - num_S)* sample_time;
Tm_ND = (num_D - num_N)* sample_time;
Tm_bb2 = (num_b2 - num_b)* sample_time;
Tm_bc = (num_c-num_b)* sample_time;
Tm_bd = (num_d-num_b)* sample_time;
Tm_wb = (num_b-num_w)* sample_time;
Tm_wS = (num_S-num_w)* sample_time;
Tm_wc = (num_c-num_w)* sample_time;
Tm_wd = (num_d-num_w)* sample_time;
Tm_wz = (num_z - num_w)* sample_time;
Tm_ac = (num_c -num_a)* sample_time;
ppg_feature.TimeSpan(1) = Tm_Oa;
ppg_feature.TimeSpan(2) = Tm_Ow;
ppg_feature.TimeSpan(3) = Tm_Ob;
ppg_feature.TimeSpan(4) = Tm_OS;
ppg_feature.TimeSpan(5) = Tm_Oc;
ppg_feature.TimeSpan(6) = Tm_Oy;
ppg_feature.TimeSpan(7) = Tm_ON;
ppg_feature.TimeSpan(8) = Tm_OD;
ppg_feature.TimeSpan(9) = Tss;
ppg_feature.TimeSpan(10) = Tm_Sc;
ppg_feature.TimeSpan(11) = Tm_Sd;
ppg_feature.TimeSpan(12) = Tm_Se;
ppg_feature.TimeSpan(13) = Tm_SD;
ppg_feature.TimeSpan(14) = Tm_ND;
ppg_feature.TimeSpan(15) = Tm_bb2;
ppg_feature.TimeSpan(16) = Tm_bc;
ppg_feature.TimeSpan(17) = Tm_bd;
ppg_feature.TimeSpan(18) = Tm_wb;
ppg_feature.TimeSpan(19) = Tm_wS;
ppg_feature.TimeSpan(20) = Tm_wc;
ppg_feature.TimeSpan(21) = Tm_wd;
ppg_feature.TimeSpan(22) = Tm_wz;
ppg_feature.TimeSpan(23) = Tm_ac;
%% PPG Feature Type 2: Features of PPG Amplitude
AMS = ppg(num_S) - ppg(num_O);
Am_Oa = ppg(num_a) - ppg(num_O);
Am_Ow = ppg(num_w) - ppg(num_O);
Am_Ob = ppg(num_b) - ppg(num_O);
Am_Oc = ppg(num_c) - ppg(num_O);
Am_Oy = ppg(num_y) - ppg(num_O);
Am_OO2 = ppg(num_O_next) - ppg(num_O);
Am_OD = ppg(num_D) - ppg(num_O);
Am_ON = ppg(num_N) - ppg(num_O);
Am_NS = ppg(num_S) - ppg(num_N);
AI_ON_AMS = Am_ON/AMS;
AI_OD_AMS = Am_OD/AMS;
AI_NS_AMS = Am_NS/AMS;
AI_DS_AMS = (ppg(num_S) - ppg(num_D))/AMS;
ppg_feature.Amplitude(1) = AMS;
ppg_feature.Amplitude(2) = Am_Oa;
ppg_feature.Amplitude(3) = Am_Ow;
ppg_feature.Amplitude(4) = Am_Ob;
ppg_feature.Amplitude(5) = Am_Oc;
ppg_feature.Amplitude(6) = Am_Oy;
ppg_feature.Amplitude(7) = Am_OO2;
ppg_feature.Amplitude(8) = Am_OD;
ppg_feature.Amplitude(9) = Am_ON;
ppg_feature.Amplitude(10) = Am_NS;
ppg_feature.Amplitude(11) = AI_ON_AMS;
ppg_feature.Amplitude(12) = AI_OD_AMS;
ppg_feature.Amplitude(13) = AI_NS_AMS;
ppg_feature.Amplitude(14) = AI_DS_AMS;
%% PPG Feature Type 3: Features of VPG and APG
w = vpg(num_w);
y = vpg(num_y);
z = vpg(num_z);
a = apg(num_a);
b = apg(num_b);
 c = apg(num_c);
d = apg(num_d);
 e = apg(num_e);
 cc = vpg(num_c);
 dd = vpg(num_d);
 r_z_w = z/w;
 r_y_w = y/w;
 r_cc_w = cc/w;
 r_dd_w = dd/w;
 r_b_a = b/a;
 r_c_a = c/a;
 r_d_a = d/a;
 r_e_a = e/a;
 r_bcde_a =(b-c-d-e)/a;
 r_bcd_a = (b-c-d)/a;

ppg_feature.VpgApg(1) = w;
 ppg_feature.VpgApg(2) = y;
 ppg_feature.VpgApg(3) = z;
 ppg_feature.VpgApg(4) = a;
 ppg_feature.VpgApg(5) = b;
 ppg_feature.VpgApg(6) = c;
 ppg_feature.VpgApg(7) = d;
 ppg_feature.VpgApg(8) = e;
 ppg_feature.VpgApg(9) = cc;
 ppg_feature.VpgApg(10) = dd;
 ppg_feature.VpgApg(11) = r_z_w;
 ppg_feature.VpgApg(12) = r_y_w;
 ppg_feature.VpgApg(13) = r_cc_w;
 ppg_feature.VpgApg(14) = r_dd_w;
 ppg_feature.VpgApg(15) = r_b_a;
 ppg_feature.VpgApg(16) = r_c_a;
 ppg_feature.VpgApg(17) = r_d_a;
 ppg_feature.VpgApg(18) = r_e_a;
 ppg_feature.VpgApg(19) = r_bcde_a;
 ppg_feature.VpgApg(20) = r_bcd_a;
%% PPG Feature Type 4: Waveform Area
S_OO = area_calculate(ppg(num_O),num_O,num_O_next,ppg);
S_OS = area_calculate(ppg(num_O),num_O,num_S,ppg);
S_Oc = area_calculate(ppg(num_O),num_O,num_c,ppg);
S_ON = area_calculate(ppg(num_O),num_O,num_N,ppg);
ppg_feature.WavefromArea(1) = S_OO;
ppg_feature.WavefromArea(2) = S_OS;
ppg_feature.WavefromArea(3) = S_Oc;
ppg_feature.WavefromArea(4) = S_ON;
%% PPG Feature Type 5: Power Area
power_OS_ppg = power_area_calculate(ppg(num_O),num_O, num_S,ppg);
power_wS_ppg = power_area_calculate(ppg(num_O),num_w, num_S,ppg);
power_Sc_ppg = power_area_calculate(ppg(num_O),num_S, num_c,ppg);
power_Sd_ppg = power_area_calculate(ppg(num_O),num_S, num_d,ppg);
power_OS_vpg = power_area_calculate(0,num_O,num_S,vpg);
power_wS_vpg = power_area_calculate(0,num_w,num_S,vpg);
power_Sc_vpg = power_area_calculate(0,num_S,num_c,vpg);
power_Sd_vpg = power_area_calculate(0,num_S,num_d,vpg);
power_OS_apg = power_area_calculate(0,num_O,num_S,apg);
power_wS_apg = power_area_calculate(0,num_w,num_S,apg);
power_Sc_apg = power_area_calculate(0,num_S,num_c,apg);
power_Sd_apg = power_area_calculate(0,num_S,num_d,apg);
power_OO_ppg = power_area_calculate(ppg(num_O),num_O,num_O_next,ppg);
power_OO_vpg = power_area_calculate(0,num_O,num_O_next,vpg);
power_OO_apg = power_area_calculate(0,num_O,num_O_next,apg);
ppg_feature.PowerArea(1) = power_OS_ppg;
ppg_feature.PowerArea(2) = power_wS_ppg;
ppg_feature.PowerArea(3) = power_Sc_ppg;
ppg_feature.PowerArea(4) = power_Sd_ppg;
ppg_feature.PowerArea(5) = power_OS_vpg;
ppg_feature.PowerArea(6) = power_wS_vpg;
ppg_feature.PowerArea(7) = power_Sc_vpg;
ppg_feature.PowerArea(8) = power_Sd_vpg;
ppg_feature.PowerArea(9) = power_OS_apg;
ppg_feature.PowerArea(10) = power_wS_apg;
ppg_feature.PowerArea(11) = power_Sc_apg;
ppg_feature.PowerArea(12) = power_Sd_apg;
ppg_feature.PowerArea(13) = power_OO_ppg;
ppg_feature.PowerArea(14) = power_OO_vpg;
ppg_feature.PowerArea(15) = power_OO_apg;
%% PPG Feature Type 6: Ratio
r_Tm_Oa_Tss = Tm_Oa/Tss;
r_Tm_Ow_Tss = Tm_Ow/Tss;
r_Tm_Ob_Tss = Tm_Ob/Tss;
r_Tm_OS_Tss = Tm_OS/Tss;
r_Tm_Oc_Tss = Tm_Oc/Tss;
r_Tm_Oy_Tss = Tm_Oy/Tss;
r_Tm_ON_Tss = Tm_ON/Tss;
r_Tm_wz_Tss = Tm_wz/Tss;
r_Tm_SD_Tss = Tm_SD/Tss;
r_Tm_bb2_Tss = Tm_bb2/Tss;
r_Oa_AMS = Am_Oa/AMS;
r_Ow_AMS = Am_Ow/AMS;
r_Ob_AMS = Am_Ob/AMS;
r_Oc_AMS = Am_Oc/AMS;
r_Oy_AMS = Am_Oy/AMS;
r_OO2_AMS = Am_OO2/AMS;
S_NO2 = area_calculate(ppg(num_O),num_N,num_O_next,ppg);
IPA = S_NO2/S_ON;
PIR = ppg(num_S)/ppg(num_O);
r_SOS_SOO = S_OS/S_OO;
r_SOc_SOO = S_Oc/S_OO;
r_SON_SOO = S_ON/S_OO;
r_OS_OO_ppg = power_OS_ppg/power_OO_ppg;
r_wS_OO_ppg = power_wS_ppg/power_OO_ppg;
r_Sc_OO_ppg = power_Sc_ppg/power_OO_ppg;
r_Sd_OO_ppg = power_Sd_ppg/power_OO_ppg;
r_OS_OO_vpg = power_OS_vpg/power_OO_vpg;
r_wS_OO_vpg = power_wS_vpg/power_OO_vpg;
r_Sc_OO_vpg = power_Sc_vpg/power_OO_vpg;
r_Sd_OO_vpg = power_Sd_vpg/power_OO_vpg;
r_OS_OO_apg = power_OS_apg/power_OO_apg;
r_wS_OO_apg = power_wS_apg/power_OO_apg;
r_Sc_OO_apg = power_Sc_apg/power_OO_apg;
r_Sd_OO_apg = power_Sd_apg/power_OO_apg;
ppg_feature.Ratio(1) = r_Tm_Oa_Tss;
ppg_feature.Ratio(2) = r_Tm_Ow_Tss;
ppg_feature.Ratio(3) = r_Tm_Ob_Tss;
ppg_feature.Ratio(4) = r_Tm_OS_Tss;
ppg_feature.Ratio(5) = r_Tm_Oc_Tss;
ppg_feature.Ratio(6) = r_Tm_Oy_Tss;
ppg_feature.Ratio(7) = r_Tm_ON_Tss;
ppg_feature.Ratio(8) = r_Tm_wz_Tss;
ppg_feature.Ratio(9) = r_Tm_SD_Tss;
ppg_feature.Ratio(10) = r_Tm_bb2_Tss;
ppg_feature.Ratio(11) = r_Oa_AMS;
ppg_feature.Ratio(12) = r_Ow_AMS;
ppg_feature.Ratio(13) = r_Ob_AMS;
ppg_feature.Ratio(14) = r_Oc_AMS;
ppg_feature.Ratio(15) = r_Oy_AMS;
ppg_feature.Ratio(16) = r_OO2_AMS;
ppg_feature.Ratio(17) = IPA;
ppg_feature.Ratio(18) = PIR;
ppg_feature.Ratio(19) = r_SOS_SOO;
ppg_feature.Ratio(20) = r_SOc_SOO;
ppg_feature.Ratio(21) = r_SON_SOO;
 ppg_feature.Ratio(22) = r_OS_OO_ppg;
 ppg_feature.Ratio(23) = r_wS_OO_ppg;
 ppg_feature.Ratio(24) = r_Sc_OO_ppg;
 ppg_feature.Ratio(25) = r_Sd_OO_ppg;
 ppg_feature.Ratio(26) = r_OS_OO_vpg;
 ppg_feature.Ratio(27) = r_wS_OO_vpg;
 ppg_feature.Ratio(28) = r_Sc_OO_vpg;
 ppg_feature.Ratio(29) = r_Sd_OO_vpg;
 ppg_feature.Ratio(30) = r_OS_OO_apg;
 ppg_feature.Ratio(31) = r_wS_OO_apg;
 ppg_feature.Ratio(32) = r_Sc_OO_apg;
 ppg_feature.Ratio(33) = r_Sd_OO_apg;
 %% PPG Feature Type 7: Slope
m_Sc_ppg = (ppg(num_c)-ppg(num_S))/((num_c -num_S)* sample_time);
m_Sd_ppg = (ppg(num_d)-ppg(num_S))/((num_d -num_S)* sample_time);
m_bS_ppg = (ppg(num_S)-ppg(num_b))/((num_S -num_b)* sample_time);
m_bc_ppg = (ppg(num_c)-ppg(num_b))/((num_c -num_b)* sample_time);
m_bd_ppg = (ppg(num_d)-ppg(num_b))/((num_d -num_b)* sample_time);
m_wS_ppg = (ppg(num_S)-ppg(num_w))/((num_S -num_w)* sample_time);
m_OS_ppg = (ppg(num_S)-ppg(num_O))/((num_S -num_O)* sample_time);
m_ab_ppg = (ppg(num_b)-ppg(num_a))/((num_b -num_a)* sample_time);
m_ab_apg = (apg(num_b)-apg(num_a))/((num_b -num_a)* sample_time);
m_bS_apg = (apg(num_S)-apg(num_b))/((num_S -num_b)* sample_time);
m_bc_apg = (apg(num_c)-apg(num_b))/((num_c -num_b)* sample_time);
m_bd_apg = (apg(num_d)-apg(num_b))/((num_d -num_b)* sample_time);
m_be_apg = (apg(num_e)-apg(num_b))/((num_e -num_b)* sample_time);
m_Sc_apg = (apg(num_c)-apg(num_S))/((num_c -num_S)* sample_time);
m_wS_apg = (apg(num_S)-apg(num_w))/((num_S -num_w)* sample_time);
m_OS_apg = (apg(num_S)-apg(num_O))/((num_S -num_O)* sample_time);
ppg_feature.Slope(1) = m_Sc_ppg;
ppg_feature.Slope(2) = m_Sd_ppg;
ppg_feature.Slope(3) = m_bS_ppg;
ppg_feature.Slope(4) = m_bc_ppg;
ppg_feature.Slope(5) = m_bd_ppg;
ppg_feature.Slope(6) = m_wS_ppg;
ppg_feature.Slope(7) = m_OS_ppg;
ppg_feature.Slope(8) = m_ab_ppg;
ppg_feature.Slope(9) = m_ab_apg;
ppg_feature.Slope(10) = m_bS_apg;
ppg_feature.Slope(11) = m_bc_apg;
ppg_feature.Slope(12) = m_bd_apg;
ppg_feature.Slope(13) = m_be_apg;
ppg_feature.Slope(14) = m_Sc_apg;
ppg_feature.Slope(15) = m_wS_apg;
ppg_feature.Slope(16) = m_OS_apg;
%% Data Exclusion Stardard :
%If the amplitude of ’O’ in next heartbeat cycle is more than 50% baseline , the error code will be set to 1
if 0.50 < abs(r_O2_AMS)
error_code = 1;
 ppg_feature.Total = zeros(1,125);
 else
ppg_feature.Total = [ppg_feature.TimeSpan ppg_feature.Amplitude ppg_feature.VpgApg ppg_feature.WavefromArea ppg_feature.PowerArea ppg_feature.Ratio ppg_feature.Slope];
end
end
end
