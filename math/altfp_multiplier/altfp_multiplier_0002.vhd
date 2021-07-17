-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from altfp_multiplier_0002
-- VHDL created on Mon Apr 13 16:04:11 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity altfp_multiplier_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end altfp_multiplier_0002;

architecture normal of altfp_multiplier_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid7_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid8_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid9_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid10_fpMulTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid11_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid12_fpMulTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid14_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid18_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid18_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid21_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid28_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid32_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid35_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid35_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid36_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid40_fpMulTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid43_fpMulTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal biasInc_uid45_fpMulTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal signR_uid48_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid49_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid54_fpMulTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid54_fpMulTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid56_fpMulTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid56_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid57_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal sticky_uid60_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid62_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionConstant_uid63_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid65_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBitAndNormalizationOp_uid68_fpMulTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal fracRPreExc_uid70_fpMulTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid70_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid71_fpMulTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid72_fpMulTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid72_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid90_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid91_fpMulTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid92_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid95_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid95_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid100_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid100_fpMulTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid101_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid103_fpMulTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal eq1_uid113_excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid113_excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid114_excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid114_excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_uid116_expXIsMax_uid16_fpMulTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid116_expXIsMax_uid16_fpMulTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c1_uid119_expXIsMax_uid16_fpMulTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal eq1_uid120_expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid120_expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid121_expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid121_expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_uid123_fracXIsZero_uid17_fpMulTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid123_fracXIsZero_uid17_fpMulTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c1_uid126_fracXIsZero_uid17_fpMulTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal c1_uid126_fracXIsZero_uid17_fpMulTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c2_uid129_fracXIsZero_uid17_fpMulTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal c2_uid129_fracXIsZero_uid17_fpMulTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c3_uid132_fracXIsZero_uid17_fpMulTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal eq3_uid133_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid133_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid134_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid134_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid140_excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid140_excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid141_excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid141_excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid147_expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid147_expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid148_expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid148_expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid160_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid160_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid161_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid161_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid173_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid173_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid174_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid174_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid177_eq0_uid110_excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid177_eq0_uid110_excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid180_eq0_uid110_excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid180_eq0_uid110_excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid181_eq0_uid110_excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid181_eq0_uid110_excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid184_eq0_uid117_expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid184_eq0_uid117_expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid187_eq0_uid117_expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid187_eq0_uid117_expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid188_eq0_uid117_expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid188_eq0_uid117_expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid191_eq0_uid124_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid191_eq0_uid124_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid194_eq0_uid124_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid194_eq0_uid124_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid195_eq0_uid124_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid195_eq0_uid124_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid198_eq1_uid127_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid198_eq1_uid127_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid201_eq1_uid127_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid201_eq1_uid127_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid202_eq1_uid127_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid202_eq1_uid127_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid205_eq2_uid130_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid205_eq2_uid130_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid208_eq2_uid130_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid208_eq2_uid130_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid209_eq2_uid130_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid209_eq2_uid130_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid212_eq0_uid137_excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid212_eq0_uid137_excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid215_eq0_uid137_excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid215_eq0_uid137_excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid216_eq0_uid137_excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid216_eq0_uid137_excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid219_eq0_uid144_expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid219_eq0_uid144_expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid222_eq0_uid144_expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid222_eq0_uid144_expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid223_eq0_uid144_expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid223_eq0_uid144_expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid226_eq0_uid151_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid226_eq0_uid151_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid229_eq0_uid151_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid229_eq0_uid151_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid230_eq0_uid151_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid230_eq0_uid151_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid233_eq1_uid154_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid233_eq1_uid154_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid236_eq1_uid154_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid236_eq1_uid154_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid237_eq1_uid154_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid237_eq1_uid154_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid240_eq2_uid157_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid240_eq2_uid157_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid243_eq2_uid157_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid243_eq2_uid157_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid244_eq2_uid157_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid244_eq2_uid157_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid247_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid247_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid250_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid250_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid251_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid251_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid254_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid254_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid257_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid257_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid258_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid258_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid261_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid261_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid264_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid264_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid265_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid265_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expSum_uid44_fpMulTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid44_fpMulTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expSumMBias_uid46_fpMulTest_UpperBits_for_a_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (35 downto 0);
    signal expUdf_uid73_fpMulTest_UpperBits_for_a_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expUdf_uid73_fpMulTest_p1_of_3_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid73_fpMulTest_p1_of_3_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid73_fpMulTest_p1_of_3_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid73_fpMulTest_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_a : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_b : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_o : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_UpperBits_for_b_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expOvf_uid75_fpMulTest_p1_of_3_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid75_fpMulTest_p1_of_3_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid75_fpMulTest_p1_of_3_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid75_fpMulTest_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_a : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_b : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_o : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_reset : std_logic;
    type prodXY_uid105_prod_uid47_fpMulTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_a0 : prodXY_uid105_prod_uid47_fpMulTest_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of prodXY_uid105_prod_uid47_fpMulTest_cma_a0 : signal is true;
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_c0 : prodXY_uid105_prod_uid47_fpMulTest_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid105_prod_uid47_fpMulTest_cma_c0 : signal is true;
    type prodXY_uid105_prod_uid47_fpMulTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_p : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_u : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_w : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_x : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_y : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_s : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_qq : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_ena0 : std_logic;
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_ena1 : std_logic;
    signal z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal c0_uid109_excZ_x_uid15_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid109_excZ_x_uid15_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal y0_uid183_eq0_uid117_expXIsMax_uid16_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid183_eq0_uid117_expXIsMax_uid16_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal x0_uid175_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid175_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid210_eq0_uid137_excZ_y_uid29_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid210_eq0_uid137_excZ_y_uid29_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid176_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid176_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid189_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid189_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid196_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid196_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid203_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid203_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid224_eq0_uid151_fracXIsZero_uid31_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid224_eq0_uid151_fracXIsZero_uid31_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid231_eq1_uid154_fracXIsZero_uid31_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid231_eq1_uid154_fracXIsZero_uid31_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid238_eq2_uid157_fracXIsZero_uid31_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid238_eq2_uid157_fracXIsZero_uid31_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid245_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid245_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid252_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid252_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid259_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid259_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_prodXY_uid105_prod_uid47_fpMulTest_cma_q_1_q : STD_LOGIC_VECTOR (47 downto 0);
    signal redist3_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist8_fracRPostNorm_uid53_fpMulTest_p0_q_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist9_fracRPostNorm_uid53_fpMulTest_p0_q_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist10_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist12_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist13_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist14_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist15_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_f_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist16_expSum_uid44_fpMulTest_p2_of_2_q_10_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist17_expSum_uid44_fpMulTest_p1_of_2_q_10_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist18_expSum_uid44_fpMulTest_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist19_expSum_uid44_fpMulTest_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist20_eq3_uid173_stickyRangeComparator_uid59_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_and_lev0_uid161_fracXIsZero_uid31_fpMulTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_eq3_uid160_fracXIsZero_uid31_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_and_lev0_uid148_expXIsMax_uid30_fpMulTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_and_lev0_uid134_fracXIsZero_uid17_fpMulTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_eq3_uid133_fracXIsZero_uid17_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_signRPostExc_uid102_fpMulTest_q_30_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_expRPostExc_uid100_fpMulTest_q_29_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist34_fracRPostExc_uid95_fpMulTest_q_29_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist35_expRPreExc_uid72_fpMulTest_b_5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist36_fracRPreExc_uid70_fpMulTest_b_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist37_stickyRange_uid54_fpMulTest_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist38_normalizeBit_uid49_fpMulTest_b_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_signR_uid48_fpMulTest_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_excN_y_uid34_fpMulTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_excI_y_uid33_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_excN_x_uid20_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_excI_x_uid19_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- cstZeroWF_uid11_fpMulTest(CONSTANT,10)
    cstZeroWF_uid11_fpMulTest_q <= "00000000000000000000000";

    -- c3_uid132_fracXIsZero_uid17_fpMulTest(BITSELECT,131)
    c3_uid132_fracXIsZero_uid17_fpMulTest_b <= cstZeroWF_uid11_fpMulTest_q(22 downto 18);

    -- frac_x_uid14_fpMulTest(BITSELECT,13)@0
    frac_x_uid14_fpMulTest_b <= a(22 downto 0);

    -- z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,387)@0
    z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= frac_x_uid14_fpMulTest_b(5 downto 0);
    z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= frac_x_uid14_fpMulTest_b(11 downto 6);
    z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_d <= frac_x_uid14_fpMulTest_b(17 downto 12);
    z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_e <= frac_x_uid14_fpMulTest_b(22 downto 18);

    -- eq3_uid133_fracXIsZero_uid17_fpMulTest(LOGICAL,132)@0 + 1
    eq3_uid133_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_e = c3_uid132_fracXIsZero_uid17_fpMulTest_b ELSE "0";
    eq3_uid133_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid133_fracXIsZero_uid17_fpMulTest_qi, xout => eq3_uid133_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- redist27_eq3_uid133_fracXIsZero_uid17_fpMulTest_q_2(DELAY,435)
    redist27_eq3_uid133_fracXIsZero_uid17_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid133_fracXIsZero_uid17_fpMulTest_q, xout => redist27_eq3_uid133_fracXIsZero_uid17_fpMulTest_q_2_q, clk => clk, aclr => areset );

    -- c2_uid129_fracXIsZero_uid17_fpMulTest(BITSELECT,128)
    c2_uid129_fracXIsZero_uid17_fpMulTest_in <= cstZeroWF_uid11_fpMulTest_q(17 downto 0);
    c2_uid129_fracXIsZero_uid17_fpMulTest_b <= c2_uid129_fracXIsZero_uid17_fpMulTest_in(17 downto 12);

    -- y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,393)
    y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= c2_uid129_fracXIsZero_uid17_fpMulTest_b(2 downto 0);
    y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= c2_uid129_fracXIsZero_uid17_fpMulTest_b(5 downto 3);

    -- x0_uid203_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,401)@0
    x0_uid203_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_d(2 downto 0);
    x0_uid203_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid208_eq2_uid130_fracXIsZero_uid17_fpMulTest(LOGICAL,207)@0 + 1
    eq1_uid208_eq2_uid130_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN x0_uid203_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_c = y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid208_eq2_uid130_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid208_eq2_uid130_fracXIsZero_uid17_fpMulTest_qi, xout => eq1_uid208_eq2_uid130_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid205_eq2_uid130_fracXIsZero_uid17_fpMulTest(LOGICAL,204)@0 + 1
    eq0_uid205_eq2_uid130_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN x0_uid203_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_b = y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid205_eq2_uid130_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid205_eq2_uid130_fracXIsZero_uid17_fpMulTest_qi, xout => eq0_uid205_eq2_uid130_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid209_eq2_uid130_fracXIsZero_uid17_fpMulTest(LOGICAL,208)@1 + 1
    andEq_uid209_eq2_uid130_fracXIsZero_uid17_fpMulTest_qi <= eq0_uid205_eq2_uid130_fracXIsZero_uid17_fpMulTest_q and eq1_uid208_eq2_uid130_fracXIsZero_uid17_fpMulTest_q;
    andEq_uid209_eq2_uid130_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid209_eq2_uid130_fracXIsZero_uid17_fpMulTest_qi, xout => andEq_uid209_eq2_uid130_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- c1_uid126_fracXIsZero_uid17_fpMulTest(BITSELECT,125)
    c1_uid126_fracXIsZero_uid17_fpMulTest_in <= cstZeroWF_uid11_fpMulTest_q(11 downto 0);
    c1_uid126_fracXIsZero_uid17_fpMulTest_b <= c1_uid126_fracXIsZero_uid17_fpMulTest_in(11 downto 6);

    -- y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,392)
    y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= c1_uid126_fracXIsZero_uid17_fpMulTest_b(2 downto 0);
    y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= c1_uid126_fracXIsZero_uid17_fpMulTest_b(5 downto 3);

    -- x0_uid196_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,400)@0
    x0_uid196_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_c(2 downto 0);
    x0_uid196_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid201_eq1_uid127_fracXIsZero_uid17_fpMulTest(LOGICAL,200)@0 + 1
    eq1_uid201_eq1_uid127_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN x0_uid196_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_c = y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid201_eq1_uid127_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid201_eq1_uid127_fracXIsZero_uid17_fpMulTest_qi, xout => eq1_uid201_eq1_uid127_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid198_eq1_uid127_fracXIsZero_uid17_fpMulTest(LOGICAL,197)@0 + 1
    eq0_uid198_eq1_uid127_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN x0_uid196_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_b = y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid198_eq1_uid127_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid198_eq1_uid127_fracXIsZero_uid17_fpMulTest_qi, xout => eq0_uid198_eq1_uid127_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid202_eq1_uid127_fracXIsZero_uid17_fpMulTest(LOGICAL,201)@1 + 1
    andEq_uid202_eq1_uid127_fracXIsZero_uid17_fpMulTest_qi <= eq0_uid198_eq1_uid127_fracXIsZero_uid17_fpMulTest_q and eq1_uid201_eq1_uid127_fracXIsZero_uid17_fpMulTest_q;
    andEq_uid202_eq1_uid127_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid202_eq1_uid127_fracXIsZero_uid17_fpMulTest_qi, xout => andEq_uid202_eq1_uid127_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- c0_uid123_fracXIsZero_uid17_fpMulTest(BITSELECT,122)
    c0_uid123_fracXIsZero_uid17_fpMulTest_in <= cstZeroWF_uid11_fpMulTest_q(5 downto 0);
    c0_uid123_fracXIsZero_uid17_fpMulTest_b <= c0_uid123_fracXIsZero_uid17_fpMulTest_in(5 downto 0);

    -- y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,391)
    y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= c0_uid123_fracXIsZero_uid17_fpMulTest_b(2 downto 0);
    y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= c0_uid123_fracXIsZero_uid17_fpMulTest_b(5 downto 3);

    -- x0_uid189_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,399)@0
    x0_uid189_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_b(2 downto 0);
    x0_uid189_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= z0_uid122_fracXIsZero_uid17_fpMulTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid194_eq0_uid124_fracXIsZero_uid17_fpMulTest(LOGICAL,193)@0 + 1
    eq1_uid194_eq0_uid124_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN x0_uid189_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_c = y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid194_eq0_uid124_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid194_eq0_uid124_fracXIsZero_uid17_fpMulTest_qi, xout => eq1_uid194_eq0_uid124_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid191_eq0_uid124_fracXIsZero_uid17_fpMulTest(LOGICAL,190)@0 + 1
    eq0_uid191_eq0_uid124_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN x0_uid189_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_b = y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid191_eq0_uid124_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid191_eq0_uid124_fracXIsZero_uid17_fpMulTest_qi, xout => eq0_uid191_eq0_uid124_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid195_eq0_uid124_fracXIsZero_uid17_fpMulTest(LOGICAL,194)@1 + 1
    andEq_uid195_eq0_uid124_fracXIsZero_uid17_fpMulTest_qi <= eq0_uid191_eq0_uid124_fracXIsZero_uid17_fpMulTest_q and eq1_uid194_eq0_uid124_fracXIsZero_uid17_fpMulTest_q;
    andEq_uid195_eq0_uid124_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid195_eq0_uid124_fracXIsZero_uid17_fpMulTest_qi, xout => andEq_uid195_eq0_uid124_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid134_fracXIsZero_uid17_fpMulTest(LOGICAL,133)@2 + 1
    and_lev0_uid134_fracXIsZero_uid17_fpMulTest_qi <= andEq_uid195_eq0_uid124_fracXIsZero_uid17_fpMulTest_q and andEq_uid202_eq1_uid127_fracXIsZero_uid17_fpMulTest_q and andEq_uid209_eq2_uid130_fracXIsZero_uid17_fpMulTest_q and redist27_eq3_uid133_fracXIsZero_uid17_fpMulTest_q_2_q;
    and_lev0_uid134_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid134_fracXIsZero_uid17_fpMulTest_qi, xout => and_lev0_uid134_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- redist26_and_lev0_uid134_fracXIsZero_uid17_fpMulTest_q_12(DELAY,434)
    redist26_and_lev0_uid134_fracXIsZero_uid17_fpMulTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid134_fracXIsZero_uid17_fpMulTest_q, xout => redist26_and_lev0_uid134_fracXIsZero_uid17_fpMulTest_q_12_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid10_fpMulTest(CONSTANT,9)
    cstAllOWE_uid10_fpMulTest_q <= "11111111";

    -- c1_uid119_expXIsMax_uid16_fpMulTest(BITSELECT,118)
    c1_uid119_expXIsMax_uid16_fpMulTest_b <= cstAllOWE_uid10_fpMulTest_q(7 downto 6);

    -- expX_uid6_fpMulTest(BITSELECT,5)@0
    expX_uid6_fpMulTest_b <= a(30 downto 23);

    -- z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select(BITSELECT,384)@0
    z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_b <= expX_uid6_fpMulTest_b(5 downto 0);
    z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_c <= expX_uid6_fpMulTest_b(7 downto 6);

    -- redist1_z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_c_1(DELAY,409)
    redist1_z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_c, xout => redist1_z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- eq1_uid120_expXIsMax_uid16_fpMulTest(LOGICAL,119)@1 + 1
    eq1_uid120_expXIsMax_uid16_fpMulTest_qi <= "1" WHEN redist1_z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_c_1_q = c1_uid119_expXIsMax_uid16_fpMulTest_b ELSE "0";
    eq1_uid120_expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid120_expXIsMax_uid16_fpMulTest_qi, xout => eq1_uid120_expXIsMax_uid16_fpMulTest_q, clk => clk, aclr => areset );

    -- c0_uid116_expXIsMax_uid16_fpMulTest(BITSELECT,115)
    c0_uid116_expXIsMax_uid16_fpMulTest_in <= cstAllOWE_uid10_fpMulTest_q(5 downto 0);
    c0_uid116_expXIsMax_uid16_fpMulTest_b <= c0_uid116_expXIsMax_uid16_fpMulTest_in(5 downto 0);

    -- y0_uid183_eq0_uid117_expXIsMax_uid16_fpMulTest_merged_bit_select(BITSELECT,390)
    y0_uid183_eq0_uid117_expXIsMax_uid16_fpMulTest_merged_bit_select_b <= c0_uid116_expXIsMax_uid16_fpMulTest_b(2 downto 0);
    y0_uid183_eq0_uid117_expXIsMax_uid16_fpMulTest_merged_bit_select_c <= c0_uid116_expXIsMax_uid16_fpMulTest_b(5 downto 3);

    -- x0_uid175_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select(BITSELECT,396)@0
    x0_uid175_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_b <= z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_b(2 downto 0);
    x0_uid175_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_c <= z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid187_eq0_uid117_expXIsMax_uid16_fpMulTest(LOGICAL,186)@0 + 1
    eq1_uid187_eq0_uid117_expXIsMax_uid16_fpMulTest_qi <= "1" WHEN x0_uid175_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_c = y0_uid183_eq0_uid117_expXIsMax_uid16_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid187_eq0_uid117_expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid187_eq0_uid117_expXIsMax_uid16_fpMulTest_qi, xout => eq1_uid187_eq0_uid117_expXIsMax_uid16_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid184_eq0_uid117_expXIsMax_uid16_fpMulTest(LOGICAL,183)@0 + 1
    eq0_uid184_eq0_uid117_expXIsMax_uid16_fpMulTest_qi <= "1" WHEN x0_uid175_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_b = y0_uid183_eq0_uid117_expXIsMax_uid16_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid184_eq0_uid117_expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid184_eq0_uid117_expXIsMax_uid16_fpMulTest_qi, xout => eq0_uid184_eq0_uid117_expXIsMax_uid16_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid188_eq0_uid117_expXIsMax_uid16_fpMulTest(LOGICAL,187)@1 + 1
    andEq_uid188_eq0_uid117_expXIsMax_uid16_fpMulTest_qi <= eq0_uid184_eq0_uid117_expXIsMax_uid16_fpMulTest_q and eq1_uid187_eq0_uid117_expXIsMax_uid16_fpMulTest_q;
    andEq_uid188_eq0_uid117_expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid188_eq0_uid117_expXIsMax_uid16_fpMulTest_qi, xout => andEq_uid188_eq0_uid117_expXIsMax_uid16_fpMulTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid121_expXIsMax_uid16_fpMulTest(LOGICAL,120)@2 + 1
    and_lev0_uid121_expXIsMax_uid16_fpMulTest_qi <= andEq_uid188_eq0_uid117_expXIsMax_uid16_fpMulTest_q and eq1_uid120_expXIsMax_uid16_fpMulTest_q;
    and_lev0_uid121_expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid121_expXIsMax_uid16_fpMulTest_qi, xout => and_lev0_uid121_expXIsMax_uid16_fpMulTest_q, clk => clk, aclr => areset );

    -- redist28_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_12(DELAY,436)
    redist28_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid121_expXIsMax_uid16_fpMulTest_q, xout => redist28_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_12_q, clk => clk, aclr => areset );

    -- excI_x_uid19_fpMulTest(LOGICAL,18)@14 + 1
    excI_x_uid19_fpMulTest_qi <= redist28_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_12_q and redist26_and_lev0_uid134_fracXIsZero_uid17_fpMulTest_q_12_q;
    excI_x_uid19_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid19_fpMulTest_qi, xout => excI_x_uid19_fpMulTest_q, clk => clk, aclr => areset );

    -- cstAllZWE_uid12_fpMulTest(CONSTANT,11)
    cstAllZWE_uid12_fpMulTest_q <= "00000000";

    -- c0_uid109_excZ_x_uid15_fpMulTest_merged_bit_select(BITSELECT,386)
    c0_uid109_excZ_x_uid15_fpMulTest_merged_bit_select_b <= cstAllZWE_uid12_fpMulTest_q(5 downto 0);
    c0_uid109_excZ_x_uid15_fpMulTest_merged_bit_select_c <= cstAllZWE_uid12_fpMulTest_q(7 downto 6);

    -- expY_uid7_fpMulTest(BITSELECT,6)@0
    expY_uid7_fpMulTest_b <= b(30 downto 23);

    -- z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select(BITSELECT,385)@0
    z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_b <= expY_uid7_fpMulTest_b(5 downto 0);
    z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_c <= expY_uid7_fpMulTest_b(7 downto 6);

    -- redist0_z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_c_1(DELAY,408)
    redist0_z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_c, xout => redist0_z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- eq1_uid140_excZ_y_uid29_fpMulTest(LOGICAL,139)@1 + 1
    eq1_uid140_excZ_y_uid29_fpMulTest_qi <= "1" WHEN redist0_z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_c_1_q = c0_uid109_excZ_x_uid15_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid140_excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid140_excZ_y_uid29_fpMulTest_qi, xout => eq1_uid140_excZ_y_uid29_fpMulTest_q, clk => clk, aclr => areset );

    -- y0_uid176_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select(BITSELECT,398)
    y0_uid176_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_b <= c0_uid109_excZ_x_uid15_fpMulTest_merged_bit_select_b(2 downto 0);
    y0_uid176_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_c <= c0_uid109_excZ_x_uid15_fpMulTest_merged_bit_select_b(5 downto 3);

    -- x0_uid210_eq0_uid137_excZ_y_uid29_fpMulTest_merged_bit_select(BITSELECT,397)@0
    x0_uid210_eq0_uid137_excZ_y_uid29_fpMulTest_merged_bit_select_b <= z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_b(2 downto 0);
    x0_uid210_eq0_uid137_excZ_y_uid29_fpMulTest_merged_bit_select_c <= z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid215_eq0_uid137_excZ_y_uid29_fpMulTest(LOGICAL,214)@0 + 1
    eq1_uid215_eq0_uid137_excZ_y_uid29_fpMulTest_qi <= "1" WHEN x0_uid210_eq0_uid137_excZ_y_uid29_fpMulTest_merged_bit_select_c = y0_uid176_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid215_eq0_uid137_excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid215_eq0_uid137_excZ_y_uid29_fpMulTest_qi, xout => eq1_uid215_eq0_uid137_excZ_y_uid29_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid212_eq0_uid137_excZ_y_uid29_fpMulTest(LOGICAL,211)@0 + 1
    eq0_uid212_eq0_uid137_excZ_y_uid29_fpMulTest_qi <= "1" WHEN x0_uid210_eq0_uid137_excZ_y_uid29_fpMulTest_merged_bit_select_b = y0_uid176_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid212_eq0_uid137_excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid212_eq0_uid137_excZ_y_uid29_fpMulTest_qi, xout => eq0_uid212_eq0_uid137_excZ_y_uid29_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid216_eq0_uid137_excZ_y_uid29_fpMulTest(LOGICAL,215)@1 + 1
    andEq_uid216_eq0_uid137_excZ_y_uid29_fpMulTest_qi <= eq0_uid212_eq0_uid137_excZ_y_uid29_fpMulTest_q and eq1_uid215_eq0_uid137_excZ_y_uid29_fpMulTest_q;
    andEq_uid216_eq0_uid137_excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid216_eq0_uid137_excZ_y_uid29_fpMulTest_qi, xout => andEq_uid216_eq0_uid137_excZ_y_uid29_fpMulTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid141_excZ_y_uid29_fpMulTest(LOGICAL,140)@2 + 1
    and_lev0_uid141_excZ_y_uid29_fpMulTest_qi <= andEq_uid216_eq0_uid137_excZ_y_uid29_fpMulTest_q and eq1_uid140_excZ_y_uid29_fpMulTest_q;
    and_lev0_uid141_excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid141_excZ_y_uid29_fpMulTest_qi, xout => and_lev0_uid141_excZ_y_uid29_fpMulTest_q, clk => clk, aclr => areset );

    -- redist24_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_13(DELAY,432)
    redist24_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid141_excZ_y_uid29_fpMulTest_q, xout => redist24_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_13_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid86_fpMulTest(LOGICAL,85)@15 + 1
    excYZAndExcXI_uid86_fpMulTest_qi <= redist24_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_13_q and excI_x_uid19_fpMulTest_q;
    excYZAndExcXI_uid86_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYZAndExcXI_uid86_fpMulTest_qi, xout => excYZAndExcXI_uid86_fpMulTest_q, clk => clk, aclr => areset );

    -- frac_y_uid28_fpMulTest(BITSELECT,27)@0
    frac_y_uid28_fpMulTest_b <= b(22 downto 0);

    -- z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select(BITSELECT,388)@0
    z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_b <= frac_y_uid28_fpMulTest_b(5 downto 0);
    z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_c <= frac_y_uid28_fpMulTest_b(11 downto 6);
    z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_d <= frac_y_uid28_fpMulTest_b(17 downto 12);
    z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_e <= frac_y_uid28_fpMulTest_b(22 downto 18);

    -- eq3_uid160_fracXIsZero_uid31_fpMulTest(LOGICAL,159)@0 + 1
    eq3_uid160_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_e = c3_uid132_fracXIsZero_uid17_fpMulTest_b ELSE "0";
    eq3_uid160_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid160_fracXIsZero_uid31_fpMulTest_qi, xout => eq3_uid160_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- redist22_eq3_uid160_fracXIsZero_uid31_fpMulTest_q_2(DELAY,430)
    redist22_eq3_uid160_fracXIsZero_uid31_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid160_fracXIsZero_uid31_fpMulTest_q, xout => redist22_eq3_uid160_fracXIsZero_uid31_fpMulTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid238_eq2_uid157_fracXIsZero_uid31_fpMulTest_merged_bit_select(BITSELECT,404)@0
    x0_uid238_eq2_uid157_fracXIsZero_uid31_fpMulTest_merged_bit_select_b <= z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_d(2 downto 0);
    x0_uid238_eq2_uid157_fracXIsZero_uid31_fpMulTest_merged_bit_select_c <= z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid243_eq2_uid157_fracXIsZero_uid31_fpMulTest(LOGICAL,242)@0 + 1
    eq1_uid243_eq2_uid157_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN x0_uid238_eq2_uid157_fracXIsZero_uid31_fpMulTest_merged_bit_select_c = y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid243_eq2_uid157_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid243_eq2_uid157_fracXIsZero_uid31_fpMulTest_qi, xout => eq1_uid243_eq2_uid157_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid240_eq2_uid157_fracXIsZero_uid31_fpMulTest(LOGICAL,239)@0 + 1
    eq0_uid240_eq2_uid157_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN x0_uid238_eq2_uid157_fracXIsZero_uid31_fpMulTest_merged_bit_select_b = y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid240_eq2_uid157_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid240_eq2_uid157_fracXIsZero_uid31_fpMulTest_qi, xout => eq0_uid240_eq2_uid157_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid244_eq2_uid157_fracXIsZero_uid31_fpMulTest(LOGICAL,243)@1 + 1
    andEq_uid244_eq2_uid157_fracXIsZero_uid31_fpMulTest_qi <= eq0_uid240_eq2_uid157_fracXIsZero_uid31_fpMulTest_q and eq1_uid243_eq2_uid157_fracXIsZero_uid31_fpMulTest_q;
    andEq_uid244_eq2_uid157_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid244_eq2_uid157_fracXIsZero_uid31_fpMulTest_qi, xout => andEq_uid244_eq2_uid157_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- x0_uid231_eq1_uid154_fracXIsZero_uid31_fpMulTest_merged_bit_select(BITSELECT,403)@0
    x0_uid231_eq1_uid154_fracXIsZero_uid31_fpMulTest_merged_bit_select_b <= z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_c(2 downto 0);
    x0_uid231_eq1_uid154_fracXIsZero_uid31_fpMulTest_merged_bit_select_c <= z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid236_eq1_uid154_fracXIsZero_uid31_fpMulTest(LOGICAL,235)@0 + 1
    eq1_uid236_eq1_uid154_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN x0_uid231_eq1_uid154_fracXIsZero_uid31_fpMulTest_merged_bit_select_c = y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid236_eq1_uid154_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid236_eq1_uid154_fracXIsZero_uid31_fpMulTest_qi, xout => eq1_uid236_eq1_uid154_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid233_eq1_uid154_fracXIsZero_uid31_fpMulTest(LOGICAL,232)@0 + 1
    eq0_uid233_eq1_uid154_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN x0_uid231_eq1_uid154_fracXIsZero_uid31_fpMulTest_merged_bit_select_b = y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid233_eq1_uid154_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid233_eq1_uid154_fracXIsZero_uid31_fpMulTest_qi, xout => eq0_uid233_eq1_uid154_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid237_eq1_uid154_fracXIsZero_uid31_fpMulTest(LOGICAL,236)@1 + 1
    andEq_uid237_eq1_uid154_fracXIsZero_uid31_fpMulTest_qi <= eq0_uid233_eq1_uid154_fracXIsZero_uid31_fpMulTest_q and eq1_uid236_eq1_uid154_fracXIsZero_uid31_fpMulTest_q;
    andEq_uid237_eq1_uid154_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid237_eq1_uid154_fracXIsZero_uid31_fpMulTest_qi, xout => andEq_uid237_eq1_uid154_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- x0_uid224_eq0_uid151_fracXIsZero_uid31_fpMulTest_merged_bit_select(BITSELECT,402)@0
    x0_uid224_eq0_uid151_fracXIsZero_uid31_fpMulTest_merged_bit_select_b <= z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_b(2 downto 0);
    x0_uid224_eq0_uid151_fracXIsZero_uid31_fpMulTest_merged_bit_select_c <= z0_uid149_fracXIsZero_uid31_fpMulTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid229_eq0_uid151_fracXIsZero_uid31_fpMulTest(LOGICAL,228)@0 + 1
    eq1_uid229_eq0_uid151_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN x0_uid224_eq0_uid151_fracXIsZero_uid31_fpMulTest_merged_bit_select_c = y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid229_eq0_uid151_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid229_eq0_uid151_fracXIsZero_uid31_fpMulTest_qi, xout => eq1_uid229_eq0_uid151_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid226_eq0_uid151_fracXIsZero_uid31_fpMulTest(LOGICAL,225)@0 + 1
    eq0_uid226_eq0_uid151_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN x0_uid224_eq0_uid151_fracXIsZero_uid31_fpMulTest_merged_bit_select_b = y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid226_eq0_uid151_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid226_eq0_uid151_fracXIsZero_uid31_fpMulTest_qi, xout => eq0_uid226_eq0_uid151_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid230_eq0_uid151_fracXIsZero_uid31_fpMulTest(LOGICAL,229)@1 + 1
    andEq_uid230_eq0_uid151_fracXIsZero_uid31_fpMulTest_qi <= eq0_uid226_eq0_uid151_fracXIsZero_uid31_fpMulTest_q and eq1_uid229_eq0_uid151_fracXIsZero_uid31_fpMulTest_q;
    andEq_uid230_eq0_uid151_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid230_eq0_uid151_fracXIsZero_uid31_fpMulTest_qi, xout => andEq_uid230_eq0_uid151_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid161_fracXIsZero_uid31_fpMulTest(LOGICAL,160)@2 + 1
    and_lev0_uid161_fracXIsZero_uid31_fpMulTest_qi <= andEq_uid230_eq0_uid151_fracXIsZero_uid31_fpMulTest_q and andEq_uid237_eq1_uid154_fracXIsZero_uid31_fpMulTest_q and andEq_uid244_eq2_uid157_fracXIsZero_uid31_fpMulTest_q and redist22_eq3_uid160_fracXIsZero_uid31_fpMulTest_q_2_q;
    and_lev0_uid161_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid161_fracXIsZero_uid31_fpMulTest_qi, xout => and_lev0_uid161_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- redist21_and_lev0_uid161_fracXIsZero_uid31_fpMulTest_q_12(DELAY,429)
    redist21_and_lev0_uid161_fracXIsZero_uid31_fpMulTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid161_fracXIsZero_uid31_fpMulTest_q, xout => redist21_and_lev0_uid161_fracXIsZero_uid31_fpMulTest_q_12_q, clk => clk, aclr => areset );

    -- eq1_uid147_expXIsMax_uid30_fpMulTest(LOGICAL,146)@1 + 1
    eq1_uid147_expXIsMax_uid30_fpMulTest_qi <= "1" WHEN redist0_z0_uid135_excZ_y_uid29_fpMulTest_merged_bit_select_c_1_q = c1_uid119_expXIsMax_uid16_fpMulTest_b ELSE "0";
    eq1_uid147_expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid147_expXIsMax_uid30_fpMulTest_qi, xout => eq1_uid147_expXIsMax_uid30_fpMulTest_q, clk => clk, aclr => areset );

    -- eq1_uid222_eq0_uid144_expXIsMax_uid30_fpMulTest(LOGICAL,221)@0 + 1
    eq1_uid222_eq0_uid144_expXIsMax_uid30_fpMulTest_qi <= "1" WHEN x0_uid210_eq0_uid137_excZ_y_uid29_fpMulTest_merged_bit_select_c = y0_uid183_eq0_uid117_expXIsMax_uid16_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid222_eq0_uid144_expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid222_eq0_uid144_expXIsMax_uid30_fpMulTest_qi, xout => eq1_uid222_eq0_uid144_expXIsMax_uid30_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid219_eq0_uid144_expXIsMax_uid30_fpMulTest(LOGICAL,218)@0 + 1
    eq0_uid219_eq0_uid144_expXIsMax_uid30_fpMulTest_qi <= "1" WHEN x0_uid210_eq0_uid137_excZ_y_uid29_fpMulTest_merged_bit_select_b = y0_uid183_eq0_uid117_expXIsMax_uid16_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid219_eq0_uid144_expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid219_eq0_uid144_expXIsMax_uid30_fpMulTest_qi, xout => eq0_uid219_eq0_uid144_expXIsMax_uid30_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid223_eq0_uid144_expXIsMax_uid30_fpMulTest(LOGICAL,222)@1 + 1
    andEq_uid223_eq0_uid144_expXIsMax_uid30_fpMulTest_qi <= eq0_uid219_eq0_uid144_expXIsMax_uid30_fpMulTest_q and eq1_uid222_eq0_uid144_expXIsMax_uid30_fpMulTest_q;
    andEq_uid223_eq0_uid144_expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid223_eq0_uid144_expXIsMax_uid30_fpMulTest_qi, xout => andEq_uid223_eq0_uid144_expXIsMax_uid30_fpMulTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid148_expXIsMax_uid30_fpMulTest(LOGICAL,147)@2 + 1
    and_lev0_uid148_expXIsMax_uid30_fpMulTest_qi <= andEq_uid223_eq0_uid144_expXIsMax_uid30_fpMulTest_q and eq1_uid147_expXIsMax_uid30_fpMulTest_q;
    and_lev0_uid148_expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid148_expXIsMax_uid30_fpMulTest_qi, xout => and_lev0_uid148_expXIsMax_uid30_fpMulTest_q, clk => clk, aclr => areset );

    -- redist23_and_lev0_uid148_expXIsMax_uid30_fpMulTest_q_12(DELAY,431)
    redist23_and_lev0_uid148_expXIsMax_uid30_fpMulTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid148_expXIsMax_uid30_fpMulTest_q, xout => redist23_and_lev0_uid148_expXIsMax_uid30_fpMulTest_q_12_q, clk => clk, aclr => areset );

    -- excI_y_uid33_fpMulTest(LOGICAL,32)@14 + 1
    excI_y_uid33_fpMulTest_qi <= redist23_and_lev0_uid148_expXIsMax_uid30_fpMulTest_q_12_q and redist21_and_lev0_uid161_fracXIsZero_uid31_fpMulTest_q_12_q;
    excI_y_uid33_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid33_fpMulTest_qi, xout => excI_y_uid33_fpMulTest_q, clk => clk, aclr => areset );

    -- eq1_uid113_excZ_x_uid15_fpMulTest(LOGICAL,112)@1 + 1
    eq1_uid113_excZ_x_uid15_fpMulTest_qi <= "1" WHEN redist1_z0_uid108_excZ_x_uid15_fpMulTest_merged_bit_select_c_1_q = c0_uid109_excZ_x_uid15_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid113_excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid113_excZ_x_uid15_fpMulTest_qi, xout => eq1_uid113_excZ_x_uid15_fpMulTest_q, clk => clk, aclr => areset );

    -- eq1_uid180_eq0_uid110_excZ_x_uid15_fpMulTest(LOGICAL,179)@0 + 1
    eq1_uid180_eq0_uid110_excZ_x_uid15_fpMulTest_qi <= "1" WHEN x0_uid175_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_c = y0_uid176_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid180_eq0_uid110_excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid180_eq0_uid110_excZ_x_uid15_fpMulTest_qi, xout => eq1_uid180_eq0_uid110_excZ_x_uid15_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid177_eq0_uid110_excZ_x_uid15_fpMulTest(LOGICAL,176)@0 + 1
    eq0_uid177_eq0_uid110_excZ_x_uid15_fpMulTest_qi <= "1" WHEN x0_uid175_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_b = y0_uid176_eq0_uid110_excZ_x_uid15_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid177_eq0_uid110_excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid177_eq0_uid110_excZ_x_uid15_fpMulTest_qi, xout => eq0_uid177_eq0_uid110_excZ_x_uid15_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid181_eq0_uid110_excZ_x_uid15_fpMulTest(LOGICAL,180)@1 + 1
    andEq_uid181_eq0_uid110_excZ_x_uid15_fpMulTest_qi <= eq0_uid177_eq0_uid110_excZ_x_uid15_fpMulTest_q and eq1_uid180_eq0_uid110_excZ_x_uid15_fpMulTest_q;
    andEq_uid181_eq0_uid110_excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid181_eq0_uid110_excZ_x_uid15_fpMulTest_qi, xout => andEq_uid181_eq0_uid110_excZ_x_uid15_fpMulTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid114_excZ_x_uid15_fpMulTest(LOGICAL,113)@2 + 1
    and_lev0_uid114_excZ_x_uid15_fpMulTest_qi <= andEq_uid181_eq0_uid110_excZ_x_uid15_fpMulTest_q and eq1_uid113_excZ_x_uid15_fpMulTest_q;
    and_lev0_uid114_excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid114_excZ_x_uid15_fpMulTest_qi, xout => and_lev0_uid114_excZ_x_uid15_fpMulTest_q, clk => clk, aclr => areset );

    -- redist30_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_13(DELAY,438)
    redist30_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid114_excZ_x_uid15_fpMulTest_q, xout => redist30_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_13_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid87_fpMulTest(LOGICAL,86)@15 + 1
    excXZAndExcYI_uid87_fpMulTest_qi <= redist30_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_13_q and excI_y_uid33_fpMulTest_q;
    excXZAndExcYI_uid87_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYI_uid87_fpMulTest_qi, xout => excXZAndExcYI_uid87_fpMulTest_q, clk => clk, aclr => areset );

    -- ZeroTimesInf_uid88_fpMulTest(LOGICAL,87)@16 + 1
    ZeroTimesInf_uid88_fpMulTest_qi <= excXZAndExcYI_uid87_fpMulTest_q or excYZAndExcXI_uid86_fpMulTest_q;
    ZeroTimesInf_uid88_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ZeroTimesInf_uid88_fpMulTest_qi, xout => ZeroTimesInf_uid88_fpMulTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid32_fpMulTest(LOGICAL,31)@14
    fracXIsNotZero_uid32_fpMulTest_q <= not (redist21_and_lev0_uid161_fracXIsZero_uid31_fpMulTest_q_12_q);

    -- excN_y_uid34_fpMulTest(LOGICAL,33)@14 + 1
    excN_y_uid34_fpMulTest_qi <= redist23_and_lev0_uid148_expXIsMax_uid30_fpMulTest_q_12_q and fracXIsNotZero_uid32_fpMulTest_q;
    excN_y_uid34_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_y_uid34_fpMulTest_qi, xout => excN_y_uid34_fpMulTest_q, clk => clk, aclr => areset );

    -- redist40_excN_y_uid34_fpMulTest_q_3(DELAY,448)
    redist40_excN_y_uid34_fpMulTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_y_uid34_fpMulTest_q, xout => redist40_excN_y_uid34_fpMulTest_q_3_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid18_fpMulTest(LOGICAL,17)@14 + 1
    fracXIsNotZero_uid18_fpMulTest_qi <= not (redist26_and_lev0_uid134_fracXIsZero_uid17_fpMulTest_q_12_q);
    fracXIsNotZero_uid18_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsNotZero_uid18_fpMulTest_qi, xout => fracXIsNotZero_uid18_fpMulTest_q, clk => clk, aclr => areset );

    -- redist29_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_13(DELAY,437)
    redist29_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist28_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_12_q, xout => redist29_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_13_q, clk => clk, aclr => areset );

    -- excN_x_uid20_fpMulTest(LOGICAL,19)@15 + 1
    excN_x_uid20_fpMulTest_qi <= redist29_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_13_q and fracXIsNotZero_uid18_fpMulTest_q;
    excN_x_uid20_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid20_fpMulTest_qi, xout => excN_x_uid20_fpMulTest_q, clk => clk, aclr => areset );

    -- redist42_excN_x_uid20_fpMulTest_q_2(DELAY,450)
    redist42_excN_x_uid20_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid20_fpMulTest_q, xout => redist42_excN_x_uid20_fpMulTest_q_2_q, clk => clk, aclr => areset );

    -- excRNaN_uid89_fpMulTest(LOGICAL,88)@17 + 1
    excRNaN_uid89_fpMulTest_qi <= redist42_excN_x_uid20_fpMulTest_q_2_q or redist40_excN_y_uid34_fpMulTest_q_3_q or ZeroTimesInf_uid88_fpMulTest_q;
    excRNaN_uid89_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid89_fpMulTest_qi, xout => excRNaN_uid89_fpMulTest_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid101_fpMulTest(LOGICAL,100)@18
    invExcRNaN_uid101_fpMulTest_q <= not (excRNaN_uid89_fpMulTest_q);

    -- signY_uid9_fpMulTest(BITSELECT,8)@0
    signY_uid9_fpMulTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid8_fpMulTest(BITSELECT,7)@0
    signX_uid8_fpMulTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- signR_uid48_fpMulTest(LOGICAL,47)@0 + 1
    signR_uid48_fpMulTest_qi <= signX_uid8_fpMulTest_b xor signY_uid9_fpMulTest_b;
    signR_uid48_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_qi, xout => signR_uid48_fpMulTest_q, clk => clk, aclr => areset );

    -- redist39_signR_uid48_fpMulTest_q_18(DELAY,447)
    redist39_signR_uid48_fpMulTest_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_q, xout => redist39_signR_uid48_fpMulTest_q_18_q, clk => clk, aclr => areset );

    -- signRPostExc_uid102_fpMulTest(LOGICAL,101)@18 + 1
    signRPostExc_uid102_fpMulTest_qi <= redist39_signR_uid48_fpMulTest_q_18_q and invExcRNaN_uid101_fpMulTest_q;
    signRPostExc_uid102_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid102_fpMulTest_qi, xout => signRPostExc_uid102_fpMulTest_q, clk => clk, aclr => areset );

    -- redist32_signRPostExc_uid102_fpMulTest_q_30(DELAY,440)
    redist32_signRPostExc_uid102_fpMulTest_q_30 : dspba_delay
    GENERIC MAP ( width => 1, depth => 29, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid102_fpMulTest_q, xout => redist32_signRPostExc_uid102_fpMulTest_q_30_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b(CONSTANT,288)
    expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b_q <= "0000000000";

    -- ofracY_uid43_fpMulTest(BITJOIN,42)@0
    ofracY_uid43_fpMulTest_q <= VCC_q & frac_y_uid28_fpMulTest_b;

    -- ofracX_uid40_fpMulTest(BITJOIN,39)@0
    ofracX_uid40_fpMulTest_q <= VCC_q & frac_x_uid14_fpMulTest_b;

    -- prodXY_uid105_prod_uid47_fpMulTest_cma(CHAINMULTADD,383)@0 + 2
    prodXY_uid105_prod_uid47_fpMulTest_cma_reset <= areset;
    prodXY_uid105_prod_uid47_fpMulTest_cma_ena0 <= '1';
    prodXY_uid105_prod_uid47_fpMulTest_cma_ena1 <= prodXY_uid105_prod_uid47_fpMulTest_cma_ena0;
    prodXY_uid105_prod_uid47_fpMulTest_cma_p(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_a0(0) * prodXY_uid105_prod_uid47_fpMulTest_cma_c0(0);
    prodXY_uid105_prod_uid47_fpMulTest_cma_u(0) <= RESIZE(prodXY_uid105_prod_uid47_fpMulTest_cma_p(0),48);
    prodXY_uid105_prod_uid47_fpMulTest_cma_w(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_u(0);
    prodXY_uid105_prod_uid47_fpMulTest_cma_x(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_w(0);
    prodXY_uid105_prod_uid47_fpMulTest_cma_y(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_x(0);
    prodXY_uid105_prod_uid47_fpMulTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_cma_a0 <= (others => (others => '0'));
            prodXY_uid105_prod_uid47_fpMulTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid105_prod_uid47_fpMulTest_cma_ena0 = '1') THEN
                prodXY_uid105_prod_uid47_fpMulTest_cma_a0(0) <= RESIZE(UNSIGNED(ofracX_uid40_fpMulTest_q),24);
                prodXY_uid105_prod_uid47_fpMulTest_cma_c0(0) <= RESIZE(UNSIGNED(ofracY_uid43_fpMulTest_q),24);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid105_prod_uid47_fpMulTest_cma_ena1 = '1') THEN
                prodXY_uid105_prod_uid47_fpMulTest_cma_s(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 48, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_cma_s(0)(47 downto 0)), xout => prodXY_uid105_prod_uid47_fpMulTest_cma_qq, clk => clk, aclr => areset );
    prodXY_uid105_prod_uid47_fpMulTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_cma_qq(47 downto 0));

    -- redist2_prodXY_uid105_prod_uid47_fpMulTest_cma_q_1(DELAY,410)
    redist2_prodXY_uid105_prod_uid47_fpMulTest_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 48, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_cma_q, xout => redist2_prodXY_uid105_prod_uid47_fpMulTest_cma_q_1_q, clk => clk, aclr => areset );

    -- normalizeBit_uid49_fpMulTest(BITSELECT,48)@3
    normalizeBit_uid49_fpMulTest_b <= STD_LOGIC_VECTOR(redist2_prodXY_uid105_prod_uid47_fpMulTest_cma_q_1_q(47 downto 47));

    -- redist38_normalizeBit_uid49_fpMulTest_b_5(DELAY,446)
    redist38_normalizeBit_uid49_fpMulTest_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => normalizeBit_uid49_fpMulTest_b, xout => redist38_normalizeBit_uid49_fpMulTest_b_5_q, clk => clk, aclr => areset );

    -- roundBitDetectionConstant_uid63_fpMulTest(CONSTANT,62)
    roundBitDetectionConstant_uid63_fpMulTest_q <= "010";

    -- fracRPostNormHigh_uid51_fpMulTest(BITSELECT,50)@3
    fracRPostNormHigh_uid51_fpMulTest_in <= redist2_prodXY_uid105_prod_uid47_fpMulTest_cma_q_1_q(46 downto 0);
    fracRPostNormHigh_uid51_fpMulTest_b <= fracRPostNormHigh_uid51_fpMulTest_in(46 downto 23);

    -- fracRPostNormLow_uid52_fpMulTest(BITSELECT,51)@3
    fracRPostNormLow_uid52_fpMulTest_in <= redist2_prodXY_uid105_prod_uid47_fpMulTest_cma_q_1_q(45 downto 0);
    fracRPostNormLow_uid52_fpMulTest_b <= fracRPostNormLow_uid52_fpMulTest_in(45 downto 22);

    -- fracRPostNorm_uid53_fpMulTest_p0(MUX,324)@3 + 1
    fracRPostNorm_uid53_fpMulTest_p0_s <= normalizeBit_uid49_fpMulTest_b;
    fracRPostNorm_uid53_fpMulTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p0_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p0_q <= fracRPostNormLow_uid52_fpMulTest_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p0_q <= fracRPostNormHigh_uid51_fpMulTest_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p0_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist8_fracRPostNorm_uid53_fpMulTest_p0_q_4(DELAY,416)
    redist8_fracRPostNorm_uid53_fpMulTest_p0_q_4 : dspba_delay
    GENERIC MAP ( width => 24, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p0_q, xout => redist8_fracRPostNorm_uid53_fpMulTest_p0_q_4_q, clk => clk, aclr => areset );

    -- fracRPostNorm1dto0_uid61_fpMulTest(BITSELECT,60)@7
    fracRPostNorm1dto0_uid61_fpMulTest_in <= redist8_fracRPostNorm_uid53_fpMulTest_p0_q_4_q(1 downto 0);
    fracRPostNorm1dto0_uid61_fpMulTest_b <= fracRPostNorm1dto0_uid61_fpMulTest_in(1 downto 0);

    -- extraStickyBitOfProd_uid55_fpMulTest(BITSELECT,54)@3
    extraStickyBitOfProd_uid55_fpMulTest_in <= STD_LOGIC_VECTOR(redist2_prodXY_uid105_prod_uid47_fpMulTest_cma_q_1_q(22 downto 0));
    extraStickyBitOfProd_uid55_fpMulTest_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid55_fpMulTest_in(22 downto 22));

    -- extraStickyBit_uid56_fpMulTest(MUX,55)@3 + 1
    extraStickyBit_uid56_fpMulTest_s <= normalizeBit_uid49_fpMulTest_b;
    extraStickyBit_uid56_fpMulTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            extraStickyBit_uid56_fpMulTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (extraStickyBit_uid56_fpMulTest_s) IS
                WHEN "0" => extraStickyBit_uid56_fpMulTest_q <= GND_q;
                WHEN "1" => extraStickyBit_uid56_fpMulTest_q <= extraStickyBitOfProd_uid55_fpMulTest_b;
                WHEN OTHERS => extraStickyBit_uid56_fpMulTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- stickyRange_uid54_fpMulTest(BITSELECT,53)@3
    stickyRange_uid54_fpMulTest_in <= redist2_prodXY_uid105_prod_uid47_fpMulTest_cma_q_1_q(21 downto 0);
    stickyRange_uid54_fpMulTest_b <= stickyRange_uid54_fpMulTest_in(21 downto 0);

    -- redist37_stickyRange_uid54_fpMulTest_b_1(DELAY,445)
    redist37_stickyRange_uid54_fpMulTest_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyRange_uid54_fpMulTest_b, xout => redist37_stickyRange_uid54_fpMulTest_b_1_q, clk => clk, aclr => areset );

    -- stickyExtendedRange_uid57_fpMulTest(BITJOIN,56)@4
    stickyExtendedRange_uid57_fpMulTest_q <= extraStickyBit_uid56_fpMulTest_q & redist37_stickyRange_uid54_fpMulTest_b_1_q;

    -- z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select(BITSELECT,389)@4
    z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b <= stickyExtendedRange_uid57_fpMulTest_q(5 downto 0);
    z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c <= stickyExtendedRange_uid57_fpMulTest_q(11 downto 6);
    z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_d <= stickyExtendedRange_uid57_fpMulTest_q(17 downto 12);
    z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_e <= stickyExtendedRange_uid57_fpMulTest_q(22 downto 18);

    -- eq3_uid173_stickyRangeComparator_uid59_fpMulTest(LOGICAL,172)@4 + 1
    eq3_uid173_stickyRangeComparator_uid59_fpMulTest_qi <= "1" WHEN z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_e = c3_uid132_fracXIsZero_uid17_fpMulTest_b ELSE "0";
    eq3_uid173_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid173_stickyRangeComparator_uid59_fpMulTest_qi, xout => eq3_uid173_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- redist20_eq3_uid173_stickyRangeComparator_uid59_fpMulTest_q_2(DELAY,428)
    redist20_eq3_uid173_stickyRangeComparator_uid59_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid173_stickyRangeComparator_uid59_fpMulTest_q, xout => redist20_eq3_uid173_stickyRangeComparator_uid59_fpMulTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid259_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_merged_bit_select(BITSELECT,407)@4
    x0_uid259_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b <= z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_d(2 downto 0);
    x0_uid259_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c <= z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid264_eq2_uid170_stickyRangeComparator_uid59_fpMulTest(LOGICAL,263)@4 + 1
    eq1_uid264_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_qi <= "1" WHEN x0_uid259_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c = y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid264_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid264_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_qi, xout => eq1_uid264_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid261_eq2_uid170_stickyRangeComparator_uid59_fpMulTest(LOGICAL,260)@4 + 1
    eq0_uid261_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_qi <= "1" WHEN x0_uid259_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b = y0_uid204_eq2_uid130_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid261_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid261_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_qi, xout => eq0_uid261_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid265_eq2_uid170_stickyRangeComparator_uid59_fpMulTest(LOGICAL,264)@5 + 1
    andEq_uid265_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_qi <= eq0_uid261_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_q and eq1_uid264_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_q;
    andEq_uid265_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid265_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_qi, xout => andEq_uid265_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- x0_uid252_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_merged_bit_select(BITSELECT,406)@4
    x0_uid252_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b <= z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c(2 downto 0);
    x0_uid252_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c <= z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid257_eq1_uid167_stickyRangeComparator_uid59_fpMulTest(LOGICAL,256)@4 + 1
    eq1_uid257_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_qi <= "1" WHEN x0_uid252_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c = y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid257_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid257_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_qi, xout => eq1_uid257_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid254_eq1_uid167_stickyRangeComparator_uid59_fpMulTest(LOGICAL,253)@4 + 1
    eq0_uid254_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_qi <= "1" WHEN x0_uid252_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b = y0_uid197_eq1_uid127_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid254_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid254_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_qi, xout => eq0_uid254_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid258_eq1_uid167_stickyRangeComparator_uid59_fpMulTest(LOGICAL,257)@5 + 1
    andEq_uid258_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_qi <= eq0_uid254_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_q and eq1_uid257_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_q;
    andEq_uid258_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid258_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_qi, xout => andEq_uid258_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- x0_uid245_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_merged_bit_select(BITSELECT,405)@4
    x0_uid245_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b <= z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b(2 downto 0);
    x0_uid245_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c <= z0_uid162_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid250_eq0_uid164_stickyRangeComparator_uid59_fpMulTest(LOGICAL,249)@4 + 1
    eq1_uid250_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_qi <= "1" WHEN x0_uid245_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c = y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid250_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid250_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_qi, xout => eq1_uid250_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- eq0_uid247_eq0_uid164_stickyRangeComparator_uid59_fpMulTest(LOGICAL,246)@4 + 1
    eq0_uid247_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_qi <= "1" WHEN x0_uid245_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b = y0_uid190_eq0_uid124_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid247_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid247_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_qi, xout => eq0_uid247_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- andEq_uid251_eq0_uid164_stickyRangeComparator_uid59_fpMulTest(LOGICAL,250)@5 + 1
    andEq_uid251_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_qi <= eq0_uid247_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_q and eq1_uid250_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_q;
    andEq_uid251_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid251_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_qi, xout => andEq_uid251_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid174_stickyRangeComparator_uid59_fpMulTest(LOGICAL,173)@6 + 1
    and_lev0_uid174_stickyRangeComparator_uid59_fpMulTest_qi <= andEq_uid251_eq0_uid164_stickyRangeComparator_uid59_fpMulTest_q and andEq_uid258_eq1_uid167_stickyRangeComparator_uid59_fpMulTest_q and andEq_uid265_eq2_uid170_stickyRangeComparator_uid59_fpMulTest_q and redist20_eq3_uid173_stickyRangeComparator_uid59_fpMulTest_q_2_q;
    and_lev0_uid174_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid174_stickyRangeComparator_uid59_fpMulTest_qi, xout => and_lev0_uid174_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- sticky_uid60_fpMulTest(LOGICAL,59)@7
    sticky_uid60_fpMulTest_q <= not (and_lev0_uid174_stickyRangeComparator_uid59_fpMulTest_q);

    -- lrs_uid62_fpMulTest(BITJOIN,61)@7
    lrs_uid62_fpMulTest_q <= fracRPostNorm1dto0_uid61_fpMulTest_b & sticky_uid60_fpMulTest_q;

    -- roundBitDetectionPattern_uid64_fpMulTest(LOGICAL,63)@7 + 1
    roundBitDetectionPattern_uid64_fpMulTest_qi <= "1" WHEN lrs_uid62_fpMulTest_q = roundBitDetectionConstant_uid63_fpMulTest_q ELSE "0";
    roundBitDetectionPattern_uid64_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => roundBitDetectionPattern_uid64_fpMulTest_qi, xout => roundBitDetectionPattern_uid64_fpMulTest_q, clk => clk, aclr => areset );

    -- roundBit_uid65_fpMulTest(LOGICAL,64)@8
    roundBit_uid65_fpMulTest_q <= not (roundBitDetectionPattern_uid64_fpMulTest_q);

    -- roundBitAndNormalizationOp_uid68_fpMulTest(BITJOIN,67)@8
    roundBitAndNormalizationOp_uid68_fpMulTest_q <= GND_q & redist38_normalizeBit_uid49_fpMulTest_b_5_q & cstZeroWF_uid11_fpMulTest_q & roundBit_uid65_fpMulTest_q;

    -- expFracRPostRounding_uid69_fpMulTest_BitExpansion_for_b(BITJOIN,287)@8
    expFracRPostRounding_uid69_fpMulTest_BitExpansion_for_b_q <= expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b_q & roundBitAndNormalizationOp_uid68_fpMulTest_q;

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b(BITSELECT,290)@8
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_b <= expFracRPostRounding_uid69_fpMulTest_BitExpansion_for_b_q(5 downto 0);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_f <= expFracRPostRounding_uid69_fpMulTest_BitExpansion_for_b_q(29 downto 24);

    -- redist9_fracRPostNorm_uid53_fpMulTest_p0_q_5(DELAY,417)
    redist9_fracRPostNorm_uid53_fpMulTest_p0_q_5 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_fracRPostNorm_uid53_fpMulTest_p0_q_4_q, xout => redist9_fracRPostNorm_uid53_fpMulTest_p0_q_5_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_0(BITSELECT,336)@8
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(redist9_fracRPostNorm_uid53_fpMulTest_p0_q_5_q(5 downto 0));

    -- expFracRPostRounding_uid69_fpMulTest_p1_of_6(ADD,291)@8 + 1
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_0_b);
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_b);
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p1_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p1_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p1_of_6_o(6);
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p1_of_6_o(5 downto 0);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0(BITSELECT,349)
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(cstZeroWF_uid11_fpMulTest_q(10 downto 5));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0(BITSELECT,338)@8
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(redist9_fracRPostNorm_uid53_fpMulTest_p0_q_5_q(11 downto 6));

    -- redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b_1(DELAY,415)
    redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b, xout => redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b_1_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_p2_of_6(ADD,292)@9 + 1
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p1_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b_1_q) & '1';
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0_b) & expFracRPostRounding_uid69_fpMulTest_p2_of_6_cin(0);
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p2_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p2_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p2_of_6_o(7);
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p2_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0(BITSELECT,351)
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(cstZeroWF_uid11_fpMulTest_q(16 downto 11));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0(BITSELECT,340)@8
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(redist9_fracRPostNorm_uid53_fpMulTest_p0_q_5_q(17 downto 12));

    -- redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b_2(DELAY,414)
    redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b, xout => redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b_2_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_p3_of_6(ADD,293)@10 + 1
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p2_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b_2_q) & '1';
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0_b) & expFracRPostRounding_uid69_fpMulTest_p3_of_6_cin(0);
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p3_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p3_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p3_of_6_o(7);
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p3_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0(BITSELECT,353)
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0_b <= STD_LOGIC_VECTOR(cstZeroWF_uid11_fpMulTest_q(22 downto 17));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0(BITSELECT,342)@8
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b <= STD_LOGIC_VECTOR(redist9_fracRPostNorm_uid53_fpMulTest_p0_q_5_q(23 downto 18));

    -- redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b_3(DELAY,413)
    redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b, xout => redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b_3_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_p4_of_6(ADD,294)@11 + 1
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p3_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b_3_q) & '1';
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0_b) & expFracRPostRounding_uid69_fpMulTest_p4_of_6_cin(0);
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p4_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p4_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p4_of_6_o(7);
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p4_of_6_o(6 downto 1);

    -- redist15_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_f_4(DELAY,423)
    redist15_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_f_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_f, xout => redist15_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_f_4_q, clk => clk, aclr => areset );

    -- biasInc_uid45_fpMulTest(CONSTANT,44)
    biasInc_uid45_fpMulTest_q <= "0001111111";

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0(BITSELECT,331)
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(biasInc_uid45_fpMulTest_q(5 downto 0));

    -- expSum_uid44_fpMulTest_BitExpansion_for_b(BITJOIN,267)@0
    expSum_uid44_fpMulTest_BitExpansion_for_b_q <= GND_q & expY_uid7_fpMulTest_b;

    -- expSum_uid44_fpMulTest_BitSelect_for_b(BITSELECT,270)@0
    expSum_uid44_fpMulTest_BitSelect_for_b_b <= expSum_uid44_fpMulTest_BitExpansion_for_b_q(5 downto 0);
    expSum_uid44_fpMulTest_BitSelect_for_b_c <= expSum_uid44_fpMulTest_BitExpansion_for_b_q(8 downto 6);

    -- expSum_uid44_fpMulTest_BitExpansion_for_a(BITJOIN,265)@0
    expSum_uid44_fpMulTest_BitExpansion_for_a_q <= GND_q & expX_uid6_fpMulTest_b;

    -- expSum_uid44_fpMulTest_BitSelect_for_a(BITSELECT,269)@0
    expSum_uid44_fpMulTest_BitSelect_for_a_b <= expSum_uid44_fpMulTest_BitExpansion_for_a_q(5 downto 0);
    expSum_uid44_fpMulTest_BitSelect_for_a_c <= expSum_uid44_fpMulTest_BitExpansion_for_a_q(8 downto 6);

    -- expSum_uid44_fpMulTest_p1_of_2(ADD,271)@0 + 1
    expSum_uid44_fpMulTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expSum_uid44_fpMulTest_BitSelect_for_a_b);
    expSum_uid44_fpMulTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expSum_uid44_fpMulTest_BitSelect_for_b_b);
    expSum_uid44_fpMulTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid44_fpMulTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid44_fpMulTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid44_fpMulTest_p1_of_2_a) + UNSIGNED(expSum_uid44_fpMulTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expSum_uid44_fpMulTest_p1_of_2_c(0) <= expSum_uid44_fpMulTest_p1_of_2_o(6);
    expSum_uid44_fpMulTest_p1_of_2_q <= expSum_uid44_fpMulTest_p1_of_2_o(5 downto 0);

    -- redist17_expSum_uid44_fpMulTest_p1_of_2_q_10(DELAY,425)
    redist17_expSum_uid44_fpMulTest_p1_of_2_q_10 : dspba_delay
    GENERIC MAP ( width => 6, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_p1_of_2_q, xout => redist17_expSum_uid44_fpMulTest_p1_of_2_q_10_q, clk => clk, aclr => areset );

    -- expSumMBias_uid46_fpMulTest_p1_of_2(SUB,281)@11 + 1
    expSumMBias_uid46_fpMulTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & redist17_expSum_uid44_fpMulTest_p1_of_2_q_10_q);
    expSumMBias_uid46_fpMulTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_b);
    expSumMBias_uid46_fpMulTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid46_fpMulTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSumMBias_uid46_fpMulTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSumMBias_uid46_fpMulTest_p1_of_2_a) - UNSIGNED(expSumMBias_uid46_fpMulTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expSumMBias_uid46_fpMulTest_p1_of_2_c(0) <= expSumMBias_uid46_fpMulTest_p1_of_2_o(6);
    expSumMBias_uid46_fpMulTest_p1_of_2_q <= expSumMBias_uid46_fpMulTest_p1_of_2_o(5 downto 0);

    -- expFracRPostRounding_uid69_fpMulTest_p5_of_6(ADD,295)@12 + 1
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p4_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & expSumMBias_uid46_fpMulTest_p1_of_2_q) & '1';
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & redist15_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_f_4_q) & expFracRPostRounding_uid69_fpMulTest_p5_of_6_cin(0);
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p5_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p5_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p5_of_6_o(7);
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p5_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0(BITSELECT,355)
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b_q(9 downto 4));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1(BITSELECT,347)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1_b <= STD_LOGIC_VECTOR(expSumMBias_uid46_fpMulTest_p2_of_2_q(4 downto 4));

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1(BITSELECT,334)
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1_b <= STD_LOGIC_VECTOR(biasInc_uid45_fpMulTest_q(9 downto 9));

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0(BITSELECT,333)
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(biasInc_uid45_fpMulTest_q(9 downto 6));

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,335)@12
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q <= expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1_b & expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b;

    -- expSumMBias_uid46_fpMulTest_UpperBits_for_a(CONSTANT,275)
    expSumMBias_uid46_fpMulTest_UpperBits_for_a_q <= "00";

    -- redist18_expSum_uid44_fpMulTest_BitSelect_for_b_c_1(DELAY,426)
    redist18_expSum_uid44_fpMulTest_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_BitSelect_for_b_c, xout => redist18_expSum_uid44_fpMulTest_BitSelect_for_b_c_1_q, clk => clk, aclr => areset );

    -- redist19_expSum_uid44_fpMulTest_BitSelect_for_a_c_1(DELAY,427)
    redist19_expSum_uid44_fpMulTest_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_BitSelect_for_a_c, xout => redist19_expSum_uid44_fpMulTest_BitSelect_for_a_c_1_q, clk => clk, aclr => areset );

    -- expSum_uid44_fpMulTest_p2_of_2(ADD,272)@1 + 1
    expSum_uid44_fpMulTest_p2_of_2_cin <= expSum_uid44_fpMulTest_p1_of_2_c;
    expSum_uid44_fpMulTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist19_expSum_uid44_fpMulTest_BitSelect_for_a_c_1_q) & '1';
    expSum_uid44_fpMulTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist18_expSum_uid44_fpMulTest_BitSelect_for_b_c_1_q) & expSum_uid44_fpMulTest_p2_of_2_cin(0);
    expSum_uid44_fpMulTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid44_fpMulTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid44_fpMulTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid44_fpMulTest_p2_of_2_a) + UNSIGNED(expSum_uid44_fpMulTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expSum_uid44_fpMulTest_p2_of_2_q <= expSum_uid44_fpMulTest_p2_of_2_o(3 downto 1);

    -- redist16_expSum_uid44_fpMulTest_p2_of_2_q_10(DELAY,424)
    redist16_expSum_uid44_fpMulTest_p2_of_2_q_10 : dspba_delay
    GENERIC MAP ( width => 3, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_p2_of_2_q, xout => redist16_expSum_uid44_fpMulTest_p2_of_2_q_10_q, clk => clk, aclr => areset );

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,330)@12
    expSumMBias_uid46_fpMulTest_BitSelect_for_a_BitJoin_for_c_q <= expSumMBias_uid46_fpMulTest_UpperBits_for_a_q & redist16_expSum_uid44_fpMulTest_p2_of_2_q_10_q;

    -- expSumMBias_uid46_fpMulTest_p2_of_2(SUB,282)@12 + 1
    expSumMBias_uid46_fpMulTest_p2_of_2_cin <= expSumMBias_uid46_fpMulTest_p1_of_2_c;
    expSumMBias_uid46_fpMulTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expSumMBias_uid46_fpMulTest_BitSelect_for_a_BitJoin_for_c_q) & '0');
    expSumMBias_uid46_fpMulTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q(4)) & expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q) & expSumMBias_uid46_fpMulTest_p2_of_2_cin(0));
    expSumMBias_uid46_fpMulTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid46_fpMulTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSumMBias_uid46_fpMulTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid46_fpMulTest_p2_of_2_a) - SIGNED(expSumMBias_uid46_fpMulTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expSumMBias_uid46_fpMulTest_p2_of_2_q <= expSumMBias_uid46_fpMulTest_p2_of_2_o(5 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g(BITJOIN,348)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g_q <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1_b & expSumMBias_uid46_fpMulTest_p2_of_2_q;

    -- expFracRPostRounding_uid69_fpMulTest_p6_of_6(ADD,296)@13 + 1
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p5_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g_q(5)) & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g_q) & '1');
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0_b) & expFracRPostRounding_uid69_fpMulTest_p6_of_6_cin(0));
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p6_of_6_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid69_fpMulTest_p6_of_6_a) + SIGNED(expFracRPostRounding_uid69_fpMulTest_p6_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p6_of_6_o(6 downto 1);

    -- redist10_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1(DELAY,418)
    redist10_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p5_of_6_q, xout => redist10_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1_q, clk => clk, aclr => areset );

    -- redist11_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2(DELAY,419)
    redist11_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p4_of_6_q, xout => redist11_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2_q, clk => clk, aclr => areset );

    -- redist12_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3(DELAY,420)
    redist12_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p3_of_6_q, xout => redist12_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3_q, clk => clk, aclr => areset );

    -- redist13_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4(DELAY,421)
    redist13_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p2_of_6_q, xout => redist13_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4_q, clk => clk, aclr => areset );

    -- redist14_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5(DELAY,422)
    redist14_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p1_of_6_q, xout => redist14_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q(BITJOIN,297)@14
    expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q_q <= expFracRPostRounding_uid69_fpMulTest_p6_of_6_q & redist10_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1_q & redist11_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2_q & redist12_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3_q & redist13_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4_q & redist14_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5_q;

    -- expRPreExcExt_uid71_fpMulTest(BITSELECT,70)@14
    expRPreExcExt_uid71_fpMulTest_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q_q(35 downto 24));

    -- expRPreExc_uid72_fpMulTest(BITSELECT,71)@14
    expRPreExc_uid72_fpMulTest_in <= expRPreExcExt_uid71_fpMulTest_b(7 downto 0);
    expRPreExc_uid72_fpMulTest_b <= expRPreExc_uid72_fpMulTest_in(7 downto 0);

    -- redist35_expRPreExc_uid72_fpMulTest_b_5(DELAY,443)
    redist35_expRPreExc_uid72_fpMulTest_b_5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid72_fpMulTest_b, xout => redist35_expRPreExc_uid72_fpMulTest_b_5_q, clk => clk, aclr => areset );

    -- expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0(BITSELECT,376)
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(cstAllOWE_uid10_fpMulTest_q(5 downto 0));

    -- expOvf_uid75_fpMulTest_p1_of_3(COMPARE,317)@13 + 1
    expOvf_uid75_fpMulTest_p1_of_3_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_p5_of_6_q);
    expOvf_uid75_fpMulTest_p1_of_3_b <= STD_LOGIC_VECTOR("0" & expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0_b);
    expOvf_uid75_fpMulTest_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid75_fpMulTest_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid75_fpMulTest_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expOvf_uid75_fpMulTest_p1_of_3_a) - UNSIGNED(expOvf_uid75_fpMulTest_p1_of_3_b));
        END IF;
    END PROCESS;
    expOvf_uid75_fpMulTest_p1_of_3_c(0) <= expOvf_uid75_fpMulTest_p1_of_3_o(6);

    -- expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0(BITSELECT,378)
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(cstAllOWE_uid10_fpMulTest_q(7 downto 6));

    -- expOvf_uid75_fpMulTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,380)@14
    expOvf_uid75_fpMulTest_BitSelect_for_b_BitJoin_for_c_q <= expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_merged_bit_select_b & expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0_b;

    -- expOvf_uid75_fpMulTest_p2_of_3(COMPARE,318)@14 + 1
    expOvf_uid75_fpMulTest_p2_of_3_cin <= expOvf_uid75_fpMulTest_p1_of_3_c;
    expOvf_uid75_fpMulTest_p2_of_3_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_p6_of_6_q) & '0';
    expOvf_uid75_fpMulTest_p2_of_3_b <= STD_LOGIC_VECTOR("0" & expOvf_uid75_fpMulTest_BitSelect_for_b_BitJoin_for_c_q) & expOvf_uid75_fpMulTest_p2_of_3_cin(0);
    expOvf_uid75_fpMulTest_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid75_fpMulTest_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid75_fpMulTest_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expOvf_uid75_fpMulTest_p2_of_3_a) - UNSIGNED(expOvf_uid75_fpMulTest_p2_of_3_b));
        END IF;
    END PROCESS;
    expOvf_uid75_fpMulTest_p2_of_3_c(0) <= expOvf_uid75_fpMulTest_p2_of_3_o(7);

    -- expOvf_uid75_fpMulTest_UpperBits_for_b(CONSTANT,314)
    expOvf_uid75_fpMulTest_UpperBits_for_b_q <= "00000";

    -- expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_merged_bit_select(BITSELECT,395)
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_merged_bit_select_b <= STD_LOGIC_VECTOR(expOvf_uid75_fpMulTest_UpperBits_for_b_q(3 downto 0));
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_merged_bit_select_c <= STD_LOGIC_VECTOR(expOvf_uid75_fpMulTest_UpperBits_for_b_q(4 downto 4));

    -- expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0(BITSELECT,368)@14
    expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_p6_of_6_q(5 downto 5));

    -- redist3_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1(DELAY,411)
    redist3_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0_b, xout => redist3_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid75_fpMulTest_p3_of_3(COMPARE,319)@15 + 1
    expOvf_uid75_fpMulTest_p3_of_3_cin <= expOvf_uid75_fpMulTest_p2_of_3_c;
    expOvf_uid75_fpMulTest_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => redist3_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q(0)) & redist3_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q) & '0');
    expOvf_uid75_fpMulTest_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_merged_bit_select_c) & expOvf_uid75_fpMulTest_p3_of_3_cin(0));
    expOvf_uid75_fpMulTest_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid75_fpMulTest_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid75_fpMulTest_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid75_fpMulTest_p3_of_3_a) - SIGNED(expOvf_uid75_fpMulTest_p3_of_3_b));
        END IF;
    END PROCESS;
    expOvf_uid75_fpMulTest_p3_of_3_c(0) <= expOvf_uid75_fpMulTest_p3_of_3_o(2);

    -- expOvf_uid75_fpMulTest_cout_n(LOGICAL,321)@16
    expOvf_uid75_fpMulTest_cout_n_q <= STD_LOGIC_VECTOR(not (expOvf_uid75_fpMulTest_p3_of_3_c));

    -- invExpXIsMax_uid35_fpMulTest(LOGICAL,34)@14 + 1
    invExpXIsMax_uid35_fpMulTest_qi <= not (redist23_and_lev0_uid148_expXIsMax_uid30_fpMulTest_q_12_q);
    invExpXIsMax_uid35_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invExpXIsMax_uid35_fpMulTest_qi, xout => invExpXIsMax_uid35_fpMulTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid36_fpMulTest(LOGICAL,35)@15
    InvExpXIsZero_uid36_fpMulTest_q <= not (redist24_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_13_q);

    -- excR_y_uid37_fpMulTest(LOGICAL,36)@15 + 1
    excR_y_uid37_fpMulTest_qi <= InvExpXIsZero_uid36_fpMulTest_q and invExpXIsMax_uid35_fpMulTest_q;
    excR_y_uid37_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_y_uid37_fpMulTest_qi, xout => excR_y_uid37_fpMulTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid21_fpMulTest(LOGICAL,20)@15
    invExpXIsMax_uid21_fpMulTest_q <= not (redist29_and_lev0_uid121_expXIsMax_uid16_fpMulTest_q_13_q);

    -- InvExpXIsZero_uid22_fpMulTest(LOGICAL,21)@15
    InvExpXIsZero_uid22_fpMulTest_q <= not (redist30_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_13_q);

    -- excR_x_uid23_fpMulTest(LOGICAL,22)@15 + 1
    excR_x_uid23_fpMulTest_qi <= InvExpXIsZero_uid22_fpMulTest_q and invExpXIsMax_uid21_fpMulTest_q;
    excR_x_uid23_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_x_uid23_fpMulTest_qi, xout => excR_x_uid23_fpMulTest_q, clk => clk, aclr => areset );

    -- ExcROvfAndInReg_uid84_fpMulTest(LOGICAL,83)@16 + 1
    ExcROvfAndInReg_uid84_fpMulTest_qi <= excR_x_uid23_fpMulTest_q and excR_y_uid37_fpMulTest_q and expOvf_uid75_fpMulTest_cout_n_q;
    ExcROvfAndInReg_uid84_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ExcROvfAndInReg_uid84_fpMulTest_qi, xout => ExcROvfAndInReg_uid84_fpMulTest_q, clk => clk, aclr => areset );

    -- redist43_excI_x_uid19_fpMulTest_q_2(DELAY,451)
    redist43_excI_x_uid19_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid19_fpMulTest_q, xout => redist43_excI_x_uid19_fpMulTest_q_2_q, clk => clk, aclr => areset );

    -- excYRAndExcXI_uid83_fpMulTest(LOGICAL,82)@16 + 1
    excYRAndExcXI_uid83_fpMulTest_qi <= excR_y_uid37_fpMulTest_q and redist43_excI_x_uid19_fpMulTest_q_2_q;
    excYRAndExcXI_uid83_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYRAndExcXI_uid83_fpMulTest_qi, xout => excYRAndExcXI_uid83_fpMulTest_q, clk => clk, aclr => areset );

    -- redist41_excI_y_uid33_fpMulTest_q_2(DELAY,449)
    redist41_excI_y_uid33_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid33_fpMulTest_q, xout => redist41_excI_y_uid33_fpMulTest_q_2_q, clk => clk, aclr => areset );

    -- excXRAndExcYI_uid82_fpMulTest(LOGICAL,81)@16 + 1
    excXRAndExcYI_uid82_fpMulTest_qi <= excR_x_uid23_fpMulTest_q and redist41_excI_y_uid33_fpMulTest_q_2_q;
    excXRAndExcYI_uid82_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXRAndExcYI_uid82_fpMulTest_qi, xout => excXRAndExcYI_uid82_fpMulTest_q, clk => clk, aclr => areset );

    -- excXIAndExcYI_uid81_fpMulTest(LOGICAL,80)@16 + 1
    excXIAndExcYI_uid81_fpMulTest_qi <= redist43_excI_x_uid19_fpMulTest_q_2_q and redist41_excI_y_uid33_fpMulTest_q_2_q;
    excXIAndExcYI_uid81_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXIAndExcYI_uid81_fpMulTest_qi, xout => excXIAndExcYI_uid81_fpMulTest_q, clk => clk, aclr => areset );

    -- excRInf_uid85_fpMulTest(LOGICAL,84)@17 + 1
    excRInf_uid85_fpMulTest_qi <= excXIAndExcYI_uid81_fpMulTest_q or excXRAndExcYI_uid82_fpMulTest_q or excYRAndExcXI_uid83_fpMulTest_q or ExcROvfAndInReg_uid84_fpMulTest_q;
    excRInf_uid85_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInf_uid85_fpMulTest_qi, xout => excRInf_uid85_fpMulTest_q, clk => clk, aclr => areset );

    -- expUdf_uid73_fpMulTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,359)@13
    expUdf_uid73_fpMulTest_BitSelect_for_a_BitJoin_for_b_q <= expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_b & GND_q;

    -- expUdf_uid73_fpMulTest_p1_of_3(COMPARE,305)@13 + 1
    expUdf_uid73_fpMulTest_p1_of_3_a <= STD_LOGIC_VECTOR("0" & expUdf_uid73_fpMulTest_BitSelect_for_a_BitJoin_for_b_q);
    expUdf_uid73_fpMulTest_p1_of_3_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_p5_of_6_q);
    expUdf_uid73_fpMulTest_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid73_fpMulTest_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid73_fpMulTest_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expUdf_uid73_fpMulTest_p1_of_3_a) - UNSIGNED(expUdf_uid73_fpMulTest_p1_of_3_b));
        END IF;
    END PROCESS;
    expUdf_uid73_fpMulTest_p1_of_3_c(0) <= expUdf_uid73_fpMulTest_p1_of_3_o(6);

    -- expUdf_uid73_fpMulTest_p2_of_3(COMPARE,306)@14 + 1
    expUdf_uid73_fpMulTest_p2_of_3_cin <= expUdf_uid73_fpMulTest_p1_of_3_c;
    expUdf_uid73_fpMulTest_p2_of_3_a <= STD_LOGIC_VECTOR("0" & expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_c) & '0';
    expUdf_uid73_fpMulTest_p2_of_3_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_p6_of_6_q) & expUdf_uid73_fpMulTest_p2_of_3_cin(0);
    expUdf_uid73_fpMulTest_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid73_fpMulTest_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid73_fpMulTest_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expUdf_uid73_fpMulTest_p2_of_3_a) - UNSIGNED(expUdf_uid73_fpMulTest_p2_of_3_b));
        END IF;
    END PROCESS;
    expUdf_uid73_fpMulTest_p2_of_3_c(0) <= expUdf_uid73_fpMulTest_p2_of_3_o(7);

    -- expUdf_uid73_fpMulTest_UpperBits_for_a(CONSTANT,299)
    expUdf_uid73_fpMulTest_UpperBits_for_a_q <= "000000000000";

    -- expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,394)
    expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_UpperBits_for_a_q(4 downto 0));
    expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_UpperBits_for_a_q(10 downto 5));
    expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_d <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_UpperBits_for_a_q(11 downto 11));

    -- expUdf_uid73_fpMulTest_p3_of_3(COMPARE,307)@15 + 1
    expUdf_uid73_fpMulTest_p3_of_3_cin <= expUdf_uid73_fpMulTest_p2_of_3_c;
    expUdf_uid73_fpMulTest_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_d) & '0');
    expUdf_uid73_fpMulTest_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => redist3_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q(0)) & redist3_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q) & expUdf_uid73_fpMulTest_p3_of_3_cin(0));
    expUdf_uid73_fpMulTest_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid73_fpMulTest_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid73_fpMulTest_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid73_fpMulTest_p3_of_3_a) - SIGNED(expUdf_uid73_fpMulTest_p3_of_3_b));
        END IF;
    END PROCESS;
    expUdf_uid73_fpMulTest_p3_of_3_c(0) <= expUdf_uid73_fpMulTest_p3_of_3_o(2);

    -- expUdf_uid73_fpMulTest_cout_n(LOGICAL,309)@16
    expUdf_uid73_fpMulTest_cout_n_q <= STD_LOGIC_VECTOR(not (expUdf_uid73_fpMulTest_p3_of_3_c));

    -- excZC3_uid79_fpMulTest(LOGICAL,78)@16 + 1
    excZC3_uid79_fpMulTest_qi <= excR_x_uid23_fpMulTest_q and excR_y_uid37_fpMulTest_q and expUdf_uid73_fpMulTest_cout_n_q;
    excZC3_uid79_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZC3_uid79_fpMulTest_qi, xout => excZC3_uid79_fpMulTest_q, clk => clk, aclr => areset );

    -- redist25_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_14(DELAY,433)
    redist25_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist24_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_13_q, xout => redist25_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_14_q, clk => clk, aclr => areset );

    -- excYZAndExcXR_uid78_fpMulTest(LOGICAL,77)@16 + 1
    excYZAndExcXR_uid78_fpMulTest_qi <= redist25_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_14_q and excR_x_uid23_fpMulTest_q;
    excYZAndExcXR_uid78_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYZAndExcXR_uid78_fpMulTest_qi, xout => excYZAndExcXR_uid78_fpMulTest_q, clk => clk, aclr => areset );

    -- redist31_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_14(DELAY,439)
    redist31_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist30_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_13_q, xout => redist31_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_14_q, clk => clk, aclr => areset );

    -- excXZAndExcYR_uid77_fpMulTest(LOGICAL,76)@16 + 1
    excXZAndExcYR_uid77_fpMulTest_qi <= redist31_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_14_q and excR_y_uid37_fpMulTest_q;
    excXZAndExcYR_uid77_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYR_uid77_fpMulTest_qi, xout => excXZAndExcYR_uid77_fpMulTest_q, clk => clk, aclr => areset );

    -- excXZAndExcYZ_uid76_fpMulTest(LOGICAL,75)@16 + 1
    excXZAndExcYZ_uid76_fpMulTest_qi <= redist31_and_lev0_uid114_excZ_x_uid15_fpMulTest_q_14_q and redist25_and_lev0_uid141_excZ_y_uid29_fpMulTest_q_14_q;
    excXZAndExcYZ_uid76_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYZ_uid76_fpMulTest_qi, xout => excXZAndExcYZ_uid76_fpMulTest_q, clk => clk, aclr => areset );

    -- excRZero_uid80_fpMulTest(LOGICAL,79)@17 + 1
    excRZero_uid80_fpMulTest_qi <= excXZAndExcYZ_uid76_fpMulTest_q or excXZAndExcYR_uid77_fpMulTest_q or excYZAndExcXR_uid78_fpMulTest_q or excZC3_uid79_fpMulTest_q;
    excRZero_uid80_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid80_fpMulTest_qi, xout => excRZero_uid80_fpMulTest_q, clk => clk, aclr => areset );

    -- concExc_uid90_fpMulTest(BITJOIN,89)@18
    concExc_uid90_fpMulTest_q <= excRNaN_uid89_fpMulTest_q & excRInf_uid85_fpMulTest_q & excRZero_uid80_fpMulTest_q;

    -- excREnc_uid91_fpMulTest(LOOKUP,90)@18 + 1
    excREnc_uid91_fpMulTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid91_fpMulTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid90_fpMulTest_q) IS
                WHEN "000" => excREnc_uid91_fpMulTest_q <= "01";
                WHEN "001" => excREnc_uid91_fpMulTest_q <= "00";
                WHEN "010" => excREnc_uid91_fpMulTest_q <= "10";
                WHEN "011" => excREnc_uid91_fpMulTest_q <= "00";
                WHEN "100" => excREnc_uid91_fpMulTest_q <= "11";
                WHEN "101" => excREnc_uid91_fpMulTest_q <= "00";
                WHEN "110" => excREnc_uid91_fpMulTest_q <= "00";
                WHEN "111" => excREnc_uid91_fpMulTest_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREnc_uid91_fpMulTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExc_uid100_fpMulTest(MUX,99)@19 + 1
    expRPostExc_uid100_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    expRPostExc_uid100_fpMulTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc_uid100_fpMulTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPostExc_uid100_fpMulTest_s) IS
                WHEN "00" => expRPostExc_uid100_fpMulTest_q <= cstAllZWE_uid12_fpMulTest_q;
                WHEN "01" => expRPostExc_uid100_fpMulTest_q <= redist35_expRPreExc_uid72_fpMulTest_b_5_q;
                WHEN "10" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
                WHEN "11" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
                WHEN OTHERS => expRPostExc_uid100_fpMulTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist33_expRPostExc_uid100_fpMulTest_q_29(DELAY,441)
    redist33_expRPostExc_uid100_fpMulTest_q_29 : dspba_delay
    GENERIC MAP ( width => 8, depth => 28, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPostExc_uid100_fpMulTest_q, xout => redist33_expRPostExc_uid100_fpMulTest_q_29_q, clk => clk, aclr => areset );

    -- oneFracRPostExc2_uid92_fpMulTest(CONSTANT,91)
    oneFracRPostExc2_uid92_fpMulTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid70_fpMulTest(BITSELECT,69)@14
    fracRPreExc_uid70_fpMulTest_in <= expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q_q(23 downto 0);
    fracRPreExc_uid70_fpMulTest_b <= fracRPreExc_uid70_fpMulTest_in(23 downto 1);

    -- redist36_fracRPreExc_uid70_fpMulTest_b_5(DELAY,444)
    redist36_fracRPreExc_uid70_fpMulTest_b_5 : dspba_delay
    GENERIC MAP ( width => 23, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid70_fpMulTest_b, xout => redist36_fracRPreExc_uid70_fpMulTest_b_5_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid95_fpMulTest(MUX,94)@19 + 1
    fracRPostExc_uid95_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    fracRPostExc_uid95_fpMulTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostExc_uid95_fpMulTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostExc_uid95_fpMulTest_s) IS
                WHEN "00" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
                WHEN "01" => fracRPostExc_uid95_fpMulTest_q <= redist36_fracRPreExc_uid70_fpMulTest_b_5_q;
                WHEN "10" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
                WHEN "11" => fracRPostExc_uid95_fpMulTest_q <= oneFracRPostExc2_uid92_fpMulTest_q;
                WHEN OTHERS => fracRPostExc_uid95_fpMulTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist34_fracRPostExc_uid95_fpMulTest_q_29(DELAY,442)
    redist34_fracRPostExc_uid95_fpMulTest_q_29 : dspba_delay
    GENERIC MAP ( width => 23, depth => 28, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostExc_uid95_fpMulTest_q, xout => redist34_fracRPostExc_uid95_fpMulTest_q_29_q, clk => clk, aclr => areset );

    -- R_uid103_fpMulTest(BITJOIN,102)@48
    R_uid103_fpMulTest_q <= redist32_signRPostExc_uid102_fpMulTest_q_30_q & redist33_expRPostExc_uid100_fpMulTest_q_29_q & redist34_fracRPostExc_uid95_fpMulTest_q_29_q;

    -- xOut(GPOUT,4)@48
    q <= R_uid103_fpMulTest_q;

END normal;
