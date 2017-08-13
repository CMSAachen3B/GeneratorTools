include ../../Source/make_opts
SHELL = /bin/bash
LIBDIR = ../../lib/
PROG   = check
PROG_SPLITORDERS = check_sa_born_splitOrders
LINKLIBS =  -L../../lib/ -ldhelas -lmodel
LIBS = $(LIBDIR)libdhelas.$(libext) $(LIBDIR)libmodel.$(libext)
PROCESS=  matrix.o
CHECK_SA=  check_sa.o
CHECK_SA_SPLITORDERS=  check_sa_born_splitOrders.o
 
$(PROG): $(PROCESS) $(CHECK_SA) makefile $(LIBS)
	$(FC) $(FFLAGS) -o $(PROG) $(PROCESS) $(CHECK_SA) $(LINKLIBS)

$(PROG_SPLITORDERS): $(PROCESS) $(CHECK_SA_SPLITORDERS) makefile $(LIBS)
	$(FC) $(FFLAGS) -o $(PROG) $(PROCESS) $(CHECK_SA_SPLITORDERS) $(LINKLIBS)

driver.f: nexternal.inc pmass.inc ngraphs.inc coupl.inc

# For python linking (require f2py part of numpy)
ifeq ($(origin MENUM),undefined)
  MENUM=2
endif

matrix$(MENUM)py.so: matrix.f makefile $(LIBS)
	touch __init__.py
	$(F2PY) $(LINKLIBS) -c  matrix.f -m matrix$(MENUM)py --fcompiler=gnu95
# For python linking (require f2py part of numpy)
ifeq ($(origin MENUM),undefined)
  MENUM=2
endif
P1_gb_x0bbbx/matrix$(MENUM)py.so:
	cd P1_gb_x0bbbx;make matrix$(MENUM)py.so
P1_gbx_x0bbxbx/matrix$(MENUM)py.so:
	cd P1_gbx_x0bbxbx;make matrix$(MENUM)py.so
P1_bb_x0gbb/matrix$(MENUM)py.so:
	cd P1_bb_x0gbb;make matrix$(MENUM)py.so
P1_bbx_x0gbbx/matrix$(MENUM)py.so:
	cd P1_bbx_x0gbbx;make matrix$(MENUM)py.so
P1_bxbx_x0gbxbx/matrix$(MENUM)py.so:
	cd P1_bxbx_x0gbxbx;make matrix$(MENUM)py.so
P1_gu_x0ubbx/matrix$(MENUM)py.so:
	cd P1_gu_x0ubbx;make matrix$(MENUM)py.so
P1_gd_x0dbbx/matrix$(MENUM)py.so:
	cd P1_gd_x0dbbx;make matrix$(MENUM)py.so
P1_gux_x0uxbbx/matrix$(MENUM)py.so:
	cd P1_gux_x0uxbbx;make matrix$(MENUM)py.so
P1_gdx_x0dxbbx/matrix$(MENUM)py.so:
	cd P1_gdx_x0dxbbx;make matrix$(MENUM)py.so
P1_gb_x0uuxb/matrix$(MENUM)py.so:
	cd P1_gb_x0uuxb;make matrix$(MENUM)py.so
P1_gb_x0ddxb/matrix$(MENUM)py.so:
	cd P1_gb_x0ddxb;make matrix$(MENUM)py.so
P1_gbx_x0uuxbx/matrix$(MENUM)py.so:
	cd P1_gbx_x0uuxbx;make matrix$(MENUM)py.so
P1_gbx_x0ddxbx/matrix$(MENUM)py.so:
	cd P1_gbx_x0ddxbx;make matrix$(MENUM)py.so
P1_uux_x0gbbx/matrix$(MENUM)py.so:
	cd P1_uux_x0gbbx;make matrix$(MENUM)py.so
P1_ddx_x0gbbx/matrix$(MENUM)py.so:
	cd P1_ddx_x0gbbx;make matrix$(MENUM)py.so
P1_ub_x0gub/matrix$(MENUM)py.so:
	cd P1_ub_x0gub;make matrix$(MENUM)py.so
P1_ubx_x0gubx/matrix$(MENUM)py.so:
	cd P1_ubx_x0gubx;make matrix$(MENUM)py.so
P1_db_x0gdb/matrix$(MENUM)py.so:
	cd P1_db_x0gdb;make matrix$(MENUM)py.so
P1_dbx_x0gdbx/matrix$(MENUM)py.so:
	cd P1_dbx_x0gdbx;make matrix$(MENUM)py.so
P1_uxb_x0guxb/matrix$(MENUM)py.so:
	cd P1_uxb_x0guxb;make matrix$(MENUM)py.so
P1_uxbx_x0guxbx/matrix$(MENUM)py.so:
	cd P1_uxbx_x0guxbx;make matrix$(MENUM)py.so
P1_dxb_x0gdxb/matrix$(MENUM)py.so:
	cd P1_dxb_x0gdxb;make matrix$(MENUM)py.so
P1_dxbx_x0gdxbx/matrix$(MENUM)py.so:
	cd P1_dxbx_x0gdxbx;make matrix$(MENUM)py.so
P1_bbx_x0guux/matrix$(MENUM)py.so:
	cd P1_bbx_x0guux;make matrix$(MENUM)py.so
P1_bbx_x0gddx/matrix$(MENUM)py.so:
	cd P1_bbx_x0gddx;make matrix$(MENUM)py.so
P1_gu_x0uuux/matrix$(MENUM)py.so:
	cd P1_gu_x0uuux;make matrix$(MENUM)py.so
P1_gu_x0uddx/matrix$(MENUM)py.so:
	cd P1_gu_x0uddx;make matrix$(MENUM)py.so
P1_gu_x0ussx/matrix$(MENUM)py.so:
	cd P1_gu_x0ussx;make matrix$(MENUM)py.so
