data {
   int <lower=0> N;
   int<lower=0,upper=1> game[N];
}

parameters {
   real <lower = 0> alpha;
   real <lower = 0> beta;
   real <lower = 0,upper=1> theta;
}

model {
   alpha ~ normal(600, 50);
   beta ~ normal(400, 50);
   theta ~ beta(alpha, beta);
   game ~ bernoulli(theta);
}

generated quantities {
   real y;
   vector [N] log_lik;
   array [N] real y_hat;
   real series = binomial_rng(7, theta);
   if (series >= 4.0){
      series = 4;
      y = 1;
   }
   else
      y = 0;
   for (j in 1:N) {
        log_lik[j] = bernoulli_lpmf(game[j] | theta);
        y_hat[j] = beta_rng(alpha, beta);
   }
}