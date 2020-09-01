function Fnorm (x0, gamma)
    tspan = [0, 10];
    
    options = odeset();
    [t, x] = ode45(@ZnnRightHandSide, tspan, x0, options, gamma);
    
    for j = 1:length(t)
        T = t(j);
        G = MatrixG(T);
        vecB = Vectorb(T);
        err(:,j) = G * (x(j,:)).' - vecB;
        nerr(j) = norm(err(:,j));
    end
    
    set(gca,'FontSize',12)
    plot(t, nerr, 'LineWidth', 2);
    txt = {'||{\itE}(t)||_F'};
    text(0.6,0,txt)
    txt = {'{\itt}(s)'};
    text(4,0.3,txt)
    hold on;
    
    savefig('Bound_CN_5_1');