P1_gc_x0cddx/matrix$(MENUM)py.so:
	cd P1_gc_x0cddx;make matrix$(MENUM)py.so
P1_gc_x0cssx/matrix$(MENUM)py.so:
	cd P1_gc_x0cssx;make matrix$(MENUM)py.so
P1_gd_x0udux/matrix$(MENUM)py.so:
	cd P1_gd_x0udux;make matrix$(MENUM)py.so
P1_gd_x0cdcx/matrix$(MENUM)py.so:
	cd P1_gd_x0cdcx;make matrix$(MENUM)py.so
P1_gd_x0dddx/matrix$(MENUM)py.so:
	cd P1_gd_x0dddx;make matrix$(MENUM)py.so
P1_gs_x0usux/matrix$(MENUM)py.so:
	cd P1_gs_x0usux;make matrix$(MENUM)py.so
P1_gs_x0cscx/matrix$(MENUM)py.so:
	cd P1_gs_x0cscx;make matrix$(MENUM)py.so
P1_gux_x0uuxux/matrix$(MENUM)py.so:
	cd P1_gux_x0uuxux;make matrix$(MENUM)py.so
P1_gux_x0duxdx/matrix$(MENUM)py.so:
	cd P1_gux_x0duxdx;make matrix$(MENUM)py.so
P1_gux_x0suxsx/matrix$(MENUM)py.so:
	cd P1_gux_x0suxsx;make matrix$(MENUM)py.so
P1_gcx_x0dcxdx/matrix$(MENUM)py.so:
	cd P1_gcx_x0dcxdx;make matrix$(MENUM)py.so
P1_gcx_x0scxsx/matrix$(MENUM)py.so:
	cd P1_gcx_x0scxsx;make matrix$(MENUM)py.so
P1_gdx_x0uuxdx/matrix$(MENUM)py.so:
	cd P1_gdx_x0uuxdx;make matrix$(MENUM)py.so
P1_gdx_x0ccxdx/matrix$(MENUM)py.so:
	cd P1_gdx_x0ccxdx;make matrix$(MENUM)py.so
P1_gdx_x0ddxdx/matrix$(MENUM)py.so:
	cd P1_gdx_x0ddxdx;make matrix$(MENUM)py.so
P1_gsx_x0uuxsx/matrix$(MENUM)py.so:
	cd P1_gsx_x0uuxsx;make matrix$(MENUM)py.so
P1_gsx_x0ccxsx/matrix$(MENUM)py.so:
	cd P1_gsx_x0ccxsx;make matrix$(MENUM)py.so
P1_gu_x0uccx/matrix$(MENUM)py.so:
	cd P1_gu_x0uccx;make matrix$(MENUM)py.so
P1_gu_x0udsx/matrix$(MENUM)py.so:
	cd P1_gu_x0udsx;make matrix$(MENUM)py.so
P1_gu_x0usdx/matrix$(MENUM)py.so:
	cd P1_gu_x0usdx;make matrix$(MENUM)py.so
P1_gu_x0cddx/matrix$(MENUM)py.so:
	cd P1_gu_x0cddx;make matrix$(MENUM)py.so
P1_gu_x0cdsx/matrix$(MENUM)py.so:
	cd P1_gu_x0cdsx;make matrix$(MENUM)py.so
P1_gu_x0csdx/matrix$(MENUM)py.so:
	cd P1_gu_x0csdx;make matrix$(MENUM)py.so
P1_gu_x0cssx/matrix$(MENUM)py.so:
	cd P1_gu_x0cssx;make matrix$(MENUM)py.so
P1_gc_x0uddx/matrix$(MENUM)py.so:
	cd P1_gc_x0uddx;make matrix$(MENUM)py.so
P1_gc_x0udsx/matrix$(MENUM)py.so:
	cd P1_gc_x0udsx;make matrix$(MENUM)py.so
P1_gc_x0usdx/matrix$(MENUM)py.so:
	cd P1_gc_x0usdx;make matrix$(MENUM)py.so
P1_gc_x0ussx/matrix$(MENUM)py.so:
	cd P1_gc_x0ussx;make matrix$(MENUM)py.so
P1_gc_x0cdsx/matrix$(MENUM)py.so:
	cd P1_gc_x0cdsx;make matrix$(MENUM)py.so
P1_gc_x0csdx/matrix$(MENUM)py.so:
	cd P1_gc_x0csdx;make matrix$(MENUM)py.so
P1_gd_x0udcx/matrix$(MENUM)py.so:
	cd P1_gd_x0udcx;make matrix$(MENUM)py.so
P1_gd_x0usux/matrix$(MENUM)py.so:
	cd P1_gd_x0usux;make matrix$(MENUM)py.so
P1_gd_x0uscx/matrix$(MENUM)py.so:
	cd P1_gd_x0uscx;make matrix$(MENUM)py.so
P1_gd_x0cdux/matrix$(MENUM)py.so:
	cd P1_gd_x0cdux;make matrix$(MENUM)py.so
P1_gd_x0csux/matrix$(MENUM)py.so:
	cd P1_gd_x0csux;make matrix$(MENUM)py.so
P1_gd_x0cscx/matrix$(MENUM)py.so:
	cd P1_gd_x0cscx;make matrix$(MENUM)py.so
P1_gd_x0dssx/matrix$(MENUM)py.so:
	cd P1_gd_x0dssx;make matrix$(MENUM)py.so
P1_gs_x0udux/matrix$(MENUM)py.so:
	cd P1_gs_x0udux;make matrix$(MENUM)py.so
P1_gs_x0udcx/matrix$(MENUM)py.so:
	cd P1_gs_x0udcx;make matrix$(MENUM)py.so
P1_gs_x0uscx/matrix$(MENUM)py.so:
	cd P1_gs_x0uscx;make matrix$(MENUM)py.so
