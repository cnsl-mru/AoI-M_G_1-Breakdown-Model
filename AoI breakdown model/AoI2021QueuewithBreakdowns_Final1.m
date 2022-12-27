%% Initialization
clear ; close all; clc

%% ==================== Part 1: Basic Function ====================
% Complete warmUpExercise.m
fprintf('Average AoI Running ... \n');


fprintf('Peak AoI: \n');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ======================= Part 2: Base Line Model with respect lambda1=======================

fprintf('Plotting Data ...\n')
p=[];
lambda=[];
lambda
rho=[];
AoI=[];
AoI1=[];
% %Exponential
% ES=0.5% expected service time
% ES2=2*(ES)^2  %2nd order moment of service time

%Erlang-2
ES=0.5 % expected service time
ES2=1*ES^2 % second order moment of service time


% %HyperExponential with p
% p1=0.9;
% ES=p1*0.5+(1-p1)*0.5^2;
% ES2=p1*2*0.5^2+(1-p1)*2*0.5^4;

%AAoI manipulation for different sources
for M=2:5
        for i=2:M
            lambda(i)=0.1;
         end
        l1=sum(lambda);
       
        m1=1
        for k=0.1:0.02:1.4
            lambda(1)=k;
              for i=1:M
                 rho(i)=lambda(i)*ES;
             end
                 r1=sum(rho);
            AoI11=(lambda(1))*(1-r1)/(1/r1-rho(1))+ES*((1/rho(1))+(r1/(1-r1))+((2*rho(2)-1)*(r1-1))/(1-rho(2))^2+(2*rho(1)*rho(2)*(r1-1))/(1-rho(2))^3)
            AoI(m1)=AoI11;
            m1=m1+1
        end
        x=(0.1:0.02:1.4)
        p(M)=plot(x,AoI,'*--')
        hold on;
end
legend([p(2),p(3),p(4),p(5)],'M=2','M=3','M=4','M=5')

%% ======================= Part 3: Breakdown Model with respect to lambda1 =======================
fprintf('Plotting Data ...\n')
for M=2:5
lambda=[];
rho=[];
AoI=[];
AoI1=[];
alpa=0.1;
% % %Exponential
gamma1=0.5;%expected repair time
gamma2=2*gamma1^2;% second order repair time
beta11=0.8; %expected service time
beta12=2*beta11^2 % second order service time
ES=beta11*(1+alpa*gamma1)% expected service time including breakdowns

% %Erlang-2
% gamma1=0.5; %expected repair time
% gamma2=1*gamma1^2; % second order moment of repair time
% beta11=0.8; %expected service time
% beta12=1*beta11^2 % second order moment of service time
% ES=beta11*(1+alpa*gamma1)% expected service time including breakdowns


% %HyperExponential with p
% p1=0.9;
% gamma1=p1*1/2+(1-p1)*1/(2^2); % expected repair time
% gamma2=p1*2/(2^2)+(1-p1)*2/(2^4); % second order moment of repair time
% beta11=p1*0.8+(1-p1)*0.8^2;   % expected service time
% beta12=p1*2*0.8^2+(1-p1)*2*0.8^4; % second order moment of service time
% ES=beta11*(1+alpa*gamma1) % expected service time including breakdowns
m1=1;
%AAoI manipulation for different sources
for k=0.1:0.02:0.7
   
    lambda(1)=k;
    for i=2:M
    lambda(i)=0.1;
    end
     l1=sum(lambda);
    for i=1:M
    rho(i)=lambda(i)*ES;
    end
    rho(1)
    r1=sum(rho);
