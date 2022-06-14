generated quantities {
   real alpha = normal_rng(600,50);
   real beta = normal_rng(400,50);
   real theta = beta_rng(alpha, beta);
   real series = binomial_rng(7, theta);
   real y;
   if (series >= 4.0){
      series = 4;
      y = 1;
   }
   else
      y = 0;
}