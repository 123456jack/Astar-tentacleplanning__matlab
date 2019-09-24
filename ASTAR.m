function path=ASTAR(obstacle,map)
open=[];
close=[];
path=[];

open=[map.start(1),map.start(2),0+h(map.start,map.goal),0,map.start(1),map.start(2)];
next=indexmode();
flagreach=false;%�ִ�Ŀ���־��

while ~flagreach
    if isempty(open(:,1))
        disp('no path!');
        flagreach=true;
        return;
    end
    
   %�ж�Ŀ����Ƿ������open�б���
    [isopenFlag,Id]=isopen(map.goal,open);
    if isopenFlag
        disp('Find Goal!!');
        close = [open(Id,:);close];
        flagreach=true;
        break;
    end
    
   
    
    %---�ҳ�F��С���ڽڵ����closelist����Ϊ��ǰ�ڵ�---
    [Y,I]=sort(open(:,3));
    open=open(I,:);
    close=[open(1,:);close];
    current=open(1,:);
    open(1,:)=[];
    
    for i=1:length(next(:,1))
        m=[current(1)+next(i,1),current(2)+next(i,2),0,0,0,0];
        m(4)=current(4)+next(i,3); %���ڽڵ�Gֵ
        m(3)=m(4)+h(m(1:2),map.goal); %���ڽڵ�Fֵ
   
        
        %ȥ�����ڽڵ��е��ϰ���
        if isobstacle(m,obstacle)
            continue;
        end
        
        %�Խڵ���з���
        [k,flaglist]=FINDLIST(m,open,close);
        
        %����closelist��
        if flaglist==1
            continue;
            %����openlist�У�����openlist������ǰ�ڵ���Ϊ�丸�ڵ�
        elseif flaglist==2
            m(5:6)=[current(1),current(2)];
            open=[open;m];
            %����openlist�У�������F����ԭ��������Ƿ��С�����ǣ�����ĸ��ڵ�Ϊ��ǰ�ڵ�
        else
            if m(3)<=open(k,3)
                m(5:6)=[current(1),current(2)];
                open(k,:)=m;
            end
        end
    end
    
    PLOTGRID(map);
    hold on;
    pause(0.01);
    %����
    FILLGRID(close,'p');
    hold on;
    FILLGRID(open,'r');
    hold on;
end
    
 path=GetPath(close,map.start);
end

        
    
