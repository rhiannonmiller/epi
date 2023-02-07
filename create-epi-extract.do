* uncomment to install easy access tools
* net install load_epiextracts, from("https://microdata.epi.org/stata")

*update path in query below before running
load_epiextracts, ///
begin(2022m1) ///
end(2022m12) ///
keep(age wage basicwgt cow1 countyfips statefips female ftptstat hispanic mind16 mocc03 month numjobs orgwgt veteran wbhaom) ///
sample(org) ///
sourcedir("C:\Users\rhian\My Drive\epi_org")

*if the above doesn't work try to do sample(all) instead of sample(org)
*if certain variables don't exist, try they can probably be omitted

* run filters to make extract smaller (no idea what the syntax is)
keep if statefips == 24 /* MD */
keep if ftptstat != 1 /* labor force status: employed */

*export 
export delimited "C:\Users\rhian\My Drive\epi_org\epi-org.csv", replace


*update path in query below before running
load_epiextracts, ///
begin(2022m1) ///
end(2022m12) ///
keep(age wage basicwgt cow1 countyfips statefips female ftptstat hispanic mind16 mocc03 month numjobs orgwgt veteran wbhaom) ///
sample(basic) ///
sourcedir("C:\Users\rhian\My Drive\epi_basic")

*if the above doesn't work try to do sample(all) instead of sample(org)
*if certain variables don't exist, try they can probably be omitted

* run filters to make extract smaller (no idea what the syntax is)
keep if statefips == 24 /* MD */
keep if ftptstat != 1 /* labor force status: employed */

export delimited "C:\Users\rhian\My Drive\epi_basic\epi-basic.csv", replace