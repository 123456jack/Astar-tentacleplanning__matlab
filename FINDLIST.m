function [k,flaglist]=FINDLIST(m,open,close)
k=[];
flaglist=0;
if isempty(open)
    flaglist=2;   %����openlist��
else
    for j=1:length(close(:,1))
        if isequal(m(1:2),close(j,1:2))
            flaglist=1;         %���ڽڵ�use��closelist��
            return;
        end
    end
    
    for io=1:length(open(:,1))
        if isequal(m(1:2),open(io,1:2))
            flaglist=3;        %���ڽڵ�use��openlist��
            k=io;            %��¼�´�ʱ��openlist���к�
            return;
        end
    end
    
    if ~flaglist
        flaglist=2;
    end
end
end




