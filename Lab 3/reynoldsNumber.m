function [Re] = reynoldsNumber(velosity, chordLength, density, viscosity)

Re = (density*velosity*chordLength)/viscosity;