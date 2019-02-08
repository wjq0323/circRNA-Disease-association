load('./data/MeshID.mat');
load('./data/CircR2Disease.mat');
load('./data/Mesh_disease.mat');
MeshID_str=cell(4594,20);



disease_Str=cell(4594,2); 
for i=1:4594  
    i
   disease_Str(i,1)=strtrim(cellstr(Mesh_Disease(i,1)));
   for j=1:11241
       if strcmp(disease_Str(i),MeshID(j,1))
           disease_Str(i,2)=strcat(disease_Str(i,2),MeshID(j,2),'-');
       end
   end
end

for i=1:4594
    i    
    j=3;
    MeshID_str=add_node2(i,j,MeshID_str,Mesh_Disease{i,1},disease_Str,MeshID);
end

for i=1:4594
    MeshID_str(i,1)=Mesh_Disease(i,1);
    MeshID_str(i,2)=Mesh_Disease(i,1);
end




for i=1:4594
    i
    for j=3:20
        if ~isempty(MeshID_str{i,j})
            Temp3=regexp(MeshID_str{i,j}, '*', 'split');
            [h3,l3] = size(Temp3);
            for k=1:l3 
                for p=j:20  
                    if ~isempty(MeshID_str{i,p})
                        tihuan=strcat('*',Temp3{1,k},'*');
                        Temp5=strcat('*',MeshID_str{i,p}, '*');
                        Temp5=strrep(Temp5,tihuan,'*');
                        if p==j 
                            Temp5=strcat(Temp5,'*',Temp3{1,k});
                        end
                        
                        MeshID_str(i,p) = cellstr(Temp5);
                     end
                    
                end
            end
        end
        
    end  
end

for i=1:4594
    i
    for j=3:20
        if ~isempty(MeshID_str{i,j})
             Temp_tihuan=regexp(MeshID_str{i,j}, '*', 'split'); 
             Temp6='';
             [h0,ll0]=size(Temp_tihuan);
             for pp=1:ll0
                if  ~isempty(Temp_tihuan{1,pp})
                    Temp6=strcat(Temp_tihuan{1,pp},'*',Temp6);
                end
             end
            MeshID_str(i,j) = cellstr(Temp6);
        end
    end
end

 Dise_Num=100;

disease_num=zeros(Dise_Num,1);
for i=1:Dise_Num
    i
   for j=1:4594
      for k=2:20
          if ~isempty(MeshID_str{j,k}) 
              Temp=regexp(MeshID_str{j,k}, '*', 'split');
              [h,l]=size(Temp);
              for p=1:l
                if strcmp(disease(i),Temp(1,p))
                    disease_num(i)=disease_num(i)+1;
                end
              end
          end
      end
  end
end

for i=1:Dise_Num
    if disease_num(i,1) ~=0
        disease_num(i,2)=-log2(disease_num(i,1)/4594);
    else
        disease_num(i,2)=0;
    end
end

load('./data/disease_model1_DV.mat');
SS=zeros(Dise_Num,Dise_Num);
value_Same=0;

for i=1:Dise_Num
    i
    for j=1:Dise_Num
        
        if isempty(DV{i,3})|| isempty(DV{j,3})
            SS(i,j)=0;
        else
             
            dis1_str='';
            dis2_str='';
            for k=2:10
                if ~isempty(DV{i,k})
                    dis1_str=strcat(dis1_str,DV{i,k});
                end
            end
            for k=2:10
                if ~isempty(DV{j,k})
                    dis2_str=strcat(dis2_str,DV{j,k});
                end
            end
            
            
            dis1=regexp(dis1_str,'*','split'); 
            dis2=regexp(dis2_str,'*','split');  
            [h5,l5] = size(dis1);
            [h6,l6] = size(dis2);
            for p=1:l5-1
                for q=1:l6-1  
                    if strcmpi(dis1(1,p),dis2(1,q))
                        for k=1:Dise_Num  
                            if strcmp(dis1(1,p),disease(k,1))
                                value_Same=disease_num(k,2);
                                break;
                            end
                        end
                        SS(i,j)=2*value_Same/(DV{i,1}+DV{j,1});
                    end
                end
            end

        end

        if i==j
            SS(i,j)=1;
        end
    end
end



