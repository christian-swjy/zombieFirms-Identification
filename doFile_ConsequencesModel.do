
/**********************************************************************
		
		Causes and Consequences of Zombie Firms in Indonesia
		
		By Christian Siauwijaya
		Date: 18 September 2021
		
		Desc: 
		This do file carries out a study in zombie firms CONSEQUENCES, 
		by running a panel data regression on the sample data

**********************************************************************/

* open the "Data_ConsequencesModel.dta" file prior to running the do file *

/*-----------------------------------------------------------
	** / TFP MODEL LM AND HAUSMAN TESTS / **
-----------------------------------------------------------*/
xtreg c.lntfpL3 c.zomshare i.zomDum, re
xttest0
** // **
quietly xtreg c.lntfpL3 c.zomshare i.zomDum, fe
estimates store TFPfe
quietly xtreg c.lntfpL3 c.zomshare i.zomDum, re
estimates store TFPre
hausman TFPfe TFPre
* ---

/*-----------------------------------------------------------
	** / RGDP MODEL LM AND HAUSMAN TESTS / **
-----------------------------------------------------------*/
xtreg c.lnrgdpL3 c.zomshare i.zomDum, re
xttest0
** // **
quietly xtreg c.lnrgdpL3 c.zomshare i.zomDum, fe
estimates store RGDPfe
quietly xtreg c.lnrgdpL3 c.zomshare i.zomDum, re
estimates store RGDPre
hausman RGDPfe RGDPre
* ---

/*-----------------------------------------------------------
	** / Employ MODEL LM AND HAUSMAN TESTS / **
-----------------------------------------------------------*/
xtreg c.lnemployL3 c.zomshare i.zomDum, re
xttest0
** // **
quietly xtreg c.lnemployL3 c.zomshare i.zomDum, fe
estimates store Employfe
quietly xtreg c.lnemployL3 c.zomshare i.zomDum, re
estimates store Employre
hausman Employfe Employre
* ---

/*-----------------------------------------------------------
	** / CapStck MODEL LM AND HAUSMAN TESTS / **
-----------------------------------------------------------*/
xtreg c.lncapstckL3 c.zomshare i.zomDum, re
xttest0
** // **
quietly xtreg c.lncapstckL3 c.zomshare i.zomDum, fe
estimates store CapStckfe
quietly xtreg c.lncapstckL3 c.zomshare i.zomDum, re
estimates store CapStckre
hausman CapStckfe CapStckre
* ---

**********************************************************************

/*-----------------------------------------------------------
	PESARAN TEST OF THE SELECTED FE MODEL
-----------------------------------------------------------*/
xtreg c.lntfpL3 c.zomshare i.zomDum, fe
xtcsd, pesaran
xtreg c.lnemployL3 c.zomshare i.zomDum, fe
xtcsd, pesaran
xtreg c.lnrgdpL3 c.zomshare i.zomDum, fe
xtcsd, pesaran
xtreg c.lncapstckL3 c.zomshare i.zomDum, fe
xtcsd, pesaran

**********************************************************************

/*-----------------------------------------------------------
	IMPLEMENT DRISCOLL-KRAAY ROBUST SE FOR THE FE MODEL
-----------------------------------------------------------*/
* this is the selected final model *
xtscc c.lntfpL3 c.zomshare i.zomDum, fe
xtscc c.lnemployL3 c.zomshare i.zomDum, fe
xtscc c.lnrgdpL3 c.zomshare i.zomDum, fe
xtscc c.lncapstckL3 c.zomshare i.zomDum, fe

* ## Create esttab of the estimates ## *

eststo: xtscc c.lntfpL3 c.zomshare i.zomDum, fe
eststo: xtscc c.lnemployL3 c.zomshare i.zomDum, fe
eststo: xtscc c.lnrgdpL3 c.zomshare i.zomDum, fe
eststo: xtscc c.lncapstckL3 c.zomshare i.zomDum, fe

esttab est1 est2 est3 est4, star(* 0.10 ** 0.05 *** 0.01) se scalar("r2_w within R2")

* Export Results as "consequencesResults.rtf" *
esttab est3 est4 est5 est6 using consequencesResults.rtf, star(* 0.10 ** 0.05 *** 0.01) se scalar("r2_w within R2")

**********************************************************************
