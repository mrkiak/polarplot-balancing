function a = v_isakovich(T, zWeight)
    k = getcomplex(T.mSen, T.tSen);
    a = T.zP2P-(T.zWeight-zWeight)*k;
end
