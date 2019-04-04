clc
clear
SDC={{'G05D' , 40},{'B60W ' , 21},{'G08G ' ,16},{'G01C ' , 15},...
    {'G01S' , 8},{'B60R ' , 8},{'G06Q ' , 8},{'G06K ' , 7},{'B62D ' , 7},{'G06F ' , 6}};

LID={{'G01S',  48},{'G01C ', 11},{'G08G ', 10},{'G05D ', 9},{'B60W ', 8},{'G06K ', 8},...
        {'G06T', 7},{'B60R ', 6},{'G02B ', 6},{'G06F ', 5}};
    
SSL={{'G01S ', 53},{'H01S ', 20},{'G02B ', 15},{'G01N ', 9},{'G02F ', 9},...
{'G01C ', 8},{'G01J ', 7},{'G01P ', 6},{'G01F ', 5},{'G01T ', 4}};

n=length(SDC);
T1=[];
T4=[];

for in=1:n
   T1=[T1,SDC{in}{1}(1),LID{in}{1}(1),SSL{in}{1}(1)];
   T4=[T4,SDC{in}{1}(4),LID{in}{1}(4),SSL{in}{1}(4)];   
end
C1=unique(T1);
C3=unique(T4);
M_SDC=zeros(n,4);
M_LID=zeros(n,4);
M_SSL=zeros(n,4);
f1=100;
f2=20;

for in=1:n
   M_SDC(in,1)=strfind(C1,SDC{in}{1}(1))*f1;
   M_SDC(in,2)=str2double(SDC{in}{1}(2:3));   
   M_SDC(in,3)=strfind(C3,SDC{in}{1}(4))*f2;
   M_SDC(in,4)=SDC{in}{2};
   
   M_LID(in,1)=strfind(C1,LID{in}{1}(1))*f1;
   M_LID(in,2)=str2double(LID{in}{1}(2:3));   
   M_LID(in,3)=strfind(C3,LID{in}{1}(4))*f2;
   M_LID(in,4)=LID{in}{2};
   
   M_SSL(in,1)=strfind(C1,SSL{in}{1}(1))*f1;
   M_SSL(in,2)=str2double(SSL{in}{1}(2:3));   
   M_SSL(in,3)=strfind(C3,SSL{in}{1}(4))*f2;
   M_SSL(in,4)=SSL{in}{2};
end

C2=unique([M_SDC(:,2);M_LID(:,2);M_SSL(:,2)]);

figure(1)
clf
set(gcf,'color','w')
subplot(1,2,1)
hold on
%light('Position',[300 300 300],'Style','local')

for in=1:n
pf= sphere02(M_SDC(in,1:3),M_SDC(in,4),[0,0],[1 0 0],50);
alpha(pf,0.5)
pf= sphere02(M_LID(in,1:3),M_LID(in,4),[0,0],[0 1 0],50);
alpha(pf,0.5)
end
daspect([1 1 1])
view(3)
xlabel('x')
ylabel('y')
xlim([0 350])
ylim([-100 100])
zlim([0 320])
xlabel({'1^{st} Level (or)','Major Section'})
ylabel({'2^{nd} Level (or)','Class'})
zlabel({'3^{rd} Level (or)','Subclass'})


set(gca,'xtick',[1:length(C1)]*f1,'xticklabel',num2cell(C1),...
 'fontsize',15,'xcolor',[0 0 0],'ycolor',[0 0 0],'zcolor',[0 0 0],'linewidth',2)
set(gca,'ztick',[1:length(C3)]*f2,'zticklabel',num2cell(C3))
%set(gca,'ytick',C2)
grid('on')

subplot(1,2,2)
%light('Position',[300 300 300],'Style','local')
hold on
for in=1:n
pf= sphere02(M_LID(in,1:3),M_LID(in,4),[0,0],[0 1 0],50);
alpha(pf,0.5)
pf= sphere02(M_SSL(in,1:3),M_SSL(in,4),[0,0],[0 0 1],50);
alpha(pf,0.5)
end
daspect([1 1 1])
view(3)

xlabel({'1^{st} Level (or)','Major Section'})
ylabel({'2^{nd} Level (or)','Class'})
zlabel({'3^{rd} Level (or)','Subclass'})

xlim([0 350])
ylim([-100 100])
zlim([0 320])
set(gca,'xtick',[1:length(C1)]*f1,'xticklabel',num2cell(C1),...
    'fontsize',15,'xcolor',[0 0 0],'ycolor',[0 0 0],'zcolor',[0 0 0],'linewidth',2)
set(gca,'ztick',[1:length(C3)]*f2,'zticklabel',num2cell(C3))
grid('on')
myprint('Fig1.jpg')
