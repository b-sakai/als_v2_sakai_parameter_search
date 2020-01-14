# -*- coding: utf-8 -*-
"""
Created on Thu Jun  9 15:52:38 2016
@author: nebula

Rewrite on Wed Jan 16 2019
@author: sakai
"""

import os
import swc2vtk
from tqdm import tqdm


cellname_list = [
#    '200000',
#    '300000',
    '200002',
    ]

job_id = '2767177'
starttime = 1000.05
stoptime = 1100.00
datastep = 0.025
nstep = int((stoptime - starttime) / datastep)

for cellname in cellname_list:
    vtkfile_base = os.path.join('/work/hp160269/m49005/als_v2_sakai_parameter_search/vtk', job_id, cellname + '_%d.vtk')
    swcfilename = os.path.join('swc', '200000.swc')
    datafile_base = os.path.join('/work/hp160269/m49005/als_v2_sakai_parameter_search/save_all/00075_1000_2000', job_id+cellname + 't%.6f.dat')

    print vtkfile_base
    print swcfilename
    print datafile_base

    vtkgen = swc2vtk.VtkGenerator()
    vtkgen.set_draw_mode(3)
    vtkgen.add_swc(swcfilename)

    for i in tqdm(range(1, nstep), desc='Generating VTK'):
        vtkgen.clear_datafile()
        datafile = datafile_base % float((i+starttime/datastep) * datastep)
        print datafile
        vtkgen.add_datafile(datafile)
        print "vtkgen.write"
        vtkgen.write_vtk(vtkfile_base % i, datatitle='simulation')


