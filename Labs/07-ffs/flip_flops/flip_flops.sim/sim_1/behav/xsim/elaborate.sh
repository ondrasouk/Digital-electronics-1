#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Tue Mar 30 22:13:42 CEST 2021
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto fbd9c5b60daa4c31a30c6316e5eecd90 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot tb_t_ff_rst_behav xil_defaultlib.tb_t_ff_rst -log elaborate.log"
xelab -wto fbd9c5b60daa4c31a30c6316e5eecd90 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot tb_t_ff_rst_behav xil_defaultlib.tb_t_ff_rst -log elaborate.log