ES2=l1*(beta11*alpa*gamma2+r1*beta12)  %2nd order moment of service time
EW=l1*ES2/(2*(1-r1)); % Expected waiting Time
LS1=(1/ES)/((1/ES)+lambda(1));    % S*(lambda(1)))
LS2=-(1/ES)/((1/ES)+lambda(1))^2; % S*'(lambda(1))) 
LS3=(2/ES)/((1/ES)+lambda(1))^3;  % S*''(lambda(1))) 
WS1=((1-r1)*lambda(1)*LS1)/((lambda(1)-l1*(1-LS1)))
WS2=(1-r1)*(l1*LS1^2+(lambda(1)^2-lambda(1)*l1)*LS2-l1*LS1)/(lambda(1)-l1*(1-LS1))^2
WS3=0;
for k1=2:M
LS11=(1/ES)/((1/ES)+lambda(k1));    % S*(lambda(1)))
LS21=-(1/ES)/((1/ES)+lambda(k1))^2; % S*'(lambda(1))) 
LS31=(2/ES)/((1/ES)+lambda(k1))^3;  % S*''(lambda(1))) 
WS11=((1-r1)*lambda(1)*LS11)/((lambda(1)-l1*(1-LS11)))
WS21=(1-r1)*(l1*LS11^2+(lambda(1)^2-lambda(1)*l1)*LS21-l1*LS11)/(lambda(1)-l1*(1-LS11))^2;
WS3=WS3+lambda(k1)*((2/lambda(1))+WS21-(2.0*WS11/lambda(1))) 
end;
AoI(m1)=EW+2.0*ES+(2.0*WS1/lambda(1))-WS2-(1/lambda(1))+ES*WS3
m1=m1+1;

end;
x=(0.1:0.02:0.7)
plot(x,AoI,'--')
hold on;
end;
legend([p(2),p(3),p(4),p(5)],'M=2','M=3','M=4','M=5')
%% ======================= Part 4: BreakdownModel with respect to alpha =======================
fprintf('Plotting Data ...\n')
p=[];
for M=2:4
lambda=[];
lambda(1)=0.4;
rho=[];
AoI=[];
AoI1=[];
alpa=0.1;
% % %Exponential
% gamma1=0.5;%expected repair time
% gamma2=2*gamma1^2;% second order repair time
% beta11=0.8; %expected service time
% beta12=2*beta11^2 % second order service time
% ES=beta11*(1+alpa*gamma1)% expected service time including breakdowns

% %Erlang-2
% gamma1=0.5; %expected repair time
% gamma2=1*gamma1^2; % second order moment of repair time
% beta11=0.8; %expected service time
% beta12=1*beta11^2 % second order moment of service time
% ES=beta11*(1+alpa*gamma1)% expected service time including breakdowns
% 

%HyperExponential with p
p1=0.9;
gamma1=p1*1/2+(1-p1)*1/(2^2); % expected repair time
gamma2=p1*2/(2^2)+(1-p1)*2/(2^4); % second order moment of repair time
beta11=p1*0.8+(1-p1)*0.8^2;   % expected service time
beta12=p1*2*0.8^2+(1-p1)*2*0.8^4; % second order moment of service time
ES=beta11*(1+alpa*gamma1) % expected service time including breakdowns
m1=1;
%AAoI manipulation for different sources
for k=0.01:0.05:0.8
   ES=beta11*(1+k*gamma1)
    for i=2:M
    lambda(i)=0.1;
    end
     l1=sum(lambda);
    for i=1:M
    rho(i)=lambda(i)*ES;
    end
    rho(1)
    r1=sum(rho);
ES2=l1*(beta11*alpa*gamma2+r1*beta12)  %2nd order moment of service time
EW=l1*ES2/(2*(1-r1)); % Expected waiting Time
LS1=(1/ES)/((1/ES)+lambda(1));    % S*(lambda(1)))
LS2=-(1/ES)/((1/ES)+lambda(1))^2; % S*'(lambda(1))) 
LS3=(2/ES)/((1/ES)+lambda(1))^3;  % S*''(lambda(1))) 
WS1=((1-r1)*lambda(1)*LS1)/((lambda(1)-l1*(1-LS1)))
WS2=(1-r1)*(l1*LS1^2+(lambda(1)^2-lambda(1)*l1)*LS2-l1*LS1)/(lambda(1)-l1*(1-LS1))^2
WS3=0;
for k1=2:M
LS11=(1/ES)/((1/ES)+lambda(k1));    % S*(lambda(1)))
LS21=-(1/ES)/((1/ES)+lambda(k1))^2; % S*'(lambda(1))) 
LS31=(2/ES)/((1/ES)+lambda(k1))^3;  % S*''(lambda(1))) 
WS11=((1-r1)*lambda(1)*LS11)/((lambda(1)-l1*(1-LS11)))
WS21=(1-r1)*(l1*LS11^2+(lambda(1)^2-lambda(1)*l1)*LS21-l1*LS11)/(lambda(1)-l1*(1-LS11))^2;
WS3=WS3+lambda(k1)*((2/lambda(1))+WS21-(2.0*WS11/lambda(1))) 
end;
AoI(m1)=EW+2.0*ES+(2.0*WS1/lambda(1))-WS2-(1/lambda(1))+ES*WS3
m1=m1+1;

