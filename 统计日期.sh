#!/bin/bash
##判断变量，是否为空（如果没有或只有一个，进行默认赋值）
if [ "$1" == "" ] 
then
    start_date=`date -d "today last month" "+%Y%m01"`
    end_date=`date -d "today" "+%Y%m%d"`
else if [ "$2" == "" ]
    then
        start_date=`date -d "$1" "+%Y%m%d"`
        end_date=`date -d "today" "+%Y%m%d"`
else 
        start_date=`date -d "$1" "+%Y%m%d"`
        end_date=`date -d "$2" "+%Y%m%d"`
    fi
  fi        
##判断两个变量是否有问题(可扩展，进行可用性识别)
if [ "$start_date" -gt "$end_date" ]    
then
    echo "ERROR! \nplease input a right date"
    exit
fi

##通过循环，返回日期值（包含开始和结束日期，闭区间）
for i in `seq 0 100000`
do
    t_date=`date -d "${start_date} +$(($i+1)) day" "+%Y%m%d"`
    echo $t_date
    cnt_days=$i
    
    ##如果循环到当天，就退出
    if [ $t_date == $end_date ]
    then
        break
    fi
done

echo "The days between two date is "+$cnt_days+" !"
