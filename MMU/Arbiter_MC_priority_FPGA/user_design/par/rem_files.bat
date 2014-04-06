@echo off
IF EXIST "../synth/__projnav" rmdir /S /Q "../synth/__projnav" 
IF EXIST "../synth/xst" rmdir /S /Q "../synth/xst" 
IF EXIST "../synth/_ngo" rmdir /S /Q "../synth/_ngo" 

IF EXIST tmp rmdir /S /Q tmp
IF EXIST _xmsgs rmdir /S /Q _xmsgs
IF EXIST vio_sync_out32_xdb rmdir /S /Q vio_sync_out32_xdb
IF EXIST vio_async_in100_xdb rmdir /S /Q vio_async_in100_xdb
IF EXIST vio_async_in192_xdb rmdir /S /Q vio_async_in192_xdb
IF EXIST vio_async_in96_xdb rmdir /S /Q vio_async_in96_xdb
IF EXIST icon4_xdb rmdir /S /Q icon4_xdb

IF EXIST xst rmdir /S /Q xst
IF EXIST xlnx_auto_0_xdb rmdir /S /Q xlnx_auto_0_xdb

IF EXIST coregen.cgp del /F /Q coregen.cgp
IF EXIST coregen.cgc del /F /Q coregen.cgc
IF EXIST coregen.log del /F /Q coregen.log
IF EXIST stdout.log del /F /Q stdout.log
IF EXIST vio_sync_out32.asy del /F /Q vio_sync_out32.asy
IF EXIST vio_sync_out32.cdc del /F /Q vio_sync_out32.cdc
IF EXIST vio_sync_out32.gise del /F /Q vio_sync_out32.gise
IF EXIST vio_sync_out32.ise del /F /Q vio_sync_out32.ise
IF EXIST vio_sync_out32.ncf del /F /Q vio_sync_out32.ncf
IF EXIST vio_sync_out32.ngc del /F /Q vio_sync_out32.ngc
IF EXIST vio_sync_out32.xco del /F /Q vio_sync_out32.xco
IF EXIST vio_sync_out32.xise del /F /Q vio_sync_out32.xise
IF EXIST vio_sync_out32_flist.txt del /F /Q vio_sync_out32_flist.txt
IF EXIST vio_sync_out32_readme.txt del /F /Q vio_sync_out32_readme.txt
IF EXIST vio_sync_out32_xmdf.tcl del /F /Q vio_sync_out32_xmdf.tcl

IF EXIST vio_async_in96.asy del /F /Q vio_async_in96.asy
IF EXIST vio_async_in96.cdc del /F /Q vio_async_in96.cdc
IF EXIST vio_async_in96.gise del /F /Q vio_async_in96.gise
IF EXIST vio_async_in96.ise del /F /Q vio_async_in96.ise
IF EXIST vio_async_in96.ncf del /F /Q vio_async_in96.ncf
IF EXIST vio_async_in96.ngc del /F /Q vio_async_in96.ngc
IF EXIST vio_async_in96.xco del /F /Q vio_async_in96.xco
IF EXIST vio_async_in96.xise del /F /Q vio_async_in96.xise
IF EXIST vio_async_in96_flist.txt del /F /Q vio_async_in96_flist.txt
IF EXIST vio_async_in96_readme.txt del /F /Q vio_async_in96_readme.txt
IF EXIST vio_async_in96_xmdf.tcl del /F /Q vio_async_in96_xmdf.tcl


IF EXIST vio_async_in100.asy del /F /Q vio_async_in100.asy
IF EXIST vio_async_in100.cdc del /F /Q vio_async_in100.cdc
IF EXIST vio_async_in100.gise del /F /Q vio_async_in100.gise
IF EXIST vio_async_in100.ise del /F /Q vio_async_in100.ise
IF EXIST vio_async_in100.ncf del /F /Q vio_async_in100.ncf
IF EXIST vio_async_in100.ngc del /F /Q vio_async_in100.ngc
IF EXIST vio_async_in100.xco del /F /Q vio_async_in100.xco
IF EXIST vio_async_in100.xise del /F /Q vio_async_in100.xise
IF EXIST vio_async_in100_flist.txt del /F /Q vio_async_in100_flist.txt
IF EXIST vio_async_in100_readme.txt del /F /Q vio_async_in100_readme.txt
IF EXIST vio_async_in100_xmdf.tcl del /F /Q vio_async_in100_xmdf.tcl

IF EXIST vio_async_in192.asy del /F /Q vio_async_in192.asy
IF EXIST vio_async_in192.cdc del /F /Q vio_async_in192.cdc
IF EXIST vio_async_in192.gise del /F /Q vio_async_in192.gise
IF EXIST vio_async_in192.ise del /F /Q vio_async_in192.ise
IF EXIST vio_async_in192.ncf del /F /Q vio_async_in192.ncf
IF EXIST vio_async_in192.ngc del /F /Q vio_async_in192.ngc
IF EXIST vio_async_in192.xco del /F /Q vio_async_in192.xco
IF EXIST vio_async_in192.xise del /F /Q vio_async_in192.xise
IF EXIST vio_async_in192_flist.txt del /F /Q vio_async_in192_flist.txt
IF EXIST vio_async_in192_readme.txt del /F /Q vio_async_in192_readme.txt
IF EXIST vio_async_in192_xmdf.tcl del /F /Q vio_async_in192_xmdf.tcl

