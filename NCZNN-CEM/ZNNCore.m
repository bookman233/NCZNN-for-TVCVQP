function delta = ZNNCore(t, x)
    gamma = 10;
   
    G = MatrixG;
    b = vecZeta;

    delta = -inv(G) * (gamma * (G * x - b));
    t

end
    