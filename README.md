# Centromere cluster quantification

Version 1.0

Measure degree of clustering of individual centromere spots from microscopy data.


## Input/Output

Place any number of data folders (one folder containing multiple images) within data>raw (see Project organization below). These will be annotated separately and will result in properly formatted output graphs.
Filenames ending with "PRJ.tif" or "PRJ.dv" (note the capitals) will be read by the code. Other files can exist within data folder without interference.

Run src>MAIN_RunOnSubfolders.ijm and select data>raw as base directory (drag into ImageJ or FiJi and hit run). This will output a *.txt file which is then read by the Python code.
Next, run src>CEN_cluster_analysis.py from a Python compiler (doesn't work from FiJi for whatever reason).

The ImageJ macro outputs a *.txt file in the format below, which is read by the Python script

This will output three types of data:
1) a *.txt file with all raw data (see format below)
2) a single histogram comparing number of CENs per squareby dataset
3) one lineplot per dataset showing the average +/- SD (I believe) tubulin intensity by number of centromeres per square
4) (in a subfolder:) one violinplot per image showing the distribution of tubulin intensity by number of centromeres per square

The *.txt file will be organized as follows:
>> ##### Running CenClusterQuant on [base folder]
>> ##### Start time: [current time]
>> ***[folder name]
>> **[image name]
>> [list of CEN counts]
>> [list of tubulin intensities]
>> **[image name]
>> [list of CEN counts]
>> [list of tubulin intensities]
>> ***[folder name]
>> **[image name]
>> [list of CEN counts]
>> [list of tubulin intensities]
>> etc.
>> ##### End time: [current time]
>> ##### All done

=======
This will output a *.txt file with the data in the following format: [need to write this up]

Next, run src>CEN_cluster_analysis.py from a Python compiler (doesn't work from FiJi for whatever reason)


## Project organization

Used Barbara Vreede's 'good-enough-project' cookiecutter setup for project organization (cookiecutter gh:bvreede/good-enough-project)

```
.
├── .gitignore
├── CITATION.md
├── LICENSE.md
├── README.md
├── requirements.txt
├── bin                <- Compiled and external code, ignored by git (PG)
│   └── external       <- Any external source code, ignored by git (RO)
├── config             <- Configuration files (HW)
├── data               <- All project data, ignored by git
│   ├── processed      <- The final, canonical data sets for modeling. (PG)
│   ├── raw            <- The original, immutable data dump. (RO)
│   │   ├── dataset 1  <- separate conditions to be analyzed (containing multiple images). (RO) 
│   │   ├── dataset 2   
│   │   ├── ...         
│   │   └── dataset N   
│   └── temp           <- Intermediate data that has been transformed. (PG)
├── docs               <- Documentation notebook for users (HW)
│   ├── manuscript     <- Manuscript source, e.g., LaTeX, Markdown, etc. (HW)
│   └── reports        <- Other project reports and notebooks (e.g. Jupyter, .Rmd) (HW)
├── results
│   ├── figures        <- Figures for the manuscript or reports (PG)
│   └── output         <- Other output for the manuscript or reports (PG)
└── src                <- Source code for this project (HW)
```


## License

This project is licensed under the terms of the [MIT License](/LICENSE.md)

## Citation

Please [cite this project as described here](/CITATION.md).

```