P1_gs_x0cdux/matrix$(MENUM)py.so:
	cd P1_gs_x0cdux;make matrix$(MENUM)py.so
P1_gs_x0cdcx/matrix$(MENUM)py.so:
	cd P1_gs_x0cdcx;make matrix$(MENUM)py.so
P1_gs_x0csux/matrix$(MENUM)py.so:
	cd P1_gs_x0csux;make matrix$(MENUM)py.so
P1_gux_x0cuxcx/matrix$(MENUM)py.so:
	cd P1_gux_x0cuxcx;make matrix$(MENUM)py.so
P1_gux_x0duxsx/matrix$(MENUM)py.so:
	cd P1_gux_x0duxsx;make matrix$(MENUM)py.so
P1_gux_x0dcxdx/matrix$(MENUM)py.so:
	cd P1_gux_x0dcxdx;make matrix$(MENUM)py.so
P1_gux_x0dcxsx/matrix$(MENUM)py.so:
	cd P1_gux_x0dcxsx;make matrix$(MENUM)py.so
P1_gux_x0suxdx/matrix$(MENUM)py.so:
	cd P1_gux_x0suxdx;make matrix$(MENUM)py.so
P1_gux_x0scxdx/matrix$(MENUM)py.so:
	cd P1_gux_x0scxdx;make matrix$(MENUM)py.so
P1_gux_x0scxsx/matrix$(MENUM)py.so:
	cd P1_gux_x0scxsx;make matrix$(MENUM)py.so
P1_gcx_x0duxdx/matrix$(MENUM)py.so:
	cd P1_gcx_x0duxdx;make matrix$(MENUM)py.so
P1_gcx_x0duxsx/matrix$(MENUM)py.so:
	cd P1_gcx_x0duxsx;make matrix$(MENUM)py.so
P1_gcx_x0dcxsx/matrix$(MENUM)py.so:
	cd P1_gcx_x0dcxsx;make matrix$(MENUM)py.so
P1_gcx_x0suxdx/matrix$(MENUM)py.so:
	cd P1_gcx_x0suxdx;make matrix$(MENUM)py.so
P1_gcx_x0suxsx/matrix$(MENUM)py.so:
	cd P1_gcx_x0suxsx;make matrix$(MENUM)py.so
P1_gcx_x0scxdx/matrix$(MENUM)py.so:
	cd P1_gcx_x0scxdx;make matrix$(MENUM)py.so
P1_gdx_x0uuxsx/matrix$(MENUM)py.so:
	cd P1_gdx_x0uuxsx;make matrix$(MENUM)py.so
P1_gdx_x0ucxdx/matrix$(MENUM)py.so:
	cd P1_gdx_x0ucxdx;make matrix$(MENUM)py.so
P1_gdx_x0ucxsx/matrix$(MENUM)py.so:
	cd P1_gdx_x0ucxsx;make matrix$(MENUM)py.so
P1_gdx_x0cuxdx/matrix$(MENUM)py.so:
	cd P1_gdx_x0cuxdx;make matrix$(MENUM)py.so
P1_gdx_x0cuxsx/matrix$(MENUM)py.so:
	cd P1_gdx_x0cuxsx;make matrix$(MENUM)py.so
P1_gdx_x0ccxsx/matrix$(MENUM)py.so:
	cd P1_gdx_x0ccxsx;make matrix$(MENUM)py.so
P1_gdx_x0sdxsx/matrix$(MENUM)py.so:
	cd P1_gdx_x0sdxsx;make matrix$(MENUM)py.so
P1_gsx_x0uuxdx/matrix$(MENUM)py.so:
	cd P1_gsx_x0uuxdx;make matrix$(MENUM)py.so
P1_gsx_x0ucxdx/matrix$(MENUM)py.so:
	cd P1_gsx_x0ucxdx;make matrix$(MENUM)py.so
P1_gsx_x0ucxsx/matrix$(MENUM)py.so:
	cd P1_gsx_x0ucxsx;make matrix$(MENUM)py.so
P1_gsx_x0cuxdx/matrix$(MENUM)py.so:
	cd P1_gsx_x0cuxdx;make matrix$(MENUM)py.so
P1_gsx_x0cuxsx/matrix$(MENUM)py.so:
	cd P1_gsx_x0cuxsx;make matrix$(MENUM)py.so
P1_gsx_x0ccxdx/matrix$(MENUM)py.so:
	cd P1_gsx_x0ccxdx;make matrix$(MENUM)py.so
P1_uu_x0guu/matrix$(MENUM)py.so:
	cd P1_uu_x0guu;make matrix$(MENUM)py.so
P1_ud_x0gud/matrix$(MENUM)py.so:
	cd P1_ud_x0gud;make matrix$(MENUM)py.so
P1_us_x0gus/matrix$(MENUM)py.so:
	cd P1_us_x0gus;make matrix$(MENUM)py.so
P1_uux_x0guux/matrix$(MENUM)py.so:
	cd P1_uux_x0guux;make matrix$(MENUM)py.so
P1_uux_x0gddx/matrix$(MENUM)py.so:
	cd P1_uux_x0gddx;make matrix$(MENUM)py.so
P1_uux_x0gssx/matrix$(MENUM)py.so:
	cd P1_uux_x0gssx;make matrix$(MENUM)py.so
P1_udx_x0gudx/matrix$(MENUM)py.so:
	cd P1_udx_x0gudx;make matrix$(MENUM)py.so
P1_usx_x0gusx/matrix$(MENUM)py.so:
	cd P1_usx_x0gusx;make matrix$(MENUM)py.so
P1_cd_x0gcd/matrix$(MENUM)py.so:
	cd P1_cd_x0gcd;make matrix$(MENUM)py.so
