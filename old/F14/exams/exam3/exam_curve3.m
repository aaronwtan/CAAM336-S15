grades = [74 81 81 94 80 90 93 93 92 100 93 50 100 51 87 84 88 95 91 91 93 32 66 84 28 67 79 92 89 100 98 74 90 66 94 90 90 90 91];
o_grades = grades;
nG = length(grades);
% sev_grades= [87 89 92 90 88 88 89 97 89 95 86 ];
% grades = [grades sev_grades];
a = .835; % optimize to get 85 average
grades = 100^(1-a)*grades.^a;

hist(grades)
title(sprintf('mean grades = %f',mean(grades)))

[o_grades' round(grades(1:nG))']