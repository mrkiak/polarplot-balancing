function a = v_isakovich(D, zW)
    k = getcomplex(D.mSen, D.tSen);
    zP2P = getcomplex(D.mP2P, D.tP2P);
    zWeight = getcomplex(D.mWeight, D.tWeight);
    a = zP2P-(zWeight-zW).*k;
end
