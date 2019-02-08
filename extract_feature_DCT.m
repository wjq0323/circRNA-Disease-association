load ./data/data_ALL.mat;


Feature=[];    

for i=1:1478 
    P_A=data_DCT(i,2:785);

    for j=1:28
        P_A_trans(j,:)=P_A(1,(j-1)*28+1:(j-1)*28+28);
    end
    DCT=dct2(P_A_trans,8,8); 
    Feature(i,:)=DCT(:);
end

PF=ones(739,1);
NF=-ones(739,1);
FF=[PF;NF];
Feature=[FF,Feature];

