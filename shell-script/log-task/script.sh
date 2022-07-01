#!/bin/bash
mkdir buffer_error || true 
mkdir buffer_access || true 
ls  *error.log* | xargs -I{} echo {} > error-log-list
for i in `cat error-log-list` ;  do
   printf "\n##########start##############\n\n"
   printf "\nFile name: $i"
   naked_file_name=`echo $i |awk -F'log.' '{print $1}'`
   file_extension=`echo $i |awk -F'log.' '{print $2}'`
   extended_file_extension=$((file_extension+1))
   printf "\n naked file name is ${naked_file_name}log\n"
   printf "file_extension is $file_extension\n"
   printf "\nextended_file_extension is $extended_file_extension\n"
   printf "\n ${i} will be renamed to ./buffer_error/${naked_file_name}log.${extended_file_extension}"
   
   mv ${i} ./buffer_error/${naked_file_name}log.${extended_file_extension}
   printf "\n########################\n\n"
done
cd ./buffer_error
#ls  *error.log* |xargs -I{} mv {}  ./../{}
cd ..