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
P1_bb_x0bb/matrix$(MENUM)py.so:
	cd P1_bb_x0bb;make matrix$(MENUM)py.so
P1_bbx_x0bbx/matrix$(MENUM)py.so:
	cd P1_bbx_x0bbx;make matrix$(MENUM)py.so
P1_bxbx_x0bxbx/matrix$(MENUM)py.so:
	cd P1_bxbx_x0bxbx;make matrix$(MENUM)py.so
P1_uux_x0bbx/matrix$(MENUM)py.so:
	cd P1_uux_x0bbx;make matrix$(MENUM)py.so
P1_ddx_x0bbx/matrix$(MENUM)py.so:
	cd P1_ddx_x0bbx;make matrix$(MENUM)py.so
P1_ub_x0ub/matrix$(MENUM)py.so:
	cd P1_ub_x0ub;make matrix$(MENUM)py.so
P1_ubx_x0ubx/matrix$(MENUM)py.so:
	cd P1_ubx_x0ubx;make matrix$(MENUM)py.so
P1_db_x0db/matrix$(MENUM)py.so:
	cd P1_db_x0db;make matrix$(MENUM)py.so
P1_dbx_x0dbx/matrix$(MENUM)py.so:
	cd P1_dbx_x0dbx;make matrix$(MENUM)py.so
P1_uxb_x0uxb/matrix$(MENUM)py.so:
	cd P1_uxb_x0uxb;make matrix$(MENUM)py.so
P1_uxbx_x0uxbx/matrix$(MENUM)py.so:
	cd P1_uxbx_x0uxbx;make matrix$(MENUM)py.so
P1_dxb_x0dxb/matrix$(MENUM)py.so:
	cd P1_dxb_x0dxb;make matrix$(MENUM)py.so
P1_dxbx_x0dxbx/matrix$(MENUM)py.so:
	cd P1_dxbx_x0dxbx;make matrix$(MENUM)py.so
P1_bbx_x0uux/matrix$(MENUM)py.so:
	cd P1_bbx_x0uux;make matrix$(MENUM)py.so
P1_bbx_x0ddx/matrix$(MENUM)py.so:
	cd P1_bbx_x0ddx;make matrix$(MENUM)py.so
P1_uu_x0uu/matrix$(MENUM)py.so:
	cd P1_uu_x0uu;make matrix$(MENUM)py.so
P1_ud_x0ud/matrix$(MENUM)py.so:
	cd P1_ud_x0ud;make matrix$(MENUM)py.so
P1_us_x0us/matrix$(MENUM)py.so:
	cd P1_us_x0us;make matrix$(MENUM)py.so
P1_uux_x0uux/matrix$(MENUM)py.so:
	cd P1_uux_x0uux;make matrix$(MENUM)py.so
P1_uux_x0ddx/matrix$(MENUM)py.so:
	cd P1_uux_x0ddx;make matrix$(MENUM)py.so
P1_uux_x0ssx/matrix$(MENUM)py.so:
	cd P1_uux_x0ssx;make matrix$(MENUM)py.so
P1_udx_x0udx/matrix$(MENUM)py.so:
	cd P1_udx_x0udx;make matrix$(MENUM)py.so
P1_usx_x0usx/matrix$(MENUM)py.so:
	cd P1_usx_x0usx;make matrix$(MENUM)py.so
P1_cd_x0cd/matrix$(MENUM)py.so:
	cd P1_cd_x0cd;make matrix$(MENUM)py.so
P1_cs_x0cs/matrix$(MENUM)py.so:
	cd P1_cs_x0cs;make matrix$(MENUM)py.so
P1_ccx_x0ddx/matrix$(MENUM)py.so:
	cd P1_ccx_x0ddx;make matrix$(MENUM)py.so
P1_ccx_x0ssx/matrix$(MENUM)py.so:
	cd P1_ccx_x0ssx;make matrix$(MENUM)py.so
P1_cdx_x0cdx/matrix$(MENUM)py.so:
	cd P1_cdx_x0cdx;make matrix$(MENUM)py.so
P1_csx_x0csx/matrix$(MENUM)py.so:
	cd P1_csx_x0csx;make matrix$(MENUM)py.so
P1_dd_x0dd/matrix$(MENUM)py.so:
	cd P1_dd_x0dd;make matrix$(MENUM)py.so
P1_dux_x0dux/matrix$(MENUM)py.so:
	cd P1_dux_x0dux;make matrix$(MENUM)py.so
