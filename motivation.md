---
layout: default
title: Motivation
notitle: false
---

Vehicle electrification has been an ongoing process for the past several years. Electric vehicles (EVs) have been shown with market analysis to nearly be at the point where consumers will prefer to buy an EV over a gas-powered vehicle. The three pillars identified as needing to be met for widespread EV adoption are:

1. Manufacturer Suggested Retail Price at or below $36,000
2. EV range of at least 291 miles
3. Widespread fast charging stations

While the EVs in the market already have, or will shortly, achieve pillars 1 and 2; the charging infrastructure required by pillar 3 is extremely limited. A study found that out of the 100 most populous U.S. metropolitan areas, 88 had less than half of the total charging infrastructure that they are expected to need by 2025. While charging at home is possible, a lack of in-home and publicly accessible fast chargers has led to nearly 1 in 5 EV owners in California choosing to revert back to a gas-powered vehicle.

This gap in charging infrastructure, coupled with the limited range of EVs, is a common source of range anxiety for many EV owners. Range anxiety is a major concern for consumers, especially when a trip is planned that is outside of the typical routes done by the driver, for example a vacation trip, and is often cited as the primary reason why, even with incentives, consumers are hesitant to switch to an EV. Increasing investment and deployment of public fast chargers can help to ease the technical and psychological hurdles facing widespread EV adoption. 

Fast charging stations are expensive; however, thus it is important that the right considerations be made when siting these chargers. Many charger placement algorithms that exist model the battery of an EV as a fixed system with either a single range or a fixed discharge rate. These static values, often obtained from manufacturer's specifications, then directly impact where the chargers will be placed. This type of modeling for the battery, however, is not sufficient. A battery is a dynamic system which will change based on the power required by the vehicle. In addition, both the power requirement of the vehicle and the battery dynamics depend on the environmental conditions in which the vehicle operates; another set of factors that most algorithms do not consider. This means that a charger placement algorithm which uses a fixed battery will improperly place the chargers which could lead to some chargers having low utilization and, in the worst case, EV drivers not being able to properly travel using the installed charging network since the charging stations were placed farther apart than they should have been and not providing drivers a place charge where they actually needed it.

The INCEPTS software platform has been designed to directly address these problems and provide solutions that incorporate a dynamic battery model and the local conditions in its recommendations.  The base module of INCEPTS is a high-fidelity vehicle model which utilizes an adaptive vehicle dynamics model to capture the power requirements of the vehicle as it travels through its environment. This power demand is then fed into a battery model that determines the State of Charge (SoC) of the battery based on the environmental conditions and the chemistry of the battery in the vehicle. This allows INCEPTS to fully capture the dynamics of the EV regardless of the area in which the vehicle is traveling. INCEPTS then includes a fleet analysis module which will use the high-fidelity vehicle model to estimate the fleet statistics within the target area. Through the use of high-performance computing and complex system analysis, the fleet analysis of INCEPTS is able to capture high-level trends that can directly impact the decisions being made by an EV fleet operator. The charger placement module of INCEPTS utilizes both the fleet analysis and high-fidelity vehicle software in an optimization to determine the proper locations for chargers. By including a variety of factors such as electricity cost, societal costs, etc. the charger placement solution offered by INCEPTS can provide equitable access, maximize charger utilization, minimize the economic investment cost and properly meet the demand of the EVs.

References:
1. [Global EV Outlook 2020](https://www.iea.org/reports/global-ev-outlook-2020)
2. [Charging Gap Study](https://theicct.org/publications/charging-gap-US)
3. [California EV article]( https://www.businessinsider.in/1-in-5-electric-vehicle-owners-in-California-switched-back-to-gas-because-charging-their-cars-is-a-hassle-new-research-shows/articleshow/82332806.cms)
4. [Range Anxiety](https://www.sciencedirect.com/science/article/pii/S2214629618304456)
