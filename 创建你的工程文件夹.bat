@echo off
set /p your_project= 请输入你的项目名
md %your_project%
xcopy D:\intelFPGA\18.1\class19_code\example D:\intelFPGA\18.1\class19_code\%your_project% /e /y
:: 需要改以下两个路径，第一个“D:\intelFPGA\18.1\class19_code\example”是你的模板文件夹 
:: 第二个“D:\intelFPGA\18.1\class19_code\%your_project%”是你要放的工程文件夹。
:: 建议搞一个整体工程即可