IF EXIST icon4.gise del /F /Q icon4.gise
IF EXIST icon4.ise del /F /Q icon4.ise
IF EXIST icon4.ncf del /F /Q icon4.ncf
IF EXIST icon4.ngc del /F /Q icon4.ngc
IF EXIST icon4.xco del /F /Q icon4.xco
IF EXIST icon4.xise del /F /Q icon4.xise
IF EXIST icon4_flist.txt del /F /Q icon4_flist.txt
IF EXIST icon4_readme.txt del /F /Q icon4_readme.txt
IF EXIST icon4_xmdf.tcl del /F /Q icon4_xmdf.tcl

IF EXIST ise_flow_results.txt del /F /Q ise_flow_results.txt
IF EXIST mig_user_vhdl.prj del /F /Q mig_user_vhdl.prj
IF EXIST mem_interface_top.syr del /F /Q mem_interface_top.syr
IF EXIST mig_user.ngc del /F /Q mig_user.ngc
IF EXIST mig_user.ngo del /F /Q mig_user.ngo
IF EXIST netlist.lst del /F /Q netlist.lst
IF EXIST mig_user.ngr del /F /Q mig_user.ngr
IF EXIST mig_user_xst.xrpt del /F /Q mig_user_xst.xrpt
IF EXIST mig_user.bld del /F /Q mig_user.bld
IF EXIST mig_user.ngd del /F /Q mig_user.ngd
IF EXIST mig_user_ngdbuild.xrpt del /F /Q  mig_user_ngdbuild.xrpt
IF EXIST mig_user_map.map del /F /Q  mig_user_map.map
IF EXIST mig_user_map.mrp del /F /Q  mig_user_map.mrp
IF EXIST mig_user_map.ngm del /F /Q  mig_user_map.ngm
IF EXIST mig_user.pcf del /F /Q  mig_user.pcf
IF EXIST mig_user_map.ncd del /F /Q  mig_user_map.ncd
IF EXIST mig_user_map.xrpt del /F /Q  mig_user_map.xrpt
IF EXIST mig_user_summary.xml del /F /Q  mig_user_summary.xml
IF EXIST mig_user_usage.xml del /F /Q  mig_user_usage.xml
IF EXIST mig_user.ncd del /F /Q  mig_user.ncd
IF EXIST mig_user.par del /F /Q  mig_user.par
IF EXIST mig_user.xpi del /F /Q  mig_user.xpi
IF EXIST smartpreview.twr del /F /Q  smartpreview.twr
IF EXIST mig_user.ptwx del /F /Q  mig_user.ptwx
IF EXIST mig_user.pad del /F /Q  mig_user.pad
IF EXIST mig_user.unroutes del /F /Q  mig_user.unroutes
IF EXIST mig_user_pad.csv del /F /Q  mig_user_pad.csv
IF EXIST mig_user_pad.txt del /F /Q  mig_user_pad.txt
IF EXIST mig_user_par.xrpt del /F /Q  mig_user_par.xrpt
IF EXIST mig_user.twx del /F /Q  mig_user.twx
IF EXIST mig_user.bgn del /F /Q  mig_user.bgn
IF EXIST mig_user.twr del /F /Q  mig_user.twr
IF EXIST mig_user.drc del /F /Q  mig_user.drc
IF EXIST mig_user_bitgen.xwbt del /F /Q  mig_user_bitgen.xwbt
IF EXIST mig_user.bit del mig_user.bit

:: Files and folders generated by create ise
IF EXIST test_xdb rmdir /S /Q test_xdb 
IF EXIST _xmsgs rmdir /S /Q _xmsgs 
IF EXIST test.gise del /F /Q test.gise
IF EXIST test.xise del /F /Q test.xise
IF EXIST test.xise del /F /Q test.xise

:: Files generated by ISE through GUI mode
IF EXIST _ngo rmdir /S /Q _ngo 
IF EXIST xst rmdir /S /Q xst 
IF EXIST mig_user.lso del /F /Q mig_user.lso
IF EXIST mig_user.prj del /F /Q mig_user.prj
IF EXIST mig_user.xst del /F /Q mig_user.xst
IF EXIST mig_user.stx del /F /Q mig_user.stx
IF EXIST mig_user.syr del /F /Q mig_user.syr
IF EXIST mig_user_prev_built.ngd del /F /Q mig_user_prev_built.ngd
IF EXIST test.ntrc_log del /F /Q test.ntrc_log
IF EXIST mig_user_guide.ncd del /F /Q mig_user_guide.ncd
IF EXIST mig_user.ut del /F /Q mig_user.ut
IF EXIST mig_user.cmd_log del /F /Q mig_user.cmd_log
IF EXIST par_usage_statistics.html del /F /Q par_usage_statistics.html
IF EXIST usage_statistics_webtalk.html del /F /Q usage_statistics_webtalk.html
IF EXIST webtalk.log del /F /Q webtalk.log
IF EXIST device_usage_statistics.html del /F /Q device_usage_statistics.html
IF EXIST mig_user_summary.html del /F /Q mig_user_summary.html

@echo on
