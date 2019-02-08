function test_example_CNN
%load mnist_uint8;
load ../data/Yeast/CNN_Data_P_A.mat;      %%%%%%%%%
% train_x = double(reshape(train_x',28,28,60000))/255;
% test_x = double(reshape(test_x',28,28,10000))/255;
% train_y = double(train_y');
% test_y = double(test_y');

train_x = double(reshape(train_x',20,20,5594));
train_y = double(train_y');


% ex1 Train a 6c-2s-12c-2s Convolutional neural network 
%will run 1 epoch in about 200 second and get around 11% error. 
%With 100 epochs you'll get around 1.2% error
rand('state',0)
cnn.layers = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 4, 'kernelsize', 1) %convolution layer
    struct('type', 's', 'scale', 4) %sub sampling layer
%     struct('type', 'c', 'outputmaps', 6, 'kernelsize', 5) %convolution layer
%     struct('type', 's', 'scale', 2) %subsampling layer
};

cnn = cnnsetup(cnn, train_x, train_y);

opts.alpha = 5;  
opts.batchsize = 2;


opts.numepochs = 1;
cnn = cnntrain(cnn, train_x, train_y, opts); 
Protein_Feature=cnn.Feature';
save('../data/Yeast/Feature_P_A','Protein_Feature');


%plot mean squared error
% figure; plot(cnn.rL);
% 
% assert(er<0.12, 'Too big error');
