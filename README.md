# DEBrowser: 
Interactive Differential Expression Analysis Tool

# Introduction

Differential gene expression analysis has become an increasingly popular tool
in determining and viewing up and/or down experssed genes between two sets of
samples.  The goal of Differential gene expression analysis is to find genes
or transcripts whose difference in expression, when accounting for the
variance within condition, is higher than expected by chance.  DESeq2
<https://bioconductor.org/packages/release/bioc/html/DESeq2.html> is an R
package available via Bioconductor and is designed to normalize count data
from high-throughput sequencing assays such as RNA-Seq and test for
differential expression (Love et al. 2014).  With multiple parameters such as
padjust values, log fold changes, plot styles, and so on, altering plots
created with your DE data can be a hassle as well as time consuming. The
Differential Expression Browser uses DESeq2 coupled with shiny to produce
real-time changes within your plot queries and allows for interactive browsing
of your DESeq results. In addition to DESeq analysis, DEBrowser also offers a
variety of other plots and analysis tools to help visualize your data even
further.

# Quick start

Before you start;

First, you will have to install R and/or RStudio.
(On Fedora/Red Hat/CentOS, these packages have to be installed;
openssl-devel, libxml2-devel, libcurl-devel, libpng-devel)
Running these simple commands will launch the DEBrowser within your local
machine:

```
# Installation instructions:
# 1. Install DEBrowser and its dependencies by running the lines below
# in R or RStudio.

source(“http://www.bioconductor.org/biocLite.R”)

biocLite("debrowser")

# 2. Load the library

library(DEBrowser)

# 3. Start DEBrowser

startDEBrowser()
```

# Browsing your Data

Once you have the DEBrowser running, a page will load asking to choose a CSV
file or to load the demo data.  In order to run DESeq2, we are going to need
gene quantifications for those genes contained in a tab-seperated values (TSV) 
format.  The file values must contain the gene, transcript, and the samples 
count values you wish to enter into DEBrowser.

```
IE:

# TSV:

gene  transcript  exper_rep1 exper_rep2 control_rep1 control_rep2
DQ714826  uc007tfl.1  0.00  0.00  0.00  0.00
DQ551521  uc008bml.1  0.00  0.00  0.00  0.00
AK028549  uc011wpi.1  2.00  1.29  0.00  0.00
```

You can also view/use the demo data by clicking the 'Load Demo!' text as an
example.  For the case study demo data, feel free to download our case study
demo file at http://galaxyweb.umassmed.edu/pub/DC/advanced_demo.tsv
After obtaining and loading in the gene quantifications file, you
are then able to view QC information of your quantifications or to continue
on to running DESeq2.

