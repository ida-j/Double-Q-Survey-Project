FID = fopen(filename, 'w');
fprintf(FID, caption);
fprintf(FID, '\\begin{threeparttable} \n');

fprintf(FID, '\\begin{tabular}{|l|ccc|ccc|ccc|}\\toprule \n');
fprintf(FID,'& \\multicolumn{3}{c}{one month} & \\multicolumn{3}{c}{three months}&\\multicolumn{3}{c}{one year}   \\\\  \n');

fprintf(FID, ' & Equity & Gold & Housing & Equity  & Gold & Housing & Equity & Gold & Housing \\\\\\midrule \n');

i=1; j=i+1;
fprintf(FID,'$\\beta^{(h)}$ & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s \\\\ \n' , est(i,1),stars{i,1} ,est(i,2),stars{i,2} ,est(i,3),stars{i,3} , est(i,4),stars{i,4},  est(i,5),stars{i,5} ,est(i,6),stars{i,6} , est(i,7),stars{i,7} , est(i,8),stars{i,8} ,est(i,9),stars{i,9}  );
fprintf(FID,' & (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f) \\\\ \n' , est(j,1), est(j,2),est(j,3), est(j,4), est(j,5),est(j,6), est(j,7), est(j,8),est(j,9));

i=3; j=i+1;
fprintf(FID,'$\\ln \\text{age}$ ($\\gamma^{(h)}_1$) & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s \\\\ \n' , est(i,1),stars{i,1} ,est(i,2),stars{i,2} ,est(i,3),stars{i,3} , est(i,4),stars{i,4},  est(i,5),stars{i,5} ,est(i,6),stars{i,6} , est(i,7),stars{i,7} , est(i,8),stars{i,8} ,est(i,9),stars{i,9}  );
fprintf(FID,' & (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f) \\\\ \n' , est(j,1), est(j,2),est(j,3), est(j,4), est(j,5),est(j,6), est(j,7), est(j,8),est(j,9));

i=5; j=i+1;
fprintf(FID,'$\\ln \\text{income}$ ($\\gamma^{(h)}_2$) & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s \\\\ \n' , est(i,1),stars{i,1} ,est(i,2),stars{i,2} ,est(i,3),stars{i,3} , est(i,4),stars{i,4},  est(i,5),stars{i,5} ,est(i,6),stars{i,6} , est(i,7),stars{i,7} , est(i,8),stars{i,8} ,est(i,9),stars{i,9}  );
fprintf(FID,' & (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f) \\\\ \n' , est(j,1), est(j,2),est(j,3), est(j,4), est(j,5),est(j,6), est(j,7), est(j,8),est(j,9));

i=7; j=i+1;
fprintf(FID,'Female ($\\gamma^{(h)}_3$) & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s \\\\ \n' , est(i,1),stars{i,1} ,est(i,2),stars{i,2} ,est(i,3),stars{i,3} , est(i,4),stars{i,4},  est(i,5),stars{i,5} ,est(i,6),stars{i,6} , est(i,7),stars{i,7} , est(i,8),stars{i,8} ,est(i,9),stars{i,9}  );
fprintf(FID,' & (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f) \\\\ \n' , est(j,1), est(j,2),est(j,3), est(j,4), est(j,5),est(j,6), est(j,7), est(j,8),est(j,9));

i=9; j=i+1;
fprintf(FID,'Asian ($\\gamma^{(h)}_4$) & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s \\\\ \n' , est(i,1),stars{i,1} ,est(i,2),stars{i,2} ,est(i,3),stars{i,3} , est(i,4),stars{i,4},  est(i,5),stars{i,5} ,est(i,6),stars{i,6} , est(i,7),stars{i,7} , est(i,8),stars{i,8} ,est(i,9),stars{i,9}  );
fprintf(FID,' & (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f) \\\\ \n' , est(j,1), est(j,2),est(j,3), est(j,4), est(j,5),est(j,6), est(j,7), est(j,8),est(j,9));

i=11; j=i+1;
fprintf(FID,'Black ($\\gamma^{(h)}_5$) & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s \\\\ \n' , est(i,1),stars{i,1} ,est(i,2),stars{i,2} ,est(i,3),stars{i,3} , est(i,4),stars{i,4},  est(i,5),stars{i,5} ,est(i,6),stars{i,6} , est(i,7),stars{i,7} , est(i,8),stars{i,8} ,est(i,9),stars{i,9}  );
fprintf(FID,' & (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f) \\\\ \n' , est(j,1), est(j,2),est(j,3), est(j,4), est(j,5),est(j,6), est(j,7), est(j,8),est(j,9));

i=13; j=i+1;
fprintf(FID,'Hispanic/Latino ($\\gamma^{(h)}_6$) & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s \\\\ \n' , est(i,1),stars{i,1} ,est(i,2),stars{i,2} ,est(i,3),stars{i,3} , est(i,4),stars{i,4},  est(i,5),stars{i,5} ,est(i,6),stars{i,6} , est(i,7),stars{i,7} , est(i,8),stars{i,8} ,est(i,9),stars{i,9}  );
fprintf(FID,' & (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f) \\\\ \n' , est(j,1), est(j,2),est(j,3), est(j,4), est(j,5),est(j,6), est(j,7), est(j,8),est(j,9));

i=15; j=i+1;
fprintf(FID,'Education ($\\gamma^{(h)}_7$) & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s & %.3f%s \\\\ \n' , est(i,1),stars{i,1} ,est(i,2),stars{i,2} ,est(i,3),stars{i,3} , est(i,4),stars{i,4},  est(i,5),stars{i,5} ,est(i,6),stars{i,6} , est(i,7),stars{i,7} , est(i,8),stars{i,8} ,est(i,9),stars{i,9}  );
fprintf(FID,' & (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f)& (%.3f) & (%.3f) & (%.3f) \\\\ \\bottomrule\n' , est(j,1), est(j,2),est(j,3), est(j,4), est(j,5),est(j,6), est(j,7), est(j,8),est(j,9));

fprintf(FID,'\\end{tabular} \n');

%tablenotes
fprintf(FID,'\\begin{tablenotes} \n');
fprintf(FID,'\\item The  estimates reported refer to the panel regressions  $\\hat{\\pi}^e_{i,t+h|t}=\\beta^{(h)} x_{i t}+\\mathbf{z}_{i}\\prime\\mathbf{\\gamma }^{(h)}+\\alpha_i^{(h)}+\\varepsilon_{i,t+h}$  using an unbalanced panel of 4,971 respondents over 11 months,\\\\  March 2012 to January 2013.\n');
fprintf(FID,'\\item $N=35,961$, $T_{min}=1$, $T_{p25}=4$, $T_{p50}=6$, $\\bar{T}=7.23$, $T_{p75}=9$,    $T_{max}=11$\n');
fprintf(FID,'\\item Standard errors are in parentheses, *, ** and *** denote statistical significance at 10 per cent, 5 per cent and 1 per cent levels, respectively. \n');
fprintf(FID,'\\item Estimates of $\\mathbf{\\gamma}^{(h)}$ are obtained using the  FE Filtered estimator or Pesaran and Zhou (2016). \n');
fprintf(FID,'  \\end{tablenotes} \n');
fprintf(FID,'\\end{threeparttable} \n');
fprintf(FID,'\\end{table} \n');

fclose(FID);
    

