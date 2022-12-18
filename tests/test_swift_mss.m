% test comparison of .m and .py mss codes

e = [1.19930880e-02, 3.60038400e-02, 4.80215040e-02, 7.80288000e-02, ...
     5.16120576e-01, 3.00672614e+00, 1.31252060e+01, 2.38798356e+01, ...
     2.06630339e+01, 1.14808013e+01, 6.04348416e+00, 5.20327987e+00, ...
     4.42908672e+00, 2.73066394e+00, 2.47861248e+00, 2.31655834e+00, ...
     2.01648538e+00, 1.54838630e+00, 1.31432448e+00, 1.12828416e+00, ...
     9.00218880e-01, 7.32168192e-01, 5.94149376e-01, 4.80116736e-01, ...
     4.02087936e-01, 3.30080256e-01, 2.70065664e-01, 2.76062208e-01, ...
     2.52051456e-01, 1.62029568e-01, 1.38043392e-01, 1.32022272e-01, ...
     1.14032640e-01, 7.80288000e-02, 5.40180480e-02, 3.60038400e-02, ...
     3.00072960e-02, 2.40107520e-02];

f = [0.0293 , 0.03906, 0.04883, 0.05859, 0.06836, 0.07813, 0.08789, ...
     0.09766, 0.10742, 0.11719, 0.12695, 0.13672, 0.14648, 0.15625, ...
     0.16602, 0.17578, 0.18555, 0.19531, 0.20508, 0.21484, 0.22461, ...
     0.23438, 0.24414, 0.25391, 0.26367, 0.27344, 0.2832 , 0.29297, ...
     0.30273, 0.3125 , 0.32227, 0.33203, 0.35156, 0.38086, 0.41016, ...
     0.43945, 0.46875, 0.49805];

direction = deg2rad([63.66118562123529, 69.83651536571733, 70.1966890179433, 67.17223887212481,  ...
68.11560140337707, 66.76620169938838, 72.46175579310562, 75.21384296661631,  ...
79.93826228338412, 80.9510907144147, 75.94508335362138, 76.3836013091875,  ...
72.50722686224526, 69.91560610029683, 68.66986985959585, 64.93467406654986,  ...
66.2826484251674, 65.08757982859362, 65.29612796473015, 62.486581066095994,  ...
58.805507142194415, 55.81254126527415, 59.35215951401949, 57.720609546230435,  ...
54.45281703759042, 45.589431410889574, 45.6323666442247, 55.269270514574714,  ...
52.98485032668606, 47.26862925444493, 55.85544653743074, 55.888227184063965,  ...
52.55122061789541, 51.63256544066087, 55.648482189459685, 60.79591900600633,  ...
52.208259929539054, 44.48379200745728, 68.81155775451072]);

spread = deg2rad([60.48190169134263, 60.04317147975769, 58.48885347986495, 59.76078038955793,    ...
 49.500970783685524, 32.90662846949174, 27.01749283020015, 29.276180939850036,   ...
 31.91525089867864, 36.07656029243812, 42.21610651609902, 38.309705049532674,   ...
 38.79768176079975, 43.72593796207629, 42.23717804799098, 38.99892636400586,   ...
 39.23513666141462, 43.45207550090215, 43.37991751134262, 43.40100025587177,   ...
 46.81330099882079, 47.53473912181352, 48.71412623342074, 46.42345168632379,   ...
 45.40425032910627, 46.413758812583005, 49.5352530226081, 51.43279032125458,   ...
 50.145338064041084, 52.747672728582366, 54.545189379957755, 54.2015479167874,   ...
 54.85047689606332, 58.50030292166716, 61.5658628196362, 60.81194730651426,   ...
 62.072647539490966, 63.61449253721305, 73.07789984894407]);

[mss, mssnorm] = calc_mss(e, f, direction, spread)

function [mss, mssnorm] = calc_mss(e, f, direction, spread);
    df = diff(f)
    fe = nansum(f .* e) ./ nansum(e) 
%     findices = find(f >= fe & f <= 2*fe) % dynamic
    findices = find(f) % dynamic
    range(f(findices))
    mss = trapz(f(findices), (2*3.14* f(findices)).^4 .* e(findices))  ./ (9.8^2);
    mss2 = trapz(f(findices), (2*3.14* f(findices)).^4 .* e(findices) ./ direction(findices))  ./ (9.8^2)
    mss3 = trapz(f(findices), (2*3.14* f(findices)).^4 .* e(findices) ./ spread(findices))  ./ (9.8^2)

    mssnorm = mss ./ range( f(findices) );
    mssnorm2 = mss2 ./ range( f(findices) )
    mssnorm3 = mss3 ./ range( f(findices) )
end




