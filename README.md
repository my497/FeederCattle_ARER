# FeederCattle_ARER
This repository includes two parts about feeder cattle marketing. First, we estimate a price-dependent, risk-responsive input-demand model for feeder cattle based on feeder cattle auction prices at an upstate NY livestock exchange over the course of six years. The data encompass nearly 12,000 lots of feeder cattle over 54 auction dates. The pricing model considers a series of covariates including market conditions, seasonality, and lot and quality characteristics. Second, we apply forecasting from the pricing model to a seasonal delta profit model to inform producer decision making on optimal timing for feeder sales, conditional on information available as animals come off pasture and expected feeding costs for over-wintering. 



# 1. Feeder Cattle Pricing Model based on auction data from upstate NY livestock exchange
This section contains the pricing model to determine the main variables which influence the feeder cattle price. Our analysis is based on transaction-level feeder cattle auction prices at the Finger Lakes Livestock Exchange in Canandaigua, NY during the spring (March through May) and fall (September through December) seasons from October 2011 through April 2017. The data includes transactions from 11,926 lots of cattle (3,565 in spring and 8,163 in fall) encompassing 35,703 head (10,588 in spring and 25,115 in fall) over 54 auction dates.


 

- [CapitalPCs061521.xlsx](https://github.com/schmi-ny/County-Level-Community-Capital-Stocks/blob/main/CapitalPCs061521.xlsx)
- [CapitalMaps.zip](https://github.com/schmi-ny/County-Level-Community-Capital-Stocks/blob/main/CapitalMaps.zip)

# 2. Code Files
This section contains the Stata and Matlab code files. The first part of the Stata code contains the Principal Component Analysis for each capital and standardizes them into indicies (0-100). This part of the code also computes descriptive statistics, differentiated by metro and nonmetro status. The second part of the Stata code estimates the association of the capitals to the percentage of farms participating in direct-to-consumer markets using nonspatial (Ordinary Least Squares) and spatial (Spatial Durbin Model) approaches. Marginal effects are also computed. 

The Matlab code estimates the direct, indirect, and total spatial spillover effects (for the Spatial Durbin Modedl) of the capital stock variables differentiated by metro, nonmetro metro-adacent, and nonmetro nonmetro-adjacent status, following LeSage and Pace (2009, pp 114-115). The Excel file of coordinates is needed to run this code.

- Stata code: [CapCodeStata061521.do](https://github.com/schmi-ny/County-Level-Community-Capital-Stocks/blob/main/CapCodeStata061521.do)
- Matlab code: [CapCodeMatlab061521.m](https://github.com/schmi-ny/County-Level-Community-Capital-Stocks/blob/main/CapCodeMatlab061521.m)
- Coordinates file for Matlab: [Coordinates.xlsx](https://github.com/schmi-ny/County-Level-Community-Capital-Stocks/blob/main/Coordinates.xlsx)

LeSage, J., and R.K. Pace. 2009. Introduction to Spatial Econometrics. Boca Raton, FL: Taylor and Francis.

# 3. Source Data File
This section contains the full source data file for all variables used in the Principal Component Analysis for derivation of the capital stock indices and in the follow on applicaiton of them to their association with the percent of farms participating in direct-to-consumer markets. A description of the variables is included in the Food Policy paper.  

- [FullDataFile061521.xlsx](https://github.com/schmi-ny/County-Level-Community-Capital-Stocks/blob/main/FullDataFile061521.xlsx)

# 4. More Information
Schmit, T.M., B.B.R. Jablonski, A. Bonanno, and T.G. Johnson. 2021. Measuring stocks of community wealth and their association with food systems efforts in rural and urban places. Food Policy, forthcoming.

# 5. Acknowledgements 
We wish to thank Libby Christensen for her research assistance, Jill Clark for creating the capital stock maps, and John Pender for comments received on construction of the capital stock indices and on prior versions of this manuscript. We are also appreciative of the helpful comments received by attendees of the Advances in the Economic Analysis of Food System Drivers and Effects pre-conference workshop at the Northeastern Agricultural and Resource Economics Association’s 2018 annual meeting where a previous version of this work was presented.

# 6. Funding
This material is based upon work supported by the Agriculture and Food Research Initiative [grant number 2015-68006-22848] from the U.S. Department of Agriculture, National Institute of Food and Agriculture. The funder played no role in the study design or the decision to submit the article for publication. The authors have no financial interest or benefit from the direct application of this research. The views expressed are the authors’ and do not necessarily represent the policies or views of any sponsoring agencies.

