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

-- VHDL created from altfp_2int_0002
-- VHDL created on Fri Apr 17 11:31:49 2020


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

entity altfp_2int_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- sfix32
        clk : in std_logic;
        areset : in std_logic
    );
end altfp_2int_0002;

architecture normal of altfp_2int_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpToFxPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid7_fpToFxPTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid8_fpToFxPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid9_fpToFxPTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid10_fpToFxPTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid14_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid15_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid15_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid16_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid16_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid22_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid23_fpToFxPTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal signX_uid25_fpToFxPTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpVal_uid26_fpToFxPTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal udfExpVal_uid28_fpToFxPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal ovfExpVal_uid30_fpToFxPTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValRaw_uid32_fpToFxPTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValRaw_uid32_fpToFxPTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal maxShiftCst_uid33_fpToFxPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftVal_uid35_fpToFxPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftVal_uid35_fpToFxPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shifterIn_uid37_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal maxPosValueS_uid39_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal maxNegValueS_uid40_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zRightShiferNoStickyOut_uid41_fpToFxPTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal xXorSignE_uid42_fpToFxPTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xXorSignE_uid42_fpToFxPTest_qi : STD_LOGIC_VECTOR (32 downto 0);
    signal xXorSignE_uid42_fpToFxPTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal d0_uid43_fpToFxPTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal sPostRnd_uid45_fpToFxPTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal sPostRnd_uid45_fpToFxPTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal ovfPostRnd_uid48_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfPostRnd_uid48_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal muxSelConc_uid49_fpToFxPTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal muxSel_uid50_fpToFxPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal maxNegValueU_uid51_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal finalOut_uid52_fpToFxPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal finalOut_uid52_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal eq1_uid59_excZ_x_uid11_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid59_excZ_x_uid11_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid60_excZ_x_uid11_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid60_excZ_x_uid11_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid66_expXIsMax_uid12_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid66_expXIsMax_uid12_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid79_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid79_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng16_uid83_rightShiferNoStickyOut_uid38_fpToFxPTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid84_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1_uid85_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx1Rng4_uid90_rightShiferNoStickyOut_uid38_fpToFxPTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx1Pad4_uid91_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx1_uid92_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx2Rng8_uid93_rightShiferNoStickyOut_uid38_fpToFxPTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage1Idx2_uid95_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx3Rng12_uid96_rightShiferNoStickyOut_uid38_fpToFxPTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal rightShiftStage1Idx3Pad12_uid97_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3_uid98_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng1_uid101_rightShiferNoStickyOut_uid38_fpToFxPTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage2Idx1_uid103_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx2Rng2_uid104_rightShiferNoStickyOut_uid38_fpToFxPTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage2Idx2Pad2_uid105_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2Idx2_uid106_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx3Rng3_uid107_rightShiferNoStickyOut_uid38_fpToFxPTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal rightShiftStage2Idx3Pad3_uid108_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage2Idx3_uid109_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal eq0_uid115_eq0_uid56_excZ_x_uid11_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid115_eq0_uid56_excZ_x_uid11_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid118_eq0_uid56_excZ_x_uid11_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid118_eq0_uid56_excZ_x_uid11_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid119_eq0_uid56_excZ_x_uid11_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid119_eq0_uid56_excZ_x_uid11_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid122_eq0_uid63_expXIsMax_uid12_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid122_eq0_uid63_expXIsMax_uid12_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid125_eq0_uid63_expXIsMax_uid12_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid125_eq0_uid63_expXIsMax_uid12_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid126_eq0_uid63_expXIsMax_uid12_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid126_eq0_uid63_expXIsMax_uid12_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid129_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid129_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid132_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid132_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid133_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid133_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid136_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid136_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid139_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid139_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid140_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid140_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid143_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid143_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid146_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid146_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid147_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid147_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal udf_uid29_fpToFxPTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal udf_uid29_fpToFxPTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal udf_uid29_fpToFxPTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal udf_uid29_fpToFxPTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal udf_uid29_fpToFxPTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal udf_uid29_fpToFxPTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal udf_uid29_fpToFxPTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal udf_uid29_fpToFxPTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal udf_uid29_fpToFxPTest_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal udf_uid29_fpToFxPTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValE_uid31_fpToFxPTest_p2_of_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal shiftValE_uid31_fpToFxPTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (9 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_UpperBits_for_b_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p1_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p2_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p3_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p4_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p5_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p6_of_6_a : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p6_of_6_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p6_of_6_o : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_p6_of_6_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p6_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p6_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p6_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_p6_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (2 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal udf_uid29_fpToFxPTest_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal udf_uid29_fpToFxPTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal udf_uid29_fpToFxPTest_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal udf_uid29_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (2 downto 0);
    signal shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValE_uid31_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftOutOfRange_uid34_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (4 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel3_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel4_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_0_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_BitJoin_for_g_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_g_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_BitJoin_for_g_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_e_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel4_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_f_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel5_0_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel5_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_g_q : STD_LOGIC_VECTOR (4 downto 0);
    signal c0_uid62_expXIsMax_uid12_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid62_expXIsMax_uid12_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal c0_uid55_excZ_x_uid11_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid55_excZ_x_uid11_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_g : STD_LOGIC_VECTOR (1 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal y0_uid121_eq0_uid63_expXIsMax_uid12_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid121_eq0_uid63_expXIsMax_uid12_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid128_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid128_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid135_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid135_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid142_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid142_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid114_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid114_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid113_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid113_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid127_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid127_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid134_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid134_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid141_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid141_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist3_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_d_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_1_b_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_0_b_5_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist9_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel4_0_b_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist10_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel3_0_b_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel2_0_b_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist12_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel1_0_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist13_sPostRndFull_uid44_fpToFxPTest_p6_of_6_q_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_sPostRndFull_uid44_fpToFxPTest_p5_of_6_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist15_sPostRndFull_uid44_fpToFxPTest_p4_of_6_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist16_sPostRndFull_uid44_fpToFxPTest_p3_of_6_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist17_sPostRndFull_uid44_fpToFxPTest_p2_of_6_q_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist18_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist19_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist20_shiftValE_uid31_fpToFxPTest_p1_of_2_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist21_udf_uid29_fpToFxPTest_p2_of_2_c_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ovfExpRange_uid27_fpToFxPTest_p2_of_2_c_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_eq3_uid79_fracXIsZero_uid13_fpToFxPTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sPostRnd_uid45_fpToFxPTest_b_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_shiftValRaw_uid32_fpToFxPTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist28_signX_uid25_fpToFxPTest_b_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_signX_uid25_fpToFxPTest_b_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_frac_x_uid10_fpToFxPTest_b_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist31_xIn_a_1_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- maxNegValueU_uid51_fpToFxPTest(CONSTANT,50)
    maxNegValueU_uid51_fpToFxPTest_q <= "00000000000000000000000000000000";

    -- maxNegValueS_uid40_fpToFxPTest(CONSTANT,39)
    maxNegValueS_uid40_fpToFxPTest_q <= "10000000000000000000000000000000";

    -- maxPosValueS_uid39_fpToFxPTest(CONSTANT,38)
    maxPosValueS_uid39_fpToFxPTest_q <= "01111111111111111111111111111111";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1(BITSELECT,274)
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(d0_uid43_fpToFxPTest_q(2 downto 2));

    -- d0_uid43_fpToFxPTest(CONSTANT,42)
    d0_uid43_fpToFxPTest_q <= "001";

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_b(BITJOIN,277)@8
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_b_q <= sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & d0_uid43_fpToFxPTest_q;

    -- redist31_xIn_a_1(DELAY,394)
    redist31_xIn_a_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => a, xout => redist31_xIn_a_1_q, clk => clk, aclr => areset );

    -- signX_uid25_fpToFxPTest(BITSELECT,24)@1
    signX_uid25_fpToFxPTest_b <= STD_LOGIC_VECTOR(redist31_xIn_a_1_q(31 downto 31));

    -- redist28_signX_uid25_fpToFxPTest_b_6(DELAY,391)
    redist28_signX_uid25_fpToFxPTest_b_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid25_fpToFxPTest_b, xout => redist28_signX_uid25_fpToFxPTest_b_6_q, clk => clk, aclr => areset );

    -- rightShiftStage2Idx3Pad3_uid108_rightShiferNoStickyOut_uid38_fpToFxPTest(CONSTANT,107)
    rightShiftStage2Idx3Pad3_uid108_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= "000";

    -- rightShiftStage2Idx3Rng3_uid107_rightShiferNoStickyOut_uid38_fpToFxPTest(BITSELECT,106)@6
    rightShiftStage2Idx3Rng3_uid107_rightShiferNoStickyOut_uid38_fpToFxPTest_b <= rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q(31 downto 3);

    -- rightShiftStage2Idx3_uid109_rightShiferNoStickyOut_uid38_fpToFxPTest(BITJOIN,108)@6
    rightShiftStage2Idx3_uid109_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage2Idx3Pad3_uid108_rightShiferNoStickyOut_uid38_fpToFxPTest_q & rightShiftStage2Idx3Rng3_uid107_rightShiferNoStickyOut_uid38_fpToFxPTest_b;

    -- rightShiftStage2Idx2Pad2_uid105_rightShiferNoStickyOut_uid38_fpToFxPTest(CONSTANT,104)
    rightShiftStage2Idx2Pad2_uid105_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= "00";

    -- rightShiftStage2Idx2Rng2_uid104_rightShiferNoStickyOut_uid38_fpToFxPTest(BITSELECT,103)@6
    rightShiftStage2Idx2Rng2_uid104_rightShiferNoStickyOut_uid38_fpToFxPTest_b <= rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q(31 downto 2);

    -- rightShiftStage2Idx2_uid106_rightShiferNoStickyOut_uid38_fpToFxPTest(BITJOIN,105)@6
    rightShiftStage2Idx2_uid106_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage2Idx2Pad2_uid105_rightShiferNoStickyOut_uid38_fpToFxPTest_q & rightShiftStage2Idx2Rng2_uid104_rightShiferNoStickyOut_uid38_fpToFxPTest_b;

    -- rightShiftStage2Idx1Rng1_uid101_rightShiferNoStickyOut_uid38_fpToFxPTest(BITSELECT,100)@6
    rightShiftStage2Idx1Rng1_uid101_rightShiferNoStickyOut_uid38_fpToFxPTest_b <= rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q(31 downto 1);

    -- rightShiftStage2Idx1_uid103_rightShiferNoStickyOut_uid38_fpToFxPTest(BITJOIN,102)@6
    rightShiftStage2Idx1_uid103_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid101_rightShiferNoStickyOut_uid38_fpToFxPTest_b;

    -- rightShiftStage1Idx3Pad12_uid97_rightShiferNoStickyOut_uid38_fpToFxPTest(CONSTANT,96)
    rightShiftStage1Idx3Pad12_uid97_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid96_rightShiferNoStickyOut_uid38_fpToFxPTest(BITSELECT,95)@5
    rightShiftStage1Idx3Rng12_uid96_rightShiferNoStickyOut_uid38_fpToFxPTest_b <= rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q(31 downto 12);

    -- rightShiftStage1Idx3_uid98_rightShiferNoStickyOut_uid38_fpToFxPTest(BITJOIN,97)@5
    rightShiftStage1Idx3_uid98_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage1Idx3Pad12_uid97_rightShiferNoStickyOut_uid38_fpToFxPTest_q & rightShiftStage1Idx3Rng12_uid96_rightShiferNoStickyOut_uid38_fpToFxPTest_b;

    -- cstAllZWE_uid8_fpToFxPTest(CONSTANT,7)
    cstAllZWE_uid8_fpToFxPTest_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid93_rightShiferNoStickyOut_uid38_fpToFxPTest(BITSELECT,92)@5
    rightShiftStage1Idx2Rng8_uid93_rightShiferNoStickyOut_uid38_fpToFxPTest_b <= rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q(31 downto 8);

    -- rightShiftStage1Idx2_uid95_rightShiferNoStickyOut_uid38_fpToFxPTest(BITJOIN,94)@5
    rightShiftStage1Idx2_uid95_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= cstAllZWE_uid8_fpToFxPTest_q & rightShiftStage1Idx2Rng8_uid93_rightShiferNoStickyOut_uid38_fpToFxPTest_b;

    -- rightShiftStage1Idx1Pad4_uid91_rightShiferNoStickyOut_uid38_fpToFxPTest(CONSTANT,90)
    rightShiftStage1Idx1Pad4_uid91_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid90_rightShiferNoStickyOut_uid38_fpToFxPTest(BITSELECT,89)@5
    rightShiftStage1Idx1Rng4_uid90_rightShiferNoStickyOut_uid38_fpToFxPTest_b <= rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q(31 downto 4);

    -- rightShiftStage1Idx1_uid92_rightShiferNoStickyOut_uid38_fpToFxPTest(BITJOIN,91)@5
    rightShiftStage1Idx1_uid92_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage1Idx1Pad4_uid91_rightShiferNoStickyOut_uid38_fpToFxPTest_q & rightShiftStage1Idx1Rng4_uid90_rightShiferNoStickyOut_uid38_fpToFxPTest_b;

    -- rightShiftStage0Idx1Pad16_uid84_rightShiferNoStickyOut_uid38_fpToFxPTest(CONSTANT,83)
    rightShiftStage0Idx1Pad16_uid84_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= "0000000000000000";

    -- rightShiftStage0Idx1Rng16_uid83_rightShiferNoStickyOut_uid38_fpToFxPTest(BITSELECT,82)@4
    rightShiftStage0Idx1Rng16_uid83_rightShiferNoStickyOut_uid38_fpToFxPTest_b <= shifterIn_uid37_fpToFxPTest_q(31 downto 16);

    -- rightShiftStage0Idx1_uid85_rightShiferNoStickyOut_uid38_fpToFxPTest(BITJOIN,84)@4
    rightShiftStage0Idx1_uid85_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage0Idx1Pad16_uid84_rightShiferNoStickyOut_uid38_fpToFxPTest_q & rightShiftStage0Idx1Rng16_uid83_rightShiferNoStickyOut_uid38_fpToFxPTest_b;

    -- c0_uid55_excZ_x_uid11_fpToFxPTest_merged_bit_select(BITSELECT,345)
    c0_uid55_excZ_x_uid11_fpToFxPTest_merged_bit_select_b <= cstAllZWE_uid8_fpToFxPTest_q(5 downto 0);
    c0_uid55_excZ_x_uid11_fpToFxPTest_merged_bit_select_c <= cstAllZWE_uid8_fpToFxPTest_q(7 downto 6);

    -- exp_x_uid9_fpToFxPTest(BITSELECT,8)@1
    exp_x_uid9_fpToFxPTest_b <= redist31_xIn_a_1_q(30 downto 23);

    -- z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select(BITSELECT,346)@1
    z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_b <= exp_x_uid9_fpToFxPTest_b(5 downto 0);
    z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_c <= exp_x_uid9_fpToFxPTest_b(7 downto 6);

    -- redist6_z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_c_1(DELAY,369)
    redist6_z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_c, xout => redist6_z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- eq1_uid59_excZ_x_uid11_fpToFxPTest(LOGICAL,58)@2 + 1
    eq1_uid59_excZ_x_uid11_fpToFxPTest_qi <= "1" WHEN redist6_z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_c_1_q = c0_uid55_excZ_x_uid11_fpToFxPTest_merged_bit_select_c ELSE "0";
    eq1_uid59_excZ_x_uid11_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid59_excZ_x_uid11_fpToFxPTest_qi, xout => eq1_uid59_excZ_x_uid11_fpToFxPTest_q, clk => clk, aclr => areset );

    -- y0_uid114_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select(BITSELECT,358)
    y0_uid114_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_b <= c0_uid55_excZ_x_uid11_fpToFxPTest_merged_bit_select_b(2 downto 0);
    y0_uid114_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_c <= c0_uid55_excZ_x_uid11_fpToFxPTest_merged_bit_select_b(5 downto 3);

    -- x0_uid113_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select(BITSELECT,359)@1
    x0_uid113_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_b <= z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_b(2 downto 0);
    x0_uid113_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_c <= z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid118_eq0_uid56_excZ_x_uid11_fpToFxPTest(LOGICAL,117)@1 + 1
    eq1_uid118_eq0_uid56_excZ_x_uid11_fpToFxPTest_qi <= "1" WHEN x0_uid113_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_c = y0_uid114_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_c ELSE "0";
    eq1_uid118_eq0_uid56_excZ_x_uid11_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid118_eq0_uid56_excZ_x_uid11_fpToFxPTest_qi, xout => eq1_uid118_eq0_uid56_excZ_x_uid11_fpToFxPTest_q, clk => clk, aclr => areset );

    -- eq0_uid115_eq0_uid56_excZ_x_uid11_fpToFxPTest(LOGICAL,114)@1 + 1
    eq0_uid115_eq0_uid56_excZ_x_uid11_fpToFxPTest_qi <= "1" WHEN x0_uid113_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_b = y0_uid114_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_b ELSE "0";
    eq0_uid115_eq0_uid56_excZ_x_uid11_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid115_eq0_uid56_excZ_x_uid11_fpToFxPTest_qi, xout => eq0_uid115_eq0_uid56_excZ_x_uid11_fpToFxPTest_q, clk => clk, aclr => areset );

    -- andEq_uid119_eq0_uid56_excZ_x_uid11_fpToFxPTest(LOGICAL,118)@2 + 1
    andEq_uid119_eq0_uid56_excZ_x_uid11_fpToFxPTest_qi <= eq0_uid115_eq0_uid56_excZ_x_uid11_fpToFxPTest_q and eq1_uid118_eq0_uid56_excZ_x_uid11_fpToFxPTest_q;
    andEq_uid119_eq0_uid56_excZ_x_uid11_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid119_eq0_uid56_excZ_x_uid11_fpToFxPTest_qi, xout => andEq_uid119_eq0_uid56_excZ_x_uid11_fpToFxPTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid60_excZ_x_uid11_fpToFxPTest(LOGICAL,59)@3 + 1
    and_lev0_uid60_excZ_x_uid11_fpToFxPTest_qi <= andEq_uid119_eq0_uid56_excZ_x_uid11_fpToFxPTest_q and eq1_uid59_excZ_x_uid11_fpToFxPTest_q;
    and_lev0_uid60_excZ_x_uid11_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid60_excZ_x_uid11_fpToFxPTest_qi, xout => and_lev0_uid60_excZ_x_uid11_fpToFxPTest_q, clk => clk, aclr => areset );

    -- invExcXZ_uid22_fpToFxPTest(LOGICAL,21)@4
    invExcXZ_uid22_fpToFxPTest_q <= not (and_lev0_uid60_excZ_x_uid11_fpToFxPTest_q);

    -- frac_x_uid10_fpToFxPTest(BITSELECT,9)@1
    frac_x_uid10_fpToFxPTest_b <= redist31_xIn_a_1_q(22 downto 0);

    -- redist30_frac_x_uid10_fpToFxPTest_b_3(DELAY,393)
    redist30_frac_x_uid10_fpToFxPTest_b_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_x_uid10_fpToFxPTest_b, xout => redist30_frac_x_uid10_fpToFxPTest_b_3_q, clk => clk, aclr => areset );

    -- oFracX_uid23_fpToFxPTest(BITJOIN,22)@4
    oFracX_uid23_fpToFxPTest_q <= invExcXZ_uid22_fpToFxPTest_q & redist30_frac_x_uid10_fpToFxPTest_b_3_q;

    -- shifterIn_uid37_fpToFxPTest(BITJOIN,36)@4
    shifterIn_uid37_fpToFxPTest_q <= oFracX_uid23_fpToFxPTest_q & cstAllZWE_uid8_fpToFxPTest_q;

    -- maxShiftCst_uid33_fpToFxPTest(CONSTANT,32)
    maxShiftCst_uid33_fpToFxPTest_q <= "100000";

    -- ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel0_0(BITSELECT,220)@0
    ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(a(28 downto 23));

    -- ovfExpVal_uid30_fpToFxPTest(CONSTANT,29)
    ovfExpVal_uid30_fpToFxPTest_q <= "010011101";

    -- shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel0_0(BITSELECT,241)
    shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(ovfExpVal_uid30_fpToFxPTest_q(5 downto 0));

    -- shiftValE_uid31_fpToFxPTest_p1_of_2(SUB,176)@0 + 1
    shiftValE_uid31_fpToFxPTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel0_0_b);
    shiftValE_uid31_fpToFxPTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel0_0_b);
    shiftValE_uid31_fpToFxPTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValE_uid31_fpToFxPTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftValE_uid31_fpToFxPTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValE_uid31_fpToFxPTest_p1_of_2_a) - UNSIGNED(shiftValE_uid31_fpToFxPTest_p1_of_2_b));
        END IF;
    END PROCESS;
    shiftValE_uid31_fpToFxPTest_p1_of_2_c(0) <= shiftValE_uid31_fpToFxPTest_p1_of_2_o(6);
    shiftValE_uid31_fpToFxPTest_p1_of_2_q <= shiftValE_uid31_fpToFxPTest_p1_of_2_o(5 downto 0);

    -- ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel1_0(BITSELECT,222)@1
    ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(redist31_xIn_a_1_q(30 downto 29));

    -- ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,224)@1
    ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q <= rightShiftStage2Idx2Pad2_uid105_rightShiferNoStickyOut_uid38_fpToFxPTest_q & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel1_0_b;

    -- shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel1_1(BITSELECT,244)
    shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(ovfExpVal_uid30_fpToFxPTest_q(8 downto 8));

    -- shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel1_0(BITSELECT,243)
    shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(ovfExpVal_uid30_fpToFxPTest_q(8 downto 6));

    -- shiftValE_uid31_fpToFxPTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,245)@1
    shiftValE_uid31_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q <= shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel1_1_b & shiftValE_uid31_fpToFxPTest_BitSelect_for_a_tessel1_0_b;

    -- shiftValE_uid31_fpToFxPTest_p2_of_2(SUB,177)@1 + 1
    shiftValE_uid31_fpToFxPTest_p2_of_2_cin <= shiftValE_uid31_fpToFxPTest_p1_of_2_c;
    shiftValE_uid31_fpToFxPTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => shiftValE_uid31_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q(3)) & shiftValE_uid31_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q) & '0');
    shiftValE_uid31_fpToFxPTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q) & shiftValE_uid31_fpToFxPTest_p2_of_2_cin(0));
    shiftValE_uid31_fpToFxPTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValE_uid31_fpToFxPTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftValE_uid31_fpToFxPTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(shiftValE_uid31_fpToFxPTest_p2_of_2_a) - SIGNED(shiftValE_uid31_fpToFxPTest_p2_of_2_b));
        END IF;
    END PROCESS;
    shiftValE_uid31_fpToFxPTest_p2_of_2_q <= shiftValE_uid31_fpToFxPTest_p2_of_2_o(4 downto 1);

    -- redist20_shiftValE_uid31_fpToFxPTest_p1_of_2_q_1(DELAY,383)
    redist20_shiftValE_uid31_fpToFxPTest_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => shiftValE_uid31_fpToFxPTest_p1_of_2_q, xout => redist20_shiftValE_uid31_fpToFxPTest_p1_of_2_q_1_q, clk => clk, aclr => areset );

    -- shiftValE_uid31_fpToFxPTest_BitJoin_for_q(BITJOIN,178)@2
    shiftValE_uid31_fpToFxPTest_BitJoin_for_q_q <= shiftValE_uid31_fpToFxPTest_p2_of_2_q & redist20_shiftValE_uid31_fpToFxPTest_p1_of_2_q_1_q;

    -- shiftValRaw_uid32_fpToFxPTest(BITSELECT,31)@2
    shiftValRaw_uid32_fpToFxPTest_in <= shiftValE_uid31_fpToFxPTest_BitJoin_for_q_q(5 downto 0);
    shiftValRaw_uid32_fpToFxPTest_b <= shiftValRaw_uid32_fpToFxPTest_in(5 downto 0);

    -- redist27_shiftValRaw_uid32_fpToFxPTest_b_1(DELAY,390)
    redist27_shiftValRaw_uid32_fpToFxPTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => shiftValRaw_uid32_fpToFxPTest_b, xout => redist27_shiftValRaw_uid32_fpToFxPTest_b_1_q, clk => clk, aclr => areset );

    -- shiftOutOfRange_uid34_fpToFxPTest_p1_of_2(COMPARE,186)@1 + 1
    shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & shiftValE_uid31_fpToFxPTest_p1_of_2_q);
    shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & maxShiftCst_uid33_fpToFxPTest_q);
    shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_a) - UNSIGNED(shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_b));
        END IF;
    END PROCESS;
    shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_c(0) <= shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_o(6);

    -- shiftOutOfRange_uid34_fpToFxPTest_UpperBits_for_b(CONSTANT,183)
    shiftOutOfRange_uid34_fpToFxPTest_UpperBits_for_b_q <= "00000";

    -- shiftOutOfRange_uid34_fpToFxPTest_BitSelect_for_a_tessel1_1(BITSELECT,254)@2
    shiftOutOfRange_uid34_fpToFxPTest_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(shiftValE_uid31_fpToFxPTest_p2_of_2_q(3 downto 3));

    -- shiftOutOfRange_uid34_fpToFxPTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,255)@2
    shiftOutOfRange_uid34_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q <= shiftOutOfRange_uid34_fpToFxPTest_BitSelect_for_a_tessel1_1_b & shiftValE_uid31_fpToFxPTest_p2_of_2_q;

    -- shiftOutOfRange_uid34_fpToFxPTest_p2_of_2(COMPARE,187)@2 + 1
    shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_cin <= shiftOutOfRange_uid34_fpToFxPTest_p1_of_2_c;
    shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => shiftOutOfRange_uid34_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q(4)) & shiftOutOfRange_uid34_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q) & '0');
    shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & shiftOutOfRange_uid34_fpToFxPTest_UpperBits_for_b_q) & shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_cin(0));
    shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_a) - SIGNED(shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_b));
        END IF;
    END PROCESS;
    shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_c(0) <= shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_o(6);

    -- shiftOutOfRange_uid34_fpToFxPTest_cout_n(LOGICAL,189)@3
    shiftOutOfRange_uid34_fpToFxPTest_cout_n_q <= STD_LOGIC_VECTOR(not (shiftOutOfRange_uid34_fpToFxPTest_p2_of_2_c));

    -- shiftVal_uid35_fpToFxPTest(MUX,34)@3 + 1
    shiftVal_uid35_fpToFxPTest_s <= shiftOutOfRange_uid34_fpToFxPTest_cout_n_q;
    shiftVal_uid35_fpToFxPTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftVal_uid35_fpToFxPTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (shiftVal_uid35_fpToFxPTest_s) IS
                WHEN "0" => shiftVal_uid35_fpToFxPTest_q <= redist27_shiftValRaw_uid32_fpToFxPTest_b_1_q;
                WHEN "1" => shiftVal_uid35_fpToFxPTest_q <= maxShiftCst_uid33_fpToFxPTest_q;
                WHEN OTHERS => shiftVal_uid35_fpToFxPTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select(BITSELECT,348)@4
    rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_b <= shiftVal_uid35_fpToFxPTest_q(5 downto 4);
    rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_c <= shiftVal_uid35_fpToFxPTest_q(3 downto 2);
    rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_d <= shiftVal_uid35_fpToFxPTest_q(1 downto 0);

    -- rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest(MUX,88)@4 + 1
    rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_s <= rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_b;
    rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_s) IS
                WHEN "00" => rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= shifterIn_uid37_fpToFxPTest_q;
                WHEN "01" => rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage0Idx1_uid85_rightShiferNoStickyOut_uid38_fpToFxPTest_q;
                WHEN "10" => rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= maxNegValueU_uid51_fpToFxPTest_q;
                WHEN "11" => rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= maxNegValueU_uid51_fpToFxPTest_q;
                WHEN OTHERS => rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist4_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_c_1(DELAY,367)
    redist4_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_c, xout => redist4_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest(MUX,99)@5 + 1
    rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_s <= redist4_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_c_1_q;
    rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_s) IS
                WHEN "00" => rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage0_uid89_rightShiferNoStickyOut_uid38_fpToFxPTest_q;
                WHEN "01" => rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage1Idx1_uid92_rightShiferNoStickyOut_uid38_fpToFxPTest_q;
                WHEN "10" => rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage1Idx2_uid95_rightShiferNoStickyOut_uid38_fpToFxPTest_q;
                WHEN "11" => rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage1Idx3_uid98_rightShiferNoStickyOut_uid38_fpToFxPTest_q;
                WHEN OTHERS => rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_d_2(DELAY,368)
    redist5_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_d_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_d, xout => redist5_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_d_2_q, clk => clk, aclr => areset );

    -- rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest(MUX,110)@6 + 1
    rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_s <= redist5_rightShiftStageSel5Dto4_uid88_rightShiferNoStickyOut_uid38_fpToFxPTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_s) IS
                WHEN "00" => rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage1_uid100_rightShiferNoStickyOut_uid38_fpToFxPTest_q;
                WHEN "01" => rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage2Idx1_uid103_rightShiferNoStickyOut_uid38_fpToFxPTest_q;
                WHEN "10" => rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage2Idx2_uid106_rightShiferNoStickyOut_uid38_fpToFxPTest_q;
                WHEN "11" => rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= rightShiftStage2Idx3_uid109_rightShiferNoStickyOut_uid38_fpToFxPTest_q;
                WHEN OTHERS => rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- zRightShiferNoStickyOut_uid41_fpToFxPTest(BITJOIN,40)@7
    zRightShiferNoStickyOut_uid41_fpToFxPTest_q <= GND_q & rightShiftStage2_uid111_rightShiferNoStickyOut_uid38_fpToFxPTest_q;

    -- xXorSignE_uid42_fpToFxPTest(LOGICAL,41)@7 + 1
    xXorSignE_uid42_fpToFxPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 1 => redist28_signX_uid25_fpToFxPTest_b_6_q(0)) & redist28_signX_uid25_fpToFxPTest_b_6_q));
    xXorSignE_uid42_fpToFxPTest_qi <= zRightShiferNoStickyOut_uid41_fpToFxPTest_q xor xXorSignE_uid42_fpToFxPTest_b;
    xXorSignE_uid42_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xXorSignE_uid42_fpToFxPTest_qi, xout => xXorSignE_uid42_fpToFxPTest_q, clk => clk, aclr => areset );

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel0_0(BITSELECT,260)@8
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(xXorSignE_uid42_fpToFxPTest_q(5 downto 0));

    -- sPostRndFull_uid44_fpToFxPTest_p1_of_6(ADD,198)@8 + 1
    sPostRndFull_uid44_fpToFxPTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel0_0_b);
    sPostRndFull_uid44_fpToFxPTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_b_q);
    sPostRndFull_uid44_fpToFxPTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p1_of_6_a) + UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p1_of_6_b));
        END IF;
    END PROCESS;
    sPostRndFull_uid44_fpToFxPTest_p1_of_6_c(0) <= sPostRndFull_uid44_fpToFxPTest_p1_of_6_o(6);
    sPostRndFull_uid44_fpToFxPTest_p1_of_6_q <= sPostRndFull_uid44_fpToFxPTest_p1_of_6_o(5 downto 0);

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel1_0(BITSELECT,262)@8
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(xXorSignE_uid42_fpToFxPTest_q(11 downto 6));

    -- redist12_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel1_0_b_1(DELAY,375)
    redist12_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel1_0_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel1_0_b, xout => redist12_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel1_0_b_1_q, clk => clk, aclr => areset );

    -- sPostRndFull_uid44_fpToFxPTest_p2_of_6(ADD,199)@9 + 1
    sPostRndFull_uid44_fpToFxPTest_p2_of_6_cin <= sPostRndFull_uid44_fpToFxPTest_p1_of_6_c;
    sPostRndFull_uid44_fpToFxPTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & redist12_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel1_0_b_1_q) & '1';
    sPostRndFull_uid44_fpToFxPTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q) & sPostRndFull_uid44_fpToFxPTest_p2_of_6_cin(0);
    sPostRndFull_uid44_fpToFxPTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p2_of_6_a) + UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p2_of_6_b));
        END IF;
    END PROCESS;
    sPostRndFull_uid44_fpToFxPTest_p2_of_6_c(0) <= sPostRndFull_uid44_fpToFxPTest_p2_of_6_o(7);
    sPostRndFull_uid44_fpToFxPTest_p2_of_6_q <= sPostRndFull_uid44_fpToFxPTest_p2_of_6_o(6 downto 1);

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel2_0(BITSELECT,264)@8
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(xXorSignE_uid42_fpToFxPTest_q(17 downto 12));

    -- redist11_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel2_0_b_2(DELAY,374)
    redist11_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel2_0_b_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel2_0_b, xout => redist11_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel2_0_b_2_q, clk => clk, aclr => areset );

    -- sPostRndFull_uid44_fpToFxPTest_p3_of_6(ADD,200)@10 + 1
    sPostRndFull_uid44_fpToFxPTest_p3_of_6_cin <= sPostRndFull_uid44_fpToFxPTest_p2_of_6_c;
    sPostRndFull_uid44_fpToFxPTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & redist11_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel2_0_b_2_q) & '1';
    sPostRndFull_uid44_fpToFxPTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q) & sPostRndFull_uid44_fpToFxPTest_p3_of_6_cin(0);
    sPostRndFull_uid44_fpToFxPTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p3_of_6_a) + UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p3_of_6_b));
        END IF;
    END PROCESS;
    sPostRndFull_uid44_fpToFxPTest_p3_of_6_c(0) <= sPostRndFull_uid44_fpToFxPTest_p3_of_6_o(7);
    sPostRndFull_uid44_fpToFxPTest_p3_of_6_q <= sPostRndFull_uid44_fpToFxPTest_p3_of_6_o(6 downto 1);

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel3_0(BITSELECT,266)@8
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel3_0_b <= STD_LOGIC_VECTOR(xXorSignE_uid42_fpToFxPTest_q(23 downto 18));

    -- redist10_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel3_0_b_3(DELAY,373)
    redist10_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel3_0_b_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel3_0_b, xout => redist10_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel3_0_b_3_q, clk => clk, aclr => areset );

    -- sPostRndFull_uid44_fpToFxPTest_p4_of_6(ADD,201)@11 + 1
    sPostRndFull_uid44_fpToFxPTest_p4_of_6_cin <= sPostRndFull_uid44_fpToFxPTest_p3_of_6_c;
    sPostRndFull_uid44_fpToFxPTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & redist10_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel3_0_b_3_q) & '1';
    sPostRndFull_uid44_fpToFxPTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q) & sPostRndFull_uid44_fpToFxPTest_p4_of_6_cin(0);
    sPostRndFull_uid44_fpToFxPTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p4_of_6_a) + UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p4_of_6_b));
        END IF;
    END PROCESS;
    sPostRndFull_uid44_fpToFxPTest_p4_of_6_c(0) <= sPostRndFull_uid44_fpToFxPTest_p4_of_6_o(7);
    sPostRndFull_uid44_fpToFxPTest_p4_of_6_q <= sPostRndFull_uid44_fpToFxPTest_p4_of_6_o(6 downto 1);

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,284)@9
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q <= sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b;

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel4_0(BITSELECT,268)@8
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel4_0_b <= STD_LOGIC_VECTOR(xXorSignE_uid42_fpToFxPTest_q(29 downto 24));

    -- redist9_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel4_0_b_4(DELAY,372)
    redist9_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel4_0_b_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel4_0_b, xout => redist9_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel4_0_b_4_q, clk => clk, aclr => areset );

    -- sPostRndFull_uid44_fpToFxPTest_p5_of_6(ADD,202)@12 + 1
    sPostRndFull_uid44_fpToFxPTest_p5_of_6_cin <= sPostRndFull_uid44_fpToFxPTest_p4_of_6_c;
    sPostRndFull_uid44_fpToFxPTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & redist9_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel4_0_b_4_q) & '1';
    sPostRndFull_uid44_fpToFxPTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q) & sPostRndFull_uid44_fpToFxPTest_p5_of_6_cin(0);
    sPostRndFull_uid44_fpToFxPTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p5_of_6_a) + UNSIGNED(sPostRndFull_uid44_fpToFxPTest_p5_of_6_b));
        END IF;
    END PROCESS;
    sPostRndFull_uid44_fpToFxPTest_p5_of_6_c(0) <= sPostRndFull_uid44_fpToFxPTest_p5_of_6_o(7);
    sPostRndFull_uid44_fpToFxPTest_p5_of_6_q <= sPostRndFull_uid44_fpToFxPTest_p5_of_6_o(6 downto 1);

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_g(BITJOIN,310)@13
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_g_q <= sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_tessel0_1_b;

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_1(BITSELECT,271)@8
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_1_b <= STD_LOGIC_VECTOR(xXorSignE_uid42_fpToFxPTest_q(32 downto 32));

    -- redist7_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_1_b_5(DELAY,370)
    redist7_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_1_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_1_b, xout => redist7_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_1_b_5_q, clk => clk, aclr => areset );

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_0(BITSELECT,270)@8
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_0_b <= STD_LOGIC_VECTOR(xXorSignE_uid42_fpToFxPTest_q(32 downto 30));

    -- redist8_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_0_b_5(DELAY,371)
    redist8_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_0_b_5 : dspba_delay
    GENERIC MAP ( width => 3, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_0_b, xout => redist8_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_0_b_5_q, clk => clk, aclr => areset );

    -- sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_BitJoin_for_g(BITJOIN,272)@13
    sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_BitJoin_for_g_q <= redist7_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_1_b_5_q & redist8_sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_tessel5_0_b_5_q;

    -- sPostRndFull_uid44_fpToFxPTest_p6_of_6(ADD,203)@13 + 1
    sPostRndFull_uid44_fpToFxPTest_p6_of_6_cin <= sPostRndFull_uid44_fpToFxPTest_p5_of_6_c;
    sPostRndFull_uid44_fpToFxPTest_p6_of_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_BitJoin_for_g_q(3)) & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_a_BitJoin_for_g_q) & '1');
    sPostRndFull_uid44_fpToFxPTest_p6_of_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_g_q(3)) & sPostRndFull_uid44_fpToFxPTest_BitSelect_for_b_BitJoin_for_g_q) & sPostRndFull_uid44_fpToFxPTest_p6_of_6_cin(0));
    sPostRndFull_uid44_fpToFxPTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sPostRndFull_uid44_fpToFxPTest_p6_of_6_o <= STD_LOGIC_VECTOR(SIGNED(sPostRndFull_uid44_fpToFxPTest_p6_of_6_a) + SIGNED(sPostRndFull_uid44_fpToFxPTest_p6_of_6_b));
        END IF;
    END PROCESS;
    sPostRndFull_uid44_fpToFxPTest_p6_of_6_q <= sPostRndFull_uid44_fpToFxPTest_p6_of_6_o(4 downto 1);

    -- redist13_sPostRndFull_uid44_fpToFxPTest_p6_of_6_q_1(DELAY,376)
    redist13_sPostRndFull_uid44_fpToFxPTest_p6_of_6_q_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_p6_of_6_q, xout => redist13_sPostRndFull_uid44_fpToFxPTest_p6_of_6_q_1_q, clk => clk, aclr => areset );

    -- redist14_sPostRndFull_uid44_fpToFxPTest_p5_of_6_q_2(DELAY,377)
    redist14_sPostRndFull_uid44_fpToFxPTest_p5_of_6_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_p5_of_6_q, xout => redist14_sPostRndFull_uid44_fpToFxPTest_p5_of_6_q_2_q, clk => clk, aclr => areset );

    -- redist15_sPostRndFull_uid44_fpToFxPTest_p4_of_6_q_3(DELAY,378)
    redist15_sPostRndFull_uid44_fpToFxPTest_p4_of_6_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_p4_of_6_q, xout => redist15_sPostRndFull_uid44_fpToFxPTest_p4_of_6_q_3_q, clk => clk, aclr => areset );

    -- redist16_sPostRndFull_uid44_fpToFxPTest_p3_of_6_q_4(DELAY,379)
    redist16_sPostRndFull_uid44_fpToFxPTest_p3_of_6_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_p3_of_6_q, xout => redist16_sPostRndFull_uid44_fpToFxPTest_p3_of_6_q_4_q, clk => clk, aclr => areset );

    -- redist17_sPostRndFull_uid44_fpToFxPTest_p2_of_6_q_5(DELAY,380)
    redist17_sPostRndFull_uid44_fpToFxPTest_p2_of_6_q_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_p2_of_6_q, xout => redist17_sPostRndFull_uid44_fpToFxPTest_p2_of_6_q_5_q, clk => clk, aclr => areset );

    -- redist18_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_1(DELAY,381)
    redist18_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRndFull_uid44_fpToFxPTest_p1_of_6_q, xout => redist18_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_1_q, clk => clk, aclr => areset );

    -- redist19_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_6(DELAY,382)
    redist19_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_6 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist18_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_1_q, xout => redist19_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_6_q, clk => clk, aclr => areset );

    -- sPostRndFull_uid44_fpToFxPTest_BitJoin_for_q(BITJOIN,204)@15
    sPostRndFull_uid44_fpToFxPTest_BitJoin_for_q_q <= redist13_sPostRndFull_uid44_fpToFxPTest_p6_of_6_q_1_q & redist14_sPostRndFull_uid44_fpToFxPTest_p5_of_6_q_2_q & redist15_sPostRndFull_uid44_fpToFxPTest_p4_of_6_q_3_q & redist16_sPostRndFull_uid44_fpToFxPTest_p3_of_6_q_4_q & redist17_sPostRndFull_uid44_fpToFxPTest_p2_of_6_q_5_q & redist19_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_6_q;

    -- sPostRnd_uid45_fpToFxPTest(BITSELECT,44)@15
    sPostRnd_uid45_fpToFxPTest_in <= sPostRndFull_uid44_fpToFxPTest_BitJoin_for_q_q(32 downto 0);
    sPostRnd_uid45_fpToFxPTest_b <= sPostRnd_uid45_fpToFxPTest_in(32 downto 1);

    -- redist26_sPostRnd_uid45_fpToFxPTest_b_3(DELAY,389)
    redist26_sPostRnd_uid45_fpToFxPTest_b_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => sPostRnd_uid45_fpToFxPTest_b, xout => redist26_sPostRnd_uid45_fpToFxPTest_b_3_q, clk => clk, aclr => areset );

    -- redist29_signX_uid25_fpToFxPTest_b_16(DELAY,392)
    redist29_signX_uid25_fpToFxPTest_b_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist28_signX_uid25_fpToFxPTest_b_6_q, xout => redist29_signX_uid25_fpToFxPTest_b_16_q, clk => clk, aclr => areset );

    -- udfExpVal_uid28_fpToFxPTest(CONSTANT,27)
    udfExpVal_uid28_fpToFxPTest_q <= "01111101";

    -- udf_uid29_fpToFxPTest_BitSelect_for_a_tessel0_0(BITSELECT,230)
    udf_uid29_fpToFxPTest_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(udfExpVal_uid28_fpToFxPTest_q(5 downto 0));

    -- udf_uid29_fpToFxPTest_p1_of_2(COMPARE,165)@0 + 1
    udf_uid29_fpToFxPTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & udf_uid29_fpToFxPTest_BitSelect_for_a_tessel0_0_b);
    udf_uid29_fpToFxPTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel0_0_b);
    udf_uid29_fpToFxPTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            udf_uid29_fpToFxPTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            udf_uid29_fpToFxPTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(udf_uid29_fpToFxPTest_p1_of_2_a) - UNSIGNED(udf_uid29_fpToFxPTest_p1_of_2_b));
        END IF;
    END PROCESS;
    udf_uid29_fpToFxPTest_p1_of_2_c(0) <= udf_uid29_fpToFxPTest_p1_of_2_o(6);

    -- udf_uid29_fpToFxPTest_BitSelect_for_a_tessel1_1(BITSELECT,233)
    udf_uid29_fpToFxPTest_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(udfExpVal_uid28_fpToFxPTest_q(7 downto 7));

    -- udf_uid29_fpToFxPTest_BitSelect_for_a_tessel1_0(BITSELECT,232)
    udf_uid29_fpToFxPTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(udfExpVal_uid28_fpToFxPTest_q(7 downto 6));

    -- udf_uid29_fpToFxPTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,235)@1
    udf_uid29_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q <= udf_uid29_fpToFxPTest_BitSelect_for_a_tessel1_1_b & udf_uid29_fpToFxPTest_BitSelect_for_a_tessel1_1_b & udf_uid29_fpToFxPTest_BitSelect_for_a_tessel1_0_b;

    -- udf_uid29_fpToFxPTest_p2_of_2(COMPARE,166)@1 + 1
    udf_uid29_fpToFxPTest_p2_of_2_cin <= udf_uid29_fpToFxPTest_p1_of_2_c;
    udf_uid29_fpToFxPTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => udf_uid29_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q(3)) & udf_uid29_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q) & '0');
    udf_uid29_fpToFxPTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q) & udf_uid29_fpToFxPTest_p2_of_2_cin(0));
    udf_uid29_fpToFxPTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            udf_uid29_fpToFxPTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            udf_uid29_fpToFxPTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid29_fpToFxPTest_p2_of_2_a) - SIGNED(udf_uid29_fpToFxPTest_p2_of_2_b));
        END IF;
    END PROCESS;
    udf_uid29_fpToFxPTest_p2_of_2_c(0) <= udf_uid29_fpToFxPTest_p2_of_2_o(5);

    -- redist21_udf_uid29_fpToFxPTest_p2_of_2_c_15(DELAY,384)
    redist21_udf_uid29_fpToFxPTest_p2_of_2_c_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => udf_uid29_fpToFxPTest_p2_of_2_c, xout => redist21_udf_uid29_fpToFxPTest_p2_of_2_c_15_q, clk => clk, aclr => areset );

    -- udf_uid29_fpToFxPTest_cout_n(LOGICAL,168)@17
    udf_uid29_fpToFxPTest_cout_n_q <= STD_LOGIC_VECTOR(not (redist21_udf_uid29_fpToFxPTest_p2_of_2_c_15_q));

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select(BITSELECT,350)@10
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(sPostRndFull_uid44_fpToFxPTest_p2_of_6_q(0 downto 0));
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(sPostRndFull_uid44_fpToFxPTest_p2_of_6_q(5 downto 1));

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_0(BITSELECT,324)@10
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(redist18_sPostRndFull_uid44_fpToFxPTest_p1_of_6_q_1_q(5 downto 1));

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_b(BITJOIN,326)@10
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_b_q <= rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_b & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_0_b;

    -- rndOvfPos_uid47_fpToFxPTest_p1_of_6(COMPARE,212)@10 + 1
    rndOvfPos_uid47_fpToFxPTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_b);
    rndOvfPos_uid47_fpToFxPTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_b_q);
    rndOvfPos_uid47_fpToFxPTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p1_of_6_a) - UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p1_of_6_b));
        END IF;
    END PROCESS;
    rndOvfPos_uid47_fpToFxPTest_p1_of_6_c(0) <= rndOvfPos_uid47_fpToFxPTest_p1_of_6_o(6);

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select(BITSELECT,351)@11
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_b <= STD_LOGIC_VECTOR(sPostRndFull_uid44_fpToFxPTest_p3_of_6_q(0 downto 0));
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_c <= STD_LOGIC_VECTOR(sPostRndFull_uid44_fpToFxPTest_p3_of_6_q(5 downto 1));

    -- redist3_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1(DELAY,366)
    redist3_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_c, xout => redist3_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,329)@11
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q <= rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_b & redist3_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1_q;

    -- rndOvfPos_uid47_fpToFxPTest_p2_of_6(COMPARE,213)@11 + 1
    rndOvfPos_uid47_fpToFxPTest_p2_of_6_cin <= rndOvfPos_uid47_fpToFxPTest_p1_of_6_c;
    rndOvfPos_uid47_fpToFxPTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_c) & '0';
    rndOvfPos_uid47_fpToFxPTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q) & rndOvfPos_uid47_fpToFxPTest_p2_of_6_cin(0);
    rndOvfPos_uid47_fpToFxPTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p2_of_6_a) - UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p2_of_6_b));
        END IF;
    END PROCESS;
    rndOvfPos_uid47_fpToFxPTest_p2_of_6_c(0) <= rndOvfPos_uid47_fpToFxPTest_p2_of_6_o(7);

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select(BITSELECT,352)@12
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_b <= STD_LOGIC_VECTOR(sPostRndFull_uid44_fpToFxPTest_p4_of_6_q(0 downto 0));
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_c <= STD_LOGIC_VECTOR(sPostRndFull_uid44_fpToFxPTest_p4_of_6_q(5 downto 1));

    -- redist2_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_c_1(DELAY,365)
    redist2_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_c, xout => redist2_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_d(BITJOIN,332)@12
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_d_q <= rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_b & redist2_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel1_1_merged_bit_select_c_1_q;

    -- rndOvfPos_uid47_fpToFxPTest_p3_of_6(COMPARE,214)@12 + 1
    rndOvfPos_uid47_fpToFxPTest_p3_of_6_cin <= rndOvfPos_uid47_fpToFxPTest_p2_of_6_c;
    rndOvfPos_uid47_fpToFxPTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_d) & '0';
    rndOvfPos_uid47_fpToFxPTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_d_q) & rndOvfPos_uid47_fpToFxPTest_p3_of_6_cin(0);
    rndOvfPos_uid47_fpToFxPTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p3_of_6_a) - UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p3_of_6_b));
        END IF;
    END PROCESS;
    rndOvfPos_uid47_fpToFxPTest_p3_of_6_c(0) <= rndOvfPos_uid47_fpToFxPTest_p3_of_6_o(7);

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select(BITSELECT,353)@13
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_b <= STD_LOGIC_VECTOR(sPostRndFull_uid44_fpToFxPTest_p5_of_6_q(0 downto 0));
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_c <= STD_LOGIC_VECTOR(sPostRndFull_uid44_fpToFxPTest_p5_of_6_q(5 downto 1));

    -- redist1_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_c_1(DELAY,364)
    redist1_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_c, xout => redist1_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_e(BITJOIN,335)@13
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_e_q <= rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_b & redist1_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel2_1_merged_bit_select_c_1_q;

    -- rndOvfPos_uid47_fpToFxPTest_p4_of_6(COMPARE,215)@13 + 1
    rndOvfPos_uid47_fpToFxPTest_p4_of_6_cin <= rndOvfPos_uid47_fpToFxPTest_p3_of_6_c;
    rndOvfPos_uid47_fpToFxPTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_e) & '0';
    rndOvfPos_uid47_fpToFxPTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_e_q) & rndOvfPos_uid47_fpToFxPTest_p4_of_6_cin(0);
    rndOvfPos_uid47_fpToFxPTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p4_of_6_a) - UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p4_of_6_b));
        END IF;
    END PROCESS;
    rndOvfPos_uid47_fpToFxPTest_p4_of_6_c(0) <= rndOvfPos_uid47_fpToFxPTest_p4_of_6_o(7);

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel4_1(BITSELECT,337)@14
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel4_1_b <= STD_LOGIC_VECTOR(sPostRndFull_uid44_fpToFxPTest_p6_of_6_q(0 downto 0));

    -- redist0_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_c_1(DELAY,363)
    redist0_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_c, xout => redist0_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_f(BITJOIN,338)@14
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_f_q <= rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel4_1_b & redist0_rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel3_1_merged_bit_select_c_1_q;

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select(BITSELECT,349)
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(maxPosValueS_uid39_fpToFxPTest_q(5 downto 0));
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(maxPosValueS_uid39_fpToFxPTest_q(11 downto 6));
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_d <= STD_LOGIC_VECTOR(maxPosValueS_uid39_fpToFxPTest_q(17 downto 12));
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_e <= STD_LOGIC_VECTOR(maxPosValueS_uid39_fpToFxPTest_q(23 downto 18));
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_f <= STD_LOGIC_VECTOR(maxPosValueS_uid39_fpToFxPTest_q(29 downto 24));
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_g <= STD_LOGIC_VECTOR(maxPosValueS_uid39_fpToFxPTest_q(31 downto 30));

    -- rndOvfPos_uid47_fpToFxPTest_p5_of_6(COMPARE,216)@14 + 1
    rndOvfPos_uid47_fpToFxPTest_p5_of_6_cin <= rndOvfPos_uid47_fpToFxPTest_p4_of_6_c;
    rndOvfPos_uid47_fpToFxPTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_f) & '0';
    rndOvfPos_uid47_fpToFxPTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_f_q) & rndOvfPos_uid47_fpToFxPTest_p5_of_6_cin(0);
    rndOvfPos_uid47_fpToFxPTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p5_of_6_a) - UNSIGNED(rndOvfPos_uid47_fpToFxPTest_p5_of_6_b));
        END IF;
    END PROCESS;
    rndOvfPos_uid47_fpToFxPTest_p5_of_6_c(0) <= rndOvfPos_uid47_fpToFxPTest_p5_of_6_o(7);

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel5_1(BITSELECT,340)@15
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel5_1_b <= STD_LOGIC_VECTOR(redist13_sPostRndFull_uid44_fpToFxPTest_p6_of_6_q_1_q(3 downto 3));

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel5_0(BITSELECT,339)@15
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel5_0_b <= STD_LOGIC_VECTOR(redist13_sPostRndFull_uid44_fpToFxPTest_p6_of_6_q_1_q(3 downto 1));

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_g(BITJOIN,342)@15
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_g_q <= rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel5_1_b & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel5_1_b & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_tessel5_0_b;

    -- rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_BitJoin_for_g(BITJOIN,323)@15
    rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_BitJoin_for_g_q <= rightShiftStage2Idx3Pad3_uid108_rightShiferNoStickyOut_uid38_fpToFxPTest_q & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_tessel0_0_merged_bit_select_g;

    -- rndOvfPos_uid47_fpToFxPTest_p6_of_6(COMPARE,217)@15 + 1
    rndOvfPos_uid47_fpToFxPTest_p6_of_6_cin <= rndOvfPos_uid47_fpToFxPTest_p5_of_6_c;
    rndOvfPos_uid47_fpToFxPTest_p6_of_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_a_BitJoin_for_g_q) & '0');
    rndOvfPos_uid47_fpToFxPTest_p6_of_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_g_q(4)) & rndOvfPos_uid47_fpToFxPTest_BitSelect_for_b_BitJoin_for_g_q) & rndOvfPos_uid47_fpToFxPTest_p6_of_6_cin(0));
    rndOvfPos_uid47_fpToFxPTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndOvfPos_uid47_fpToFxPTest_p6_of_6_o <= STD_LOGIC_VECTOR(SIGNED(rndOvfPos_uid47_fpToFxPTest_p6_of_6_a) - SIGNED(rndOvfPos_uid47_fpToFxPTest_p6_of_6_b));
        END IF;
    END PROCESS;
    rndOvfPos_uid47_fpToFxPTest_p6_of_6_c(0) <= rndOvfPos_uid47_fpToFxPTest_p6_of_6_o(6);

    -- ovfExpVal_uid26_fpToFxPTest(CONSTANT,25)
    ovfExpVal_uid26_fpToFxPTest_q <= "010011110";

    -- ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel0_0(BITSELECT,225)
    ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(ovfExpVal_uid26_fpToFxPTest_q(5 downto 0));

    -- ovfExpRange_uid27_fpToFxPTest_p1_of_2(COMPARE,154)@0 + 1
    ovfExpRange_uid27_fpToFxPTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_tessel0_0_b);
    ovfExpRange_uid27_fpToFxPTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel0_0_b);
    ovfExpRange_uid27_fpToFxPTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ovfExpRange_uid27_fpToFxPTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            ovfExpRange_uid27_fpToFxPTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(ovfExpRange_uid27_fpToFxPTest_p1_of_2_a) - UNSIGNED(ovfExpRange_uid27_fpToFxPTest_p1_of_2_b));
        END IF;
    END PROCESS;
    ovfExpRange_uid27_fpToFxPTest_p1_of_2_c(0) <= ovfExpRange_uid27_fpToFxPTest_p1_of_2_o(6);

    -- ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel1_1(BITSELECT,228)
    ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel1_1_b <= STD_LOGIC_VECTOR(ovfExpVal_uid26_fpToFxPTest_q(8 downto 8));

    -- ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel1_0(BITSELECT,227)
    ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(ovfExpVal_uid26_fpToFxPTest_q(8 downto 6));

    -- ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,229)@1
    ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q <= ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel1_1_b & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_tessel1_0_b;

    -- ovfExpRange_uid27_fpToFxPTest_p2_of_2(COMPARE,155)@1 + 1
    ovfExpRange_uid27_fpToFxPTest_p2_of_2_cin <= ovfExpRange_uid27_fpToFxPTest_p1_of_2_c;
    ovfExpRange_uid27_fpToFxPTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_a_BitJoin_for_c_q) & '0');
    ovfExpRange_uid27_fpToFxPTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q(3)) & ovfExpRange_uid27_fpToFxPTest_BitSelect_for_b_BitJoin_for_c_q) & ovfExpRange_uid27_fpToFxPTest_p2_of_2_cin(0));
    ovfExpRange_uid27_fpToFxPTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ovfExpRange_uid27_fpToFxPTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            ovfExpRange_uid27_fpToFxPTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(ovfExpRange_uid27_fpToFxPTest_p2_of_2_a) - SIGNED(ovfExpRange_uid27_fpToFxPTest_p2_of_2_b));
        END IF;
    END PROCESS;
    ovfExpRange_uid27_fpToFxPTest_p2_of_2_c(0) <= ovfExpRange_uid27_fpToFxPTest_p2_of_2_o(5);

    -- redist22_ovfExpRange_uid27_fpToFxPTest_p2_of_2_c_14(DELAY,385)
    redist22_ovfExpRange_uid27_fpToFxPTest_p2_of_2_c_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC" )
    PORT MAP ( xin => ovfExpRange_uid27_fpToFxPTest_p2_of_2_c, xout => redist22_ovfExpRange_uid27_fpToFxPTest_p2_of_2_c_14_q, clk => clk, aclr => areset );

    -- ovfExpRange_uid27_fpToFxPTest_cout_n(LOGICAL,157)@16
    ovfExpRange_uid27_fpToFxPTest_cout_n_q <= STD_LOGIC_VECTOR(not (redist22_ovfExpRange_uid27_fpToFxPTest_p2_of_2_c_14_q));

    -- cstZeroWF_uid7_fpToFxPTest(CONSTANT,6)
    cstZeroWF_uid7_fpToFxPTest_q <= "00000000000000000000000";

    -- c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select(BITSELECT,344)
    c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b <= cstZeroWF_uid7_fpToFxPTest_q(5 downto 0);
    c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c <= cstZeroWF_uid7_fpToFxPTest_q(11 downto 6);
    c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_d <= cstZeroWF_uid7_fpToFxPTest_q(17 downto 12);
    c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_e <= cstZeroWF_uid7_fpToFxPTest_q(22 downto 18);

    -- z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select(BITSELECT,347)@4
    z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b <= redist30_frac_x_uid10_fpToFxPTest_b_3_q(5 downto 0);
    z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c <= redist30_frac_x_uid10_fpToFxPTest_b_3_q(11 downto 6);
    z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_d <= redist30_frac_x_uid10_fpToFxPTest_b_3_q(17 downto 12);
    z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_e <= redist30_frac_x_uid10_fpToFxPTest_b_3_q(22 downto 18);

    -- eq3_uid79_fracXIsZero_uid13_fpToFxPTest(LOGICAL,78)@4 + 1
    eq3_uid79_fracXIsZero_uid13_fpToFxPTest_qi <= "1" WHEN z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_e = c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_e ELSE "0";
    eq3_uid79_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid79_fracXIsZero_uid13_fpToFxPTest_qi, xout => eq3_uid79_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- redist24_eq3_uid79_fracXIsZero_uid13_fpToFxPTest_q_2(DELAY,387)
    redist24_eq3_uid79_fracXIsZero_uid13_fpToFxPTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid79_fracXIsZero_uid13_fpToFxPTest_q, xout => redist24_eq3_uid79_fracXIsZero_uid13_fpToFxPTest_q_2_q, clk => clk, aclr => areset );

    -- y0_uid142_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select(BITSELECT,357)
    y0_uid142_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b <= c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_d(2 downto 0);
    y0_uid142_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c <= c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_d(5 downto 3);

    -- x0_uid141_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select(BITSELECT,362)@4
    x0_uid141_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b <= z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_d(2 downto 0);
    x0_uid141_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c <= z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid146_eq2_uid76_fracXIsZero_uid13_fpToFxPTest(LOGICAL,145)@4 + 1
    eq1_uid146_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_qi <= "1" WHEN x0_uid141_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c = y0_uid142_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c ELSE "0";
    eq1_uid146_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid146_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_qi, xout => eq1_uid146_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- eq0_uid143_eq2_uid76_fracXIsZero_uid13_fpToFxPTest(LOGICAL,142)@4 + 1
    eq0_uid143_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_qi <= "1" WHEN x0_uid141_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b = y0_uid142_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b ELSE "0";
    eq0_uid143_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid143_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_qi, xout => eq0_uid143_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- andEq_uid147_eq2_uid76_fracXIsZero_uid13_fpToFxPTest(LOGICAL,146)@5 + 1
    andEq_uid147_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_qi <= eq0_uid143_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_q and eq1_uid146_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_q;
    andEq_uid147_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid147_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_qi, xout => andEq_uid147_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- y0_uid135_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select(BITSELECT,356)
    y0_uid135_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b <= c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c(2 downto 0);
    y0_uid135_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c <= c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c(5 downto 3);

    -- x0_uid134_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select(BITSELECT,361)@4
    x0_uid134_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b <= z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c(2 downto 0);
    x0_uid134_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c <= z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid139_eq1_uid73_fracXIsZero_uid13_fpToFxPTest(LOGICAL,138)@4 + 1
    eq1_uid139_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_qi <= "1" WHEN x0_uid134_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c = y0_uid135_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c ELSE "0";
    eq1_uid139_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid139_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_qi, xout => eq1_uid139_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- eq0_uid136_eq1_uid73_fracXIsZero_uid13_fpToFxPTest(LOGICAL,135)@4 + 1
    eq0_uid136_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_qi <= "1" WHEN x0_uid134_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b = y0_uid135_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b ELSE "0";
    eq0_uid136_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid136_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_qi, xout => eq0_uid136_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- andEq_uid140_eq1_uid73_fracXIsZero_uid13_fpToFxPTest(LOGICAL,139)@5 + 1
    andEq_uid140_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_qi <= eq0_uid136_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_q and eq1_uid139_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_q;
    andEq_uid140_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid140_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_qi, xout => andEq_uid140_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- y0_uid128_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select(BITSELECT,355)
    y0_uid128_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b <= c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b(2 downto 0);
    y0_uid128_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c <= c0_uid69_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b(5 downto 3);

    -- x0_uid127_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select(BITSELECT,360)@4
    x0_uid127_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b <= z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b(2 downto 0);
    x0_uid127_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c <= z0_uid68_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid132_eq0_uid70_fracXIsZero_uid13_fpToFxPTest(LOGICAL,131)@4 + 1
    eq1_uid132_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_qi <= "1" WHEN x0_uid127_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c = y0_uid128_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_c ELSE "0";
    eq1_uid132_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid132_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_qi, xout => eq1_uid132_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- eq0_uid129_eq0_uid70_fracXIsZero_uid13_fpToFxPTest(LOGICAL,128)@4 + 1
    eq0_uid129_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_qi <= "1" WHEN x0_uid127_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b = y0_uid128_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_merged_bit_select_b ELSE "0";
    eq0_uid129_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid129_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_qi, xout => eq0_uid129_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- andEq_uid133_eq0_uid70_fracXIsZero_uid13_fpToFxPTest(LOGICAL,132)@5 + 1
    andEq_uid133_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_qi <= eq0_uid129_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_q and eq1_uid132_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_q;
    andEq_uid133_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid133_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_qi, xout => andEq_uid133_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest(LOGICAL,79)@6 + 1
    and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_qi <= andEq_uid133_eq0_uid70_fracXIsZero_uid13_fpToFxPTest_q and andEq_uid140_eq1_uid73_fracXIsZero_uid13_fpToFxPTest_q and andEq_uid147_eq2_uid76_fracXIsZero_uid13_fpToFxPTest_q and redist24_eq3_uid79_fracXIsZero_uid13_fpToFxPTest_q_2_q;
    and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_qi, xout => and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_q, clk => clk, aclr => areset );

    -- redist23_and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_q_9(DELAY,386)
    redist23_and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_q, xout => redist23_and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_q_9_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid6_fpToFxPTest(CONSTANT,5)
    cstAllOWE_uid6_fpToFxPTest_q <= "11111111";

    -- c0_uid62_expXIsMax_uid12_fpToFxPTest_merged_bit_select(BITSELECT,343)
    c0_uid62_expXIsMax_uid12_fpToFxPTest_merged_bit_select_b <= cstAllOWE_uid6_fpToFxPTest_q(5 downto 0);
    c0_uid62_expXIsMax_uid12_fpToFxPTest_merged_bit_select_c <= cstAllOWE_uid6_fpToFxPTest_q(7 downto 6);

    -- eq1_uid66_expXIsMax_uid12_fpToFxPTest(LOGICAL,65)@2 + 1
    eq1_uid66_expXIsMax_uid12_fpToFxPTest_qi <= "1" WHEN redist6_z0_uid54_excZ_x_uid11_fpToFxPTest_merged_bit_select_c_1_q = c0_uid62_expXIsMax_uid12_fpToFxPTest_merged_bit_select_c ELSE "0";
    eq1_uid66_expXIsMax_uid12_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid66_expXIsMax_uid12_fpToFxPTest_qi, xout => eq1_uid66_expXIsMax_uid12_fpToFxPTest_q, clk => clk, aclr => areset );

    -- y0_uid121_eq0_uid63_expXIsMax_uid12_fpToFxPTest_merged_bit_select(BITSELECT,354)
    y0_uid121_eq0_uid63_expXIsMax_uid12_fpToFxPTest_merged_bit_select_b <= c0_uid62_expXIsMax_uid12_fpToFxPTest_merged_bit_select_b(2 downto 0);
    y0_uid121_eq0_uid63_expXIsMax_uid12_fpToFxPTest_merged_bit_select_c <= c0_uid62_expXIsMax_uid12_fpToFxPTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid125_eq0_uid63_expXIsMax_uid12_fpToFxPTest(LOGICAL,124)@1 + 1
    eq1_uid125_eq0_uid63_expXIsMax_uid12_fpToFxPTest_qi <= "1" WHEN x0_uid113_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_c = y0_uid121_eq0_uid63_expXIsMax_uid12_fpToFxPTest_merged_bit_select_c ELSE "0";
    eq1_uid125_eq0_uid63_expXIsMax_uid12_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid125_eq0_uid63_expXIsMax_uid12_fpToFxPTest_qi, xout => eq1_uid125_eq0_uid63_expXIsMax_uid12_fpToFxPTest_q, clk => clk, aclr => areset );

    -- eq0_uid122_eq0_uid63_expXIsMax_uid12_fpToFxPTest(LOGICAL,121)@1 + 1
    eq0_uid122_eq0_uid63_expXIsMax_uid12_fpToFxPTest_qi <= "1" WHEN x0_uid113_eq0_uid56_excZ_x_uid11_fpToFxPTest_merged_bit_select_b = y0_uid121_eq0_uid63_expXIsMax_uid12_fpToFxPTest_merged_bit_select_b ELSE "0";
    eq0_uid122_eq0_uid63_expXIsMax_uid12_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid122_eq0_uid63_expXIsMax_uid12_fpToFxPTest_qi, xout => eq0_uid122_eq0_uid63_expXIsMax_uid12_fpToFxPTest_q, clk => clk, aclr => areset );

    -- andEq_uid126_eq0_uid63_expXIsMax_uid12_fpToFxPTest(LOGICAL,125)@2 + 1
    andEq_uid126_eq0_uid63_expXIsMax_uid12_fpToFxPTest_qi <= eq0_uid122_eq0_uid63_expXIsMax_uid12_fpToFxPTest_q and eq1_uid125_eq0_uid63_expXIsMax_uid12_fpToFxPTest_q;
    andEq_uid126_eq0_uid63_expXIsMax_uid12_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid126_eq0_uid63_expXIsMax_uid12_fpToFxPTest_qi, xout => andEq_uid126_eq0_uid63_expXIsMax_uid12_fpToFxPTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid67_expXIsMax_uid12_fpToFxPTest(LOGICAL,66)@3 + 1
    and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_qi <= andEq_uid126_eq0_uid63_expXIsMax_uid12_fpToFxPTest_q and eq1_uid66_expXIsMax_uid12_fpToFxPTest_q;
    and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_qi, xout => and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_q, clk => clk, aclr => areset );

    -- redist25_and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_q_12(DELAY,388)
    redist25_and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_q, xout => redist25_and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_q_12_q, clk => clk, aclr => areset );

    -- excI_x_uid15_fpToFxPTest(LOGICAL,14)@15 + 1
    excI_x_uid15_fpToFxPTest_qi <= redist25_and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_q_12_q and redist23_and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_q_9_q;
    excI_x_uid15_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid15_fpToFxPTest_qi, xout => excI_x_uid15_fpToFxPTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid14_fpToFxPTest(LOGICAL,13)@15
    fracXIsNotZero_uid14_fpToFxPTest_q <= not (redist23_and_lev0_uid80_fracXIsZero_uid13_fpToFxPTest_q_9_q);

    -- excN_x_uid16_fpToFxPTest(LOGICAL,15)@15 + 1
    excN_x_uid16_fpToFxPTest_qi <= redist25_and_lev0_uid67_expXIsMax_uid12_fpToFxPTest_q_12_q and fracXIsNotZero_uid14_fpToFxPTest_q;
    excN_x_uid16_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid16_fpToFxPTest_qi, xout => excN_x_uid16_fpToFxPTest_q, clk => clk, aclr => areset );

    -- ovfPostRnd_uid48_fpToFxPTest(LOGICAL,47)@16 + 1
    ovfPostRnd_uid48_fpToFxPTest_qi <= excN_x_uid16_fpToFxPTest_q or excI_x_uid15_fpToFxPTest_q or ovfExpRange_uid27_fpToFxPTest_cout_n_q or rndOvfPos_uid47_fpToFxPTest_p6_of_6_c;
    ovfPostRnd_uid48_fpToFxPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ovfPostRnd_uid48_fpToFxPTest_qi, xout => ovfPostRnd_uid48_fpToFxPTest_q, clk => clk, aclr => areset );

    -- muxSelConc_uid49_fpToFxPTest(BITJOIN,48)@17
    muxSelConc_uid49_fpToFxPTest_q <= redist29_signX_uid25_fpToFxPTest_b_16_q & udf_uid29_fpToFxPTest_cout_n_q & ovfPostRnd_uid48_fpToFxPTest_q;

    -- muxSel_uid50_fpToFxPTest(LOOKUP,49)@17 + 1
    muxSel_uid50_fpToFxPTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            muxSel_uid50_fpToFxPTest_q <= "00";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (muxSelConc_uid49_fpToFxPTest_q) IS
                WHEN "000" => muxSel_uid50_fpToFxPTest_q <= "00";
                WHEN "001" => muxSel_uid50_fpToFxPTest_q <= "01";
                WHEN "010" => muxSel_uid50_fpToFxPTest_q <= "11";
                WHEN "011" => muxSel_uid50_fpToFxPTest_q <= "11";
                WHEN "100" => muxSel_uid50_fpToFxPTest_q <= "00";
                WHEN "101" => muxSel_uid50_fpToFxPTest_q <= "10";
                WHEN "110" => muxSel_uid50_fpToFxPTest_q <= "11";
                WHEN "111" => muxSel_uid50_fpToFxPTest_q <= "11";
                WHEN OTHERS => -- unreachable
                               muxSel_uid50_fpToFxPTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- finalOut_uid52_fpToFxPTest(MUX,51)@18
    finalOut_uid52_fpToFxPTest_s <= muxSel_uid50_fpToFxPTest_q;
    finalOut_uid52_fpToFxPTest_combproc: PROCESS (finalOut_uid52_fpToFxPTest_s, redist26_sPostRnd_uid45_fpToFxPTest_b_3_q, maxPosValueS_uid39_fpToFxPTest_q, maxNegValueS_uid40_fpToFxPTest_q, maxNegValueU_uid51_fpToFxPTest_q)
    BEGIN
        CASE (finalOut_uid52_fpToFxPTest_s) IS
            WHEN "00" => finalOut_uid52_fpToFxPTest_q <= redist26_sPostRnd_uid45_fpToFxPTest_b_3_q;
            WHEN "01" => finalOut_uid52_fpToFxPTest_q <= maxPosValueS_uid39_fpToFxPTest_q;
            WHEN "10" => finalOut_uid52_fpToFxPTest_q <= maxNegValueS_uid40_fpToFxPTest_q;
            WHEN "11" => finalOut_uid52_fpToFxPTest_q <= maxNegValueU_uid51_fpToFxPTest_q;
            WHEN OTHERS => finalOut_uid52_fpToFxPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xOut(GPOUT,4)@18
    q <= finalOut_uid52_fpToFxPTest_q;

END normal;
