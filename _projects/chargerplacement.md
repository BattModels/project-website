---
title: Charging Infrastructure

description: |
  INCEPTS utilizes its fleet analysis and high-fidelity vehicle modeling software within a charger optimization algorithm to determine efficient and equitable charger locations that will reduce investment costs and meet the estimated demand.

people:
  - matt
  - alexius

layout: project
last-updated: 2021-05-04
---

INCEPTS utilizes its fleet analysis and high-fidelity vehicle modeling software within a charger optimization algorithm to determine efficient and equitable charger locations that will reduce investment costs and meet the estimated demand.

## Boston Case Study

This analysis looked to test the capabilities of INCEPTS in identifying critical areas for charger placement based solely on the State of Charge (SoC) demand exhibited by the vehicles in this study. For this analysis, we ran 1000 vehicles that randomly spawned in Boston, MA and each had 50 destinations to reach. Note that the results obtained from this study are not representative of a final result from INCEPTS as several factors that would normally be considered have been excluded for this test.

<img src="{% link img/SoC_Hex.png %}" alt="Average SOC in Massachusetts" class="center">

This image shows the average SoC of all of the vehicles that traveled through a particular hexagonal region. The darker red hexagons show regions where the average SoC is low while the brighter hexagons show regions where the average SoC is high.

<img src="{% link img/BostonAverage.png %}" alt="Average SOC in Boston" class="center">

This image shows the same information as the previous with a zoomed in focus on the Boston area itself.

<img src="{% link img/BostonVar.png %}" alt="Proability of less than 30% charge" class="center">

The statistical variation of the SoC within each region is also measured as shown in the above image. This is necessary to check the distribution of vehicle SoCs within the region to ensure that the demand is properly characterized. This check is important so that cases where, for example, an equal number of vehicles with high SoCs and low SoCs isn't misrepresented in the optimization scheme.

<img src="{% link img/charge_deploy.png %}" class="center">

This image shows the INCEPTS suggested charger locations in light blue and the existing charger locations in pink. In this analysis, INCEPTS was not given any knowledge of preexisting chargers that were deployed in Massachusetts. Due to the limited set of conditions INCEPTS was given, the optimization favored a solution that saw maximum coverage. As noted earlier, this placement solution should not be considered fully representative of the final solution INCEPTS will provide as the other conditions will change the placement once taken into account.

## Future Case Studies

A more in-depth analysis for the Boston area is currently in progress. To showcase the flexibility of the charger placement algorithm, case studies will also be performed for New York, Utah and California. These case studies will demonstrate the adaptability of the algorithm when considering different climates and provide interesting comparisons between what is currently deployed and what INCEPTS suggests.
