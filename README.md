# Capstone

Evolution tree of technolgies : A sponsored project from LUX Research


Objective:

The goal of my capstone project is to build an evolution tree of growing technologgies around the world. This classifcation scheme allow users to easily recognise the possible fields connected to their field of interest.

To build this tree, I chose International Patent Classification (IPC) codes that are recorded in each publsihed patent related to each technology as ingredients.


Data Acquisition:


The data acquisition has been performed by the LUX research team. The International patent authority API allows a keyword search to return all the matched patents.  

The response pages of a serach keyword are collected using requests library and the IPC codes are collected by scraping the html documents using beautifulsoup.

IPC codes are strings with 4 characters of the form 'A01B', that represent the significant fundamental scietific components/aspects used in the invention disclosed in the patent. Each patent may contain between 3 to 10 IPC codes.

Utilizing the IPC code data, we assigned a weigtage of each IPC code to each technology by calculating the ratio of number of times an IPC code appears with respect to the total number of patents of a technology.

The weighting factors are tabulated such as each row represet a new technology and each column represent the IPC codes. 



Visulaization:

As a first step we compared different rows of the table to identify matching patterns of IPC codes between different technologies. An example of Radar, Lidar technologies is shown in the figure below 

![alt text](https://github.com/sandeepinampudi/Capstone/blob/master/Picture1.jpg)

An unsupervised model for a sequence of clustering and classication

An example output branch from the algorithm for a small list of technologies, matched to the intuition of the experts


![alt text](https://github.com/sandeepinampudi/Capstone/blob/master/Picture2.jpg)

 


  



