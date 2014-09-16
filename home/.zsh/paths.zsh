for path in $paths
do
    PATH_=$path:$PATH_
done
export PATH=$PATH:$PATH_