P1_cs_x0gcs/matrix$(MENUM)py.so:
	cd P1_cs_x0gcs;make matrix$(MENUM)py.so
P1_ccx_x0gddx/matrix$(MENUM)py.so:
	cd P1_ccx_x0gddx;make matrix$(MENUM)py.so
P1_ccx_x0gssx/matrix$(MENUM)py.so:
	cd P1_ccx_x0gssx;make matrix$(MENUM)py.so
P1_cdx_x0gcdx/matrix$(MENUM)py.so:
	cd P1_cdx_x0gcdx;make matrix$(MENUM)py.so
P1_csx_x0gcsx/matrix$(MENUM)py.so:
	cd P1_csx_x0gcsx;make matrix$(MENUM)py.so
P1_dd_x0gdd/matrix$(MENUM)py.so:
	cd P1_dd_x0gdd;make matrix$(MENUM)py.so
P1_dux_x0gdux/matrix$(MENUM)py.so:
	cd P1_dux_x0gdux;make matrix$(MENUM)py.so
P1_dcx_x0gdcx/matrix$(MENUM)py.so:
	cd P1_dcx_x0gdcx;make matrix$(MENUM)py.so
P1_ddx_x0guux/matrix$(MENUM)py.so:
	cd P1_ddx_x0guux;make matrix$(MENUM)py.so
P1_ddx_x0gccx/matrix$(MENUM)py.so:
	cd P1_ddx_x0gccx;make matrix$(MENUM)py.so
P1_ddx_x0gddx/matrix$(MENUM)py.so:
	cd P1_ddx_x0gddx;make matrix$(MENUM)py.so
P1_sux_x0gsux/matrix$(MENUM)py.so:
	cd P1_sux_x0gsux;make matrix$(MENUM)py.so
P1_scx_x0gscx/matrix$(MENUM)py.so:
	cd P1_scx_x0gscx;make matrix$(MENUM)py.so
P1_ssx_x0guux/matrix$(MENUM)py.so:
	cd P1_ssx_x0guux;make matrix$(MENUM)py.so
P1_ssx_x0gccx/matrix$(MENUM)py.so:
	cd P1_ssx_x0gccx;make matrix$(MENUM)py.so
P1_uxux_x0guxux/matrix$(MENUM)py.so:
	cd P1_uxux_x0guxux;make matrix$(MENUM)py.so
P1_uxdx_x0guxdx/matrix$(MENUM)py.so:
	cd P1_uxdx_x0guxdx;make matrix$(MENUM)py.so
P1_uxsx_x0guxsx/matrix$(MENUM)py.so:
	cd P1_uxsx_x0guxsx;make matrix$(MENUM)py.so
P1_cxdx_x0gcxdx/matrix$(MENUM)py.so:
	cd P1_cxdx_x0gcxdx;make matrix$(MENUM)py.so
P1_cxsx_x0gcxsx/matrix$(MENUM)py.so:
	cd P1_cxsx_x0gcxsx;make matrix$(MENUM)py.so
P1_dxdx_x0gdxdx/matrix$(MENUM)py.so:
	cd P1_dxdx_x0gdxdx;make matrix$(MENUM)py.so
P1_uc_x0guc/matrix$(MENUM)py.so:
	cd P1_uc_x0guc;make matrix$(MENUM)py.so
P1_ud_x0gus/matrix$(MENUM)py.so:
	cd P1_ud_x0gus;make matrix$(MENUM)py.so
P1_ud_x0gcd/matrix$(MENUM)py.so:
	cd P1_ud_x0gcd;make matrix$(MENUM)py.so
P1_ud_x0gcs/matrix$(MENUM)py.so:
	cd P1_ud_x0gcs;make matrix$(MENUM)py.so
P1_us_x0gud/matrix$(MENUM)py.so:
	cd P1_us_x0gud;make matrix$(MENUM)py.so
P1_us_x0gcd/matrix$(MENUM)py.so:
	cd P1_us_x0gcd;make matrix$(MENUM)py.so
P1_us_x0gcs/matrix$(MENUM)py.so:
	cd P1_us_x0gcs;make matrix$(MENUM)py.so
P1_uux_x0gccx/matrix$(MENUM)py.so:
	cd P1_uux_x0gccx;make matrix$(MENUM)py.so
P1_uux_x0gdsx/matrix$(MENUM)py.so:
	cd P1_uux_x0gdsx;make matrix$(MENUM)py.so
P1_uux_x0gsdx/matrix$(MENUM)py.so:
	cd P1_uux_x0gsdx;make matrix$(MENUM)py.so
P1_cd_x0gud/matrix$(MENUM)py.so:
	cd P1_cd_x0gud;make matrix$(MENUM)py.so
P1_ucx_x0gucx/matrix$(MENUM)py.so:
	cd P1_ucx_x0gucx;make matrix$(MENUM)py.so
P1_ucx_x0gddx/matrix$(MENUM)py.so:
	cd P1_ucx_x0gddx;make matrix$(MENUM)py.so
P1_ucx_x0gdsx/matrix$(MENUM)py.so:
	cd P1_ucx_x0gdsx;make matrix$(MENUM)py.so
P1_ucx_x0gsdx/matrix$(MENUM)py.so:
	cd P1_ucx_x0gsdx;make matrix$(MENUM)py.so
P1_ucx_x0gssx/matrix$(MENUM)py.so:
	cd P1_ucx_x0gssx;make matrix$(MENUM)py.so
P1_udx_x0gusx/matrix$(MENUM)py.so:
	cd P1_udx_x0gusx;make matrix$(MENUM)py.so
P1_udx_x0gcdx/matrix$(MENUM)py.so:
	cd P1_udx_x0gcdx;make matrix$(MENUM)py.so
P1_udx_x0gcsx/matrix$(MENUM)py.so:
	cd P1_udx_x0gcsx;make matrix$(MENUM)py.so
