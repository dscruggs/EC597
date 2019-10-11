function f = production(K,H,alpha)
    f = (K.^alpha).*(H.^(1-alpha));
end

