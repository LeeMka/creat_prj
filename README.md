# creat_prj
  * @Description: 	1、通过修改“创建你的工程文件夹 .bat”文本内容来改变到你所操作的工程路径
 * 2、通过修改tb文件夹下的“点我仿真.bat”来修改设计文件的名称以便modelsim执行
 * 3、修改prj文件夹下的“make_prj.bat”来修改设计模块的名称以及顶层
 * 4、通过1来创建quartus基本工程文件及其子文件夹、通过2直接打开modelsim无需与quartus联合仿真
 * 打开、通过3直接进行全套流程（自动添加设计文件），最后生成比特流文件。
  * 通过点击创建工程。在设计verilog文件完成后，点击tb文件夹中的.bat文件运行仿真，
 * 确认功能无误后点击prj中的.bat文件，自动执行创建工程项目，设置器件型号，绑定引脚，编译文件。
    *
 * @Author: Areas
 * @Email: solitaryhuan@gmail.com
 * @Date: 2023-04-04 10:53:07
 * @LastEditTime: 2023-04-04 15:24:38
 * @Requare:需要windows的环境变量path中含有quartus和modelsim
 *          quartus版本为Quartus (Quartus Prime 18.1) Standard Edition
 *          modelsim版本为ModelSim - Intel FPGA Starter Edition 10.5b (Quartus Prime 18.1)
 *          FPGA板卡型号为EP4CE6F17C
 *    其中的exampl文件夹可以包含doc\ip\rtl\tb文件夹  （exampl文件夹是为了便于复制）
 *    而create_prj.tcl  make_prj.bat 两个文件均在prj文件夹下 （creat_prj.tcl文件夹是对quartus进行操作 make_prj.bat则是使用批处理执行tcl脚本）
 *    start.do 和 点我仿真.bat 位于tb文件夹下。（这两个用于仿真使用）
 *    最后创建你的工程文件.bat 和example在同一目录下。