P1_dcx_x0dcx/matrix$(MENUM)py.so:
	cd P1_dcx_x0dcx;make matrix$(MENUM)py.so
P1_ddx_x0uux/matrix$(MENUM)py.so:
	cd P1_ddx_x0uux;make matrix$(MENUM)py.so
P1_ddx_x0ccx/matrix$(MENUM)py.so:
	cd P1_ddx_x0ccx;make matrix$(MENUM)py.so
P1_ddx_x0ddx/matrix$(MENUM)py.so:
	cd P1_ddx_x0ddx;make matrix$(MENUM)py.so
P1_sux_x0sux/matrix$(MENUM)py.so:
	cd P1_sux_x0sux;make matrix$(MENUM)py.so
P1_scx_x0scx/matrix$(MENUM)py.so:
	cd P1_scx_x0scx;make matrix$(MENUM)py.so
P1_ssx_x0uux/matrix$(MENUM)py.so:
	cd P1_ssx_x0uux;make matrix$(MENUM)py.so
P1_ssx_x0ccx/matrix$(MENUM)py.so:
	cd P1_ssx_x0ccx;make matrix$(MENUM)py.so
P1_uxux_x0uxux/matrix$(MENUM)py.so:
	cd P1_uxux_x0uxux;make matrix$(MENUM)py.so
P1_uxdx_x0uxdx/matrix$(MENUM)py.so:
	cd P1_uxdx_x0uxdx;make matrix$(MENUM)py.so
P1_uxsx_x0uxsx/matrix$(MENUM)py.so:
	cd P1_uxsx_x0uxsx;make matrix$(MENUM)py.so
P1_cxdx_x0cxdx/matrix$(MENUM)py.so:
	cd P1_cxdx_x0cxdx;make matrix$(MENUM)py.so
P1_cxsx_x0cxsx/matrix$(MENUM)py.so:
	cd P1_cxsx_x0cxsx;make matrix$(MENUM)py.so
P1_dxdx_x0dxdx/matrix$(MENUM)py.so:
	cd P1_dxdx_x0dxdx;make matrix$(MENUM)py.so
P1_uc_x0uc/matrix$(MENUM)py.so:
	cd P1_uc_x0uc;make matrix$(MENUM)py.so
P1_ud_x0us/matrix$(MENUM)py.so:
	cd P1_ud_x0us;make matrix$(MENUM)py.so
P1_ud_x0cd/matrix$(MENUM)py.so:
	cd P1_ud_x0cd;make matrix$(MENUM)py.so
P1_ud_x0cs/matrix$(MENUM)py.so:
	cd P1_ud_x0cs;make matrix$(MENUM)py.so
P1_us_x0ud/matrix$(MENUM)py.so:
	cd P1_us_x0ud;make matrix$(MENUM)py.so
P1_us_x0cd/matrix$(MENUM)py.so:
	cd P1_us_x0cd;make matrix$(MENUM)py.so
P1_us_x0cs/matrix$(MENUM)py.so:
	cd P1_us_x0cs;make matrix$(MENUM)py.so
P1_uux_x0ccx/matrix$(MENUM)py.so:
	cd P1_uux_x0ccx;make matrix$(MENUM)py.so
P1_uux_x0dsx/matrix$(MENUM)py.so:
	cd P1_uux_x0dsx;make matrix$(MENUM)py.so
P1_uux_x0sdx/matrix$(MENUM)py.so:
	cd P1_uux_x0sdx;make matrix$(MENUM)py.so
P1_ucx_x0ucx/matrix$(MENUM)py.so:
	cd P1_ucx_x0ucx;make matrix$(MENUM)py.so
P1_ucx_x0ddx/matrix$(MENUM)py.so:
	cd P1_ucx_x0ddx;make matrix$(MENUM)py.so
P1_ucx_x0dsx/matrix$(MENUM)py.so:
	cd P1_ucx_x0dsx;make matrix$(MENUM)py.so
P1_ucx_x0sdx/matrix$(MENUM)py.so:
	cd P1_ucx_x0sdx;make matrix$(MENUM)py.so
P1_ucx_x0ssx/matrix$(MENUM)py.so:
	cd P1_ucx_x0ssx;make matrix$(MENUM)py.so
P1_udx_x0usx/matrix$(MENUM)py.so:
	cd P1_udx_x0usx;make matrix$(MENUM)py.so
