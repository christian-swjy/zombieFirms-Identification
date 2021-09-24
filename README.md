# Zombie Firms Identifier (zombieFirms-Identification)
Identify Zombie Firms based on Siauwijaya (2021) Master's dissertation from the University of Glasgow titled: <br>__"Causes and Consequences of Zombie Firms in Indonesia"__<br />
<br>
Methods for the zombie firms identification are sourced from Banerjee et al. (2018) and Cella (2020).
<br />
<br>--------------<br />
A brief description on each files is provided below:
1. __DataCenter_Hub.xlsx__ : <br>Contains the raw data for ICR and its original dummy codification (if ICR<1 = 1, else 0) and all data needed for the dissertation.<br />
2. __ICR_Dummy.xlsx__ : <br>The standalone excel file to interact with the zombieFirms_Checker.ipynb file.<br />
3. __zombieFirms_Checker.ipynb__ : <br>Jupyter notebook file containing the script that identify zombie firms using the ICR_Dummy.xlsx data.<br />
4. __zombieShare_Output.xlsx__ : <br>Output file of zombieFirms_Checker.ipynb. Contains the annual zombie share in Indonesia from 1999 to 2019.<br />
5. __Data_CausesModel (available in .dta and .xlsx)__ : <br>The compiled data for the "potential *causes* of zombie firms" model.<br />
6. __Data_ConsequencesModel (available in .dta and .xlsx)__ : <br>The compiled data for the "estimated *consequences* of zombie firms" model.<br />
7. __doFile_CausesModel.do__ : <br>STATA do file for the "potential *causes* of zombie firms" model.<br />
8. __doFile_ConsequencesModel.do__ : <br>STATA do file for the "estimated *consequences* of zombie firms" model.<br />
9. __CITATION.cff__ : <br>A Citation File Format (cff) file that provides citation data this repository<br />

## DISCLAIMER
This repository is created for an unpublished dissertation, written in partial fulfilment of the Master of Science (MSc) degree in Financial Economics at the University of Glasgow. The data and scripts provided in this repository are published for the dissertation's reference and the author's portfolio. Thus, this repository may be used for academic and research purposes only. The author is not responsible for any losses incurred from the repository's content outside of its intended use.
