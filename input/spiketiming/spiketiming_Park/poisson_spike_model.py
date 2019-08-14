#! /usr/bin/python
# coding: UTF-8

###############################
#2016.01.24

import scipy as sp
import numpy as np
import matplotlib.pyplot as plt
import os

from SpikeFuncs import *

def main_single():
    dose = 10
    Nfiles = 1000
    _SAVE_DIR_ = "./%ddose_1stims_poisson/"%(dose)
    if not os.path.exists(_SAVE_DIR_):
        os.makedirs(_SAVE_DIR_)
    for i in range(Nfiles):
        _SAVE_NAME_="%sspt%03d.dat"%(_SAVE_DIR_,i)
        print _SAVE_NAME_
        poisson_model(_SAVE_NAME_,dose)
#main_single()

def main_multi(dose,Nfiles,Nstims):
    _SAVE_DIR_ = "./%ddose_%dstims_poisson/"%(dose,Nstims)
    if not os.path.exists(_SAVE_DIR_):
        os.makedirs(_SAVE_DIR_)
    #for i in range(Nfiles):
    for i in range(750,1000):
        _SAVE_NAME_="%sspt%03d.dat"%(_SAVE_DIR_,i)
        print _SAVE_NAME_
        #        poisson_model_multi(_SAVE_NAME_,dose,Nstims)
        poisson_model_multi_adaption(_SAVE_NAME_,dose,Nstims)

main_multi(1000,1000,30)

