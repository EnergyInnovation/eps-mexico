*This Stata script is used to plot graphs for the Energy Policy...\\\
*Simulator (EPS) model outputs...\\\

clear
import excel "/Users/ssy02/Desktop/Paper-Mexico/Data-Mexico.xlsx", ///
              sheet("EPS Outputs") firstrow

*Total Greenhouse Gas Emissions*
line TotalGHGBAU TotalGHGExpert TotalGHGCAS TimeYear, /// 
     title("Total Greenhouse Gas Emissions") ///
     xtitle("Time(Year)") ///
	 ytitle("GHG Emissions (Mt CO2e)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(100)900) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)	 
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 1.gph", ///  
replace

*Total Greehouse Gas Emissions Excluding LULUCF*
line TotalGHGeLULUCFBAU TotalGHGeLULUCFExpert TotalGHGeLULUCFCAS TimeYear, ///
     title("Total Greenhouse Gas Emissions Excluding LULUCF") ///
     xtitle("Time(Year)") ///
	 ytitle("GHG Emissions (Mt CO2e)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(100)900) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)	 
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 2.gph", ///
replace

*Greenhouse Gas Emissions by Sector*
*BAU Emissions by Sector*
line GHGS1BAU GHGS2BAU GHGS3BAU GHGS4BAU GHGS5BAU GHGS6BAU GHGS7BAU ///
     GHGS8BAU GHGS9BAU TimeYear, ///
     title("BAU") ///
     xtitle("Time(Year)") ///
	 ytitle("GHG Emissions(Mt CO2e)") ///
     legend(subtitle("Sectors") order (1 "Transportation" ////
	        2 "Electricity" 3 "Residential Buildings" ///
			4 "Commercial Buildings" 5 "Industry" ///
			6 "District Heat and Hydrogen" 7 "LULUCF" ///
	        8 "Agriculture" 9 "Water and Waste")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(50)400) ///
	 lcolor (blue red green yellow orange purple teal brown cyan) ///
	 lwidth(thick thick thick thick thick thick thick thick thick)	
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 3.gph", ///
replace

*Expert Emissions by Sector*
line GHGS1EXPERT GHGS2EXPERT GHGS3EXPERT GHGS4EXPERT GHGS5EXPERT ///
     GHGS6EXPERT GHGS7EXPERT GHGS8EXPERT GHGS9EXPERT TimeYear, ///
     title("Expert") ///
     xtitle("Time(Year)") ///
	 ytitle("GHG Emissions(Mt CO2e)") ///
     legend(subtitle("Sectors") order (1 "Transportation" ////
	        2 "Electricity" 3 "Residential Buildings" ///
			4 "Commercial Buildings" 5 "Industry" ///
			6 "District Heat and Hydrogen" 7 "LULUCF" ///
	        8 "Agriculture" 9 "Water and Waste")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(50)400) ///
	 lcolor (blue red green yellow orange purple teal brown cyan) ///
	 lwidth(thick thick thick thick thick thick thick thick thick)	
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 4.gph", ///
replace

*CAS Emissions by Sector*
line GHGS1CAS GHGS2CAS GHGS3CAS GHGS4CAS GHGS5CAS GHGS6CAS GHGS7CAS ///
     GHGS8CAS GHGS9CAS TimeYear, ///
     title("CAS") ///
     xtitle("Time(Year)") ///
	 ytitle("GHG Emissions(Mt CO2e)") ///
     legend(subtitle("Sectors") order (1 "Transportation" ///
	        2 "Electricity" 3 "Residential Buildings" ///
			4 "Commercial Buildings" 5 "Industry" ///
			6 "District Heat and Hydrogen" 7 "LULUCF" ///
	        8 "Agriculture" 9 "Water and Waste")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(50)400) ///
	 lcolor (blue red green yellow orange purple teal brown cyan) ///
	 lwidth(thick thick thick thick thick thick thick thick thick)	
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 5.gph", ///
replace

*Electricity Generation*
graph pie BAU2030, over (Type) plabel(_all percent, color(black) ///
          size(small) format(%9.1f)) ///
          title("BAU (2030)") ///
		  legend(subtitle("Energy Sources") order(1 "Coal" 2 "Hydro" ///
		         3 "Natural Gas" 4 "Oil" 5 "Other" ///
				 6 "Solar" 7 "Wind")) ///
		  pie(1, color(140 86 75)) ///
		  pie(2, color(51 122 183)) ///
		  pie(3, color(236 151 31)) ///
		  pie(4, color(200 0 0)) ///
		  pie(5, color(152 223 138)) ///
		  pie(6, color(251 222 6)) ///
		  pie(7, color(45 100 65))
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 6.gph", ///
replace

graph pie BAU2050, over (Type) plabel(_all percent, color(black) ///
          size(small) format(%9.1f)) ///
          title("BAU (2050)") ///
		  legend(subtitle("Energy Sources") order(1 "Coal" 2 "Hydro" ///
		         3 "Natural Gas" 4 "Oil" 5 "Other" ///
				 6 "Solar" 7 "Wind")) ///
		  pie(1, color(140 86 75)) ///
		  pie(2, color(51 122 183)) ///
		  pie(3, color(236 151 31)) ///
		  pie(4, color(200 0 0)) ///
		  pie(5, color(152 223 138)) ///
		  pie(6, color(251 222 6)) ///
		  pie(7, color(45 100 65))
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 7.gph", ///
replace

graph pie EXPERT2030, over (Type) plabel(_all percent, color(black) ///
          size(small) format(%9.1f)) ///
          title("Expert (2030)") ///
		  legend(subtitle("Energy Sources") order(1 "Coal" 2 "Hydro" ///
		         3 "Natural Gas" 4 "Oil" 5 "Other" ///
				 6 "Solar" 7 "Wind")) ///
		  pie(1, color(140 86 75)) ///
		  pie(2, color(51 122 183)) ///
		  pie(3, color(236 151 31)) ///
		  pie(4, color(200 0 0)) ///
		  pie(5, color(152 223 138)) ///
		  pie(6, color(251 222 6)) ///
		  pie(7, color(45 100 65))
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 8.gph", ///
replace

graph pie EXPERT2050, over (Type) plabel(_all percent, color(black) ///
          size(small) format(%9.1f)) ///
          title("Expert (2050)") ///
		  legend(subtitle("Energy Sources") order(1 "Coal" 2 "Hydro" ///
		         3 "Natural Gas" 4 "Oil" 5 "Other" ///
				 6 "Solar" 7 "Wind")) ///
		  pie(1, color(140 86 75)) ///
		  pie(2, color(51 122 183)) ///
		  pie(3, color(236 151 31)) ///
		  pie(4, color(200 0 0)) ///
		  pie(5, color(152 223 138)) ///
		  pie(6, color(251 222 6)) ///
		  pie(7, color(45 100 65))
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 9.gph", ///
replace

graph pie CAS2030, over (Type) plabel(_all percent, color(black) ///
          size(small) format(%9.1f)) ///
          title("CAS (2030)") ///
		  legend(subtitle("Energy Sources") order(1 "Coal" 2 "Hydro" ///
		         3 "Natural Gas" 4 "Oil" 5 "Other" ///
				 6 "Solar" 7 "Wind")) ///
		  pie(1, color(140 86 75)) ///
		  pie(2, color(51 122 183)) ///
		  pie(3, color(236 151 31)) ///
		  pie(4, color(200 0 0)) ///
		  pie(5, color(152 223 138)) ///
		  pie(6, color(251 222 6)) ///
		  pie(7, color(45 100 65))
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 10.gph", ///
replace

graph pie CAS2050, over (Type) plabel(_all percent, color(black) ///
          size(small) format(%9.1f)) ///
          title("CAS (2050)") ///
		  legend(subtitle("Energy Sources") order(1 "Coal" 2 "Hydro" ///
		         3 "Natural Gas" 4 "Oil" 5 "Other" ///
				 6 "Solar" 7 "Wind")) ///
		  pie(1, color(140 86 75)) ///
		  pie(2, color(51 122 183)) ///
		  pie(3, color(236 151 31)) ///
		  pie(4, color(200 0 0)) ///
		  pie(5, color(152 223 138)) ///
		  pie(6, color(251 222 6)) ///
		  pie(7, color(45 100 65))
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 11.gph", ///
replace

*Economic Outputs*
*Gross Domestic Product*
line GDPBAU	GDPEXPERT GDPCAS TimeYear, /// 
     title("Gross Domestic Product (GDP)") ///
     xtitle("Time(Year)") ///
	 ytitle("Change in GDP (Billion US Dollars)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(5)35) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)	 
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 12.gph", ///
replace

*Gross Domestic Product by Sector*
line GDPBAU	GDPEXPERT GDPCAS TimeYear, /// 
     title("GDP by Sector)") ///
     xtitle("Time(Year)") ///
	 ytitle("Change in GDP (Billion US Dollars)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(5)35) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)	 
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 13.gph", ///
replace

*Jobs*
line JOBBAU	JOBEXPERT JOBCAS TimeYear, /// 
     title("Jobs") ///
     xtitle("Time(Year)") ///
	 ytitle("Change in Jobs (Number of Jobs)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(500000)1500000) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 14.gph", ///
replace
	 
*Jobs by Sector*
line JOBBAU	JOBEXPERT JOBCAS TimeYear, /// 
     title("Jobs by Sector*") ///
     xtitle("Time(Year)") ///
	 ytitle("Change in Jobs (Number of Jobs)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(500000)1500000) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 15.gph", ///
replace	 
	 
*Debt*
line DEBTBAU DEBTEXPERT	DEBTCAS TimeYear, /// 
     title("National Debt") ///
     xtitle("Time(Year)") ///
	 ytitle("Change in Debt (Billion US Dollars)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(-20)-100) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)	 	 
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 16.gph", ///
replace	
	
*Government Cash Flow*
line DEBTBAU DEBTEXPERT	DEBTCAS TimeYear, /// 
     title("Government Cash Flow") ///
     xtitle("Time(Year)") ///
	 ytitle("Change in Cash Flow (Billion US Dollars)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(-20)-100) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)	 	 
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 17.gph", ///
replace	
		
*Cost of Implementation*
line DEBTBAU DEBTEXPERT	DEBTCAS TimeYear, /// 
     title("Cost of Implementation") ///
     xtitle("Time(Year)") ///
	 ytitle("Change in Cost (Billion US Dollars)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(-20)-100) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)	 	 
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 18.gph", ///
replace

*Savings from Implementation*
line DEBTBAU DEBTEXPERT	DEBTCAS TimeYear, /// 
     title("Savings from Implementation") ///
     xtitle("Time(Year)") ///
	 ytitle("Change in Savings (Billion US Dollars)") ///
     legend(subtitle("Scenarios") order(1 "BAU" 2 "Expert" 3 "CAS")) ///
	 xlabel(2020(5)2050) ///
	 ylabel(0(-20)-100) ///
	 lcolor (red blue green) ///
	 lwidth(thick thick thick)	 	 
graph save "Graph" "/Users/ssy02/Desktop/EPS Graph/Figure 19.gph", ///
replace	
