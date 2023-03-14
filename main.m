clear all
clc
close all
SearchAgents_no=30; % Number of search agents
Function_name='F1'; % Name of the test function 
Max_iteration=1000; % Maximum number of iterations  

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

Max_test=20;
for i=1:Max_test
    disp(['第',num2str(i),'次实验']);
    [Best_pos1(i,:),Best_score1(i),SMA_curve(i,:)]=SMA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);     
end
% % %结果对比
figure
semilogy(mean(SMA_curve),'color','m','linewidth',2.0,'Marker','+','MarkerIndices',1:100:length(mean(PSO_sono_curve)))
title('Convergence curve of F_{1}')
xlabel('Iteration');
ylabel('Fitness');
axis tight
grid off
box on 
legend('SMA')


disp('-------------------------------------------------')
display([' (Best) : ', num2str(min(Best_score1))]);
display([' (mean) : ', num2str(mean(Best_score1))]);
display([' (wrost) : ', num2str(max(Best_score1))]);
display([' （std） : ', num2str(std(Best_score1))]);


