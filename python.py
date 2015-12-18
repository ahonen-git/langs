import numpy as np
import netCDF4

ary = np.arange(1,13)
ary = ary.reshape(4,3)

fo0 = netCDF4.Dataset('python.nc','w',format='NETCDF4')
fo0.createDimension('nrow',3)
fo0.createDimension('ncol',4)

fo0_ary = fo0.createVariable('ary',np.dtype('double').char,('nrow','ncol'))
fo0_ary.units='N/A'

fo0_ary[:] = ary[:]

fo0.close()
