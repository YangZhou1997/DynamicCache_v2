#!/bin/bash
build/ARM/gem5.fast \
    --remote-gdb-port=0 \
    --outdir=m5out/test \
    --stats-file=lpm_stats.txt \
    configs/dramsim2/dramsim2_se.py \
    --fixaddr \
    --cpu-type=detailed \
    --caches \
    --l2cache \
    --l2config=private \
    --fast-forward=2000000000 \
    --maxtick=2000000000000 \
    --cpu-type=timing \
    --numpids=1 \
    --p0="/users/yangzhou/NF-GEM5/dpi"
    # --p0="/users/yangzhou/NF-GEM5/m5threads/tests/test_malloc 2"
    # --num-cpus=3 \
    # --p0="/users/yangzhou/NetBricks-GEM5/target/arm-unknown-linux-musleabi/debug/helloworld" \
    
