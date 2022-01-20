# FeederCattle_NYS
This repository includes two parts about feeder cattle marketing. First, we estimate a price-dependent, risk-responsive input-demand model for feeder cattle based on feeder cattle auction prices at an upstate NY livestock exchange over the course of six years. The data encompass 8,977 feeder cattle transactions over 54 auction dates. The pricing model considers a series of covariates including market conditions, seasonality, and lot and quality characteristics. Second, we apply forecasting from the pricing model to a seasonal delta profit model to inform producer decision making on optimal timing for feeder sales, conditional on information available as animals come off pasture and expected feeding costs for over-wintering. 



# 1. Feeder Cattle Pricing Model Code
This section contains the pricing model to determine the main variables that influence feeder cattle prices in New York state. The model includes cattle characteristics such as breed, sex, preconditioning, frame size, muscling, thriftiness, and the presence of horns.  Prices differ not only by weight, but also on feeder cattle quality and market forces that reflect the complex interactions between markets for feed and finished (fed) cattle. The pricing model provides for direct calculation of expected market prices for feeder cattle under differing weights, market conditions, and quality characteristics – something necessary as a decision aid when making price forecasts.


Here is the pricing model code in R. 

 

- [PricingModel.R](https://github.com/my497/FeederCattle_ARER/blob/main/PricingModel.R)


# 2. Decision Making Model Code
We apply forecasting from the pricing model to a seasonal delta profit model to inform producer decision making on optimal timing for feeder sales, conditional on information available as animals come off pasture and expected feeding costs for over-wintering. We use our pricing model to forecast current and future feeder prices conditional on market and feeder cattle characteristics. We also considered death loss, opportunity cost and interest cost in the delta profit model. The delta profit model outputs the expected profit gain (or loss) of selling the feeder cattle the following spring relative to the near term fall , explicitly accounting for price slides. Applying the model to our historical auction data, we find that 50.56% of the cattle sold in the fall were expected to bring in more profit per head at that time if sold the following spring. We also add sensitivity analysis in the revised manuscript for the delta profit model by including two thresholds ($0 and $25 per head). What's more, we calculate the mean and lower bounds of delta profits from a 95% confidence interval.

Here are the decision making model codes in R.

- [DecisionMakingModel.R](https://github.com/my497/FeederCattle_ARER/blob/main/DecisionMakingModel.R)
- [DecisionMakingModel_Conf_Interval.R](https://github.com/my497/FeederCattle_ARER/blob/main/DecisionMakingModel_Conf_Interval.R)

# 3. Source Data File
Our analysis is based on transaction-level feeder cattle auction prices at the Finger Lakes Livestock Exchange in Canandaigua, NY during the spring (March through May) and fall (September through December) seasons from October 2011 through April 2017. The data includes 8977 transactions of cattle (2,671 in spring and 6,306 in fall) encompassing 22,466 head (6,640 in spring and 15,826 in fall) over 54 auction dates.

- [datac.csv](https://github.com/my497/FeederCattle_ARER/blob/main/datac.csv)


# 4. Acknowledgements 
We wish to thank the staff of Cornell Cooperative Extension (CCE) that assisted in our data collection efforts and to Jing Qian who developed the baseline empirical strategy during the initial data collection phase of this research. We are also appreciative of the helpful comments received at the CCE Ag and Food Systems In-Service Program where a previous version of this research was presented.


# 5. Financial Disclosure

This work was supported by a joint research under #02267661 and #1004039 and extension program funded by the Cornell University Agricultural Experiment Station (Hatch funds) and Cornell Cooperative Extension (Smith Lever funds) received from the National Institutes of Food and Agriculture (NIFA,) U.S. Department of Agriculture (USDA). Any opinions, findings, conclusions, or recommendations expressed in this publication are those of the author(s) and do not necessarily reflect the view of USDA.

# 6. Conflicts of Interest

None.




