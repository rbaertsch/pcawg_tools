#!/usr/bin/env python

import subprocess
import argparse
import os
import sys

if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument("--input", dest="input_bam")
	parser.add_argument("--input-index", dest="input_index")
	parser.add_argument("--temp-dir", dest="temp_dir")
	parser.add_argument("--skip-chrM", dest="skip_chrM")
        parser.add_argument("--samtools", dest="samtools_path")
	parser.add_argument("-o", "--output", dest="out")
	
	args = parser.parse_args()
	
	#which_cmd = ["which","samtools"]
	#p = subprocess.Popen(which_cmd, stdout=subprocess.PIPE)
	#out = p.stdout.readlines()
	#if len(out) == 0:		
	#	sys.exit(1)
		
	#samtools_path = "/pod/podstore/bin/samtools"
	#	out[0].rstrip("\n\r")
	samtools_path = args.samtools_path
	print "Using: ", samtools_path
	
	local_bam = os.path.join(args.temp_dir, "bam_data")
	local_bam_index = os.path.join(args.temp_dir, "bam_data.bai")
	print("ln ", args.input_bam, " ",local_bam)
	os.symlink(args.input_bam, local_bam)
	os.symlink(args.input_index, local_bam_index)
	
	ref_seqs = []
	# Get sequence references from sam file
	print samtools_path, "view", "-H", local_bam
	handle = subprocess.Popen([samtools_path, "view", "-H", local_bam], stdout=subprocess.PIPE).stdout
	for line in handle:
		if line.startswith("@SQ"):
			tmp = line.split("\t")
			chrom = tmp[1].split(":")[1]
			#if (chrom == "chrM_rCRS" or chrom == "chrM") and args.skip_chrM:
			#	continue
			ref_seqs.append(tmp[1].split(":")[1])
	handle.close()
	
	sorted_files = []
	for ref in ref_seqs:
		# Loop through each reference creating sorted by name bam specific to the reference
		sorted_file = os.path.join(args.temp_dir, ref)
		sorted_files.append(sorted_file + ".bam")
		cmd_view = [samtools_path, "view", "-b", local_bam, ref]
		cmd_sort = [samtools_path, "sort", "-m", "3000000000", "-n", "-", sorted_file]		
		p1 = subprocess.Popen(cmd_view, stdout=subprocess.PIPE)
		p2 = subprocess.Popen(cmd_sort, stdin=p1.stdout)
		p2.communicate()
		
	cmd = [samtools_path, "cat", "-o", args.out] + sorted_files 
	p = subprocess.Popen(cmd)
	p.communicate()
