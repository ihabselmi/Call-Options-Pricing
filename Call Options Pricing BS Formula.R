call_bs = function(r, t, k, s0, sd)
{
  d1 = (log(s0/k) + (r+0.5*sd^2)*t)/(sd*sqrt(t))
  d2 = d1 - sd*sqrt(t)
  
call_price = s0*pnorm(d1) - k*exp(-r*t)*pnorm(d2)

call_price
}
# Call Price
t = 1
r = .04
sd = .25
k = 95
s0 = 100
call_bs(r, t, k, s0, sd)

# Call price for every strike K = {75,76,...,124,125}

t = 1
r = .04
sd = .25
k = seq(75,125,1)
s0 = 100
call_bs(r, t, k, s0, sd)

# Call price for every strike K = {75,76,...,124,125} and maturities T = {1/12,2/12...,23/12,2}
t = seq(1/12,2,by = 1/12)
r = .04
sd = .25
k = 75:125
s0 = 100


grid_results = sapply(t, function(tva){ 
  call_bs(r, tva, k, s0, sd)
  })
grid_results