end;
x=(0.01:0.05:0.8)
p(M)=plot(x,AoI,'*-')
hold on;
end;
legend([p(2),p(3),p(4),p(5)],'M=2','M=3','M=4','M=5');
%% ======================= Part 5: BreakdownModel with respect to E[R] =======================
fprintf('Plotting Data ...\n')
p=[];
for M=2:4
lambda=[];
lambda(1)=0.4;
rho=[];
AoI=[];
AoI1=[];
alpa=0.1;
% % %Exponential
gamma1=0.5;%expected repair time
gamma2=2*gamma1^2;% second order repair time
beta11=0.8; %expected service time
beta12=2*beta11^2 % second order service time
ES=beta11*(1+alpa*gamma1)% expected service time including breakdowns

% %Erlang-2
% gamma1=0.5; %expected repair time
% gamma2=1*gamma1^2; % second order moment of repair time
% beta11=0.8; %expected service time
% beta12=1*beta11^2 % second order moment of service time
% ES=beta11*(1+alpa*gamma1)% expected service time including breakdowns


%HyperExponential with p
% p1=0.9;
% gamma1=p1*0.5+(1-p1)*0.5^2; % expected repair time
% gamma2=p1*2*0.5^2+(1-p1)*2*0.5^4; % second order moment of repair time
% beta11=p1*0.8+(1-p1)*0.8^2;   % expected service time
% beta12=p1*2*0.8^2+(1-p1)*2*0.8^4; % second order moment of service time
% ES=beta11*(1+alpa*gamma1) % expected service time including breakdowns
m1=1;
%AAoI manipulation for different sources
for k=0.01:0.05:0.6
    gamma1=k;%expected repair time
    gamma2=2*gamma1^2
   ES=beta11*(1+alpa*gamma1)
    for i=2:M
    lambda(i)=0.1;
    end
     l1=sum(lambda);
    for i=1:M
    rho(i)=lambda(i)*ES;
    end
    rho(1)
    r1=sum(rho);
ES2=l1*(beta11*alpa*gamma2+r1*beta12)  %2nd order moment of service time
EW=l1*ES2/(2*(1-r1)); % Expected waiting Time
LS1=(1/ES)/((1/ES)+lambda(1));    % S*(lambda(1)))
LS2=-(1/ES)/((1/ES)+lambda(1))^2; % S*'(lambda(1))) 
LS3=(2/ES)/((1/ES)+lambda(1))^3;  % S*''(lambda(1))) 
WS1=((1-r1)*lambda(1)*LS1)/((lambda(1)-l1*(1-LS1)))
WS2=(1-r1)*(l1*LS1^2+(lambda(1)^2-lambda(1)*l1)*LS2-l1*LS1)/(lambda(1)-l1*(1-LS1))^2
WS3=0;
for k1=2:M
LS11=(1/ES)/((1/ES)+lambda(k1));    % S*(lambda(1)))
LS21=-(1/ES)/((1/ES)+lambda(k1))^2; % S*'(lambda(1))) 
LS31=(2/ES)/((1/ES)+lambda(k1))^3;  % S*''(lambda(1))) 
WS11=((1-r1)*lambda(1)*LS11)/((lambda(1)-l1*(1-LS11)))
WS21=(1-r1)*(l1*LS11^2+(lambda(1)^2-lambda(1)*l1)*LS21-l1*LS11)/(lambda(1)-l1*(1-LS11))^2;
WS3=WS3+lambda(k1)*((2/lambda(1))+WS21-(2.0*WS11/lambda(1))) 
end;
AoI(m1)=EW+2.0*ES+(2.0*WS1/lambda(1))-WS2-(1/lambda(1))+ES*WS3
m1=m1+1;

