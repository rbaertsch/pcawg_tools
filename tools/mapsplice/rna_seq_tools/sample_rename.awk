$10=="Benchmark_NugenStranded+Complete"{l="NG";t="ST"}
$10=="NugenNonStranded"{l="NG";t="NS"}
$10=="IlluminaStranded"{l="Tru";t="ST"}
$10=="011014_Benchmark_IlluminaNonStranded"{l="Tru";t="NS"}
NR==2{print "mv Sample_" $3 "_R1.fastq "l"_"t"_"$3"_R1.fastq";print "mv Sample_" $3 "_R2.fastq "l"_"t"_"$3"_R2.fastq"}
