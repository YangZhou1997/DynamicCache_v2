#!/bin/bash
build/ARM/gem5.fast \
    --remote-gdb-port=0 \
    --outdir=m5out/test \
    --stats-file=hmmer_stats.txt \
    configs/dramsim2/dramsim2_se.py \
    --fixaddr \
    --cpu-type=detailed \
    --caches \
    --l2cache \
    --l2config=private \
    --fast-forward=1000000000 \
    --maxinsts=250000000 \
    --maxtick=2000000000000000 \
    --numpids=1 \
    --p0='benchmarks/spec2k6bin/specint/hmmer benchmarks/spec2k6bin/specint/nph3.hmm benchmarks/spec2k6bin/specint/swiss41'\
    > /users/yangzhou/DynamicCache_v2/run_scripts/results/test/stdout_hmmer.out.sh