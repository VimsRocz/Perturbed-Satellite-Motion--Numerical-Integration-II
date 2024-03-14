# Perturbed-Satellite-Motion--Numerical-Integration-II
# Perturbed Satellite Motion - Numerical Integration

## 1. Computation of CHAMP Orbit with Additional Perturbations

Compute the orbit of CHAMP numerically for one revolution considering the following perturbations:
- Direct gravitational influences of the Moon and the Sun separately
- Indirect influences of the Moon and the Sun due to Earth's tidal deformation

### Assumptions:
- The Moon and the Sun exhibit no proper motion during the time span considered (geocentric point of view).
- New Moon occurs at the beginning of summer.
- Lunar coordinates: rMoon = [0 352518 153279] km
- Solar coordinates: rSun = [0 137559 1060] km
- Gravitational constants: GMMoon = 4902.8 km^3/s^2, GMSun = 1.327 x 10^11 km^3/s^2

## 2. Relativistic Formulation of Satellite Motion

A relativistic formulation of satellite motion includes additional terms in the equations of motion (EOMs):
- Perturbation acceleration:
  - Schwarzschild solution term
  - Geodetic precession term
  - Lense-Thirring precession term
- Constants:
  - Earth's angular momentum vector per unit mass (J)
  - Sun's position and velocity:
    - rSun = [-150e6 0 0] km
    - _rSun = [0 -27.5 -12.0] km/s

### Plotting
Plot the differences between the perturbed and unperturbed satellite orbit trajectories.

### Results Interpretation
Highlighting any significant differences observed between the perturbed and unperturbed orbits.

