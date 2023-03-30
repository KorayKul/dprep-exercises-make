
## Main Build Rule 

all: plot_Antwerp.pdf plot_all.pdf


## Sub-build Rules

reviews.csv listings.csv: download.R
	R --vanilla < download.R

aggregated_df.csv: clean.R reviews.csv listings.csv
	R --vanilla < clean.R

pivot_table.csv: pivot_table.R aggregated_df.csv
	R --vanilla < pivot_table.R

plot_Antwerp.pdf: plot_Antwerp.R pivot_table.csv
	R --vanilla < plot_Antwerp.R

plot_all.pdf: plot_all.R aggregated_df.csv
	R --vanilla < plot_all.R




