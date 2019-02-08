
%fold-1
model1=svmtrain(IC_f1_train_label,IC_f1_train_feature,'-c 0.04 -g 100 -b 1');
[predictions_f1,accuracy1,dec_values1]=svmpredict(IC_f1_test_label,IC_f1_test_feature,model1,'-b 1');

[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f1,IC_f1_test_label);
aa = [ACC,SN,SP,PPV,NPV,F1,MCC];

%fold-2
model2=svmtrain(IC_f2_train_label,IC_f2_train_feature,'-c 0.04 -g 100 -b 1');
[predictions_f2,accuracy2,dec_values2]=svmpredict(IC_f2_test_label,IC_f2_test_feature,model2,'-b 1');

[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f2,IC_f2_test_label);
bb = [ACC,SN,SP,PPV,NPV,F1,MCC];

%fold-3
model3=svmtrain(IC_f3_train_label,IC_f3_train_feature,'-c 0.04 -g 100 -b 1');
[predictions_f3,accuracy3,dec_values3]=svmpredict(IC_f3_test_label,IC_f3_test_feature,model3,'-b 1');

[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f3,IC_f3_test_label);
cc = [ACC,SN,SP,PPV,NPV,F1,MCC];

%fold-4
model4=svmtrain(IC_f4_train_label,IC_f4_train_feature,'-c 0.04 -g 100 -b 1');
[predictions_f4,accuracy4,dec_values4]=svmpredict(IC_f4_test_label,IC_f4_test_feature,model4,'-b 1');

[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f4,IC_f4_test_label);
dd = [ACC,SN,SP,PPV,NPV,F1,MCC];

%fold-5
model5=svmtrain(IC_f5_train_label,IC_f5_train_feature,'-c 0.04 -g 100 -b 1');
[predictions_f5,accuracy5,dec_values5]=svmpredict(IC_f5_test_label,IC_f5_test_feature,model5,'-b 1');

[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f5,IC_f5_test_label);
ee = [ACC,SN,SP,PPV,NPV,F1,MCC];

R=[];
R=[aa;bb;cc;dd;ee]; 