P1_udx_x0cdx/matrix$(MENUM)py.so:
	cd P1_udx_x0cdx;make matrix$(MENUM)py.so
P1_udx_x0csx/matrix$(MENUM)py.so:
	cd P1_udx_x0csx;make matrix$(MENUM)py.so
P1_usx_x0udx/matrix$(MENUM)py.so:
	cd P1_usx_x0udx;make matrix$(MENUM)py.so
P1_usx_x0cdx/matrix$(MENUM)py.so:
	cd P1_usx_x0cdx;make matrix$(MENUM)py.so
P1_usx_x0csx/matrix$(MENUM)py.so:
	cd P1_usx_x0csx;make matrix$(MENUM)py.so
P1_cd_x0ud/matrix$(MENUM)py.so:
	cd P1_cd_x0ud;make matrix$(MENUM)py.so
P1_cd_x0us/matrix$(MENUM)py.so:
	cd P1_cd_x0us;make matrix$(MENUM)py.so
P1_cd_x0cs/matrix$(MENUM)py.so:
	cd P1_cd_x0cs;make matrix$(MENUM)py.so
P1_cs_x0ud/matrix$(MENUM)py.so:
	cd P1_cs_x0ud;make matrix$(MENUM)py.so
P1_cs_x0us/matrix$(MENUM)py.so:
	cd P1_cs_x0us;make matrix$(MENUM)py.so
P1_cs_x0cd/matrix$(MENUM)py.so:
	cd P1_cs_x0cd;make matrix$(MENUM)py.so
P1_cux_x0ddx/matrix$(MENUM)py.so:
	cd P1_cux_x0ddx;make matrix$(MENUM)py.so
P1_cux_x0dsx/matrix$(MENUM)py.so:
	cd P1_cux_x0dsx;make matrix$(MENUM)py.so
P1_cux_x0sdx/matrix$(MENUM)py.so:
	cd P1_cux_x0sdx;make matrix$(MENUM)py.so
P1_cux_x0ssx/matrix$(MENUM)py.so:
	cd P1_cux_x0ssx;make matrix$(MENUM)py.so
P1_ccx_x0dsx/matrix$(MENUM)py.so:
	cd P1_ccx_x0dsx;make matrix$(MENUM)py.so
P1_ccx_x0sdx/matrix$(MENUM)py.so:
	cd P1_ccx_x0sdx;make matrix$(MENUM)py.so
P1_cdx_x0udx/matrix$(MENUM)py.so:
	cd P1_cdx_x0udx;make matrix$(MENUM)py.so
P1_cdx_x0usx/matrix$(MENUM)py.so:
	cd P1_cdx_x0usx;make matrix$(MENUM)py.so
P1_cdx_x0csx/matrix$(MENUM)py.so:
	cd P1_cdx_x0csx;make matrix$(MENUM)py.so
P1_csx_x0udx/matrix$(MENUM)py.so:
	cd P1_csx_x0udx;make matrix$(MENUM)py.so
P1_csx_x0usx/matrix$(MENUM)py.so:
	cd P1_csx_x0usx;make matrix$(MENUM)py.so
P1_csx_x0cdx/matrix$(MENUM)py.so:
	cd P1_csx_x0cdx;make matrix$(MENUM)py.so
P1_ds_x0ds/matrix$(MENUM)py.so:
	cd P1_ds_x0ds;make matrix$(MENUM)py.so
P1_dux_x0dcx/matrix$(MENUM)py.so:
	cd P1_dux_x0dcx;make matrix$(MENUM)py.so
P1_dux_x0sux/matrix$(MENUM)py.so:
	cd P1_dux_x0sux;make matrix$(MENUM)py.so
P1_dux_x0scx/matrix$(MENUM)py.so:
	cd P1_dux_x0scx;make matrix$(MENUM)py.so
P1_dcx_x0dux/matrix$(MENUM)py.so:
	cd P1_dcx_x0dux;make matrix$(MENUM)py.so
P1_dcx_x0sux/matrix$(MENUM)py.so:
	cd P1_dcx_x0sux;make matrix$(MENUM)py.so
P1_dcx_x0scx/matrix$(MENUM)py.so:
	cd P1_dcx_x0scx;make matrix$(MENUM)py.so
P1_ddx_x0ucx/matrix$(MENUM)py.so:
	cd P1_ddx_x0ucx;make matrix$(MENUM)py.so
