/**********************************************************************
		
		Causes and Consequences of Zombie Firms in Indonesia
		
		By Christian Siauwijaya
		Date: 18 September 2021
		
		Desc: 
		This do file carries out a study in zombie firms CAUSES, 
		by running a VAR model and analysing it with Granger-causality

**********************************************************************/

* open the "Data_CausesModel.dta" file prior to running the do file *

/*-----------------------------------------------------------
	Lag-selection with selection-order criteria
-----------------------------------------------------------*/

quietly var zomshare strate, dfk
varsoc, max(3)
quietly var zomshare lendrate, dfk
varsoc, max(3)
quietly var zomshare polrate, dfk
varsoc, max(3)

**

quietly var zomshare lnnpl
varsoc
quietly var zomshare pbr
varsoc, max(3)

**********************************************************************

/*-----------------------------------------------------------
	Analysis for the proxy variables of "Interest Rates"
-----------------------------------------------------------*/

quietly var zomshare strate, lags(1/3) dfk
vargranger
varstable
varlmar, mlag(3)

quietly var zomshare polrate, lags(1/3) dfk
vargranger
varstable
varlmar, mlag(3)

quietly var zomshare lendrate, lags(1/3) dfk
vargranger
varstable
varlmar, mlag(3)

/*-----------------------------------------------------------
	Analysis for the proxy variables of "Bank Health"
-----------------------------------------------------------*/

quietly var zomshare pbr, lags(1/3) dfk
vargranger
varstable
varlmar, mlag(3)

quietly var zomshare lnnpl, lags(1/2) dfk
vargranger
varstable
varlmar, mlag(2)

**********************************************************************

/*-----------------------------------------------------------
	Producing the IRF Graph
-----------------------------------------------------------*/

** Setting the IRF Graph **
irf set modelirf

* Creating IRF Graph for each statistically significant model *
* ## RUN PER SECTION, DO NOT RUN ALL AT ONCE ## *

* zomshare -> lendRate section
quietly var zomshare lendrate, lags(1/3) dfk
irf create lendrateirf
irf graph irf, irf(lendrateirf) impulse(zomshare) response(lendrate)
graph export zomShare_lendRate.png
* ---

* pbr -> zomshare section
quietly var zomshare pbr, lags(1/3) dfk
irf create pbrirf
irf graph irf, irf(pbrirf) impulse(pbr) response(zomshare)
* ---

* lnnpl -> zomshare; zomShare -> lnnpl section
quietly var zomshare lnnpl, lags(1/3) dfk
irf create lnnplirf
irf graph irf, irf(lnnplirf) impulse(lnnpl) response(zomshare)
irf graph irf, irf(lnnplirf) impulse(zomshare) response(lnnpl)
* ---

**********************************************************************
