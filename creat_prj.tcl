#   
#    @Description: 第3版，已经实现的功能：
#               通过.bat文件创建工程，之后运行Tcl脚本，
#               即可实现添加设计文件、综合编译、绑定引脚、
#               全编译。
#    @Author: lizs
#    @Date: 2023-04-01 16:55:30
#    @LastEditTime: 2023-04-01 17:26:23
#    @FilePath: \test\prj\c.tcl
#   

# 设置变量
set top_name iic_io
set my_new_prj iic_io
set verilog_files [glob ../rtl/*.v] 

#本来应该是my_new_prj
project_new $my_new_prj -overwrite 

set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE6F17C8
set_global_assignment -name TOP_LEVEL_ENTITY $top_name 
											#工程顶层实体名称
set_global_assignment -name NUM_PARALLEL_PROCESSORS 4

set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
set_global_assignment -name DEVICE_FILTER_PIN_COUNT 256
set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 8
set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V
set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"

set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"


foreach file $verilog_files {
    set_global_assignment -name VERILOG_FILE $file
}

# 指定FPGA器件型号和系列
set_global_assignment -name DEVICE "EP4CE6F17C8"
set_global_assignment -name FAMILY "Cyclone IV E"

# 执行综合和布局布线
#execute_flow -compile

set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"
set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"
set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_DATA0_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_DATA1_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_FLASH_NCE_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_DCLK_AFTER_CONFIGURATION "USE AS REGULAR IO"


#引脚参数导入脚本
#时钟、复位
set_location_assignment PIN_E1 -to  clk
set_location_assignment PIN_M16 -to rst_n
#ds18b20测温模块
set_location_assignment PIN_M12 -to scl 
set_location_assignment PIN_N14 -to sda 
#UART
#set_location_assignment PIN_M2 -to uart_rx
#set_location_assignment PIN_G1 -to uart_tx

#LED
# set_location_assignment PIN_D16 -to led[3]
# set_location_assignment PIN_F15 -to led[2]
# set_location_assignment PIN_F16 -to led[1]
# set_location_assignment PIN_G15 -to led[0]

#独立按键
set_location_assignment PIN_E15 -to key[0]
set_location_assignment PIN_E16 -to key[1]
# set_location_assignment PIN_M16 -to key[2]
# set_location_assignment PIN_M15 -to key[3]

#数码管选段
set_location_assignment PIN_B7 -to seg[0]
set_location_assignment PIN_A8 -to seg[1]
set_location_assignment PIN_A6 -to seg[2]
set_location_assignment PIN_B5 -to seg[3]
set_location_assignment PIN_B6 -to seg[4]
set_location_assignment PIN_A7 -to seg[5]
set_location_assignment PIN_B8 -to seg[6]
set_location_assignment PIN_A5 -to seg[7]

#数码管片选
set_location_assignment PIN_A4 -to sel[0]
set_location_assignment PIN_B4 -to sel[1]
set_location_assignment PIN_A3 -to sel[2]
set_location_assignment PIN_B3 -to sel[3]
set_location_assignment PIN_A2 -to sel[4]
set_location_assignment PIN_B1 -to sel[5]

#蜂鸣器
# set_location_assignment PIN_J1 -to beep

#SDRAM #地址
#set_location_assignment PIN_T8    -to addr[0]  
#set_location_assignment PIN_P9    -to addr[1]
#set_location_assignment PIN_T9    -to addr[2]
#set_location_assignment PIN_R9    -to addr[3]
#set_location_assignment PIN_L16   -to addr[4]
#set_location_assignment PIN_L15   -to addr[5]
#set_location_assignment PIN_N16   -to addr[6]
#set_location_assignment PIN_N15   -to addr[7]
#set_location_assignment PIN_P16   -to addr[8]
#set_location_assignment PIN_P15   -to addr[9]
#set_location_assignment PIN_R8    -to addr[10]
#set_location_assignment PIN_R16   -to addr[11]
#set_location_assignment PIN_T15   -to addr[12]
    
#数据
#set_location_assignment PIN_R5    -to dq[0]
#set_location_assignment PIN_T4    -to dq[1]
#set_location_assignment PIN_T3    -to dq[2]
#set_location_assignment PIN_R3    -to dq[3]
#set_location_assignment PIN_T2    -to dq[4]
#set_location_assignment PIN_R1    -to dq[5]
#set_location_assignment PIN_P2    -to dq[6]
#set_location_assignment PIN_P1    -to dq[7]
#set_location_assignment PIN_R13   -to dq[8]
#set_location_assignment PIN_T13   -to dq[9]
#set_location_assignment PIN_R12   -to dq[10]
#set_location_assignment PIN_T12   -to dq[11]
#set_location_assignment PIN_T10   -to dq[12]
#set_location_assignment PIN_R10   -to dq[13]
#set_location_assignment PIN_T11   -to dq[14]
#set_location_assignment PIN_R11   -to dq[15]

#bank
#set_location_assignment PIN_R7   -to bank[0]
#set_location_assignment PIN_T7   -to bank[1]

#dqm
#set_location_assignment PIN_N2    -to dqm[0]
#set_location_assignment PIN_T14   -to dqm[1]
    
#时钟
#set_location_assignment PIN_R4    -to sdram_clk

#控制信号
#set_location_assignment PIN_R14   -to cke
#set_location_assignment PIN_T6    -to cs_n
#set_location_assignment PIN_R6    -to ras_n
#set_location_assignment PIN_T5    -to cas_n
#set_location_assignment PIN_N1    -to we_n

#flash
#set_location_assignment PIN_H2    -to miso   
#set_location_assignment PIN_C1    -to mosi
#set_location_assignment PIN_H1    -to sclk
#set_location_assignment PIN_D2    -to cs_n

#EEPROM 
#set_location_assignment PIN_L2 -to sda
#set_location_assignment PIN_L1 -to sclk

# 16bit vga output  VGA
#set_location_assignment PIN_F6 -to vga_out_b[4]
#set_location_assignment PIN_E5 -to vga_out_b[3]
#set_location_assignment PIN_D3 -to vga_out_b[2]
#set_location_assignment PIN_D4 -to vga_out_b[1]
#set_location_assignment PIN_C3 -to vga_out_b[0]
#set_location_assignment PIN_J6 -to vga_out_g[5]
#set_location_assignment PIN_L8 -to vga_out_g[4]
#set_location_assignment PIN_K8 -to vga_out_g[3]
#set_location_assignment PIN_F7 -to vga_out_g[2]
#set_location_assignment PIN_G5 -to vga_out_g[1]
#set_location_assignment PIN_F5 -to vga_out_g[0]
#set_location_assignment PIN_L6 -to vga_out_hs
#set_location_assignment PIN_L4 -to vga_out_r[4]
#set_location_assignment PIN_L3 -to vga_out_r[3]
#set_location_assignment PIN_L7 -to vga_out_r[2]
#set_location_assignment PIN_K5 -to vga_out_r[1]
#set_location_assignment PIN_K6 -to vga_out_r[0]
#set_location_assignment PIN_N3 -to vga_out_vs

#cmos an5640 module  摄像头
#set_location_assignment PIN_C3 -to cmos_db[7]
#set_location_assignment PIN_E5 -to cmos_db[6]
#set_location_assignment PIN_F2 -to cmos_db[5]
#set_location_assignment PIN_F3 -to cmos_db[4]
#set_location_assignment PIN_M1 -to cmos_db[3]
#set_location_assignment PIN_D4 -to cmos_db[2]
#set_location_assignment PIN_G5 -to cmos_db[1]
#set_location_assignment PIN_F5 -to cmos_db[0] 
#set_location_assignment PIN_D1 -to cmos_href
#set_location_assignment PIN_D5 -to cmos_pclk 
#set_location_assignment PIN_C6 -to cmos_scl 
#set_location_assignment PIN_D6 -to cmos_sda 
#set_location_assignment PIN_F6 -to cmos_vsync 
#set_location_assignment PIN_D3 -to cmos_xclk 
#set_location_assignment PIN_F1 -to cmos_rst_n
#set_location_assignment PIN_G2 -to cmos_pwdn

#lcd an430 J2
#set_location_assignment PIN_J11 -to lcd_b[7]
#set_location_assignment PIN_G16 -to lcd_b[6]
#set_location_assignment PIN_K10 -to lcd_b[5]
#set_location_assignment PIN_K9 -to lcd_b[4]
#set_location_assignment PIN_G11 -to lcd_b[3]
#set_location_assignment PIN_F14 -to lcd_b[2]
#set_location_assignment PIN_F13 -to lcd_b[1]
#set_location_assignment PIN_F11 -to lcd_b[0]
#set_location_assignment PIN_J12 -to lcd_dclk
#set_location_assignment PIN_K11 -to lcd_de
#set_location_assignment PIN_D14 -to lcd_g[7]
#set_location_assignment PIN_F10 -to lcd_g[6]
#set_location_assignment PIN_C14 -to lcd_g[5]
#set_location_assignment PIN_E11 -to lcd_g[4]
#set_location_assignment PIN_D12 -to lcd_g[3]
#set_location_assignment PIN_D11 -to lcd_g[2]
#set_location_assignment PIN_C11 -to lcd_g[1]
#set_location_assignment PIN_E10 -to lcd_g[0]
#set_location_assignment PIN_J13 -to lcd_hs
#set_location_assignment PIN_D9 -to lcd_r[7]
#set_location_assignment PIN_C9 -to lcd_r[6]
#set_location_assignment PIN_E9 -to lcd_r[5]
#set_location_assignment PIN_F9 -to lcd_r[4]
#set_location_assignment PIN_F7 -to lcd_r[3]
#set_location_assignment PIN_E8 -to lcd_r[2]
#set_location_assignment PIN_D8 -to lcd_r[1]
#set_location_assignment PIN_E7 -to lcd_r[0]
#set_location_assignment PIN_J14 -to lcd_vs


# 编译
#execute_flow -compile

