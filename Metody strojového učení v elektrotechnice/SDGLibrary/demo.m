function demo()
% demonstration file for SGDLibrary.
%
% This file illustrates how to use this library in case of linear
% regression problem. This demonstrates SGD and SVRG algorithms.
%
% This file is part of SGDLibrary.
%
% Created by H.Kasai on Oct. 24, 2016
% Modified by H.Kasai on Nov. 03, 2016


    clc;
    clear;
    close all;

    %% generate synthetic data        
    % set number of dimensions
    d = 1;
    % set number of samples    
    n = 20;
    % generate data
    data = linear_regression_data_generator(n, d, 10);
       
    func = @(x) (sin(pi.*x))./((x.^2)+1);    % funkce pro nagenerování dat
    from = 0;                           % rozsah pro od ...
    to = 4;                            % počet vzorků
    data.w_opt = rand(2,1);
    data.x_train = from:((to-from)/(n-1)):to;      % vzorkovací čas
    data.y_train = awgn(func(data.x_train),27);
    data.x_test = sort((to-from).*rand(1,n) + from);
    data.y_test = awgn(func(data.x_train),27);
    
    %% define problem definitions
%     problem = logistic_regression(data.x_train, data.y_train, data.x_test, data.y_test); 
    problem = linear_regression(data.x_train, data.y_train, data.x_test, data.y_test);
    plot(data.x_train,data.y_train,"rx");
    hold on;y
    grid on;
    plot(data.x_test,data.y_test,"bo");
    
    %% perform algorithms SGD and SVRG 
    options.w_init = data.w_opt;    
    options.step_init = 0.01; 
    options.verbose = 2;
    [w_sgd, info_sgd] = sgd(problem, options);  
    
    
    %% display cost/optimality gap vs number of gradient evaluations
    display_graph('grad_calc_count','cost', {'SGD', 'SVRG'}, {w_sgd, w_svrg}, {info_sgd, info_svrg});

end


