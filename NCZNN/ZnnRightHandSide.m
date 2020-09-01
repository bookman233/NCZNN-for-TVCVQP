function y = ZnnRightHandSide(t, x, gamma)
    syms u;

    % Constant Noise
    constantNoise = [2+2i, 2+2i, 2+2i, 2+2i, 2+2i, 2+2i, 2+2i]';
    
    % Time-varying Noise
    timeNoise = [1*cos(t)+1*sin(t)*i, 1*sin(t)+1*cos(t)*i, 1*cos(t)+1*cos(t)*i, 1*cos(t)+1*cos(t)*i, -1*acot(t)-1*acot(t)*i, -1*atan(t)-1*atan(t)*i, 1*cos(t)+1*cos(t)*i]';

    
    G = MatrixG(t);
    vecB = Vectorb(t);

    dotG = diff(MatrixG(u));
    dotVecB = diff(Vectorb(u));
    u = t;
    dG = eval(dotG);
    dvB = eval(dotVecB);
    
    % Activation Function:
    % AFNonconvexSaturationTwo
    % 
%     k = -pinv(MatrixG(t))*(dG * x - dvB + gamma * AFBoundSaturationSimple(G * x - vecB));
    k = -pinv(MatrixG(t))*(dG * x - dvB + gamma * (G * x - vecB));
    
    [m, n] = size(k);
    y = reshape(k, m * n, 1);

    t
    
    