![alt text](https://i.imgur.com/CkPTon9.png "Initial option selection")

**Figure 1:** *The initial options selection.*

Upon selection of QC information, you will be
shown an all-to-all plot of your samples.  This sample-by-sample comparison
will help you visualize possible descrepencies between replicate samples,
in case you may want to omit them for further analysis.  To the left of
this plot are various plot-shaping options you can alter to more easily view
the all-to-all plot.

Additionally, two addition QC plots are available for you to use: Heatmap and
PCA plots.  The heatmap will display genes for each sample within your dataset
in the form of a heatmap and PCA will display Principal component analysis of
your dataset. You have the option of veiwing an interactive heatmap by selecting
the 'Interactive' checkbox in the left side panel when you have selected the
Heatmap option.  You can select these various plot options by selecting the type
of plot you wish to view on the left panel.

![alt text](http://i.imgur.com/rS1n0hd.png "QC plots")

**Figure 2:** *Display of the all-to-all plot in the initial QC plots page.*

You can also view the genes within your quantification file in various
ways.  The 'Tables' tab will bring you to a table setup based on the dataset
you have selected on the left options panel. The 'All detected' option
lists all of the genes present within your file.  The 'Selected' option
lets your browser your gene selection based on your interactive heatmap
selection.  The Last option, 'Most Varied', will display your
top N varied genes.  You can alter the value of N by selecting 'most-varied'
from the dropdown menu on the left.

![alt text](http://i.imgur.com/WPqscLL.png "Heatmap")

**Figure 3:** *Display of the heatmap in the initial QC plots page.*

![alt text](http://i.imgur.com/VWaMHWl.png "PCA")

**Figure 4:** *Display of the PCA plot in the initial QC plots page.*

![alt text](http://i.imgur.com/rwdrnZQ.png "Most varied")

**Figure 5:** *Display of most varied genes.*

Upon selecting to run DESeq, you are then able to select
which samples will be selected for your first condition and second condition
to use for differential expression analysis.  By clicking the 'Add New
Comparison' button, you can add as many different comparisons as you want.
Sample names are created based on the column headers within your data file.
Once you've selected your comparisons, you are then ready to run DESeq2 to
calculate differential expression by clicking on the 'Submit!' button.

![alt text](https://i.imgur.com/XhxEfJO.png "Loading in samples")

**Figure 6:** *Menus after loading in a sample.*

#Analyzing the Results

After clicking on the 'Submit!' button, DESeq2 will analyze your comparisons
and store the results into seperate data tables.  Shiny will then allow you
to access this data, with multiple interactive features, at the click of a
button.  It is important to note that the resulting data produced from DESeq
is normalized. Upon finishing the DESeq analysis, a tab-based menu will appear
with multiple options.

![alt text](https://i.imgur.com/hXRcDQt.png 'tab selection')

**Figure 7:** *List of the tabbed menus in DEBrowser.*


The first tab, the 'Main Plots' section, is where you will be able to view
the interactive results plots.  On the left hand side of the screen will be
the options you have  to alter the padj and fold change
cutoff values, what specific data set to use such as up or down regulated
genes, what comparison dataset you would like to use to plot,
and what type of plot you would like to view your results in.  Plot
choices include:

* Main plot

* Volcano plot

* MA plot

![alt text](https://i.imgur.com/xjtcqrk.png 'scatterplot')

**Figure 8:** *Main scatter plot and the zoomed in main scatterplot.*

![alt text](https://i.imgur.com/DinxEaW.png 'volcano')

**Figure 9:** *Main volcano Plot and the zoomed in main volcano plot.*

![alt text](https://i.imgur.com/lysUKfZ.png 'ma')

**Figure 10:** *Main MA plot and the zoomed in main MA plot.*

Once you have selected your values, you can hit the 'Submit!' button to create
your interactive plots!

The top left plot is whichever plot you have
selected to use to analyze your results.  Up-regulated genes are displayed
in green while down-regulated genes are displayed in red.
Hovering over a gene on this plot will display the bottom two plots: the
genes normalized variation and colored by condition in the left graph,
and the normalized variation between conditions within the right graph.
Hovering over a gene will also display information about that gene in
regards to both conditions you have selected.
By clicking and dragging your mouse to create a selection over the main graph,
you will create the top right plot, or the zoomed in version of your
selection.  If you are going to change any of the parameters on the left,
please make sure to re-click the 'Submit!' button to update the graphs.
You can also change which type of dataset to use within the main plots by
selecting from the drop down dataset box.  Additionally, you can further
filter these datasets by typeing in the genes of interest, or regex for
specific genes, to search for those specific genes within the dataset.
It's also worth noting that the plots are resizable as well as downloable.

![alt text](http://i.imgur.com/iAwNkPV.png "Main plots")

**Figure 11:** *The main plots page within DEBrowser.*

![alt text](http://i.imgur.com/5bxkF7Y.png "varied plots")

**Figure 12:** *Display of the most varied genes as a scatter plot.*

![alt text](http://i.imgur.com/TikED4T.png "geneset plots")

**Figure 13:** *Display of the geneset list as a scatter plot.*

Selecting the 'QC Plots' tab will take you to the quality control plots
section.  These QC plots are very similar to the QC plots shown before
running DESeq, however the dataset being used here depends on the one
you select on the left menu.  In addition to the all-to-all plot shown
within the previous QC analysis, users can also view a heatmap and PCA
plot of their analyzed data by selecting the proper plot on the left
menu.

![alt text](http://i.imgur.com/aNQFR4i.png "Heatmap")

**Figure 14:** *Display of the heatmap within DEBrowser.*

The heatmap is a great way to analyze replicate results of genes all in
one simple plot.  Users have the option to change the clustering method used
as well as the distance method used to display their heatmap.  In addition,
you can also change the size of the heatmap produced and adjust the p-adjust
and fold change cut off for this plot as well.  Once all of the parameters
have been set, click the 'Submit!' button at the bottom of the left menu to
generate your heatmap.

You can also select to view an interactive version of the heatmap by clicking
on the 'Interactive' button on the left panel under the height and width
options.  Selecting this feature changes the heatmap into an interactive
version with two colors, allowing you to select specific genes to be compared
within the GO term plots.  In order to use the interactive heatmap selection
within your GO term query, you must use either the up+down dataset or the
most varied dataset for the heatmap display.
This will allow you to compare interesting clusters
found within the the heatmap within our GO Term analysis section which will
be discussed later within the materials.

![alt text](http://i.imgur.com/36nMJul.png "Interactive Heatmap")

**Figure 15:** *View of the interactive Heatmap*

![alt text](http://i.imgur.com/uf9tM6J.png "PCA")

**Figure 16:** *Display of the PCA plot within DEBrowser.*

Prinicipal Component Analysis (PCA) is another excellent method of checking
replicates.  PCA calculates the variance between all of the samples genes
within your current comparison set and creates a two-dimensional
graph to represent the proportion of variance explained in different
components.  Within the PCA plot section you can select the p-adjust
value, fold change cut off value, which comparison set to use, which dataset
to use, the height and width of the corresponding plots, as well as which
prinicipal components to analyze by changing the appropriate values on the
left menu.

The next tab, 'GO Term', takes you to the ontology comparison portion of
DEBrowser.  From here you can select the standard dataset options such as
p-adjust value, fold change cut off value, which comparison set to use, and
which dataset to use on the left menu.  In addition to these parameters, you
also can choose from the 4 different ontology plot options: 'enrichGO',
'enrichKEGG', 'Disease', and 'compareCluster'.  Selecting one of these plot
options queries their specific databases with your current DESeq results.
By selecting the 'selection' dataset on the left panel after selecting
specific genes from the interactive heatmap, you will be able to compare
your specific gene selection within the various GO Term databases.

In order to use your selected genes from the interactive heatmap, you must
first make your selection within the interactive heatmap.  Next you will want
to switch to the GO Terms tab and use the 'selected' dataset.  Once all your
other parameters have been selected, hit submit and you will use your selected
genes from the interactive heatmap in your GO Term analysis.

![alt text](http://i.imgur.com/UtlERoG.png "GO")

**Figure 17:** *Display of the GO Plot section within DEBrowser.*

![alt text](http://i.imgur.com/UCn8LaA.png "dotplot GO")

**Figure 18:** *Display of the GO dotplot section within DEBrowser.*

![alt text](http://i.imgur.com/qjdTWNV.png "DO")

**Figure 19:** *Display of the DO plot section within DEBrowser.*

![alt text](http://i.imgur.com/paT3TYC.png "DO dotplot")

**Figure 20:** *Display of the DO dotplot section within DEBrowser.*

![alt text](http://i.imgur.com/vlOuYKu.png "KEGG")

**Figure 21:** *Display of the KEGG dotplot section within DEBrowser.*

![alt text](https://i.imgur.com/hNB9lO9.png "heatmap enrich")

**Figure 22:** *Display of Heatmap selected enriched GO Term search*

The last tab, 'Tables', contains various result information in table formats.
The 'All Detected' option contains the list of all the genes within the
TSV/CSV provided with the corresponding DESeq analyses.
Up-regulated values are shown in green while down-regulated values
are displayed in red.  To view any particular dataset's custom options,
the dataset type must be selected.

The 'Up' option contains a list of all the up-regulated genes based on the
options selected on the left panel.  The 'Down' option contains a list of all
the down-regulated genes based on the options selected.
The 'Selected' option contains the list of genes selected from the main plots
section.  By clicking and dragging your mouse on the main plot within the
'Main Plots' tab, you will then be able to see that selection in list form
within the 'Selected' option.
The 'Gene Set' option allows you to filter out gene data based on
genes selected via a text box.  To create a gene set, simply type the names
of the genes you wish to view in the text box on the left panel in a comma-
seperated format.  You can also use regular expressions in order to search
for specific gene sets.
The 'Most Varied' option, much like the original QC 'Most Varied' tab,
allows you to view the list of most varied genes based on user input
parameters on the left panel.
The 'Comparisons' option allows you to view the
differences between your different condition comparisons.
Comparisons between datasets are shown if at least one of the conditional
comparisons has passed the padj value or fold change cut off.

It is also important to note that comparisons with only
one sample cannot create statistically significant p-adjust values.  The
more replicates you have within a condition, the greater the statistical
significance of your comparisons.

![alt text](http://i.imgur.com/70WsI73.png "Up+Down Regulated")

**Figure 23:** *Display of the up+down-regulated genes table.*

![alt text](http://i.imgur.com/edDlfF4.png "Down Regulated")

**Figure 24:** *Display of the down-regulated genes table.*

![alt text](http://i.imgur.com/oiWLDX0.png "geneset")

**Figure 25:** *Display of the geneset input box.*

![alt text](https://i.imgur.com/76hDD1l.png "geneset table")

**Figure 26:** *Display of the gene set search of the term '^al'.*

![alt text](http://i.imgur.com/lzD4MBx.png "Comparisons")

**Figure 27:** *Condition comparisons table within DEBrowser.*

Lastly, the tables have a bunch of features that allow you to view your DESeq
results more conviently.  By clicking on a column header, you can sort the
data within the table based either alphabetical or numeric sorting.
You can also enter a term within the search box to search for a specific
gene within the table.

With that, you've now successfully navigated the DEBrowser and are ready to
start inserting your own data files and browsing your own experiments.  Enjoy
the DEBrowser!

#       Case Study

Taking a look at the case study (Vernia S. et al 2014), Multiple heatmaps were
created to display findings within the research.  The heatmaps generated
for the study were customized to a high level of specificity.  However,
using a sample dataset generated from this study, it is possible to
recreate similar heatmaps displayed within the studies findings.

![alt text](http://i.imgur.com/a2ZTcfd.png "Comparisons")

**Figure 28:** *All detected genes heatmap using case study data.*

![alt text](http://i.imgur.com/rLF6DJ3.png "Comparisons")

**Figure 29:** *Most varied genes heatmap using case study data.*

The only main difference between the plots created within DEBrowser
and the plots created within the research paper is that the clustering
method used within the paper was a k-means method with k equalling 6.

Using the 'advanced demo' dataset we mentioned earlier, you too can
recreate these tables using the same data.  Browsing, changing parameters,
and creating unique plots to view and analyze data can be a creative way
to recreate the same analytical results produced.  DEBrowser can be used in
multiple ways to check the reproducibility of research results in a highly
interactive format!