P1_ddx_x0cux/matrix$(MENUM)py.so:
	cd P1_ddx_x0cux;make matrix$(MENUM)py.so
P1_ddx_x0ssx/matrix$(MENUM)py.so:
	cd P1_ddx_x0ssx;make matrix$(MENUM)py.so
P1_dsx_x0uux/matrix$(MENUM)py.so:
	cd P1_dsx_x0uux;make matrix$(MENUM)py.so
P1_dsx_x0ucx/matrix$(MENUM)py.so:
	cd P1_dsx_x0ucx;make matrix$(MENUM)py.so
P1_dsx_x0cux/matrix$(MENUM)py.so:
	cd P1_dsx_x0cux;make matrix$(MENUM)py.so
P1_dsx_x0ccx/matrix$(MENUM)py.so:
	cd P1_dsx_x0ccx;make matrix$(MENUM)py.so
P1_dsx_x0dsx/matrix$(MENUM)py.so:
	cd P1_dsx_x0dsx;make matrix$(MENUM)py.so
P1_sux_x0dux/matrix$(MENUM)py.so:
	cd P1_sux_x0dux;make matrix$(MENUM)py.so
P1_sux_x0dcx/matrix$(MENUM)py.so:
	cd P1_sux_x0dcx;make matrix$(MENUM)py.so
P1_sux_x0scx/matrix$(MENUM)py.so:
	cd P1_sux_x0scx;make matrix$(MENUM)py.so
P1_scx_x0dux/matrix$(MENUM)py.so:
	cd P1_scx_x0dux;make matrix$(MENUM)py.so
P1_scx_x0dcx/matrix$(MENUM)py.so:
	cd P1_scx_x0dcx;make matrix$(MENUM)py.so
P1_scx_x0sux/matrix$(MENUM)py.so:
	cd P1_scx_x0sux;make matrix$(MENUM)py.so
P1_sdx_x0uux/matrix$(MENUM)py.so:
	cd P1_sdx_x0uux;make matrix$(MENUM)py.so
P1_sdx_x0ucx/matrix$(MENUM)py.so:
	cd P1_sdx_x0ucx;make matrix$(MENUM)py.so
P1_sdx_x0cux/matrix$(MENUM)py.so:
	cd P1_sdx_x0cux;make matrix$(MENUM)py.so
P1_sdx_x0ccx/matrix$(MENUM)py.so:
	cd P1_sdx_x0ccx;make matrix$(MENUM)py.so
P1_ssx_x0ucx/matrix$(MENUM)py.so:
	cd P1_ssx_x0ucx;make matrix$(MENUM)py.so
P1_ssx_x0cux/matrix$(MENUM)py.so:
	cd P1_ssx_x0cux;make matrix$(MENUM)py.so
P1_uxcx_x0uxcx/matrix$(MENUM)py.so:
	cd P1_uxcx_x0uxcx;make matrix$(MENUM)py.so
P1_uxdx_x0uxsx/matrix$(MENUM)py.so:
	cd P1_uxdx_x0uxsx;make matrix$(MENUM)py.so
P1_uxdx_x0cxdx/matrix$(MENUM)py.so:
	cd P1_uxdx_x0cxdx;make matrix$(MENUM)py.so
P1_uxdx_x0cxsx/matrix$(MENUM)py.so:
	cd P1_uxdx_x0cxsx;make matrix$(MENUM)py.so
P1_uxsx_x0uxdx/matrix$(MENUM)py.so:
	cd P1_uxsx_x0uxdx;make matrix$(MENUM)py.so
P1_uxsx_x0cxdx/matrix$(MENUM)py.so:
	cd P1_uxsx_x0cxdx;make matrix$(MENUM)py.so
P1_uxsx_x0cxsx/matrix$(MENUM)py.so:
	cd P1_uxsx_x0cxsx;make matrix$(MENUM)py.so
P1_cxdx_x0uxdx/matrix$(MENUM)py.so:
	cd P1_cxdx_x0uxdx;make matrix$(MENUM)py.so
P1_cxdx_x0uxsx/matrix$(MENUM)py.so:
	cd P1_cxdx_x0uxsx;make matrix$(MENUM)py.so
P1_cxdx_x0cxsx/matrix$(MENUM)py.so:
	cd P1_cxdx_x0cxsx;make matrix$(MENUM)py.so
P1_cxsx_x0uxdx/matrix$(MENUM)py.so:
	cd P1_cxsx_x0uxdx;make matrix$(MENUM)py.so
