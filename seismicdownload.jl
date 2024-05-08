using SeisBase
# This is a quick test for julia's Seisbase package to pull single events and plot them using Plots

# Get the start and end time in UTC
ts = "2023-11-24T08:12:04"
te = "2023-11-24T08:18:04"

# Get the seisdata "S", downloading from FDSN, station UO.HAPY, from IRIS server
S = get_data("FDSN","UO.HAPY.",src="IRIS", s=ts,t=te, detrend=false, rr=false, w= true, autoname=true)
SeisBase.findchan("HNZ", S) #This find the HNZ channel in the seisdata to plot

using Plots

#Plots the event
Plots.plot(S[3].x, label="HNZ", legend=:topleft, title="Seismic Station UO.HAPY", xlabel="Time (s)", ylabel="Amplitude")
#Personal Projects to add
# Seisnoise to make plots nicer, make plot have more features such as time axis
# Make some sort of Pandas DF equvialent and Obspy way to pull events, gather station data to calculate arrival time