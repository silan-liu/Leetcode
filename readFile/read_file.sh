// https://leetcode.com/problems/tenth-line/submissions/
FILENAME='test.txt'
i=1
cat $FILENAME | while read LINE
do
    if [ $i == 10 ];then
        echo $LINE
    fi
    ((i++))
done
