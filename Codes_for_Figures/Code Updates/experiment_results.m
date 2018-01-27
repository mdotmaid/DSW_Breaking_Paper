clear;close all; clc

load('fig_quants.mat')
trials = 8:22;
dsw = dsw(trials);
in  = in(trials);
out = out(trials);
close all
% ----- figure settings -----
w    = 2.5;
h    = 2.5;
fs   = 8;
lw   = 1;
mark = {'o','d','^'};
ms   = 4;
mc   = {[ 0     0  200 ]./255,... % blue
        [ 0   100    0 ]./255,... % green
        [ 200   0  200 ]./255};   % pink

% ----- stucts to vectors -----
A    = [dsw.A0]';
zb   = [out.zb]';
tbi  = [in.tb]';
tbo  = [out.tb]';

% ----- sort trials -----
i15  = find([dsw.zb] == 15);
i20  = find([dsw.zb] == 20);
i25  = find([dsw.zb] == 25);

% ----- get error bounds -----
[zerr,terr] = getError(dsw,in);

%% Figure 1: Break Height
f1 = figure; hold on;
    errorbar(A,zb,zerr,'r.');
    plot([0,5],[in(i15(1)).zb,in(i15(end)).zb],'--',...
                        'color',mc{1},...
                        'linewidth',lw)
    p1 = plot(A(i15),zb(i15),mark{1},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{1},...
                        'markersize',ms);
    plot([0,5],[in(i20(1)).zb,in(i20(end)).zb],'--',...
                        'color',mc{2},...
                        'linewidth',lw)
    p2 = plot(A(i20),zb(i20),mark{2},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{2},...
                        'markersize',ms);
    plot([0,5],[in(i25(1)).zb,in(i25(end)).zb],'--',...
                        'color',mc{3},...
                        'linewidth',lw)
    p3 = plot(A(i25),zb(i25),mark{3},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{3},...
                        'markersize',ms);
 legstr = {sprintf('$z_b = %0.0f~cm$',in(i15(1)).zb),...
           sprintf('$z_b = %0.0f~cm$',in(i20(1)).zb),...
           sprintf('$z_b = %0.0f~cm$',in(i25(1)).zb)};
 legend([p1,p2,p3],legstr,'interpreter','latex',...
                           'fontsize',fs,...
                           'Orientation','vertical',...
                           'location','northeast',...
                           'box','off')
 set(gca,'xlim',[min(A)-0.5,max(A)+0.5],...\
         'xtick',[min(A(i15))-0.5:0.5:max(A(i15))+0.5],...
         'ylim',[min([in.zb])-2,max([in.zb])+10],...
         'ytick',[min([in.zb]):5:max([in.zb])+5],...
         'PlotBoxAspectRatio',[1,1,1],...
         'TickLabelInterpreter','latex',...
         'fontsize',fs,...
         'box','on')
 xlabel('$A_0$','fontsize',fs+2,...
                'interpreter','latex')
 ylabel('$z_b~[cm]$','fontsize',fs+2,...
                'interpreter','latex')
 savePlot(f1,'BreakHeight',w,h)

 
 %% Figure 2: Break Hight Relative Error
 f2 = figure;hold on;
 zberr = abs(zb - [in.zb]')./[in.zb]' * 100;
    p1 = plot(A(i15),zberr(i15),mark{1},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{1},...
                        'markersize',ms);
    p2 = plot(A(i20),zberr(i20),mark{2},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{2},...
                        'markersize',ms);
    p3 = plot(A(i25),zberr(i25),mark{3},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{3},...
                        'markersize',ms);
 legstr = {sprintf('$z_b = %0.0f~cm$',in(i15(1)).zb),...
           sprintf('$z_b = %0.0f~cm$',in(i20(1)).zb),...
           sprintf('$z_b = %0.0f~cm$',in(i25(1)).zb)};
 legend([p1,p2,p3],legstr,'interpreter','latex',...
                           'fontsize',fs,...
                           'Orientation','vertical',...
                           'location','northeast',...
                           'box','off')
 set(gca,'xlim',[min(A)-0.5,max(A)+0.5],...
         'xtick',[min(A(i15))-0.5:0.5:max(A(i15))+0.5],...
         'ylim',[0,15],...
         'ytick',[0:2.5:15],...
         'PlotBoxAspectRatio',[1,1,1],...
         'TickLabelInterpreter','latex',...
         'fontsize',fs,...
         'box','on')
 xlabel('$A_0$','fontsize',fs+2,...
                'interpreter','latex')
 ylabel('$z_b~\% error$','fontsize',fs+2,...
                'interpreter','latex')
 savePlot(f2,'BreakHeightError',w,h)

 
 %% Figure 3: Break Time
 
 f3 = figure; hold on;
%     errorbar(tbi,tbo,terr,'r.');

    plot([1,3],[1,3],'--',...
                     'color','k',...
                     'linewidth',lw)

    p1 = plot(tbi(i15),tbo(i15),mark{1},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{1},...
                        'markersize',ms);
    p2 = plot(tbi(i20),tbo(i20),mark{2},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{2},...
                        'markersize',ms);
    p3 = plot(tbi(i25),tbo(i25),mark{3},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{3},...
                        'markersize',ms);
 legstr = {sprintf('$z_b = %0.0f~cm$',in(i15(1)).zb),...
           sprintf('$z_b = %0.0f~cm$',in(i20(1)).zb),...
           sprintf('$z_b = %0.0f~cm$',in(i25(1)).zb)};
 legend([p1,p2,p3],legstr,'interpreter','latex',...
                           'fontsize',fs,...
                           'Orientation','vertical',...
                           'location','northwest',...
                           'box','off')
 set(gca,'xlim',[1,3],...
         'xtick',[1:0.25:3],...
         'ylim',[1,3],...
         'ytick',[1:0.25:3],...
         'PlotBoxAspectRatio',[1,1,1],...
         'TickLabelInterpreter','latex',...
         'fontsize',fs,...
         'box','on')
 xlabel('$t_{b,in}~[min]$','fontsize',fs+2,...
                'interpreter','latex')
 ylabel('$t_{b,out}~[min]$','fontsize',fs+2,...
                'interpreter','latex')
 savePlot(f3,'BreakTime',w,h)
 
 
  %% Figure 4: Break Time Relative Error
 f4 = figure;hold on;
 tberr = abs(tbo - tbi)./tbi * 100;
    p1 = plot(A(i15),tberr(i15),mark{1},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{1},...
                        'markersize',ms);
    p2 = plot(A(i20),tberr(i20),mark{2},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{2},...
                        'markersize',ms);
    p3 = plot(A(i25),tberr(i25),mark{3},...
                        'markeredgecolor','k',...
                        'markerfacecolor',mc{3},...
                        'markersize',ms);
 legstr = {sprintf('$z_b = %0.0f~cm$',in(i15(1)).zb),...
           sprintf('$z_b = %0.0f~cm$',in(i20(1)).zb),...
           sprintf('$z_b = %0.0f~cm$',in(i25(1)).zb)};
 legend([p1,p2,p3],legstr,'interpreter','latex',...
                           'fontsize',fs,...
                           'Orientation','vertical',...
                           'location','northeast',...
                           'box','off')
 set(gca,'xlim',[min(A)-0.5,max(A)+0.5],...
         'xtick',[min(A(i15))-0.5:0.5:max(A(i15))+0.5],...
         'ylim',[0,15],...
         'ytick',[0:2.5:15],...
         'PlotBoxAspectRatio',[1,1,1],...
         'TickLabelInterpreter','latex',...
         'fontsize',fs,...
         'box','on')
 xlabel('$A_0$','fontsize',fs+2,...
                'interpreter','latex')
 ylabel('$t_b~\% error$','fontsize',fs+2,...
                'interpreter','latex')
 savePlot(f4,'BreakTimeError',w,h)

 
            
            