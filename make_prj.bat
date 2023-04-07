set /p your_prj_name= 请输入你的工程名
quartus_sh -t creat_prj.tcl 
quartus_sh --flow compile %your_prj_name%
::                    please replace "your_prj_name" as your prj_name


D:\intelFPGA\18.1\quartus\bin64\quartus_pgm.exe -m JTAG -o "p;output_files\%your_prj_name%.sof"

pause 