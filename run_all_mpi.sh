#!/bin/bash
function init()
{

	date="date"
	date_str=`date "+%Y%m%d%H%M%S"`

	rmsedir="rmse_dir_mpi"
	logdir="log_dir_mpi"
	mkdir ${rmsedir}
	mkdir ${logdir}

    machines="machines" #for single machine: machines-single
}


function run_small_mpi()
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

	#run_cmd="./RunDBN 
	#run_cmd="mpirun -machinefile ${machines} -np 4 RunDBN 
	run_cmd="./RunDBN 
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


function run_full_mpi()
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

	run_cmd="mpirun -machinefile ${machines} -np 4 RunDBN 
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

	make clean && make -j 9
	init

	# params:
	# $1: type(0: not openmp, 1: openmp)
	# $2: F
	run_small_mpi 1 28
 #	run_small_mpi 0 28
 #	run_full 1 20
 #	run_full 0 20

}

main
