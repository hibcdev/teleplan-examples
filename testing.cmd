echo Login (insert your login/password)
pause
curl -k -c cookies.txt -X POST -d "ExternalAction=AsignOn&username=ttum????&password=????" https://tlpt2.moh.hnet.bc.ca/TeleplanBroker

echo Password change (will fail passwords don't match)
pause
curl -k -b cookies.txt -X POST -d "ExternalAction=AchangePW&username=ttum9999999&password=fail&new.password=nada&confirm.password=yada" https://tlpt2.moh.hnet.bc.ca/TeleplanBroker

echo Get Log
pause
curl -k -b cookies.txt -X POST -d "ExternalAction=AgetLog&MODE=DOWNLOAD&LOGNAME=CURRENT&LOGTYPE=L" https://tlpt2.moh.hnet.bc.ca/TeleplanBroker

echo Get Log List
pause
curl -k -b cookies.txt -X POST -d "ExternalAction=AgetLogList" https://tlpt2.moh.hnet.bc.ca/TeleplanBroker

echo Post Remit (will fail file is not valid)
pause
curl -k -b cookies.txt  -F "submitFile=@testing.cmd" -F "ExternalAction=AputRemit" https://tlpt2.moh.hnet.bc.ca/TeleplanBroker

echo Get something
pause
curl -k -b cookies.txt -X POST -d "ExternalAction=AgetAscii&filechar=0" https://tlpt2.moh.hnet.bc.ca/TeleplanBroker

echo Get remittance
pause
curl -k -b cookies.txt -X POST -d "ExternalAction=AgetRemit&remittance=true" https://tlpt2.moh.hnet.bc.ca/TeleplanBroker

echo Check Eligibility
echo Optional parameters not included: &dateOfServiceyyyy=2024&dateOfServicemm=03&dateOfServicedd=20
pause
curl -k -b cookies.txt -X POST -d "ExternalAction=AcheckE45&PHN=9317279351&dateOfBirthyyyy=1948&dateOfBirthmm=09&dateOfBirthdd=08 &PatientVisitCharge=true&LastEyeExam=true&PatientRestriction=true" https://tlpt2.moh.hnet.bc.ca/TeleplanBroker

echo Logout
pause
curl -k -b cookies.txt -X POST -d "ExternalAction=AsignOff" https://tlpt2.moh.hnet.bc.ca/TeleplanBroker

del cookies.txt
