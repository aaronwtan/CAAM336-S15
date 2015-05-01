% exam 2 grades

exam2_j = [95     89   78    72    82    93    81    97    91    98    90    100    84 ...
    86    74    57    92    64    87    76    79    89    82    61    92    91    95 ...
    94    89    93    99    68    100    88    85    84    87    84    87    72    80 ...
    92    77    71    83    20    77    89    68    53    79    32    66    90    86 ...
    75    62    93     74    98     92     95    92    55    98    83    65    96 44];

exam2_t = [69 92 94 70 71 87 88 80 95 80 79 98 90 19 62 90 52 21 63 93 91 ...
    83 97 73 68 43 98 94 98 79 56 88 92 81 62 66 79 61 95 79 100];

exam2 = [exam2_j exam2_t];
mean(exam2_j)
mean(exam2_t)

hist(exam2)
title(sprintf('exam average = %f',mean(exam2)))
%
a = .69; % optimize to get 85 average
exam2_curved = 100^(1-a)*exam2.^a; 
figure
hist([exam2(:); exam2_curved(:)]',10)
title(sprintf('mean grades = %f',mean(exam2_curved)))

    