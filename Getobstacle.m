% function mapobstacle=Getobstacle(nobstacle,map)
%  %�����ϰ�������
% mapobstacle=round(rand([nobstacle,2])*map.XMAX);%ֻ�����������Σ�
% nremove=[];
% for i=1:nobstacle
%     if (isequal(mapobstacle(i,:),map.start)||isequal(mapobstacle(i,:),map.goal))
%         nremove=[nremove;mapobstacle(i,:)];
%     end
% end
% nremove=[];
% end

function obstacle=Getobstacle(nob,obstacle,map)
%�����ϰ��������
ob=round(rand([nob,2])*map.XMAX);
%���ɵ��ϰ����п����Ǻ�start���goal�������غϵģ���Ҫɾ����removeIndΪ�غϵ����������index
removeInd=[];

%����ob���飬�����Щ������start��goal�غϣ���������������removeInd��
for io=1:length(ob(:,1))
   if(isequal(ob(io,:),map.start) || isequal(ob(io,:),map.goal))
        removeInd=[removeInd;io];
    end  
end

%���ظ��Ľڵ��ÿգ�ȥ��
ob(removeInd,:)=[];
%��ob�ϰ�����뵽obstacle�У�obstacle���Ѿ������߽�ڵ�������ˣ����ﻹҪ�ټ����ڲ��ϰ�������꣩
obstacle=[obstacle;ob];
