########################################
GeoLifeCLEF 2022 - LifeCLEF 2022 x FGVC9
########################################

`<https://www.kaggle.com/competitions/geolifeclef-2022-lifeclef-2022-fgvc9/data>`_

*******************
Dataset Description
*******************

This year's challenge, GeoLifeCLEF 2022, uses a cleaned-up version of the data
used for last year's challenge, GeoLifeCLEF 2021.  A changelog is available at
the end of this page.

The challenge relies on a collection of 1.6 million of geo-localized
observations of plants and animals in the US and France, coming from the
`iNaturalist <https://www.inaturalist.org/>`__ and `Pl@ntNet
<https://plantnet.org/>`__ citizen science platforms.  There are 17K species in
the dataset, 9K plant species and 8K animal species.  Each observation consists
of a species name with the GPS coordinates where it was observed.  In addition,
observations are paired with a set of covariates characterizing the landscape
and environment around them.  Covariates include high-resolution remote sensing
imagery, land cover data, and altitude, as well as traditional low-resolution
climate and soil variables.

A `walkthrough notebook
<https://www.kaggle.com/tlorieul/geolifeclef2022-data-loading-and-visualization>`__
describing the data structure and how to load it and visualize it is available
in the ``Code`` tab.  A complete description of how the original GeoLifeCLEF
dataset was built can be found in the `associated paper
<https://arxiv.org/abs/2004.04192>`__.  Data loading and visualization
utilities are provided on the `GitHub of the competition
<https://github.com/maximiliense/GLC>`__.

|Observation distribution in France|
    
|Observation distribution in the US|

Here is an example of the patches corresponding to observation ``10171444`` on
the Pic Saint-Loup mountain, France:

|Patch data for observation 10561900|

In more detail, each observation is paired with the following
covariates:

-  Remote sensing imagery: 256mx256m RGB-IR patches centered at each
   observation

   -  Format: 256x256 JPEG images, a color JPEG file for RGB data and a
      grayscale one for near-infrared
   -  Resolution: 1 meter per pixel
   -  Source: NAIP for US and IGN for France

-  Land cover data: 256mx256m patches centered at each observation

   -  Format: 256x256 TIFF files with Deflate compression
   -  Resolution: 1 meter per pixel
   -  Source: NLCD for US and Cesbio for France

-  Altitude data: 256mx256m patches centered at each observation

   -  Format: 256x256 TIFF files with Deflate compression
   -  Resolution: 1 meter per pixel
   -  Source: SRTMGL1 for US and France

-  Bioclimatic data: 19 low-resolution rasters

   -  Format: GeoTIFF files with LZW compression
   -  Resolution: 30 arcsec per pixel (~ 1 kilometer per pixel)
   -  Source: WorldClim for US and France

-  Pedologic data: 8 low-resolution rasters

   -  Format: GeoTIFF files with LZW compression
   -  Resolution: 250 meters per pixel
   -  Source: SoilGrids for US and France

Changelog from GeoLifeCLEF 2021 dataset
=======================================

-  completed species metadata with genus, family and kingdom information from
   GBIF

-  removed observations of species from kingdom different from Plantae and
   Animalia (29240 observations, 2072 species)

-  kept only one observation when it is duplicated - same latitude, longitude
   and species (110556 observations removed)

-  removed all observations at exactly the same location - same latitude and
   longitude, different species (103887 observations removed)

-  removed observations from species only present in test set (208
   observations, 188 species)

-  removed species with strictly less than 3 observations in the train set
   (13336 observations, 9913 species)

-  species_id updated (not aligned with GeoLifeCLEF21), in the end, 17037
   species are retained

-  updated all altitude patches

   -  re-extraction uses bi-cubic interpolation instead of bi-linear
      interpolation

   -  an issue which resulted in artifacts on a few altitude patches from past
      years was also fixed

.. |Observation distribution in France| image:: https://raw.githubusercontent.com/maximiliense/GLC/master/images/observations_distribution_FR.png
   :width: 350px
.. |Observation distribution in the US| image:: https://raw.githubusercontent.com/maximiliense/GLC/master/images/observations_distribution_US.png
   :width: 450px
.. |Patch data for observation 10561900| image:: https://raw.githubusercontent.com/maximiliense/GLC/master/images/patches_sample_FR.jpg
   :width: 1000px
