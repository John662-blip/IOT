%Sử dụng một mạng nơ-ron cạnh tranh (competitive neural network) để phân nhóm (cluster) các đặc trưng thành hai lớp (two classes) dựa trên quá trình huấn luyện.
Feature1 = [1.12 0.11];
Feature2 = [0.7 0.33];
% Competitive layer with two classes
net1 = competlayer(2);
% Combining features
feature = [Feature1; Feature2];
% training the competetive layer with the featureset
net = train(net1,feature);
% test the network with the same feature set used in the training
outputs = net(feature);
% converting the output into class label
classes = vec2ind(outputs);