# Multi-Input WASD for time-series Neuronet
Implementation of a fast 3-layer feed-forward neuronet model for time-series modeling and forecasting problems that is trained using a WASD (weights-and-structure-determination) for time-series algorithm, called WASDTS.
The purpose of this package is to present applications on Federal Reserve Bank of St. Louis (FRED) industrial indices under three different patterns of time-series.
Employing a power sigmoid activation function, the WASDTS algorithm handles the model fitting and validation by determining the optimal input variables number and the weights of the MI-WASDTSN. More specifically, the WASDTS algorithm finds and holds only the activation function powers that reduce the model's error during validation. 

The main article used is the following:
*	S.D.Mourtas, "A Weights Direct Determination Neuronet for Time-Series with Applications in the Industrial Indices of the Federal Reserve Bank of St. Louis", (submitted)

Also, the package includes the following six datasets:
*	Board of Governors of the Federal Reserve System (US), Industrial Production: Utilities: Electric and Gas Utilities (NAICS = 2211,2) [IPG2211A2N], retrieved from FRED at https://fred.stlouisfed.org/series/IPG2211A2N
*	Board of Governors of the Federal Reserve System (US), Industrial Production: Manufacturing: Non-Durable Goods: Ice Cream and Frozen Dessert (NAICS = 31152) [IPN31152N], retrieved from FRED at https://fred.stlouisfed.org/series/IPN31152N
*	Board of Governors of the Federal Reserve System (US), Capacity Utilization: Utilities: Electric Power Generation, Transmission, and Distribution (NAICS = 2211) [CAPUTLG2211S], retrieved from FRED at https://fred.stlouisfed.org/series/CAPUTLG2211S
*	Board of Governors of the Federal Reserve System (US), Industrial Production: Mining, Quarrying, and Oil and Gas Extraction: Gold Ore and Silver Ore Mining (NAICS = 21222) [IPG21222S], retrieved from FRED at https://fred.stlouisfed.org/series/IPG21222S
*	Board of Governors of the Federal Reserve System (US), Industrial Production: Manufacturing: Durable Goods: Machinery (NAICS = 333) [IPG333S], retrieved from FRED at https://fred.stlouisfed.org/series/IPG333S
*	Board of Governors of the Federal Reserve System (US), Industrial Production: Manufacturing: Durable Goods: Wood Product (NAICS = 321) [IPG321S], retrieved from FRED at https://fred.stlouisfed.org/series/IPG321S 

# M-files Description
*	Main_MI_WASDTSN.m: the main function
*	problem.m: input data and parameters of the MI-WASDTSN
*	WASDTS.m: function for finding the optimal number of hidden-layer neurons, along with the optimal activation function power at each hidden-layer neuron
*	Normalization.m: function for normalization
*	Qmatrix.m: function for calculating the matrix Q
*	predictN.m: function for forecasting
*	error_pred.m: function for calculating the mean absolute percentage error (MAPE) of the prediction

# Installation
*	Unzip the file you just downloaded and copy the MI-WASDTSN directory to a location,e.g.,/my-directory/
*	Run Matlab/ Octave, Go to /my-directory/MI-WASDTSN/ at the command prompt
*	run 'Main_MI_WASDTSN (Matlab/Octave)

# Results
After running the 'Main_MI_WASDTSN.m file, the package outputs are the following:
*	The optimal number of hidden-layer neurons.
*	The optimal activation function power of each hidden-layer neuron.
*	The prediction and MAPE of the training samples.
*	The graphic illustration of the training and forecasting performance.

# Environment
The MI-WASDTSN package has been tested in Matlab 2018b on OS: Windows 10 64-bit.
