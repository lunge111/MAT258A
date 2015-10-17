
Y=admit;
gre=gre/std(gre);
gpa=gpa/std(gpa);
X=[ones(400,1),gpa,gre];
theta=[-4. ; 0.5;0.];
t=gradient(X,Y,theta,2000,0.1,0.001);

figure
plot(gpa(admit==1),gre(admit==1),'+')
xlabel('gpa');
ylabel('gre')
hold on
plot(gpa(admit==0),gre(admit==0),'o')
hold on
x=2:0.01:11;
y=(-t(1)-t(2)*x)/t(3);
plot(x,y,'-')
hold off
