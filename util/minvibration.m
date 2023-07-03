function [m, t] = minvibration(D)
    k = getcomplex(D.mSen, D.tSen);
    zP2P = getcomplex(D.mP2P, D.tP2P);
    zWeight = getcomplex(D.mWeight, D.tWeight);
    zWeightTarget = -zP2P./k + zWeight;
    z = 2*mean(zWeightTarget);
    x = real(z); y = imag(z); 
    x = linspace(0,x); y = linspace(0,y);
    [X, Y] = meshgrid(x, y);
    Z = complex(X, Y);
    A = 0;
    for i = 1:height(D)
        A = A + abs(zP2P(i)-(zWeight(i)-Z).*k(i));
    end
    minimum = min(abs(A), [], "all");
    [row, col] = find(A == minimum, 1);
    zWeightTargetByAllMode = Z(row, col); 
    [m, t] = ampthetafromz(zWeightTargetByAllMode);
end