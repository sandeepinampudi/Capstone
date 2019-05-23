# Capstone Project: Evolution tree of technolgies 
Sponsored by LUX Research


## Objective:

The goal of my capstone project is to build an evolution tree of growing technologgies around the world. This classifcation scheme allow users to easily recognise the possible fields connected to their field of interest.

To build this tree, we chose International Patent Classification (IPC) codes that are recorded in each publsihed patent related to each technology as ingredients.


## Data Acquisition:


The data acquisition has been performed by the LUX research team. The International patent authority API allows a keyword search to return all the matched patents.  

The response pages of a serach keyword are collected using requests library and the IPC codes are collected by scraping the html documents using beautifulsoup.

IPC codes are strings with 4 characters of the form 'A01B', that represent the significant fundamental scietific components/aspects used in the invention disclosed in the patent. Each patent may contain between 3 to 10 IPC codes.

Utilizing the IPC code data, we assigned a weigtage for each IPC code to each technology by calculating the ratio of number of times an IPC code appears with respect to the total number of patents of a technology.

The weighting factors are tabulated such as each row represet a new technology and each column represent the IPC codes. 



## Visulaization:

As a first step we compared different rows of the table to identify matching patterns of IPC codes between different technologies. An example of Radar, Lidar technologies is shown in the figure below 

![alt text](https://github.com/sandeepinampudi/Capstone/blob/master/Picture1.jpg)

The above visulazation inspred us to define a quantity called pattern match factor that quantifies the overlap between any two rows of the table. 

pattern match factor = sum(abs((x_i-y_i)/(x_i+y_i))), where x_i and y_i are corresponding elements of two rows.


## An unsupervised model for a sequence of clustering and classication:

An in-house developed unsupervised method with a combination of clustering and classication schemes is used to build the evolution tree. 

The algorithm is based on the following hypothesis:

Three types of relationships are possible between any pair of technolgies based on the pattern match factor defined above

i) Not connected, 
When the pattern match factor between the technologies is below the threshold

ii) Parent-Child,  
When the pattern match factor between the technologies is higher than a threshold. The technolgy with larger number of total patents will act as the parent and the other acts as child 

iii) Simply Connected,

When the pattern match factor between the technologies is higher than a threshold, but both the technolgies have roughly equal number of total patenets. 


## Algorithm implementation:

During the implementation, the algorithm could be highly simplified by sorting the technolgies in the descending order of total number of patensts. 

Start with the first in the list by assigning it a parent status. 
Compute the pattern match factor of the second with the first to identify the second either as a child to the first, simply-connected, or not connected. If not connected, then assign a parent status to the second so that it can start its own branch.


Follow the same process for the i^th technology by identifying its relation with every parent technology before i^th step. 

## Output: 
An example output branch from the algorithm for a small list of technologies, matched to the intuition of the experts is hsown below


![alt text](https://github.com/sandeepinampudi/Capstone/blob/master/Picture2.jpg)

 



  



