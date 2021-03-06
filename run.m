clear all 
load daten

%% 1.Berechnen Kovarianzmarix und ploten
c1 = ourCov(data1');
c2 = ourCov(data2');
c3 = ourCov(data3');
c4 = ourCov(data4');

figure;
subplot(2,2,1)
plot(data1(1,:),data1(2,:),'.');
axis equal

subplot(2,2,2)
plot(data2(1,:),data2(2,:),'.');
axis equal

subplot(2,2,3)
plot(data3(1,:),data3(2,:),'.');
axis equal

subplot(2,2,4)
plot(data4(1,:),data4(2,:),'.');
axis equal

%% 2. PCA

% demonstration of 3d pca visualization:
disp('2d pca demo... ')

[V,D] = ourPCA(data1'); 
plot2DPCA(data1', mean(data1'),[], V, D, 1, 0)

[V,D] = ourPCA(data2');  
plot2DPCA(data2', mean(data2'),[], V, D, 1, 0)

[V,D] = ourPCA(data3');  
plot2DPCA(data3', mean(data3'),[], V, D, 1, 0)

[V,D] = ourPCA(data4');
plot2DPCA(data4', mean(data4'),[], V, D, 1, 0)


%% 4.PCA 3D

load 'daten3d.mat';

[V,D]=ourPCA(data');
figure
plot3(data(1,:),data(2,:),data(3,:))


%% 5.Shape

load 'shapes.mat'

% shape the nPunkte x nDimensionen x nShapes to a 
% nPunkte*nDimensionen x nShapes matrix
% prepare the input value
shape = reshape(aligned,[size(aligned,1)*size(aligned,2),size(aligned,3)]);
[V,D] = ourPCA(shape');
meanshape = mean(shape,2);








    shape_ = reshape(meanshape,128,2);


bar(D*100/sum(D))

Vmain = 13
Dmain= D(1:Vmain) 

for i = 1:Vmain
figure;
    for S = linspace( -3*sqrt(Dmain(i)), 3*sqrt(Dmain(i)),10);
    b = zeros(Vmain,1);
    b(i)= S;
    plotShape(meanshape,V(:,1),b);
    title(['Mode N: ' num2str(i)]);
    hold on
     end    
end





