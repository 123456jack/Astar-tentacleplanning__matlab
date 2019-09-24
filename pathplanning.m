clear;
clc;
disp('A star path planning start!');

%--------��ʼ��--------
map.XMAX=30;  %��ͼX�򳤶�
map.YMAX=30;  %��ͼY�򳤶�
map.start=[1,1];    %���
map.goal=[30,20];   %�յ�

PLOTGRID(map);   %������ͼ
hold on;

%---------���ϰ���---------
obstacle=Getboundary(map); %��ȡ�߽�����
nobstacle=200;     %�ϰ�����Ŀ
obstacle=Getobstacle(nobstacle,obstacle,map);%obstacle=[obstacle;Getobstacle(nobstacle,map)];%��ȡ�����ϰ�������

FILLGRID(obstacle,'k');%����ϰ��﷽��

%--------A*�㷨Ѱ��·��-------
path=ASTAR(obstacle,map); %���·����

if length(path(:,1))>=1
    plot(path(:,1),path(:,2),'-c','LineWidth',5);hold on;
end




