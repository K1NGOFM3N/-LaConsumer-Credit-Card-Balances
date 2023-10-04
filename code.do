cd "D:\Grad school\ECON 5495"

gen t = _n
tsset t 
tsline RCCCBBALTOT

reg RCCCBBALTOT t 
predict y_hat
predict r, resid
tsline RCCCBBALTOT y_hat r

gen t2 = t^2
reg RCCCBBALTOT t t2
predict y_hat2
predict r2,resid
tsline RCCCBBALTOT  y_hat2 r2

gen t3 = t^3
reg RCCCBBALTOT t t2 t3
predict y_hat3
tsline RCCCBBALTOT y_hat y_hat2 y_hat3

* pick the one with the orange line that goes up and down I think that is the cubic function

gen d = 0 
replace d =1 if t >39

gen dt = d *t

reg RCCCBBALTOT d t dt 
reg RCCCBBALTOT  t  if t <= 39 


predict e1, resid
list e1 if t>=41
