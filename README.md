# Hansmann’s Contract Failure Theory: Correct but Irrelevant? 
<!---#### **Eva Witesman**, Romney Institute of Public Service and Ethics, Brigham Young University
#### **Curtis Child**, Department of Sociology, Brigham Young University
#### **Chris Silvia**, Romney Institute of Public Service and Ethics, Brigham Young University--->


## Abstract
     
<table><tr><td> 

In his theory on the role of nonprofit enterprise, Hansmann (1980) makes an argument for the government regulation of nonprofit enterprise on the basis of what he calls “contract failure.” In this paper, we assess whether nonprofit status serves as a valuable indicator of trust in low information environments as Hansmann posited. Using choice-based conjoint analysis, we find that in the absence of additional information (such as consumer ratings and third-party certifications) nonprofit status serves as an important value signal to consumers. Under most low-information circumstances, subjects prefer goods and services provided by nonprofits to those offered by government or business providers. However, in the presence of consumer ratings and third-party certifications, nonprofit status becomes much less relevant. Given that Hansmann was writing before the ubiquitous availability of online rating and certification information, we find that his theory was prescient, but that as information becomes more abundant and organizational forms continue to converge, it is likely that contract failure thesis will become increasingly obsolete, undermining Hansmann’s argument for government regulation of the nonprofit form.  
 
</td></tr></table>


-----

<!---This repository contains the data and code for:
> # ENTER CITATION HERE --->
-----
-----
## Replication
For our analysis, we used Sawtooth’s proprietary, built-in Analysis and Simulator tools to conduct initial analyses. Supplemental analyses and graphics were generated using Excel and R. Sawtooth provides all data in Microsoft Excel files.  

There are three types of analysis conducted in our paper. The following describes the rationale for the analysis, the data used, the procedures followed, and the code used.

----
1. We estimated the part-worth utilities, or the influence of individual attribute levels on the decision. The part-worths are zero-centered for each attribute such that the average part-worth score for each attribute is set to 0. These part-worth scores serve as the basis for the analysis of conjoint analysis results. *Table 3* can be replicated using the following:

     
     A. *Data:*
     1. The data used for the Meal Scenario portion of *Table 3* can be found in *Meal_Scenario_PartWorths.xlsx*
     2. The data used for the Shirt Scenario portion of *Table 3* can be found in *Shirt_Scenario_PartWorths.xlsx*
     3. The data used for the Health Test Scenario portion of *Table 3* can be found in *Health_Scenario_PartWorths.xlsx*
     
     B. *Procedure and Code for Table 3:*
     1. The mean partworth utility for each level of each attribute was calculated in Excel using the =AVERAGE() command. For example, the mean partworth utility for the nonprofit organizational type in the meal scenario is =AVERAGE(B2:B20001) since cells B2 through B20001 contain the partworths for the nonprofit organizational type for the 20,000 iterations.
     2. The standard deviation for each level of each attribute was calculated in Excel using the =STDEV.S() command. For example, the standard deviation for the partworth utility for the nonprofit organizational type in the meal scenario is =STDEV.S(B2:B20001). The standard deviation was not reported in *Table 3*. It was calculated in order to determine the lower and upper bounds of the 95% credible interval
     3. The lower and upper bound of the 95% Credible Interval was calculated using the =NORM.INV command
        1. For the lower bound: =NORM.INV(0.025,mean,standard deviation)
        2. For the upper bound: =NORM.INV(0.975,mean,standard deviation)

----
        