P1_usx_x0gudx/matrix$(MENUM)py.so:
	cd P1_usx_x0gudx;make matrix$(MENUM)py.so
P1_usx_x0gcdx/matrix$(MENUM)py.so:
	cd P1_usx_x0gcdx;make matrix$(MENUM)py.so
P1_usx_x0gcsx/matrix$(MENUM)py.so:
	cd P1_usx_x0gcsx;make matrix$(MENUM)py.so
P1_cd_x0gus/matrix$(MENUM)py.so:
	cd P1_cd_x0gus;make matrix$(MENUM)py.so
P1_cd_x0gcs/matrix$(MENUM)py.so:
	cd P1_cd_x0gcs;make matrix$(MENUM)py.so
P1_cs_x0gud/matrix$(MENUM)py.so:
	cd P1_cs_x0gud;make matrix$(MENUM)py.so
P1_cs_x0gus/matrix$(MENUM)py.so:
	cd P1_cs_x0gus;make matrix$(MENUM)py.so
P1_cs_x0gcd/matrix$(MENUM)py.so:
	cd P1_cs_x0gcd;make matrix$(MENUM)py.so
P1_cux_x0gddx/matrix$(MENUM)py.so:
	cd P1_cux_x0gddx;make matrix$(MENUM)py.so
P1_cux_x0gdsx/matrix$(MENUM)py.so:
	cd P1_cux_x0gdsx;make matrix$(MENUM)py.so
P1_cux_x0gsdx/matrix$(MENUM)py.so:
	cd P1_cux_x0gsdx;make matrix$(MENUM)py.so
P1_cux_x0gssx/matrix$(MENUM)py.so:
	cd P1_cux_x0gssx;make matrix$(MENUM)py.so
P1_ccx_x0gdsx/matrix$(MENUM)py.so:
	cd P1_ccx_x0gdsx;make matrix$(MENUM)py.so
P1_ccx_x0gsdx/matrix$(MENUM)py.so:
	cd P1_ccx_x0gsdx;make matrix$(MENUM)py.so
P1_cdx_x0gudx/matrix$(MENUM)py.so:
	cd P1_cdx_x0gudx;make matrix$(MENUM)py.so
P1_cdx_x0gusx/matrix$(MENUM)py.so:
	cd P1_cdx_x0gusx;make matrix$(MENUM)py.so
P1_cdx_x0gcsx/matrix$(MENUM)py.so:
	cd P1_cdx_x0gcsx;make matrix$(MENUM)py.so
P1_csx_x0gudx/matrix$(MENUM)py.so:
	cd P1_csx_x0gudx;make matrix$(MENUM)py.so
P1_csx_x0gusx/matrix$(MENUM)py.so:
	cd P1_csx_x0gusx;make matrix$(MENUM)py.so
P1_csx_x0gcdx/matrix$(MENUM)py.so:
	cd P1_csx_x0gcdx;make matrix$(MENUM)py.so
P1_ds_x0gds/matrix$(MENUM)py.so:
	cd P1_ds_x0gds;make matrix$(MENUM)py.so
P1_dux_x0gdcx/matrix$(MENUM)py.so:
	cd P1_dux_x0gdcx;make matrix$(MENUM)py.so
P1_dux_x0gsux/matrix$(MENUM)py.so:
	cd P1_dux_x0gsux;make matrix$(MENUM)py.so
P1_dux_x0gscx/matrix$(MENUM)py.so:
	cd P1_dux_x0gscx;make matrix$(MENUM)py.so
P1_dcx_x0gdux/matrix$(MENUM)py.so:
	cd P1_dcx_x0gdux;make matrix$(MENUM)py.so
P1_dcx_x0gsux/matrix$(MENUM)py.so:
	cd P1_dcx_x0gsux;make matrix$(MENUM)py.so
P1_dcx_x0gscx/matrix$(MENUM)py.so:
	cd P1_dcx_x0gscx;make matrix$(MENUM)py.so
P1_ddx_x0gucx/matrix$(MENUM)py.so:
	cd P1_ddx_x0gucx;make matrix$(MENUM)py.so
P1_ddx_x0gcux/matrix$(MENUM)py.so:
	cd P1_ddx_x0gcux;make matrix$(MENUM)py.so
P1_ddx_x0gssx/matrix$(MENUM)py.so:
	cd P1_ddx_x0gssx;make matrix$(MENUM)py.so
P1_dsx_x0guux/matrix$(MENUM)py.so:
	cd P1_dsx_x0guux;make matrix$(MENUM)py.so
P1_dsx_x0gucx/matrix$(MENUM)py.so:
	cd P1_dsx_x0gucx;make matrix$(MENUM)py.so
P1_dsx_x0gcux/matrix$(MENUM)py.so:
	cd P1_dsx_x0gcux;make matrix$(MENUM)py.so
P1_dsx_x0gccx/matrix$(MENUM)py.so:
	cd P1_dsx_x0gccx;make matrix$(MENUM)py.so
P1_dsx_x0gdsx/matrix$(MENUM)py.so:
	cd P1_dsx_x0gdsx;make matrix$(MENUM)py.so
P1_sux_x0gdux/matrix$(MENUM)py.so:
	cd P1_sux_x0gdux;make matrix$(MENUM)py.so
P1_sux_x0gdcx/matrix$(MENUM)py.so:
	cd P1_sux_x0gdcx;make matrix$(MENUM)py.so
P1_sux_x0gscx/matrix$(MENUM)py.so:
	cd P1_sux_x0gscx;make matrix$(MENUM)py.so
P1_scx_x0gdux/matrix$(MENUM)py.so:
	cd P1_scx_x0gdux;make matrix$(MENUM)py.so
P1_scx_x0gdcx/matrix$(MENUM)py.so:
	cd P1_scx_x0gdcx;make matrix$(MENUM)py.so
