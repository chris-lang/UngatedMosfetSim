function [x0,x,nf] = newtonNdNoJacob(fhand,x0)
% 
% INPUTS:
%   fhand - function handle
%   x0    - initial guess
% Use Newton's method to solve the nonlinear function
% defined by function handle fhand with initial guess x0. 


if nargin<2
    error('Must provide three input arguments.  Type ''help newton1d'' for details');
end

tol= 1e-6;          % convergence tolerance
phitol = 1e-8;
maxIters=500;       % max # of iterations
x00=x0;             % initial guess
x = [];
% Newton loop
for iter=1:maxIters
    f=fhand(x0);            % evaluate function
    f = transpose(f);
    if norm(f)<tol
        x=x0;
        nf(iter)=norm(f);
        
       break 
    end
    dx = tgcr(fhand,-f,.001,500,x0);   % solve linear system
	iter
    nf(iter)=norm(f);            % norm of f at step k+1
    ndx(iter)=norm(dx);          % norm of dx at step k+1
    x= [x, x0+dx];              % solution x at step k+1
    x0=x(:,iter);                 % set value for next guess
    if nf(iter) < tol %& ndx(iter) < phitol
        % check for convergence
        %fprintf('Converged in %d iterations\n',iter);
        break; 
    end
end

if iter==maxIters, % check for non-convergence
    fprintf('Non-Convergence after %d iterations!!!\n',iter); 
end
