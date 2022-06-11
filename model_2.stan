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
   alpha ~ normal(550, 50);
   beta ~ normal(450, 50);
   theta ~ beta(alpha, beta);
   game ~ bernoulli(theta);
}

generated quantities {
   real y;
   real series = binomial_rng(7, theta);
   if (series >= 4.0){
      series = 4;
      y = 1;
   }
   else
      y = 0;
}