## Dataset summary:
This dataset includes the absolute quantification of the number of _Borrelia burgdorferi_ found in field-caught nymphal _Ixodes pacificus_ samples from the Swei Lab.
The samples were collected from Marin County, Sonoma County, and San Mateo County from the years 2007, 2018-2022. 
These samples also have varying ospC genotypes, with some genotypes being human-invasive (HIS) and others not (non-HIS).
The purpose of this dataset is to determine whether the bacterial load found in nymphal _I. pacificus_ varied depending on genotype, human-invasive status, or other spatiotemporal variables.

## Languages:
This dataset is in standard American English.

## Dataset Structure:
```json
{'YEAR': '2007',
'SITE': 'MMWD',
'COUNTY': 'Marin',
'TICK_ID': '7M2.116',
'GENOTYPE': 'A',
'HUMAN': 'Y',
'REPLICATE': 1,
'BB_LOAD': 297
}
```

## Data Fields:
YEAR: categorical
SITE: categorical, MMWD = Marin Municipal Water District Sky Oaks Headquarters, ANN = Annadel State Park, JLSP = Jack London State Historic Park, CCSP = China Camp State Park, SLRP = Sugarlaf Ridge Preserve, Wh = Windy Hill Open Space Preserve
COUNTY: categorical
TICK_ID: categorical, Tick ID's are labeled to represent (Year)(SITE)(TICK #) ie. 7M2.116 = Tick # 116 from MMWD in the year 2007
GENOTYPE: categorical
HUMAN: categorical, Y represents HIS genotypes, N represents non-HIS genotypes
REPLICATE: categorical, The quantification was run in triplicates, meaning the same sample was run a total of three times.
BB_LOAD: numerical, The results of the ddPCR quantification, absolute counts of _Borrelia burgdorferi_ found in 5 uL of sample.

## Curation Rationale
The dataset represents a portion of Andrea Swei Lab at SFSU's Master Field Dataset. The Swei Lab has collected data on nymphal infection prevalence and ospC genotypes for the past decade in sites and counties around the San Francisco Bay Area.

## Initial Data Collection and Normalization
Nymphal tick samples were collected during each field season from the months of April to June. They were collected using the drag-cloth method and their DNA was extracted and tested for the presence of _B. burgdorferi_ using a nested 5S PCR. OspC genotypes were determined through sequencing and a 16S PCR. All samples were processed the same way, with the same kits and same protocols.

## Source Language Producers
The data was produced by the collaborative efforts of members of the Swei Lab.

## Personal and Sensitive Information
This dataset does not contain personal or sensitive information.

## Social Impact of Dataset
This dataset can be usde to determine and predict the intensity of Lyme disease infection found amongst different genotypes of _B. burgdorferi_. As there are previous studies conducted by the Swei Lab that have determined that there is a predominance of HIS genotypes in Marin and Sonoma County, understanding the intensity of the infection can provide understanding on the transmission and acquisition of _B. burgdorferi_ with different genotypes, especially those that are HIS.

## Dataset Curators
San Francisco State University, Department of Biology
Andrea Swei (P.I. of the Swei Lab and) is the main contact person for the dataset.

## Contributions
Thanks to the CDC, NIH, PacVec for funding the research that led to the creation of this dataset.
