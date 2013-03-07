function [Re] = ReynoldsNumber(velosity, chordLength, density, viscosity)

Re = (density*velosity*chordLength)/viscosity;