@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Tue Jun 18 13:01:08 -0500 2019
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim decoder_tb_behav -key {Behavioral:sim_1:Functional:decoder_tb} -tclbatch decoder_tb.tcl -view C:/Users/Lucy Saucedo/ECE_LAB_1/Test_Binary_To_BCD_behav.wcfg -log simulate.log"
call xsim  decoder_tb_behav -key {Behavioral:sim_1:Functional:decoder_tb} -tclbatch decoder_tb.tcl -view C:/Users/Lucy Saucedo/ECE_LAB_1/Test_Binary_To_BCD_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0