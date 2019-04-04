function [pf]= sphere02(cen,r,or,clr,Nr)
% r=radius
% cen=center
% or=axis orientation
% clr=color rows
%Nr=number of points for smootheness

phi=or(2);
thet=or(1);

u=[-sind(phi) cosd(phi) 0];
nCu=[cosd(thet)*cosd(phi) cosd(thet)*sind(phi) -sind(thet)];

Nrad=Nr;
Nht=Nr;

t=linspace(0,2*pi,Nrad+1)';
t=t(1:end-1);
%% face
t1=cen-r*[sind(thet)*cosd(phi) sind(thet)*sind(phi) cosd(thet)];
t2=cen+r*[sind(thet)*cosd(phi) sind(thet)*sind(phi) cosd(thet)];

V=[t1];
h2=linspace(-r,r,Nht+2);
h2=h2(2:end-1);
for ih=1:length(h2)
    bc2=cen+h2(ih)*[sind(thet)*cosd(phi) sind(thet)*sind(phi) cosd(thet)];
    r2=sqrt(r^2-h2(ih)^2);
    P=r2*cos(t)*u+r2*sin(t)*nCu+repmat(bc2,Nrad,1);
    V=[V;P];    
end
V=[V;t2];

faces=zeros(Nrad,2*Nht+2);
faces(:,1)=1;

for ih=2:Nht+1
    faces(:,ih)=(2:Nrad+1)+Nrad*(ih-2);
    faces(:,2*Nht+4-ih)=[faces(2:Nrad,ih);faces(1,ih)];
end
faces(:,Nht+2)=size(V,1);
if size(clr,1)==1;clr=[clr;clr];end
cdata=interp1(linspace(1,size(V,1),size(clr,1)),clr,1:size(V,1),'linesr');
pf=patch('Faces',faces,'Vertices',V,'FacevertexCdata',cdata);
set(pf,'linestyle','none','facecolor','interp')
end