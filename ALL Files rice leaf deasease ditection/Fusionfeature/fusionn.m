load('EfeaturesDL.mat');
vec1=testFeaturesdLd;
%% vit load features
load('visionfeatures.mat');
vec2=visionfeaturesDL;

label=testLabelsDL;
fusionVitself=horzcat(vec1,vec2);
save fusionfeatures.mat;

testFeaturesdLd=im2double(fusionVitself);
%% testFeaturesdUCOr=testFeaturesdUCOr';
testFeaturesdLd=array2table(testFeaturesdLd);
testFeaturesdLd.type=label;
