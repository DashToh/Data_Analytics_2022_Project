generated quantities {
   real theta = beta_rng(550, 450);
   real series = binomial_rng(7, theta);
   real y;
   if (series >= 4.0){
      series = 4;
      y = 1;
   }
   else
      y = 0;
}