----
2. We use the part-worth utilities to estimate attribute importance scores. The attribute importance scores provide information regarding the relative importance of each attribute. Attribute importance scores are estimated by calculating part-worth utilities for each attribute level for each subject. The range in part-worth utilities for each attribute is then determined (the highest part-worth utility at a certain level of the given attribute minus the lowest part-worth utility at a certain level of the given attribute) before computing each attribute’s utility range as a percentage of the combined possible utility, which are then averaged across the dataset (Orme 2014). The resulting percentage is an attribute’s importance. Attribute importance scores, therefore, can be interpreted as the average percent of the total variation in utility attributable to the particular attribute. *Table 5* can be replicated using the following:   


     A. *Data:*
     1. The data used for the Health Test Scenario portion of *Table 5* can be found in *Health4sector_PartWorths.xlsx*
     2. The data used for the Museum Ticket Scenario portion of *Table 5* can be found in *Museum4sector_PartWorths.xlsx*   

   
     B. *Procedure and Code:*
     1. The utilities for each attribute in each iteration were determined by calculating the difference between the largest partworth for any level of the attribute in the iteration and the smallest partworth for any level of the attribute in the iteration using the =Max and =Min commands. For example, the utility for organizational type for the first iteration is calculated by =MAX(B2:E2)-MIN(B2:E2) since cells B2 through E2 contain the partworths for the four levels of the organizational type in the first iteration.
     2. The importance for each attribute in each iteration was determined by dividing the utility for each attribute by the sum of the utilities for all attributes in that iteration. For example, if the utilities for organizational type, cost, rating, and certification for the first iteration were calculated in cells B20015 through E20015, the importance for organizational type would be calculated by =B20015/SUM($B20015:$E20015) since cell B20015 would contain the utility for organizational type as described in Step 1, above.
     3. The mean attribute importance was calculated using =AVERAGE
     4. The standard deviation for each attribute importance was calculated in Excel using the =STDEV.S() command. 
     5. The lower and upper bound of the 95% Credible Interval was calculated using the =NORM.INV command
        1. For the lower bound: =NORM.INV(0.025,mean,standard deviation)
        2. For the upper bound: =NORM.INV(0.975,mean,standard deviation)
-----

-----
3. We use the part-worth utilities to estimate the probability that a subject will make a purchasing decision at specified attribute levels. Because part-worth scores are zero-centered by attribute, part-worth scores for one attribute cannot be compared to the scores of the other attributes because of the difference in scaling. Therefore, we transform part-worth utilities into preference shares using a market simulator (Orme 2014). Market simulator results are easier to interpret because they are on a zero to one hundred scale, and have ratio scale properties (Orme 2014). We presented these results graphically, with each plotted point representing the probability that subjects would purchase the product at the indicated levels of the attributes. *Figure 4* and *Figure 5* can be replicated using the following:   


     A.*Data:*
     1. The data used for *Figure 4* can be found in *Health_Long_Results*
     2. The data used for *Figure 5* can be found in *Museum_Long_Results.xlsx*
     3. The data used to create the *Health_Long_Results* and the *Museum_Long_Results.xlsx* were generated using the *Sawtooth_Health_Simulator.xlsx* and the *Sawtooth_Museum_Simulator.xlsx*, respectively.     
 
  
     B. *Procedure and Code:*
      1. The code for creating *Figure 4* can be found in *Figure4.R*
      2. The code for creating *Figure 5* can be found in *Figure5.R*
-----  

-----
4. We regressed the cost levels on the average utilities for each cost level to calculate the willingness to pay for each attribute level in order to create a linear interpolation of a continuous covariate.


     A. *Data:*
     1. The data used to calculate the marginal willingess to pay (MWTP) for the Health Test Scenario can be found on the summary tab of *CBChealth4sector-HB.xlsx*
     2. The data used to calculate the marginal willingess to pay (MWTP) for the Museum Ticket Scenario can be found on the summary tab of *CBCmuseum4sector-HB.xlsx*  
     
     
     B. *Procedure and Code:*
     1. The average ultility was regressed on the cost attribute levels using =LINEST to get the slope coefficient. For example, the formula =@LINEST(B12:B17,A12:A17) was used in Cell B35 of the *CBChealth4sector-HB.xlsx* to calculate thge slope coefficient for the Health Test Scenario
     2. The MWTP was calculated by dividing the difference of the average utlity for the base level minus the average utility for the level of interest by the slope coefficient. For example, the formula to calculate the MTWP for Nonprofitness in the Health Test Scenario is =(B11-B8)/B35, where cell B11 contains the average ultility for an organization from an unknown sector (the base level), B8 is the average utility for a nonprofit organization, and B35 is the slope coefficient calculated in Step 1. 
-----