P1_scx_x0gsux/matrix$(MENUM)py.so:
	cd P1_scx_x0gsux;make matrix$(MENUM)py.so
P1_sdx_x0guux/matrix$(MENUM)py.so:
	cd P1_sdx_x0guux;make matrix$(MENUM)py.so
P1_sdx_x0gucx/matrix$(MENUM)py.so:
	cd P1_sdx_x0gucx;make matrix$(MENUM)py.so
P1_sdx_x0gcux/matrix$(MENUM)py.so:
	cd P1_sdx_x0gcux;make matrix$(MENUM)py.so
P1_sdx_x0gccx/matrix$(MENUM)py.so:
	cd P1_sdx_x0gccx;make matrix$(MENUM)py.so
P1_ssx_x0gucx/matrix$(MENUM)py.so:
	cd P1_ssx_x0gucx;make matrix$(MENUM)py.so
P1_ssx_x0gcux/matrix$(MENUM)py.so:
	cd P1_ssx_x0gcux;make matrix$(MENUM)py.so
P1_uxcx_x0guxcx/matrix$(MENUM)py.so:
	cd P1_uxcx_x0guxcx;make matrix$(MENUM)py.so
P1_uxdx_x0guxsx/matrix$(MENUM)py.so:
	cd P1_uxdx_x0guxsx;make matrix$(MENUM)py.so
P1_uxdx_x0gcxdx/matrix$(MENUM)py.so:
	cd P1_uxdx_x0gcxdx;make matrix$(MENUM)py.so
P1_uxdx_x0gcxsx/matrix$(MENUM)py.so:
	cd P1_uxdx_x0gcxsx;make matrix$(MENUM)py.so
P1_uxsx_x0guxdx/matrix$(MENUM)py.so:
	cd P1_uxsx_x0guxdx;make matrix$(MENUM)py.so
P1_uxsx_x0gcxdx/matrix$(MENUM)py.so:
	cd P1_uxsx_x0gcxdx;make matrix$(MENUM)py.so
P1_uxsx_x0gcxsx/matrix$(MENUM)py.so:
	cd P1_uxsx_x0gcxsx;make matrix$(MENUM)py.so
P1_cxdx_x0guxdx/matrix$(MENUM)py.so:
	cd P1_cxdx_x0guxdx;make matrix$(MENUM)py.so
P1_cxdx_x0guxsx/matrix$(MENUM)py.so:
	cd P1_cxdx_x0guxsx;make matrix$(MENUM)py.so
P1_cxdx_x0gcxsx/matrix$(MENUM)py.so:
	cd P1_cxdx_x0gcxsx;make matrix$(MENUM)py.so
P1_cxsx_x0guxdx/matrix$(MENUM)py.so:
	cd P1_cxsx_x0guxdx;make matrix$(MENUM)py.so
P1_cxsx_x0guxsx/matrix$(MENUM)py.so:
	cd P1_cxsx_x0guxsx;make matrix$(MENUM)py.so
P1_cxsx_x0gcxdx/matrix$(MENUM)py.so:
	cd P1_cxsx_x0gcxdx;make matrix$(MENUM)py.so
P1_dxsx_x0gdxsx/matrix$(MENUM)py.so:
	cd P1_dxsx_x0gdxsx;make matrix$(MENUM)py.so