P1_cxsx_x0uxsx/matrix$(MENUM)py.so:
	cd P1_cxsx_x0uxsx;make matrix$(MENUM)py.so
P1_cxsx_x0cxdx/matrix$(MENUM)py.so:
	cd P1_cxsx_x0cxdx;make matrix$(MENUM)py.so
P1_dxsx_x0dxsx/matrix$(MENUM)py.so:
	cd P1_dxsx_x0dxsx;make matrix$(MENUM)py.so
all:  P1_bb_x0bb/matrix$(MENUM)py.so  P1_bbx_x0bbx/matrix$(MENUM)py.so  P1_bxbx_x0bxbx/matrix$(MENUM)py.so  P1_uux_x0bbx/matrix$(MENUM)py.so  P1_ddx_x0bbx/matrix$(MENUM)py.so  P1_ub_x0ub/matrix$(MENUM)py.so  P1_ubx_x0ubx/matrix$(MENUM)py.so  P1_db_x0db/matrix$(MENUM)py.so  P1_dbx_x0dbx/matrix$(MENUM)py.so  P1_uxb_x0uxb/matrix$(MENUM)py.so  P1_uxbx_x0uxbx/matrix$(MENUM)py.so  P1_dxb_x0dxb/matrix$(MENUM)py.so  P1_dxbx_x0dxbx/matrix$(MENUM)py.so  P1_bbx_x0uux/matrix$(MENUM)py.so  P1_bbx_x0ddx/matrix$(MENUM)py.so  P1_uu_x0uu/matrix$(MENUM)py.so  P1_ud_x0ud/matrix$(MENUM)py.so  P1_us_x0us/matrix$(MENUM)py.so  P1_uux_x0uux/matrix$(MENUM)py.so  P1_uux_x0ddx/matrix$(MENUM)py.so  P1_uux_x0ssx/matrix$(MENUM)py.so  P1_udx_x0udx/matrix$(MENUM)py.so  P1_usx_x0usx/matrix$(MENUM)py.so  P1_cd_x0cd/matrix$(MENUM)py.so  P1_cs_x0cs/matrix$(MENUM)py.so  P1_ccx_x0ddx/matrix$(MENUM)py.so  P1_ccx_x0ssx/matrix$(MENUM)py.so  P1_cdx_x0cdx/matrix$(MENUM)py.so  P1_csx_x0csx/matrix$(MENUM)py.so  P1_dd_x0dd/matrix$(MENUM)py.so  P1_dux_x0dux/matrix$(MENUM)py.so  P1_dcx_x0dcx/matrix$(MENUM)py.so  P1_ddx_x0uux/matrix$(MENUM)py.so  P1_ddx_x0ccx/matrix$(MENUM)py.so  P1_ddx_x0ddx/matrix$(MENUM)py.so  P1_sux_x0sux/matrix$(MENUM)py.so  P1_scx_x0scx/matrix$(MENUM)py.so  P1_ssx_x0uux/matrix$(MENUM)py.so  P1_ssx_x0ccx/matrix$(MENUM)py.so  P1_uxux_x0uxux/matrix$(MENUM)py.so  P1_uxdx_x0uxdx/matrix$(MENUM)py.so  P1_uxsx_x0uxsx/matrix$(MENUM)py.so  P1_cxdx_x0cxdx/matrix$(MENUM)py.so  P1_cxsx_x0cxsx/matrix$(MENUM)py.so  P1_dxdx_x0dxdx/matrix$(MENUM)py.so  P1_uc_x0uc/matrix$(MENUM)py.so  P1_ud_x0us/matrix$(MENUM)py.so  P1_ud_x0cd/matrix$(MENUM)py.so  P1_ud_x0cs/matrix$(MENUM)py.so  P1_us_x0ud/matrix$(MENUM)py.so  P1_us_x0cd/matrix$(MENUM)py.so  P1_us_x0cs/matrix$(MENUM)py.so  P1_uux_x0ccx/matrix$(MENUM)py.so  P1_uux_x0dsx/matrix$(MENUM)py.so  P1_uux_x0sdx/matrix$(MENUM)py.so  P1_ucx_x0ucx/matrix$(MENUM)py.so  P1_ucx_x0ddx/matrix$(MENUM)py.so  P1_ucx_x0dsx/matrix$(MENUM)py.so  P1_ucx_x0sdx/matrix$(MENUM)py.so  P1_ucx_x0ssx/matrix$(MENUM)py.so  P1_udx_x0usx/matrix$(MENUM)py.so  P1_udx_x0cdx/matrix$(MENUM)py.so  P1_udx_x0csx/matrix$(MENUM)py.so  P1_usx_x0udx/matrix$(MENUM)py.so  P1_usx_x0cdx/matrix$(MENUM)py.so  P1_usx_x0csx/matrix$(MENUM)py.so  P1_cd_x0ud/matrix$(MENUM)py.so  P1_cd_x0us/matrix$(MENUM)py.so  P1_cd_x0cs/matrix$(MENUM)py.so  P1_cs_x0ud/matrix$(MENUM)py.so  P1_cs_x0us/matrix$(MENUM)py.so  P1_cs_x0cd/matrix$(MENUM)py.so  P1_cux_x0ddx/matrix$(MENUM)py.so  P1_cux_x0dsx/matrix$(MENUM)py.so  P1_cux_x0sdx/matrix$(MENUM)py.so  P1_cux_x0ssx/matrix$(MENUM)py.so  P1_ccx_x0dsx/matrix$(MENUM)py.so  P1_ccx_x0sdx/matrix$(MENUM)py.so  P1_cdx_x0udx/matrix$(MENUM)py.so  P1_cdx_x0usx/matrix$(MENUM)py.so  P1_cdx_x0csx/matrix$(MENUM)py.so  P1_csx_x0udx/matrix$(MENUM)py.so  P1_csx_x0usx/matrix$(MENUM)py.so  P1_csx_x0cdx/matrix$(MENUM)py.so  P1_ds_x0ds/matrix$(MENUM)py.so  P1_dux_x0dcx/matrix$(MENUM)py.so  P1_dux_x0sux/matrix$(MENUM)py.so  P1_dux_x0scx/matrix$(MENUM)py.so  P1_dcx_x0dux/matrix$(MENUM)py.so  P1_dcx_x0sux/matrix$(MENUM)py.so  P1_dcx_x0scx/matrix$(MENUM)py.so  P1_ddx_x0ucx/matrix$(MENUM)py.so  P1_ddx_x0cux/matrix$(MENUM)py.so  P1_ddx_x0ssx/matrix$(MENUM)py.so  P1_dsx_x0uux/matrix$(MENUM)py.so  P1_dsx_x0ucx/matrix$(MENUM)py.so  P1_dsx_x0cux/matrix$(MENUM)py.so  P1_dsx_x0ccx/matrix$(MENUM)py.so  P1_dsx_x0dsx/matrix$(MENUM)py.so  P1_sux_x0dux/matrix$(MENUM)py.so  P1_sux_x0dcx/matrix$(MENUM)py.so  P1_sux_x0scx/matrix$(MENUM)py.so  P1_scx_x0dux/matrix$(MENUM)py.so  P1_scx_x0dcx/matrix$(MENUM)py.so  P1_scx_x0sux/matrix$(MENUM)py.so  P1_sdx_x0uux/matrix$(MENUM)py.so  P1_sdx_x0ucx/matrix$(MENUM)py.so  P1_sdx_x0cux/matrix$(MENUM)py.so  P1_sdx_x0ccx/matrix$(MENUM)py.so  P1_ssx_x0ucx/matrix$(MENUM)py.so  P1_ssx_x0cux/matrix$(MENUM)py.so  P1_uxcx_x0uxcx/matrix$(MENUM)py.so  P1_uxdx_x0uxsx/matrix$(MENUM)py.so  P1_uxdx_x0cxdx/matrix$(MENUM)py.so  P1_uxdx_x0cxsx/matrix$(MENUM)py.so  P1_uxsx_x0uxdx/matrix$(MENUM)py.so  P1_uxsx_x0cxdx/matrix$(MENUM)py.so  P1_uxsx_x0cxsx/matrix$(MENUM)py.so  P1_cxdx_x0uxdx/matrix$(MENUM)py.so  P1_cxdx_x0uxsx/matrix$(MENUM)py.so  P1_cxdx_x0cxsx/matrix$(MENUM)py.so  P1_cxsx_x0uxdx/matrix$(MENUM)py.so  P1_cxsx_x0uxsx/matrix$(MENUM)py.so  P1_cxsx_x0cxdx/matrix$(MENUM)py.so  P1_dxsx_x0dxsx/matrix$(MENUM)py.so 
	echo 'done'