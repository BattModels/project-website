---
layout: default
title: Motivation
notitle: false
---

Vehicle electrification has been an ongoing process for the past several years. Electric vehicles (EVs) have been shown with market analysis to nearly be at the point where consumers will prefer to buy an EV over a gas-powered car. However, adoptions has been limited by a lack of charging infrastructure. A [study by the ICCT][1] found that 88 of the 100 most populated U.S. cities had less than half of the total charging capacity needed by 2025. This lack of infrastructure exasperates consumer range anxiety which led to [1 in 5 Californian EV owners][3] to revert back to gas-powered vehicles.

[Range anxiety][2] is a significant concern for consumers given the limited range of EVs and lack of widespread charging infrastructure.  While EVs are suitable for most consumers' daily commute, longer routes can risk running out of charge. Increasing investment and deployment of public fast chargers can help to ease the technical and psychological hurdles facing widespread EV adoption.

Fast chargers are expensive; thus, the proper considerations must be made when siting these chargers. Most charger placement algorithms model the range of an EV using a fixed lower bound. This type of modeling of the battery, however, is not sufficient. A battery is a dynamic system that will change based on the power required by the vehicle and local conditions. Not accounting for these factors will result in an improper charger placement, leading to some chargers having low utilization and/or leaving EV drivers stranded between chargers.

The INCEPTS software platform has been designed to directly address these problems and provide solutions that incorporate a dynamic battery model and the local conditions in its recommendations.  The base module of INCEPTS is a high-fidelity vehicle model which utilizes a vehicle dynamics model to capture the power requirements of the vehicle as it travels through its environment. This power demand is then fed into a battery model that determines the State of Charge (SoC) of the battery based on the environmental conditions and the chemistry of the battery in the vehicle. This allows INCEPTS to fully capture the dynamics of the EV regardless of the area in which the vehicle is traveling. INCEPTS then includes a fleet analysis module which will use the high-fidelity vehicle model to estimate the fleet statistics within the target area. The charger placement module uses these regional estimates to determine proper charger locations. The charger placement solution offered by INCEPTS can provide equitable access, maximize charger utilization, minimize the economic investment cost and meet consumer charger demand.

[1]: https://theicct.org/publications/charging-gap-US
[2]: https://www.sciencedirect.com/science/article/pii/S2214629618304456
[3]: https://www.businessinsider.in/1-in-5-electric-vehicle-owners-in-California-switched-back-to-gas-because-charging-their-cars-is-a-hassle-new-research-shows/articleshow/82332806.cms