all:  P1_gb_x0bbbx/matrix$(MENUM)py.so  P1_gbx_x0bbxbx/matrix$(MENUM)py.so  P1_bb_x0gbb/matrix$(MENUM)py.so  P1_bbx_x0gbbx/matrix$(MENUM)py.so  P1_bxbx_x0gbxbx/matrix$(MENUM)py.so  P1_gu_x0ubbx/matrix$(MENUM)py.so  P1_gd_x0dbbx/matrix$(MENUM)py.so  P1_gux_x0uxbbx/matrix$(MENUM)py.so  P1_gdx_x0dxbbx/matrix$(MENUM)py.so  P1_gb_x0uuxb/matrix$(MENUM)py.so  P1_gb_x0ddxb/matrix$(MENUM)py.so  P1_gbx_x0uuxbx/matrix$(MENUM)py.so  P1_gbx_x0ddxbx/matrix$(MENUM)py.so  P1_uux_x0gbbx/matrix$(MENUM)py.so  P1_ddx_x0gbbx/matrix$(MENUM)py.so  P1_ub_x0gub/matrix$(MENUM)py.so  P1_ubx_x0gubx/matrix$(MENUM)py.so  P1_db_x0gdb/matrix$(MENUM)py.so  P1_dbx_x0gdbx/matrix$(MENUM)py.so  P1_uxb_x0guxb/matrix$(MENUM)py.so  P1_uxbx_x0guxbx/matrix$(MENUM)py.so  P1_dxb_x0gdxb/matrix$(MENUM)py.so  P1_dxbx_x0gdxbx/matrix$(MENUM)py.so  P1_bbx_x0guux/matrix$(MENUM)py.so  P1_bbx_x0gddx/matrix$(MENUM)py.so  P1_gu_x0uuux/matrix$(MENUM)py.so  P1_gu_x0uddx/matrix$(MENUM)py.so  P1_gu_x0ussx/matrix$(MENUM)py.so  P1_gc_x0cddx/matrix$(MENUM)py.so  P1_gc_x0cssx/matrix$(MENUM)py.so  P1_gd_x0udux/matrix$(MENUM)py.so  P1_gd_x0cdcx/matrix$(MENUM)py.so  P1_gd_x0dddx/matrix$(MENUM)py.so  P1_gs_x0usux/matrix$(MENUM)py.so  P1_gs_x0cscx/matrix$(MENUM)py.so  P1_gux_x0uuxux/matrix$(MENUM)py.so  P1_gux_x0duxdx/matrix$(MENUM)py.so  P1_gux_x0suxsx/matrix$(MENUM)py.so  P1_gcx_x0dcxdx/matrix$(MENUM)py.so  P1_gcx_x0scxsx/matrix$(MENUM)py.so  P1_gdx_x0uuxdx/matrix$(MENUM)py.so  P1_gdx_x0ccxdx/matrix$(MENUM)py.so  P1_gdx_x0ddxdx/matrix$(MENUM)py.so  P1_gsx_x0uuxsx/matrix$(MENUM)py.so  P1_gsx_x0ccxsx/matrix$(MENUM)py.so  P1_gu_x0uccx/matrix$(MENUM)py.so  P1_gu_x0udsx/matrix$(MENUM)py.so  P1_gu_x0usdx/matrix$(MENUM)py.so  P1_gu_x0cddx/matrix$(MENUM)py.so  P1_gu_x0cdsx/matrix$(MENUM)py.so  P1_gu_x0csdx/matrix$(MENUM)py.so  P1_gu_x0cssx/matrix$(MENUM)py.so  P1_gc_x0uddx/matrix$(MENUM)py.so  P1_gc_x0udsx/matrix$(MENUM)py.so  P1_gc_x0usdx/matrix$(MENUM)py.so  P1_gc_x0ussx/matrix$(MENUM)py.so  P1_gc_x0cdsx/matrix$(MENUM)py.so  P1_gc_x0csdx/matrix$(MENUM)py.so  P1_gd_x0udcx/matrix$(MENUM)py.so  P1_gd_x0usux/matrix$(MENUM)py.so  P1_gd_x0uscx/matrix$(MENUM)py.so  P1_gd_x0cdux/matrix$(MENUM)py.so  P1_gd_x0csux/matrix$(MENUM)py.so  P1_gd_x0cscx/matrix$(MENUM)py.so  P1_gd_x0dssx/matrix$(MENUM)py.so  P1_gs_x0udux/matrix$(MENUM)py.so  P1_gs_x0udcx/matrix$(MENUM)py.so  P1_gs_x0uscx/matrix$(MENUM)py.so  P1_gs_x0cdux/matrix$(MENUM)py.so  P1_gs_x0cdcx/matrix$(MENUM)py.so  P1_gs_x0csux/matrix$(MENUM)py.so  P1_gux_x0cuxcx/matrix$(MENUM)py.so  P1_gux_x0duxsx/matrix$(MENUM)py.so  P1_gux_x0dcxdx/matrix$(MENUM)py.so  P1_gux_x0dcxsx/matrix$(MENUM)py.so  P1_gux_x0suxdx/matrix$(MENUM)py.so  P1_gux_x0scxdx/matrix$(MENUM)py.so  P1_gux_x0scxsx/matrix$(MENUM)py.so  P1_gcx_x0duxdx/matrix$(MENUM)py.so  P1_gcx_x0duxsx/matrix$(MENUM)py.so  P1_gcx_x0dcxsx/matrix$(MENUM)py.so  P1_gcx_x0suxdx/matrix$(MENUM)py.so  P1_gcx_x0suxsx/matrix$(MENUM)py.so  P1_gcx_x0scxdx/matrix$(MENUM)py.so  P1_gdx_x0uuxsx/matrix$(MENUM)py.so  P1_gdx_x0ucxdx/matrix$(MENUM)py.so  P1_gdx_x0ucxsx/matrix$(MENUM)py.so  P1_gdx_x0cuxdx/matrix$(MENUM)py.so  P1_gdx_x0cuxsx/matrix$(MENUM)py.so  P1_gdx_x0ccxsx/matrix$(MENUM)py.so  P1_gdx_x0sdxsx/matrix$(MENUM)py.so  P1_gsx_x0uuxdx/matrix$(MENUM)py.so  P1_gsx_x0ucxdx/matrix$(MENUM)py.so  P1_gsx_x0ucxsx/matrix$(MENUM)py.so  P1_gsx_x0cuxdx/matrix$(MENUM)py.so  P1_gsx_x0cuxsx/matrix$(MENUM)py.so  P1_gsx_x0ccxdx/matrix$(MENUM)py.so  P1_uu_x0guu/matrix$(MENUM)py.so  P1_ud_x0gud/matrix$(MENUM)py.so  P1_us_x0gus/matrix$(MENUM)py.so  P1_uux_x0guux/matrix$(MENUM)py.so  P1_uux_x0gddx/matrix$(MENUM)py.so  P1_uux_x0gssx/matrix$(MENUM)py.so  P1_udx_x0gudx/matrix$(MENUM)py.so  P1_usx_x0gusx/matrix$(MENUM)py.so  P1_cd_x0gcd/matrix$(MENUM)py.so  P1_cs_x0gcs/matrix$(MENUM)py.so  P1_ccx_x0gddx/matrix$(MENUM)py.so  P1_ccx_x0gssx/matrix$(MENUM)py.so  P1_cdx_x0gcdx/matrix$(MENUM)py.so  P1_csx_x0gcsx/matrix$(MENUM)py.so  P1_dd_x0gdd/matrix$(MENUM)py.so  P1_dux_x0gdux/matrix$(MENUM)py.so  P1_dcx_x0gdcx/matrix$(MENUM)py.so  P1_ddx_x0guux/matrix$(MENUM)py.so  P1_ddx_x0gccx/matrix$(MENUM)py.so  P1_ddx_x0gddx/matrix$(MENUM)py.so  P1_sux_x0gsux/matrix$(MENUM)py.so  P1_scx_x0gscx/matrix$(MENUM)py.so  P1_ssx_x0guux/matrix$(MENUM)py.so  P1_ssx_x0gccx/matrix$(MENUM)py.so  P1_uxux_x0guxux/matrix$(MENUM)py.so  P1_uxdx_x0guxdx/matrix$(MENUM)py.so  P1_uxsx_x0guxsx/matrix$(MENUM)py.so  P1_cxdx_x0gcxdx/matrix$(MENUM)py.so  P1_cxsx_x0gcxsx/matrix$(MENUM)py.so  P1_dxdx_x0gdxdx/matrix$(MENUM)py.so  P1_uc_x0guc/matrix$(MENUM)py.so  P1_ud_x0gus/matrix$(MENUM)py.so  P1_ud_x0gcd/matrix$(MENUM)py.so  P1_ud_x0gcs/matrix$(MENUM)py.so  P1_us_x0gud/matrix$(MENUM)py.so  P1_us_x0gcd/matrix$(MENUM)py.so  P1_us_x0gcs/matrix$(MENUM)py.so  P1_uux_x0gccx/matrix$(MENUM)py.so  P1_uux_x0gdsx/matrix$(MENUM)py.so  P1_uux_x0gsdx/matrix$(MENUM)py.so  P1_cd_x0gud/matrix$(MENUM)py.so  P1_ucx_x0gucx/matrix$(MENUM)py.so  P1_ucx_x0gddx/matrix$(MENUM)py.so  P1_ucx_x0gdsx/matrix$(MENUM)py.so  P1_ucx_x0gsdx/matrix$(MENUM)py.so  P1_ucx_x0gssx/matrix$(MENUM)py.so  P1_udx_x0gusx/matrix$(MENUM)py.so  P1_udx_x0gcdx/matrix$(MENUM)py.so  P1_udx_x0gcsx/matrix$(MENUM)py.so  P1_usx_x0gudx/matrix$(MENUM)py.so  P1_usx_x0gcdx/matrix$(MENUM)py.so  P1_usx_x0gcsx/matrix$(MENUM)py.so  P1_cd_x0gus/matrix$(MENUM)py.so  P1_cd_x0gcs/matrix$(MENUM)py.so  P1_cs_x0gud/matrix$(MENUM)py.so  P1_cs_x0gus/matrix$(MENUM)py.so  P1_cs_x0gcd/matrix$(MENUM)py.so  P1_cux_x0gddx/matrix$(MENUM)py.so  P1_cux_x0gdsx/matrix$(MENUM)py.so  P1_cux_x0gsdx/matrix$(MENUM)py.so  P1_cux_x0gssx/matrix$(MENUM)py.so  P1_ccx_x0gdsx/matrix$(MENUM)py.so  P1_ccx_x0gsdx/matrix$(MENUM)py.so  P1_cdx_x0gudx/matrix$(MENUM)py.so  P1_cdx_x0gusx/matrix$(MENUM)py.so  P1_cdx_x0gcsx/matrix$(MENUM)py.so  P1_csx_x0gudx/matrix$(MENUM)py.so  P1_csx_x0gusx/matrix$(MENUM)py.so  P1_csx_x0gcdx/matrix$(MENUM)py.so  P1_ds_x0gds/matrix$(MENUM)py.so  P1_dux_x0gdcx/matrix$(MENUM)py.so  P1_dux_x0gsux/matrix$(MENUM)py.so  P1_dux_x0gscx/matrix$(MENUM)py.so  P1_dcx_x0gdux/matrix$(MENUM)py.so  P1_dcx_x0gsux/matrix$(MENUM)py.so  P1_dcx_x0gscx/matrix$(MENUM)py.so  P1_ddx_x0gucx/matrix$(MENUM)py.so  P1_ddx_x0gcux/matrix$(MENUM)py.so  P1_ddx_x0gssx/matrix$(MENUM)py.so  P1_dsx_x0guux/matrix$(MENUM)py.so  P1_dsx_x0gucx/matrix$(MENUM)py.so  P1_dsx_x0gcux/matrix$(MENUM)py.so  P1_dsx_x0gccx/matrix$(MENUM)py.so  P1_dsx_x0gdsx/matrix$(MENUM)py.so  P1_sux_x0gdux/matrix$(MENUM)py.so  P1_sux_x0gdcx/matrix$(MENUM)py.so  P1_sux_x0gscx/matrix$(MENUM)py.so  P1_scx_x0gdux/matrix$(MENUM)py.so  P1_scx_x0gdcx/matrix$(MENUM)py.so  P1_scx_x0gsux/matrix$(MENUM)py.so  P1_sdx_x0guux/matrix$(MENUM)py.so  P1_sdx_x0gucx/matrix$(MENUM)py.so  P1_sdx_x0gcux/matrix$(MENUM)py.so  P1_sdx_x0gccx/matrix$(MENUM)py.so  P1_ssx_x0gucx/matrix$(MENUM)py.so  P1_ssx_x0gcux/matrix$(MENUM)py.so  P1_uxcx_x0guxcx/matrix$(MENUM)py.so  P1_uxdx_x0guxsx/matrix$(MENUM)py.so  P1_uxdx_x0gcxdx/matrix$(MENUM)py.so  P1_uxdx_x0gcxsx/matrix$(MENUM)py.so  P1_uxsx_x0guxdx/matrix$(MENUM)py.so  P1_uxsx_x0gcxdx/matrix$(MENUM)py.so  P1_uxsx_x0gcxsx/matrix$(MENUM)py.so  P1_cxdx_x0guxdx/matrix$(MENUM)py.so  P1_cxdx_x0guxsx/matrix$(MENUM)py.so  P1_cxdx_x0gcxsx/matrix$(MENUM)py.so  P1_cxsx_x0guxdx/matrix$(MENUM)py.so  P1_cxsx_x0guxsx/matrix$(MENUM)py.so  P1_cxsx_x0gcxdx/matrix$(MENUM)py.so  P1_dxsx_x0gdxsx/matrix$(MENUM)py.so 
	echo 'done'