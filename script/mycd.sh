# this script help you to go you most used dirctories fast
# jianjun write it at 6th,jan,2010

#!/bin/bash

function list_all_name_path_pairs
{
python3.1 <<EOF
import mypathdb;
pathdb = mypathdb.PathForName()
str = pathdb.getAllPathNamePair()
print(str)
EOF
}

function insert_name_path_pair
{
python3.1 <<EOF
import mypathdb;
pathdb = mypathdb.PathForName()
pathdb.addNamePathPair("$1","$2")
EOF
}

function search_path_of_name
{
echo "search_path_of_name"
name=`
python3.1 <<EOF
import mypathdb;
pathdb = mypathdb.PathForName()
str = pathdb.getPath("$1")
print(str)
EOF
`
}

isAdd=$FALSE
isList=$FALSE
name=""
path=""

while getopts ":lin:p:h" optname
do
    case "$optname" in
	"l")
	    echo "list all name path pair"
	    isList=$TRUE
	    list_all_name_path_pairs
	    ;;
	"i")
	    echo "add a name path pair"
	    isAdd=$TRUE
	    ;;
	"n")
	    echo "the short name of the path"
	    name=$OPTARG
	    ;;
	"p")
	    echo "the full path of the short name"
	    path=$OPTARG
	    ;;
	"h")
	    echo  "-i     insert a short name for a full path \n "
            echo  "-n     short name \n"
            echo  "-p     path for the short name "
    esac
done

if [ $isList ]
then
    exit
fi
if [ $isAdd ] 
then
    insert_name_path_pair $name $path 
else
    search_path_of_name $name
fi

