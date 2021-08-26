2021--Murphy et al.--Designing and interpreting 4D tumour spheroid experiments

Preprint on bioRxiv:
[![DOI](https://doi.org/10.1101/2021.08.18.456910)](https://doi.org/10.1101/2021.08.18.456910) 

Key MATLAB code used to generate figures.
Software requirements: MATLAB 2019a or later.

Please contact Ryan Murphy for any queries or questions.

Notes:
1) The main script is A_Murphy2021Spheroids_Main.m. By running each section of this code one can generate maximum likelihood estimates, profile likelihoods, and figures in the main manuscript and supplementary material. The total run time for one simulation, e.g. WM793B tumour spheroid formed with 5000 cells per spheroid analysed with Design 3 Temporal Resolution A, is approximately 104 hours (2 hours to compute first approximation of MLE; 5 hours for first evaluation of profile likelihood for each of the five parameters and repeated twice - once to left of MLE and once to right of MLE; 2 hours to compute second approximation of MLE inside approximate 95% confidence intervals; 5 hours for evaluation of profile likelihoods inside approximate 95% confidence intervals for each of the five parameters and repeated twice - once to left of MLE and once to right of MLE; 30 mins for all figures).

2) function_load_simulation_settings.m - this script includes details used to generate maximum likelihood estimates and profile likelihoods. In this file the user can specify the cell line, initial condition, temporal resolution, and types of measurements used. To run this code move the relevant .mat files from the 'Data files (MATLAB)' folder into the same folder as the MATLAB scripts.

3) Data files used for code are included as .mat files in the folder 'Data files (MATLAB)'. Each cell line has 3 files corresponding to outer radius measurements, inhibited radius measurements, and necrotic radius measurements. These files are also provided in an .csv format in the folder 'Data files (csv)'.

4) AA_Murphy2021Spheroids_RUN_loop.m - this script can be used to loop through the main script (A_Murphy2021Spheroids_Main.m) without running each section separately. The simulation number is set for a WM793b tumour spheroid formed with 5000 cells and analysed with Design 3 Time Resolution A.

5) Section 33 of  A_Murphy2021Spheroids_Main.m enables figures in plots to be generated (provided MLE and profile likelihoods data files have been generated for all relevant simulations in the figure - this is completed by modifying  AA_Murphy2021Spheroids_RUN_loop.m). function_Greenspan_compute_confidenceintervals - can be called to generate approximate 95% confidence intervals as shown in the Table 3 Supplementary Material D.

6) function_Greenspan_generate_synthetic_data.m - this standalone script is used to generate the synthetic data used in Supplementary Material E.
