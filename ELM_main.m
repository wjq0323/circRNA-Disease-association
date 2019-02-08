
%fold-1
 [TrainingTime_f1, TestingTime_f1, TrainingAccuracy_f1, TestingAccuracy_f1,predictions_f1] = ...
     elm('./data_feature_fold5_elm.mat','f1_train', 'f1_test', 1, 5, 'sig');
 
% %fold-2
 [TrainingTime_f2, TestingTime_f2, TrainingAccuracy_f2, TestingAccuracy_f2,predictions_f2] = ...
     elm('./data_feature_fold5_elm.mat','f2_train', 'f2_test', 1, 5, 'sig');

% %fold-3
 [TrainingTime_f3, TestingTime_f3, TrainingAccuracy_f3, TestingAccuracy_f3,predictions_f3] = ...
     elm('./data_feature_fold5_elm.mat','f3_train', 'f3_test', 1, 5, 'sig');

% %fold-4
 [TrainingTime_f4, TestingTime_f4, TrainingAccuracy_f4, TestingAccuracy_f4,predictions_f4] = ...
     elm('./data_feature_fold5_elm.mat','f4_train', 'f4_test', 1, 5, 'sig');

% %fold-5
 [TrainingTime_f5, TestingTime_f5, TrainingAccuracy_f5, TestingAccuracy_f5,predictions_f5] = ...
     elm('./data_feature_fold5_elm.mat','f5_train', 'f5_test', 1, 5, 'sig');
 

 
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f1,IC_f1_test_label);
aa = [ACC,SN,SP,PPV,NPV,F1,MCC];
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f2,IC_f2_test_label);
bb = [ACC,SN,SP,PPV,NPV,F1,MCC];
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f3,IC_f3_test_label);
cc = [ACC,SN,SP,PPV,NPV,F1,MCC];
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f4,IC_f4_test_label);
dd = [ACC,SN,SP,PPV,NPV,F1,MCC];
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f5,IC_f5_test_label);
ee = [ACC,SN,SP,PPV,NPV,F1,MCC];
R=[];
R=[aa;bb;cc;dd;ee];  