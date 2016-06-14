for path in $paths
do
    PATH_=$path:$PATH_
done
export PATH=$PATH:$PATH_

export RUST_SRC_PATH=/home/simon/dev/rust/src
