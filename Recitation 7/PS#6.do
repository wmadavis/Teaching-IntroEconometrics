//*****************Q#1*******************//
describe
sum smoker
sum smoker if smkban==1
sum smoker if smkban==0
reg smoker smkban, r
test smkban
gen age2=age*age
reg smoker smkban female age age2 hsdrop hsgrad colsome colgrad black hispanic, r
test hsdrop hsgrad colsome colgrad

reg smoker smkban female age age2 hsdrop hsgrad colsome colgrad black hispanic, r
    predict linear_yhat  // for percent correctly predicted
	gen linear_yhat2=linear_yhat>0.5
	count if smoker==linear_yhat2
	di r(N)/_N
	
// linear, Ms.A, male, white, non-hispanic, 20 years old, high school dropout
sca linear_a1 =_b[_cons]+_b[smkban]*1+_b[female]*0+_b[age]*20+_b[age2]*20^2+_b[hsdrop]*1+_b[hsgrad]*0+_b[colsome]*0+_b[colgrad]*0+_b[black]*0+_b[hispanic]*0
disp linear_a1

// linear, Ms.A, male, white, non-hispanic, 20 years old, high school dropout
sca linear_a0 =_b[_cons]+_b[smkban]*0+_b[female]*0+_b[age]*20+_b[age2]*20^2+_b[hsdrop]*1+_b[hsgrad]*0+_b[colsome]*0+_b[colgrad]*0+_b[black]*0+_b[hispanic]*0
disp linear_a0

// difference
di linear_a1-linear_a0

logit smoker smkban female age age2 hsdrop hsgrad colsome colgrad black hispanic, r
    predict logit_yhat  // for percent correctly predicted
	gen logit_yhat2=logit_yhat>0.5
	count if smoker==logit_yhat2
	di r(N)/_N
	
// Logit, Ms.A, male, white, non-hispanic, 20 years old, high school dropout
sca logit_a1 =_b[_cons]+_b[smkban]*1+_b[female]*0+_b[age]*20+_b[age2]*20^2+_b[hsdrop]*1+_b[hsgrad]*0+_b[colsome]*0+_b[colgrad]*0+_b[black]*0+_b[hispanic]*0

disp 1/(1+exp(-logit_a1))

// logit, Ms.A, male, white, non-hispanic, 20 years old, high school dropout
sca logit_a0 =_b[_cons]+_b[smkban]*0+_b[female]*0+_b[age]*20+_b[age2]*20^2+_b[hsdrop]*1+_b[hsgrad]*0+_b[colsome]*0+_b[colgrad]*0+_b[black]*0+_b[hispanic]*0

disp 1/(1+exp(-logit_a0))

// difference
di (1/(1+exp(-logit_a1)))-(1/(1+exp(-logit_a0)))
	
probit smoker smkban female age age2 hsdrop hsgrad colsome colgrad black hispanic, r
    predict probit_yhat  // for percent correctly predicted
	gen probit_yhat2=probit_yhat>0.5
	count if smoker==probit_yhat2
	di r(N)/_N

// Probit, Ms.A, male, white, non-hispanic, 20 years old, high school dropout
sca probit_a1 =_b[_cons]+_b[smkban]*1+_b[female]*0+_b[age]*20+_b[age2]*20^2+_b[hsdrop]*1+_b[hsgrad]*0+_b[colsome]*0+_b[colgrad]*0+_b[black]*0+_b[hispanic]*0

disp normal(probit_a1)

// Probit, Ms.A, male, white, non-hispanic, 20 years old, high school dropout
sca probit_a0 =_b[_cons]+_b[smkban]*0+_b[female]*0+_b[age]*20+_b[age2]*20^2+_b[hsdrop]*1+_b[hsgrad]*0+_b[colsome]*0+_b[colgrad]*0+_b[black]*0+_b[hispanic]*0

disp normal(probit_a1)

// difference
di normal(probit_a1)-normal(probit_a0)

//********************* Ms. B*****************************//
//Ms. B:  female, black, 40 years old, college graduate

reg smoker smkban female age age2 hsdrop hsgrad colsome colgrad black hispanic, r
    
// linear, Ms.B, female, black, 40 years old, college graduate
sca linear_b1 =_b[_cons]+_b[smkban]*1+_b[female]*1+_b[age]*40+_b[age2]*40^2+_b[hsdrop]*0+_b[hsgrad]*1+_b[colsome]*1+_b[colgrad]*1+_b[black]*1+_b[hispanic]*0
disp linear_b1

// linear, Ms.A, female, black, 40 years old, college graduate
sca linear_b0 =_b[_cons]+_b[smkban]*0+_b[female]*1+_b[age]*40+_b[age2]*40^2+_b[hsdrop]*0+_b[hsgrad]*1+_b[colsome]*1+_b[colgrad]*1+_b[black]*1+_b[hispanic]*0
disp linear_b0

// difference
di linear_b1-linear_b0

logit smoker smkban female age age2 hsdrop hsgrad colsome colgrad black hispanic, r
	
// Logit, Ms.A, female, black, 40 years old, college graduate
sca logit_b1 =_b[_cons]+_b[smkban]*1+_b[female]*1+_b[age]*40+_b[age2]*40^2+_b[hsdrop]*0+_b[hsgrad]*1+_b[colsome]*1+_b[colgrad]*1+_b[black]*1+_b[hispanic]*0

disp 1/(1+exp(-logit_b1))

// logit, Ms.A, female, black, 40 years old, college graduate
sca logit_b0 =_b[_cons]+_b[smkban]*0+_b[female]*1+_b[age]*40+_b[age2]*40^2+_b[hsdrop]*0+_b[hsgrad]*1+_b[colsome]*1+_b[colgrad]*1+_b[black]*1+_b[hispanic]*0

disp 1/(1+exp(-logit_b0))

// difference
di (1/(1+exp(-logit_b1)))-(1/(1+exp(-logit_b0)))
	
probit smoker smkban female age age2 hsdrop hsgrad colsome colgrad black hispanic, r

// Probit, Ms.A, female, black, 40 years old, college graduate
sca probit_b1 =_b[_cons]+_b[smkban]*1+_b[female]*1+_b[age]*40+_b[age2]*40^2+_b[hsdrop]*0+_b[hsgrad]*1+_b[colsome]*1+_b[colgrad]*1+_b[black]*1+_b[hispanic]*0

disp normal(probit_b1)

// Probit, Ms.A, female, black, 40 years old, college graduate
sca probit_b0 =_b[_cons]+_b[smkban]*0+_b[female]*1+_b[age]*40+_b[age2]*40^2+_b[hsdrop]*0+_b[hsgrad]*1+_b[colsome]*1+_b[colgrad]*1+_b[black]*1+_b[hispanic]*0

disp normal(probit_b0)

// difference
di normal(probit_b1)-normal(probit_b0)


