load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
begin

  fo0 = addfile("ncl.nc","c")

  filedimdef(fo0,"ncol",4,False)
  filedimdef(fo0,"nrow",3,False)
  filevardef(fo0,"ary","double",(/"nrow","ncol"/))

  att = 0.0
  att@units      = "N/A"
 
  filevarattdef(fo0,"ary" ,att)

  tmp = fspan(1,12,12)
  ary = reshape(tmp,(/3,4/))

  fo0->ary = (/ary/)

end
