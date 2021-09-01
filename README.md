# FeederCattle_NYS
This repository includes two parts about feeder cattle marketing. First, we estimate a price-dependent, risk-responsive input-demand model for feeder cattle based on feeder cattle auction prices at an upstate NY livestock exchange over the course of six years. The data encompass nearly 12,000 lots of feeder cattle over 54 auction dates. The pricing model considers a series of covariates including market conditions, seasonality, and lot and quality characteristics. Second, we apply forecasting from the pricing model to a seasonal delta profit model to inform producer decision making on optimal timing for feeder sales, conditional on information available as animals come off pasture and expected feeding costs for over-wintering. 



# 1. Feeder Cattle Pricing Model Code
This section contains the pricing model to determine the main variables which influence the feeder cattle price. While consistent in formulation with Dhuyvetter and Schroeder (2000), our approach importantly extends cattle characteristics beyond simply breed and sex to consider preconditioning, frame size, muscling, thriftiness, and the presence of horns.  Prices differ not only by weight, but also on feeder cattle quality and market forces that reflect the complex interactions between markets for feed and finished (fed) cattle. The pricing model provides for direct calculation of expected market prices for feeder cattle under differing weights, market conditions, and quality characteristics – something necessary as a decision aid when making price forecasts.


Here is the pricing model code in R. In this code, we estimate three models: lm1 is the simplest pricing model without interaction terms. lm2 is our pricing model. Jing is Jing Qian's model. DS denotes the Dhuyvetter and Schroeder model in 2000.

 

- [PricingModel.R](https://github.com/my497/FeederCattle_ARER/blob/main/PricingModel.R)


# 2. Decision Making Model Code
We apply forecasting from the pricing model to a seasonal delta profit model to inform producer decision making on optimal timing for feeder sales, conditional on information available as animals come off pasture and expected feeding costs for over-wintering. we use our pricing model to forecast current and future feeder prices conditional on market and feeder cattle characteristics, we follow an alternative approach. The delta profit model outputs the expected profit gain (or loss) of selling the feeder cattle the following spring relative to the near term fall, explicitly accounting for price slides. Applying the model to our historical auction data, we find that 55% of the cattle sold in the fall were expected to bring in more profit per head at that time if sold the following spring. 

Here is the decision making model code in R.

- [DecisionMakingModel.R](https://github.com/my497/FeederCattle_ARER/blob/main/DecisionMakingModel.R)


# 3. Source Data File
Our analysis is based on transaction-level feeder cattle auction prices at the Finger Lakes Livestock Exchange in Canandaigua, NY during the spring (March through May) and fall (September through December) seasons from October 2011 through April 2017. The data includes transactions from 11,926 lots of cattle (3,565 in spring and 8,163 in fall) encompassing 35,703 head (10,588 in spring and 25,115 in fall) over 54 auction dates.

- [dataFinal.csv](https://github.com/my497/FeederCattle_ARER/blob/main/dataFinal.csv)


# 4. Acknowledgements 
We wish to thank the staff of Cornell Cooperative Extension (CCE) that assisted in our data collection efforts and to Jing Qian who developed a baseline of empirical results during the initial data collection phase. We are also appreciative of the helpful comments received at the CCE Ag and Food Systems In-Service Program where a previous version of this research was presented. 


# 5. Financial Disclosure

This work was supported by a joint research under #02267661 and #1004039 and extension program funded by the Cornell University Agricultural Experiment Station (Hatch funds) and Cornell Cooperative Extension (Smith Lever funds) received from the National Institutes of Food and Agriculture (NIFA,) U.S. Department of Agriculture (USDA). Any opinions, findings, conclusions, or recommendations expressed in this publication are those of the author(s) and do not necessarily reflect the view of USDA.

# 6. Conflicts of Interest

None.




