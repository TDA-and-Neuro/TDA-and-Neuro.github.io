---
layout: page
title: Project
permalink: /project/
nav: true
nav_order: 3
---

By using ideas from persistent homology, we are going to analyze and try to discriminate the different classes (dogs, cats, gorillas, horses, etc) from the Non-Rigid World TOSCA database of 3D shapes.

The project will expose students to several of the challenges that arise when working with data that could be noisy, or simply too large to process all at once. This database of shapes contains nearly 150 different shapes, each of which has a few thousand points.

In order to process the shapes in this database we will have to use not only efficient subsampling methods, but we will also have to resort to  fast implementations of Ripser (the "live" version will not be practical). In particular, one of the initial steps of this project will be to install Ripser on your own computer (a step which will require compiling the C++ code).

**Part 1**

The first part of the project is about single linkage hierarchical clustering (SLHC). Students will code their own SLHC algorithms in Matlab. See this [video](https://youtu.be/p4-nKnKKKlM) for details.


**Part 2**

The second part of the project involves computing persistence diagrams as part of a larger shape classification project. See this [document](https://github.com/TDA-and-Neuro/tda-and-neuro.github.io/blob/master/TDA%2BNeuro%20Project%20SP%202023/TDA_and_Neuro_Project-2.pdf) for details. The code for running the project can be found [here](https://github.com/TDA-and-Neuro/tda-and-neuro.github.io/tree/master/TDA%2BNeuro%20Project%20SP%202023).