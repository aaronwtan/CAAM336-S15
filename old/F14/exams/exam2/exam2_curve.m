grades = [60 47 58 82 83 67 80 87 91 99 87 51 95 60 68 71 73 83 74 85 93 42 66 73 54 74 84 78 70 91 88 44 76 66 76 81 97 86 80];
o_grades = grades;
nG = length(grades);
sev_grades = [48 80 91 91 72 94 92 70 70 83 95 90];
    
grades = [grades sev_grades];
a = .583; % optimize to get 85 average
grades = 100^(1-a)*grades.^a; 

hist(grades)
title(sprintf('mean grades = %f',mean(grades)))

[o_grades' round(grades(1:nG))']