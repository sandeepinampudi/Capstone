function myprint(filename)
f=getframe(gcf);
ref=zeros(1,3);
ref(:)=f.cdata(1,1,:);
pos=find(f.cdata(:,:,1)~=ref(1)&f.cdata(:,:,2)~=ref(2)&f.cdata(:,:,3)~=ref(3));
[I,J] = ind2sub([size(f.cdata,1) size(f.cdata,2)],pos);
I2=min(I):max(I);
J2=min(J):max(J);
f3=f;
f3.cdata=f.cdata(I2,J2,:);
f2=frame2im(f3);
imwrite(f2,filename)
end