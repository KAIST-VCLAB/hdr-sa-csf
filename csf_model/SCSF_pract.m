function S = SCSF_pract(u, L, Ls)
    para_barten = 0.2351531429034306730496695081455982290208339691162109375;
    para_rel = [0.0755869652293533478282228088573901914060115814208984375 ...
                0.07278321030327776497426128798906574957072734832763671875 ...
                -0.12638042628733450745137645299109863117337226867675781];
    
    logLratio = log10(Ls./L);
    a = para_rel(1);
    b = para_rel(2);
    c = para_rel(3);
    r = -a*logLratio.*logLratio + b.*logLratio - a*(logLratio + c).*abs(logLratio + c) + a*c.*abs(c); % Log relative sensitivity for the practical model
    
    S = Barten_CSF_freepara1(u, L, 2, para_barten).* (10.^r);
end