end;
x=(0.01:0.05:0.6)
p(M)=plot(x,AoI,'*-')
hold on;
end;
legend([p(2),p(3),p(4),p(5)],'M=2','M=3','M=4','M=5');
%% ======================= Part 6: Breakdown Model with respect to Steady state availability =======================
fprintf('Plotting Data ...\n')
for M=2:4
    
lambda=[];
rho=[];
AoI=[];
AoI1=[];
alpa=0.2;
pa1=[]
% %Exponential
gamma1=0.5;
gamma2=2*gamma1^2;
beta11=0.8;
beta12=2*beta11^2

ES=beta11*(1+alpa*gamma1)% expected service time

% % %Erlang-2
% gamma1=0.5;
% gamma2=1*gamma1^2;
% beta11=0.8;
% beta12=1*beta11^2
% ES=beta11*(1+alpa*gamma1)% expected service time


%HyperExponential with p
% p1=0.9;
% gamma1=p1*1/2+(1-p1)*1/(2^2);
% gamma2=p1*2/(2^2)+(1-p1)*2/(2^4);
% beta11=p1*0.8+(1-p1)*0.8^2;
% beta12=p1*2*0.8^2+(1-p1)*2*0.8^4;
%AAoI manipulation for different sources
m1=1
for k=0.95:0.005:0.995
pa2=k;
lambda(1)=(1-k)/(beta11*alpa*gamma1);
%pa1(m1)=1-l1*beta11*alpa*gamma1
pa1(m1)=lambda(1)
   for i=2:M
    lambda(i)=0.1;
    end
     l1=sum(lambda);
    for i=1:M
    rho(i)=lambda(i)*ES;
    end
    rho(1)
    r1=sum(rho);
ES2=l1*(beta11*alpa*gamma2+r1*beta12)  %2nd order moment of service time
EW=l1*ES2/(2*(1-r1)); % Expected waiting Time
LS1=(1/ES)/((1/ES)+lambda(1));    % S*(lambda(1)))
LS2=-(1/ES)/((1/ES)+lambda(1))^2; % S*'(lambda(1))) 
LS3=(2/ES)/((1/ES)+lambda(1))^3;  % S*''(lambda(1))) 
WS1=((1-r1)*lambda(1)*LS1)/((lambda(1)-l1*(1-LS1)))
WS2=(1-r1)*(l1*LS1^2+(lambda(1)^2-lambda(1)*l1)*LS2-l1*LS1)/(lambda(1)-l1*(1-LS1))^2
WS3=0;
for k1=2:M
LS11=(1/ES)/((1/ES)+lambda(k1));    % S*(lambda(1)))
LS21=-(1/ES)/((1/ES)+lambda(k1))^2; % S*'(lambda(1))) 
LS31=(2/ES)/((1/ES)+lambda(k1))^3;  % S*''(lambda(1))) 
WS11=((1-r1)*lambda(1)*LS11)/((lambda(1)-l1*(1-LS11)))
WS21=(1-r1)*(l1*LS11^2+(lambda(1)^2-lambda(1)*l1)*LS21-l1*LS11)/(lambda(1)-l1*(1-LS11))^2;
WS3=WS3+lambda(k1)*((2/lambda(1))+WS21-(2.0*WS11/lambda(1))) 
end;
AoI(m1)=EW+2.0*ES+(2.0*WS1/lambda(1))-WS2-(1/lambda(1))+ES*WS3

m1=m1+1;

end;
x=0.95:0.005:0.995
plot(x,AoI)
hold on;
%plot(pa1,AoI)
end;
legend([p(2),p(3),p(4),p(5)],'M=2','M=3','M=4','M=5')



