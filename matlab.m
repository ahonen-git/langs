fo0 = netcdf.create('matlab.nc','CLOBBER');
ncol_dimid = netcdf.defDim(fo0,'ncol',4);
nrow_dimid = netcdf.defDim(fo0,'nrow',3);

varid = netcdf.defVar(fo0,'ary','double',[ncol_dimid,nrow_dimid]);

netcdf.endDef(fo0) % This command terminates the definition mode; to write data into files, the mode should be changed to the data mode.
ary = linspace(1,12,12);
netcdf.putVar(fo0,varid,ary);
netcdf.close(fo0)