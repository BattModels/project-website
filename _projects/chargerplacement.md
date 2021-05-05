---
title: Charging Infrastructure

description: |
    By taking a probabilistic approach to predicting charger demand, INCEPTS can place chargers cost-effectively and equitably while reducing investment costs and meeting user demand.

people:
  - matt
  - alexius

layout: project
last-updated: 2021-05-04
---

By simulating thousands of cars in an area, INCEPTS can predict charger demand and suggest charger locations to meet that demand. Unlike other approaches, which assume a constant range, INCEPTS directly simulates vehicles producing a richer picture of where charges are needed.

## Boston Case Study

For this analysis, we simulated 1000 vehicles driving to 50 destinations sampled from a gaussian distribution with a standard deviation of 100km centered above Boston. As the cars drive about, we bin their state of charge (SOC) into regional hexagons, giving an *area* SOC estimate.

<img src="{% link img/charger_placement/average_soc.png %}" alt="Average SOC in Massachusetts" class="center">

But the *average* SOC of cars in a region isn't that helpful and skews charger placement towards helping the average. We want to place chargers that serve everyone, even when they have a frantic morning and forgot to charge overnight. By fitting a beta distribution to our regional SOC estimates, we can compute the probability of a vehicle having a low SOC in a given region.

<img src="{% link img/charger_placement/low_soc.png %}" alt="Proability of less than 30% charge" class="center">

By taking a probabilistic approach, we can place charges to ensure a consistent level of service for everyone instead of assuming the *average* is representative.
