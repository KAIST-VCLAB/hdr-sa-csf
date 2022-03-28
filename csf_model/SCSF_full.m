function S = SCSF_full(u, L, Ls)
    para_barten = [0.0103496421512110740870138414493339951150119304656982421875 ...
                   0.0148453074235465297403546713894684216938912868499755859375 ...
                   10.1826412599950035797746750176884233951568603515625];
    para_rel = [0.07934806850556229418369724726289859972894191741943359375 ...
                -0.63626297744386917099035372302751056849956512451171875 ...
                0.2157067019527991458271998226337018422782421112060546875 ...
                2245.74106450964200121234171092510223388671875 ...
                0.64999999999996738164753651290084235370159149169921875 ...
                -15.56177637997092233490548096597194671630859375];
    
    logu = log10(u);
    logLratio = log10(Ls./L);
    a = para_rel(1);
    c = para_rel(2)*logu + para_rel(3);
    b = para_rel(4)./( 1 + exp(para_rel(5)*(logu-para_rel(6))) ) - 2*a*c;
    r = -a*logLratio.*logLratio + b.*logLratio - a*(logLratio + c).*abs(logLratio + c) + a*c.*abs(c); % Log relative sensitivity for the full model
    
    S = Barten_CSF_freepara3(u, L, 2, para_barten).* (10.^r);
end