exam1_j = [96 52 80 92 100 88 92 63 83 91 89 76 90 97 92 66 97 99 80 96 97 93 68 97 ...
    62 92 95 78 81 99 97 76 98 98 100 64 79 77 92 77 93 97 100 33 89 73 99 ...
    86 72 87 97 100 93 87 87 100 93 78 94 95 94 92 87 48 77 94 96 88 27 ];

exam1_t = [100 91 92 91 92 61 81 93 81 76 97 97 80 100 88 97 51 84 86 95 100 80 ...
    86 91 100 72 84 79 88 92 82 78 69 44 71 45 ];

exam1 = [exam1_j exam1_t];
mean(exam1_j)
mean(exam1_t)
hist(exam1)
title(sprintf('exam average = %f',mean(exam1)))

a = .785; % optimize to get 85 average
exam1_curved = 100^(1-a)*exam1.^a; 

hist([exam1;exam1_curved]',10)
title(sprintf('mean grades = %f',mean(exam1_curved)))
