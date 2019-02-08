function net = cnnff(net, x)
    n = numel(net.layers);  
    net.layers{1}.a{1} = x; 
    inputmaps = 1; 

    for l = 2 : n   
        if strcmp(net.layers{l}.type, 'c')
              
            for j = 1 : net.layers{l}.outputmaps  
                z = zeros(size(net.layers{l - 1}.a{1}) - [net.layers{l}.kernelsize - 1 net.layers{l}.kernelsize - 1 0]);
                for i = 1 : inputmaps   
                    z = z + convn(net.layers{l - 1}.a{i}, net.layers{l}.k{i}{j}, 'valid'); 
                end
               
                net.layers{l}.a{j} = sigm(z + net.layers{l}.b{j});
            end
            %  set number of input maps to this layers number of outputmaps
            inputmaps = net.layers{l}.outputmaps;
        elseif strcmp(net.layers{l}.type, 's')
            %  downsample
            for j = 1 : inputmaps
               
                z = convn(net.layers{l - 1}.a{j}, ones(net.layers{l}.scale) / (net.layers{l}.scale ^ 2), 'valid');   %  !! replace with variable
              
                
                net.layers{l}.a{j} = z(1 : net.layers{l}.scale : end, 1 : net.layers{l}.scale : end, :);
            end
        end
    end

   
    net.fv = [];
    for j = 1 : numel(net.layers{n}.a)
        sa = size(net.layers{n}.a{j});
         
        net.fv = [net.fv; reshape(net.layers{n}.a{j}, sa(1) * sa(2), sa(3))];
    end
   
    net.o = sigm(net.ffW * net.fv + repmat(net.ffb, 1, size(net.fv, 2)));

end
