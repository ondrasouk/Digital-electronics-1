#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sun Mar 14 21:17:50 CET 2021
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tb_cnt_up_down_behav -key {Behavioral:sim_1:Functional:tb_cnt_up_down} -tclbatch tb_cnt_up_down.tcl -view /run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/cviceni/Digital-electronics-1/Labs/05-counter/counter/tb_cnt_up_down_behav.wcfg -log simulate.log"
xsim tb_cnt_up_down_behav -key {Behavioral:sim_1:Functional:tb_cnt_up_down} -tclbatch tb_cnt_up_down.tcl -view /run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/cviceni/Digital-electronics-1/Labs/05-counter/counter/tb_cnt_up_down_behav.wcfg -log simulate.log
