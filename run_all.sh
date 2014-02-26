#!/bin/bash

function init()
{

	date="date"
	date_str=`date "+%Y%m%d%H%M%S"`

	rmsedir="rmse_dir"
	logdir="log_dir"
	mkdir ${rmsedir}
	mkdir ${logdir}
}


function run_small()
{

	type=$1
	F=$2

	LS="../../data/bin/LS.bin.small-changeUserNum-1"
	TS="../../data/bin/TS.bin.small-changeUserNum-1"
	log="log-openmp-small"
	rmse="rmse-openmp-small"

	echo "running small"
	echo "starting openmp ${type} at:"
	eval ${date}

	run_cmd="./RunRBM 
		--LS ${LS}
		--TS ${TS} 
		--QS ${TS} 
		--VS ${TS} 
		--F ${F} 
		--openmp ${type} > ${logdir}/${type}_${log}_${F}
		--verbose 1 
		--log ${rmsedir}/${type}_${rmse}_${F}  "

	echo ${run_cmd}
	eval ${run_cmd}

	echo "finished openmp 1 at:"
	eval ${date}


}


function run_full()
{

	type=$1
	F=$2

	LS="../../data/bin/LS.bin.fengge-changeUserNum-1"
	TS="../../data/bin/TS.bin.fengge-changeUserNum-1"
	log="log-openmp-full"
	rmse="rmse-openmp-full"

	echo "running full-free"
	echo "starting openmp ${type} at:"
	eval ${date}

	run_cmd="./RunRBM 
		--LS ${LS}
		--TS ${TS} 
		--QS ${TS} 
		--VS ${TS} 
		--F ${F} 
		--openmp ${type} > ${logdir}/${type}_${log}_${F}
		--verbose 1 
		--log ${rmsedir}/${type}_${rmse}_${F}  "

	echo ${run_cmd}
	eval ${run_cmd}

	echo "finished openmp ${type} at:"
	eval ${date}


}



function main()
{

#	make clean && make -j 9
	init

	# params:
	# $1: type(0: not openmp, 1: openmp)
	# $2: F
	run_small 1 20
# 	run_small 0 20
# 	run_full 1 20
# 	run_full 0 20

}

main
