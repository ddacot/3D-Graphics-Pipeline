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

-- VHDL created from altfp_muladd_0002
-- VHDL created on Mon Apr 13 12:38:05 2020


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

entity altfp_muladd_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        c : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end altfp_muladd_0002;

architecture normal of altfp_muladd_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid9_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid10_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid11_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid12_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid13_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid14_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid15_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid17_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid21_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid21_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid22_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid22_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid23_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid23_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid24_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid25_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid26_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid26_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid31_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid35_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid36_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid36_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid37_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid37_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid38_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid38_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid39_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid40_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid40_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid43_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid46_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal biasInc_uid48_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal signR_uid51_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid51_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid52_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid54_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid54_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid55_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid55_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid57_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid57_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid58_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid58_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid59_p_uid6_fpMultAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid59_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid60_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal sticky_uid63_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid64_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid64_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid65_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionConstant_uid66_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid67_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBitDetectionPattern_uid67_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid68_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBitAndNormalizationOp_uid71_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal fracRPreExc_uid73_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid73_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid74_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid75_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid75_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal excXZAndExcYZ_uid79_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid79_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid80_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid80_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid81_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid81_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid82_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid82_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid83_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid83_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid84_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid84_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid85_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid85_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid86_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid86_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid87_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid87_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid88_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid88_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid89_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid89_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid90_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid90_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid91_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid91_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid92_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid92_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid93_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid94_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid95_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid98_p_uid6_fpMultAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid98_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid103_p_uid6_fpMultAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid103_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid104_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid105_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid105_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid106_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expFracX_uid108_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid109_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal sigY_uid111_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid112_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid113_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid114_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_aSig_uid123_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid123_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid124_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid124_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid128_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid129_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid129_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid130_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid130_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid131_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid132_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid133_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid133_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid137_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid137_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid138_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid138_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid142_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid143_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid143_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid144_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid144_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid145_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid146_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid147_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid147_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid152_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid153_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid154_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid154_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid158_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid158_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid161_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal cWFP2_uid163_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal padConst_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightPaddedIn_uid167_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal iShiftedOut_uid169_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid176_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid178_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid179_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOp_uid182_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid185_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid185_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracGRS_uid186_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal cAmA_uid188_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aMinusA_uid189_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMinusA_uid189_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneCST_uid192_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rndBitCond_uid200_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid201_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid202_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_uid202_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid203_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllOwE_uid207_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExp_uid208_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid208_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExpFracOvfBits_uid211_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFracOvfBits_uid211_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid212_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvfExtraBits_uid212_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid213_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid213_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid214_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rUdfExtraBit_uid216_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rUdfExtraBit_uid216_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid217_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid217_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid218_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid218_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid219_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid219_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid220_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid220_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid221_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid222_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid223_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid224_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid225_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid226_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid226_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid227_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid227_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid228_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid228_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid229_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid230_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid231_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid232_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid232_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid233_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid233_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid234_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid234_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid235_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid235_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid236_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid236_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid237_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid237_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid238_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid238_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid239_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid239_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid240_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid241_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid241_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid245_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid245_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid249_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid249_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid250_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid255_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal mO_uid258_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid260_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid269_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid275_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid277_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid277_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid282_lzCountVal_uid187_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid283_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal eq1_uid291_excZ_x_uid18_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid291_excZ_x_uid18_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_uid294_expXIsMax_uid19_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid294_expXIsMax_uid19_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c1_uid297_expXIsMax_uid19_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal eq1_uid298_expXIsMax_uid19_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid298_expXIsMax_uid19_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_uid301_fracXIsZero_uid20_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid301_fracXIsZero_uid20_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c1_uid304_fracXIsZero_uid20_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal c1_uid304_fracXIsZero_uid20_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c2_uid307_fracXIsZero_uid20_p_uid6_fpMultAddTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal c2_uid307_fracXIsZero_uid20_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c3_uid310_fracXIsZero_uid20_p_uid6_fpMultAddTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid318_excZ_y_uid32_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid318_excZ_y_uid32_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid325_expXIsMax_uid33_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid325_expXIsMax_uid33_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid352_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid352_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid358_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid358_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid365_expXIsMax_uid126_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid365_expXIsMax_uid126_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid385_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid385_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid392_expXIsMax_uid140_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid392_expXIsMax_uid140_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wIntCst_uid409_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage0Idx1Rng16_uid411_alignmentShifter_uid166_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx1_uid413_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng32_uid414_alignmentShifter_uid166_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx2Pad32_uid415_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx2_uid416_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng48_uid417_alignmentShifter_uid166_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx3Pad48_uid418_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid419_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng4_uid422_alignmentShifter_uid166_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx1_uid424_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng8_uid425_alignmentShifter_uid166_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage1Idx2_uid427_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng12_uid428_alignmentShifter_uid166_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal rightShiftStage1Idx3Pad12_uid429_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3_uid430_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx1Rng1_uid433_alignmentShifter_uid166_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage2Idx1_uid435_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx2Rng2_uid436_alignmentShifter_uid166_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage2Idx2_uid438_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx3Rng3_uid439_alignmentShifter_uid166_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage2Idx3Pad3_uid440_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage2Idx3_uid441_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal zeroOutCst_uid444_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid459_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid459_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0Idx1Rng8_uid463_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1Rng8_uid463_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1_uid464_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2_uid467_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Pad24_uid468_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx3Rng24_uid469_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3Rng24_uid469_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3_uid470_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng2_uid474_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1Rng2_uid474_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1_uid475_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng4_uid477_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2Rng4_uid477_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2_uid478_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Pad6_uid479_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx3Rng6_uid480_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3Rng6_uid480_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3_uid481_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage2Idx1Rng1_uid485_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1Rng1_uid485_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid496_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid496_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid503_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid503_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid523_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid523_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid526_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid526_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid527_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid527_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid530_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid530_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid533_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid533_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid534_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid534_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid537_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid537_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid540_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid540_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid541_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid541_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid544_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid544_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid547_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid547_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid548_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid548_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid551_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid551_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid554_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid554_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid555_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid555_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid558_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid558_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid561_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid561_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid562_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid562_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid565_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid565_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid568_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid568_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid569_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid569_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid572_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid572_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid575_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid575_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid576_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid576_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid579_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid579_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid582_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid582_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid583_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid583_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid586_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid586_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid589_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid589_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid590_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid590_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid593_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid593_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid596_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid596_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid597_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid597_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid600_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid600_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid603_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid603_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid604_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid604_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid607_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid607_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid610_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid610_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid611_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid611_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid614_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid614_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid617_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid617_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid618_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid618_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid621_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid621_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid624_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid624_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid625_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid625_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid628_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid628_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid631_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid631_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid632_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid632_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid635_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid635_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid638_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid638_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid639_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid639_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid642_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid642_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid645_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid645_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid646_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid646_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid649_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid649_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid652_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid652_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid653_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid653_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid656_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid656_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid659_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid659_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid660_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid660_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid663_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid663_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid666_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid666_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid667_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid667_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid670_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid670_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid673_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid673_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid674_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid674_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid677_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid677_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid680_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid680_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid681_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid681_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid684_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid684_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid687_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid687_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid688_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid688_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid691_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid691_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid694_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid694_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid695_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid695_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid698_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid698_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid701_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid701_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid702_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid702_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid705_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid705_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid708_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid708_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid709_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid709_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid712_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid712_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid715_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid715_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid716_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid716_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid719_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid719_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid722_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid722_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid723_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid723_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid726_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid726_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid729_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid729_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid730_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid730_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid733_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid733_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid736_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid736_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid737_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid737_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (35 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_a : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_b : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_o : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_UpperBits_for_b_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_a : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_b : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_o : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_d : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_e : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_f : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_g : STD_LOGIC_VECTOR (1 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_d : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_e : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_g : STD_LOGIC_VECTOR (1 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_a : STD_LOGIC_VECTOR (3 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_b : STD_LOGIC_VECTOR (3 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_o : STD_LOGIC_VECTOR (3 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_d : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_e : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (3 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_a : STD_LOGIC_VECTOR (6 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_b : STD_LOGIC_VECTOR (6 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_o : STD_LOGIC_VECTOR (6 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_a : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_b : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_o : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (27 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_UpperBits_for_b_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (34 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_d : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_e : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_g : STD_LOGIC_VECTOR (1 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_h : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_d : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_e : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_f : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_g : STD_LOGIC_VECTOR (1 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_h : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p0_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p5_q : STD_LOGIC_VECTOR (1 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_p6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid118_r_uid7_fpMultAddTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p0_q : STD_LOGIC_VECTOR (4 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p5_q : STD_LOGIC_VECTOR (1 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_p6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid119_r_uid7_fpMultAddTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_d : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_e : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_g : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_h : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_i : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_j : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_k : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_l : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_m : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_n : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_o : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_p : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_r : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_t : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_u : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_v : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_w : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_x : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_y : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_z : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_d : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_e : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_f : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_g : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_h : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_i : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_j : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_k : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_l : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_m : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_n : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_o : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_p : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_r : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_t : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_u : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_v : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_w : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_x : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_y : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_z : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (27 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel3_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel5_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_g_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel3_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel5_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expAmExpB_uid162_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (2 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_f_q : STD_LOGIC_VECTOR (3 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_g_q : STD_LOGIC_VECTOR (4 downto 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_reset : std_logic;
    type prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_a0 : prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_a0 : signal is true;
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_c0 : prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_c0 : signal is true;
    type prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(47 downto 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_p : prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ptype(0 to 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_u : prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ptype(0 to 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_w : prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ptype(0 to 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_x : prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ptype(0 to 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_y : prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ptype(0 to 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_s : prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ptype(0 to 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_qq : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ena0 : std_logic;
    signal prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ena1 : std_logic;
    signal z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal c0_uid491_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid491_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid490_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid490_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal c0_uid498_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid498_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid682_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid682_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid689_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid689_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid696_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid696_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid731_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid731_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_f : STD_LOGIC_VECTOR (4 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_in : STD_LOGIC_VECTOR (4 downto 0);
    signal Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_f : STD_LOGIC_VECTOR (0 downto 0);
    signal x0_uid521_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid521_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid556_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid556_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid535_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid535_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid542_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid542_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid549_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid549_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid570_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid570_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid577_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid577_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid584_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid584_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid591_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid591_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid598_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid598_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid605_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid605_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid612_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid612_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid626_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid626_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid633_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid633_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid640_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid640_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid647_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid647_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid661_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid661_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid668_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid668_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid675_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid675_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal y0_uid704_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid704_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid703_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid703_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid711_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid711_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid718_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid718_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid725_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid725_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid717_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid717_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid724_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid724_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal z0_uid514_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid514_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_b_5_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_c_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_b_4_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist3_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_c_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist5_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_d_4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist17_stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist18_z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist19_z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist20_z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist21_z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist22_prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q_1_q : STD_LOGIC_VECTOR (47 downto 0);
    signal redist23_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist24_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist25_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_0_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel3_0_b_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist29_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist30_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel1_0_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist31_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_bSig_uid119_r_uid7_fpMultAddTest_p5_q_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist44_aSig_uid118_r_uid7_fpMultAddTest_p6_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_aSig_uid118_r_uid7_fpMultAddTest_p5_q_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist46_aSig_uid118_r_uid7_fpMultAddTest_p5_q_12_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist47_aSig_uid118_r_uid7_fpMultAddTest_p5_q_38_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist48_aSig_uid118_r_uid7_fpMultAddTest_p4_q_12_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist49_aSig_uid118_r_uid7_fpMultAddTest_p4_q_30_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist50_aSig_uid118_r_uid7_fpMultAddTest_p3_q_12_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist51_aSig_uid118_r_uid7_fpMultAddTest_p2_q_12_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist52_aSig_uid118_r_uid7_fpMultAddTest_p1_q_12_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist53_aSig_uid118_r_uid7_fpMultAddTest_p0_q_12_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist54_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist55_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist56_shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_c_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist58_rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist59_rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist60_rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist61_rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_q_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_q_7_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist63_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_c_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_c_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist66_fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist67_fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist68_fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist69_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist70_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_d_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist71_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_e_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist72_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_f_4_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist73_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist74_shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_c_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist76_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist77_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_d_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist78_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_e_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist79_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_f_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist80_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_g_5_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist81_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist82_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_d_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist83_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_e_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist84_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_f_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist85_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_g_5_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist86_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist87_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist88_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist89_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist90_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_q_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist91_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_f_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist92_expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_q_10_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_q_10_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist94_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist95_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist96_and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist97_eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist98_and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist100_eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist101_eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist103_and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist104_eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist105_and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q_28_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist106_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist107_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_29_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist108_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_42_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist109_and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist110_eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist111_and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist112_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist113_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist114_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_31_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist115_eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist116_and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist117_eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist118_and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist119_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist120_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist121_and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist122_eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist123_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist124_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist125_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist126_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist127_r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist128_vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist129_vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_b_9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist130_rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist131_signRInfRZRReg_uid239_r_uid7_fpMultAddTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist132_signRReg_uid232_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist133_excRInfVInC_uid224_r_uid7_fpMultAddTest_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist134_excRZero_uid222_r_uid7_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist135_regInputs_uid220_r_uid7_fpMultAddTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist136_expRPreExc_uid219_r_uid7_fpMultAddTest_b_7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist137_fracRPreExc_uid218_r_uid7_fpMultAddTest_b_7_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist138_rUdfExtraBit_uid216_r_uid7_fpMultAddTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist139_rOvfExtraBits_uid212_r_uid7_fpMultAddTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist140_aMinusA_uid189_r_uid7_fpMultAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist141_fracGRS_uid186_r_uid7_fpMultAddTest_q_3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist142_fracGRS_uid186_r_uid7_fpMultAddTest_q_12_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist143_invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist144_effSub_uid154_r_uid7_fpMultAddTest_q_33_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist145_sigB_uid153_r_uid7_fpMultAddTest_b_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist146_sigB_uid153_r_uid7_fpMultAddTest_b_31_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist147_sigA_uid152_r_uid7_fpMultAddTest_b_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist148_InvExpXIsZero_uid146_r_uid7_fpMultAddTest_q_26_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist149_excN_bSig_uid144_r_uid7_fpMultAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist150_excI_bSig_uid143_r_uid7_fpMultAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist151_frac_bSig_uid138_r_uid7_fpMultAddTest_b_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist152_excN_aSig_uid130_r_uid7_fpMultAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist153_excI_aSig_uid129_r_uid7_fpMultAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist154_frac_aSig_uid124_r_uid7_fpMultAddTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist155_expY_uid113_r_uid7_fpMultAddTest_b_6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist156_fracY_uid112_r_uid7_fpMultAddTest_b_6_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist157_sigY_uid111_r_uid7_fpMultAddTest_b_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist158_R_uid106_p_uid6_fpMultAddTest_q_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist159_signRPostExc_uid105_p_uid6_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist160_expRPreExc_uid75_p_uid6_fpMultAddTest_b_5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist161_fracRPreExc_uid73_p_uid6_fpMultAddTest_b_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist162_stickyRange_uid57_p_uid6_fpMultAddTest_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist163_normalizeBit_uid52_p_uid6_fpMultAddTest_b_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist164_signR_uid51_p_uid6_fpMultAddTest_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist165_excN_y_uid37_p_uid6_fpMultAddTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist166_excI_y_uid36_p_uid6_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist167_excN_x_uid23_p_uid6_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist168_excI_x_uid22_p_uid6_fpMultAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist169_xIn_c_20_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- cAmA_uid188_r_uid7_fpMultAddTest(CONSTANT,187)
    cAmA_uid188_r_uid7_fpMultAddTest_q <= "11100";

    -- zs_uid255_lzCountVal_uid187_r_uid7_fpMultAddTest(CONSTANT,254)
    zs_uid255_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= "0000000000000000";

    -- c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1108)
    c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= zs_uid255_lzCountVal_uid187_r_uid7_fpMultAddTest_q(5 downto 0);
    c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= zs_uid255_lzCountVal_uid187_r_uid7_fpMultAddTest_q(11 downto 6);
    c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_d <= zs_uid255_lzCountVal_uid187_r_uid7_fpMultAddTest_q(15 downto 12);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- redist169_xIn_c_20(DELAY,1329)
    redist169_xIn_c_20 : dspba_delay
    GENERIC MAP ( width => 32, depth => 20, reset_kind => "ASYNC" )
    PORT MAP ( xin => c, xout => redist169_xIn_c_20_q, clk => clk, aclr => areset );

    -- sigY_uid111_r_uid7_fpMultAddTest(BITSELECT,110)@20
    sigY_uid111_r_uid7_fpMultAddTest_b <= STD_LOGIC_VECTOR(redist169_xIn_c_20_q(31 downto 31));

    -- redist157_sigY_uid111_r_uid7_fpMultAddTest_b_6(DELAY,1317)
    redist157_sigY_uid111_r_uid7_fpMultAddTest_b_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigY_uid111_r_uid7_fpMultAddTest_b, xout => redist157_sigY_uid111_r_uid7_fpMultAddTest_b_6_q, clk => clk, aclr => areset );

    -- expY_uid113_r_uid7_fpMultAddTest(BITSELECT,112)@20
    expY_uid113_r_uid7_fpMultAddTest_b <= redist169_xIn_c_20_q(30 downto 23);

    -- redist155_expY_uid113_r_uid7_fpMultAddTest_b_6(DELAY,1315)
    redist155_expY_uid113_r_uid7_fpMultAddTest_b_6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => expY_uid113_r_uid7_fpMultAddTest_b, xout => redist155_expY_uid113_r_uid7_fpMultAddTest_b_6_q, clk => clk, aclr => areset );

    -- fracY_uid112_r_uid7_fpMultAddTest(BITSELECT,111)@20
    fracY_uid112_r_uid7_fpMultAddTest_b <= redist169_xIn_c_20_q(22 downto 0);

    -- redist156_fracY_uid112_r_uid7_fpMultAddTest_b_6(DELAY,1316)
    redist156_fracY_uid112_r_uid7_fpMultAddTest_b_6 : dspba_delay
    GENERIC MAP ( width => 23, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracY_uid112_r_uid7_fpMultAddTest_b, xout => redist156_fracY_uid112_r_uid7_fpMultAddTest_b_6_q, clk => clk, aclr => areset );

    -- ypn_uid114_r_uid7_fpMultAddTest(BITJOIN,113)@26
    ypn_uid114_r_uid7_fpMultAddTest_q <= redist157_sigY_uid111_r_uid7_fpMultAddTest_b_6_q & redist155_expY_uid113_r_uid7_fpMultAddTest_b_6_q & redist156_fracY_uid112_r_uid7_fpMultAddTest_b_6_q;

    -- aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a(BITSELECT,885)@26
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_b <= STD_LOGIC_VECTOR(ypn_uid114_r_uid7_fpMultAddTest_q(4 downto 0));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_c <= STD_LOGIC_VECTOR(ypn_uid114_r_uid7_fpMultAddTest_q(10 downto 5));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_d <= STD_LOGIC_VECTOR(ypn_uid114_r_uid7_fpMultAddTest_q(16 downto 11));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_e <= STD_LOGIC_VECTOR(ypn_uid114_r_uid7_fpMultAddTest_q(22 downto 17));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_f <= STD_LOGIC_VECTOR(ypn_uid114_r_uid7_fpMultAddTest_q(28 downto 23));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_g <= STD_LOGIC_VECTOR(ypn_uid114_r_uid7_fpMultAddTest_q(30 downto 29));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_h <= STD_LOGIC_VECTOR(ypn_uid114_r_uid7_fpMultAddTest_q(31 downto 31));

    -- cstZeroWF_uid14_p_uid6_fpMultAddTest(CONSTANT,13)
    cstZeroWF_uid14_p_uid6_fpMultAddTest_q <= "00000000000000000000000";

    -- c3_uid310_fracXIsZero_uid20_p_uid6_fpMultAddTest(BITSELECT,309)
    c3_uid310_fracXIsZero_uid20_p_uid6_fpMultAddTest_b <= cstZeroWF_uid14_p_uid6_fpMultAddTest_q(22 downto 18);

    -- frac_x_uid17_p_uid6_fpMultAddTest(BITSELECT,16)@0
    frac_x_uid17_p_uid6_fpMultAddTest_b <= a(22 downto 0);

    -- z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1096)@0
    z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b <= frac_x_uid17_p_uid6_fpMultAddTest_b(5 downto 0);
    z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c <= frac_x_uid17_p_uid6_fpMultAddTest_b(11 downto 6);
    z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_d <= frac_x_uid17_p_uid6_fpMultAddTest_b(17 downto 12);
    z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_e <= frac_x_uid17_p_uid6_fpMultAddTest_b(22 downto 18);

    -- eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,310)@0 + 1
    eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= "1" WHEN z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_e = c3_uid310_fracXIsZero_uid20_p_uid6_fpMultAddTest_b ELSE "0";
    eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist122_eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_2(DELAY,1282)
    redist122_eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, xout => redist122_eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- c2_uid307_fracXIsZero_uid20_p_uid6_fpMultAddTest(BITSELECT,306)
    c2_uid307_fracXIsZero_uid20_p_uid6_fpMultAddTest_in <= cstZeroWF_uid14_p_uid6_fpMultAddTest_q(17 downto 0);
    c2_uid307_fracXIsZero_uid20_p_uid6_fpMultAddTest_b <= c2_uid307_fracXIsZero_uid20_p_uid6_fpMultAddTest_in(17 downto 12);

    -- y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1117)
    y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b <= c2_uid307_fracXIsZero_uid20_p_uid6_fpMultAddTest_b(2 downto 0);
    y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c <= c2_uid307_fracXIsZero_uid20_p_uid6_fpMultAddTest_b(5 downto 3);

    -- x0_uid549_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1136)@0
    x0_uid549_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_d(2 downto 0);
    x0_uid549_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid554_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,553)@0 + 1
    eq1_uid554_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid549_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid554_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid554_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => eq1_uid554_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid551_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,550)@0 + 1
    eq0_uid551_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid549_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid551_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid551_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => eq0_uid551_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid555_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,554)@1 + 1
    andEq_uid555_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= eq0_uid551_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_q and eq1_uid554_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_q;
    andEq_uid555_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid555_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => andEq_uid555_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- c1_uid304_fracXIsZero_uid20_p_uid6_fpMultAddTest(BITSELECT,303)
    c1_uid304_fracXIsZero_uid20_p_uid6_fpMultAddTest_in <= cstZeroWF_uid14_p_uid6_fpMultAddTest_q(11 downto 0);
    c1_uid304_fracXIsZero_uid20_p_uid6_fpMultAddTest_b <= c1_uid304_fracXIsZero_uid20_p_uid6_fpMultAddTest_in(11 downto 6);

    -- y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1116)
    y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b <= c1_uid304_fracXIsZero_uid20_p_uid6_fpMultAddTest_b(2 downto 0);
    y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c <= c1_uid304_fracXIsZero_uid20_p_uid6_fpMultAddTest_b(5 downto 3);

    -- x0_uid542_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1135)@0
    x0_uid542_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c(2 downto 0);
    x0_uid542_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid547_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,546)@0 + 1
    eq1_uid547_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid542_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid547_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid547_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => eq1_uid547_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid544_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,543)@0 + 1
    eq0_uid544_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid542_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid544_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid544_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => eq0_uid544_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid548_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,547)@1 + 1
    andEq_uid548_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= eq0_uid544_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_q and eq1_uid547_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_q;
    andEq_uid548_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid548_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => andEq_uid548_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- c0_uid301_fracXIsZero_uid20_p_uid6_fpMultAddTest(BITSELECT,300)
    c0_uid301_fracXIsZero_uid20_p_uid6_fpMultAddTest_in <= cstZeroWF_uid14_p_uid6_fpMultAddTest_q(5 downto 0);
    c0_uid301_fracXIsZero_uid20_p_uid6_fpMultAddTest_b <= c0_uid301_fracXIsZero_uid20_p_uid6_fpMultAddTest_in(5 downto 0);

    -- y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1115)
    y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b <= c0_uid301_fracXIsZero_uid20_p_uid6_fpMultAddTest_b(2 downto 0);
    y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c <= c0_uid301_fracXIsZero_uid20_p_uid6_fpMultAddTest_b(5 downto 3);

    -- x0_uid535_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1134)@0
    x0_uid535_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid535_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid300_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid540_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,539)@0 + 1
    eq1_uid540_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid535_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid540_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid540_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => eq1_uid540_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid537_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,536)@0 + 1
    eq0_uid537_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid535_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid537_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid537_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => eq0_uid537_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid541_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,540)@1 + 1
    andEq_uid541_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= eq0_uid537_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_q and eq1_uid540_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_q;
    andEq_uid541_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid541_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => andEq_uid541_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest(LOGICAL,311)@2 + 1
    and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi <= andEq_uid541_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_q and andEq_uid548_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_q and andEq_uid555_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_q and redist122_eq3_uid311_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_2_q;
    and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_qi, xout => and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist121_and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_12(DELAY,1281)
    redist121_and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_q, xout => redist121_and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_12_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid13_p_uid6_fpMultAddTest(CONSTANT,12)
    cstAllOWE_uid13_p_uid6_fpMultAddTest_q <= "11111111";

    -- c1_uid297_expXIsMax_uid19_p_uid6_fpMultAddTest(BITSELECT,296)
    c1_uid297_expXIsMax_uid19_p_uid6_fpMultAddTest_b <= cstAllOWE_uid13_p_uid6_fpMultAddTest_q(7 downto 6);

    -- expX_uid9_p_uid6_fpMultAddTest(BITSELECT,8)@0
    expX_uid9_p_uid6_fpMultAddTest_b <= a(30 downto 23);

    -- z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1093)@0
    z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b <= expX_uid9_p_uid6_fpMultAddTest_b(5 downto 0);
    z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c <= expX_uid9_p_uid6_fpMultAddTest_b(7 downto 6);

    -- redist21_z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c_1(DELAY,1181)
    redist21_z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c, xout => redist21_z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- eq1_uid298_expXIsMax_uid19_p_uid6_fpMultAddTest(LOGICAL,297)@1 + 1
    eq1_uid298_expXIsMax_uid19_p_uid6_fpMultAddTest_qi <= "1" WHEN redist21_z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c_1_q = c1_uid297_expXIsMax_uid19_p_uid6_fpMultAddTest_b ELSE "0";
    eq1_uid298_expXIsMax_uid19_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid298_expXIsMax_uid19_p_uid6_fpMultAddTest_qi, xout => eq1_uid298_expXIsMax_uid19_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- c0_uid294_expXIsMax_uid19_p_uid6_fpMultAddTest(BITSELECT,293)
    c0_uid294_expXIsMax_uid19_p_uid6_fpMultAddTest_in <= cstAllOWE_uid13_p_uid6_fpMultAddTest_q(5 downto 0);
    c0_uid294_expXIsMax_uid19_p_uid6_fpMultAddTest_b <= c0_uid294_expXIsMax_uid19_p_uid6_fpMultAddTest_in(5 downto 0);

    -- y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1114)
    y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_b <= c0_uid294_expXIsMax_uid19_p_uid6_fpMultAddTest_b(2 downto 0);
    y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_c <= c0_uid294_expXIsMax_uid19_p_uid6_fpMultAddTest_b(5 downto 3);

    -- x0_uid521_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1131)@0
    x0_uid521_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid521_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid533_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest(LOGICAL,532)@0 + 1
    eq1_uid533_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid521_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid533_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid533_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_qi, xout => eq1_uid533_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid530_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest(LOGICAL,529)@0 + 1
    eq0_uid530_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid521_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid530_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid530_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_qi, xout => eq0_uid530_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid534_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest(LOGICAL,533)@1 + 1
    andEq_uid534_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_qi <= eq0_uid530_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_q and eq1_uid533_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_q;
    andEq_uid534_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid534_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_qi, xout => andEq_uid534_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest(LOGICAL,298)@2 + 1
    and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_qi <= andEq_uid534_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_q and eq1_uid298_expXIsMax_uid19_p_uid6_fpMultAddTest_q;
    and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_qi, xout => and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist123_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_12(DELAY,1283)
    redist123_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q, xout => redist123_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_12_q, clk => clk, aclr => areset );

    -- excI_x_uid22_p_uid6_fpMultAddTest(LOGICAL,21)@14 + 1
    excI_x_uid22_p_uid6_fpMultAddTest_qi <= redist123_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_12_q and redist121_and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_12_q;
    excI_x_uid22_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid22_p_uid6_fpMultAddTest_qi, xout => excI_x_uid22_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- cstAllZWE_uid15_p_uid6_fpMultAddTest(CONSTANT,14)
    cstAllZWE_uid15_p_uid6_fpMultAddTest_q <= "00000000";

    -- c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1095)
    c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b <= cstAllZWE_uid15_p_uid6_fpMultAddTest_q(5 downto 0);
    c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c <= cstAllZWE_uid15_p_uid6_fpMultAddTest_q(7 downto 6);

    -- expY_uid10_p_uid6_fpMultAddTest(BITSELECT,9)@0
    expY_uid10_p_uid6_fpMultAddTest_b <= b(30 downto 23);

    -- z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1094)@0
    z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_b <= expY_uid10_p_uid6_fpMultAddTest_b(5 downto 0);
    z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c <= expY_uid10_p_uid6_fpMultAddTest_b(7 downto 6);

    -- redist20_z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c_1(DELAY,1180)
    redist20_z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c, xout => redist20_z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- eq1_uid318_excZ_y_uid32_p_uid6_fpMultAddTest(LOGICAL,317)@1 + 1
    eq1_uid318_excZ_y_uid32_p_uid6_fpMultAddTest_qi <= "1" WHEN redist20_z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c_1_q = c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid318_excZ_y_uid32_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid318_excZ_y_uid32_p_uid6_fpMultAddTest_qi, xout => eq1_uid318_excZ_y_uid32_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1133)
    y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b <= c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b(2 downto 0);
    y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c <= c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- x0_uid556_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1132)@0
    x0_uid556_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid556_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid561_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest(LOGICAL,560)@0 + 1
    eq1_uid561_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid556_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid561_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid561_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_qi, xout => eq1_uid561_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid558_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest(LOGICAL,557)@0 + 1
    eq0_uid558_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid556_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid558_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid558_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_qi, xout => eq0_uid558_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid562_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest(LOGICAL,561)@1 + 1
    andEq_uid562_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_qi <= eq0_uid558_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_q and eq1_uid561_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_q;
    andEq_uid562_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid562_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_qi, xout => andEq_uid562_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest(LOGICAL,318)@2 + 1
    and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_qi <= andEq_uid562_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_q and eq1_uid318_excZ_y_uid32_p_uid6_fpMultAddTest_q;
    and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_qi, xout => and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist119_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_13(DELAY,1279)
    redist119_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q, xout => redist119_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_13_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid89_p_uid6_fpMultAddTest(LOGICAL,88)@15 + 1
    excYZAndExcXI_uid89_p_uid6_fpMultAddTest_qi <= redist119_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_13_q and excI_x_uid22_p_uid6_fpMultAddTest_q;
    excYZAndExcXI_uid89_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYZAndExcXI_uid89_p_uid6_fpMultAddTest_qi, xout => excYZAndExcXI_uid89_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- frac_y_uid31_p_uid6_fpMultAddTest(BITSELECT,30)@0
    frac_y_uid31_p_uid6_fpMultAddTest_b <= b(22 downto 0);

    -- z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1097)@0
    z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b <= frac_y_uid31_p_uid6_fpMultAddTest_b(5 downto 0);
    z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c <= frac_y_uid31_p_uid6_fpMultAddTest_b(11 downto 6);
    z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_d <= frac_y_uid31_p_uid6_fpMultAddTest_b(17 downto 12);
    z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_e <= frac_y_uid31_p_uid6_fpMultAddTest_b(22 downto 18);

    -- eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,337)@0 + 1
    eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= "1" WHEN z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_e = c3_uid310_fracXIsZero_uid20_p_uid6_fpMultAddTest_b ELSE "0";
    eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist117_eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_2(DELAY,1277)
    redist117_eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, xout => redist117_eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid584_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1139)@0
    x0_uid584_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_d(2 downto 0);
    x0_uid584_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid589_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,588)@0 + 1
    eq1_uid589_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid584_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid589_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid589_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => eq1_uid589_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid586_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,585)@0 + 1
    eq0_uid586_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid584_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid586_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid586_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => eq0_uid586_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid590_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,589)@1 + 1
    andEq_uid590_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= eq0_uid586_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_q and eq1_uid589_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_q;
    andEq_uid590_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid590_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => andEq_uid590_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid577_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1138)@0
    x0_uid577_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c(2 downto 0);
    x0_uid577_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid582_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,581)@0 + 1
    eq1_uid582_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid577_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid582_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid582_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => eq1_uid582_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid579_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,578)@0 + 1
    eq0_uid579_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid577_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid579_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid579_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => eq0_uid579_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid583_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,582)@1 + 1
    andEq_uid583_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= eq0_uid579_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_q and eq1_uid582_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_q;
    andEq_uid583_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid583_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => andEq_uid583_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid570_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1137)@0
    x0_uid570_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid570_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid327_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid575_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,574)@0 + 1
    eq1_uid575_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid570_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid575_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid575_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => eq1_uid575_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid572_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,571)@0 + 1
    eq0_uid572_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid570_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid572_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid572_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => eq0_uid572_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid576_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,575)@1 + 1
    andEq_uid576_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= eq0_uid572_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_q and eq1_uid575_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_q;
    andEq_uid576_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid576_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => andEq_uid576_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest(LOGICAL,338)@2 + 1
    and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi <= andEq_uid576_eq0_uid329_fracXIsZero_uid34_p_uid6_fpMultAddTest_q and andEq_uid583_eq1_uid332_fracXIsZero_uid34_p_uid6_fpMultAddTest_q and andEq_uid590_eq2_uid335_fracXIsZero_uid34_p_uid6_fpMultAddTest_q and redist117_eq3_uid338_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_2_q;
    and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_qi, xout => and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist116_and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_12(DELAY,1276)
    redist116_and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_q, xout => redist116_and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_12_q, clk => clk, aclr => areset );

    -- eq1_uid325_expXIsMax_uid33_p_uid6_fpMultAddTest(LOGICAL,324)@1 + 1
    eq1_uid325_expXIsMax_uid33_p_uid6_fpMultAddTest_qi <= "1" WHEN redist20_z0_uid313_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c_1_q = c1_uid297_expXIsMax_uid19_p_uid6_fpMultAddTest_b ELSE "0";
    eq1_uid325_expXIsMax_uid33_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid325_expXIsMax_uid33_p_uid6_fpMultAddTest_qi, xout => eq1_uid325_expXIsMax_uid33_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq1_uid568_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest(LOGICAL,567)@0 + 1
    eq1_uid568_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid556_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid568_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid568_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_qi, xout => eq1_uid568_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid565_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest(LOGICAL,564)@0 + 1
    eq0_uid565_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid556_eq0_uid315_excZ_y_uid32_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid565_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid565_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_qi, xout => eq0_uid565_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid569_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest(LOGICAL,568)@1 + 1
    andEq_uid569_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_qi <= eq0_uid565_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_q and eq1_uid568_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_q;
    andEq_uid569_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid569_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_qi, xout => andEq_uid569_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest(LOGICAL,325)@2 + 1
    and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_qi <= andEq_uid569_eq0_uid322_expXIsMax_uid33_p_uid6_fpMultAddTest_q and eq1_uid325_expXIsMax_uid33_p_uid6_fpMultAddTest_q;
    and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_qi, xout => and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist118_and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q_12(DELAY,1278)
    redist118_and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q, xout => redist118_and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q_12_q, clk => clk, aclr => areset );

    -- excI_y_uid36_p_uid6_fpMultAddTest(LOGICAL,35)@14 + 1
    excI_y_uid36_p_uid6_fpMultAddTest_qi <= redist118_and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q_12_q and redist116_and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_12_q;
    excI_y_uid36_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid36_p_uid6_fpMultAddTest_qi, xout => excI_y_uid36_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq1_uid291_excZ_x_uid18_p_uid6_fpMultAddTest(LOGICAL,290)@1 + 1
    eq1_uid291_excZ_x_uid18_p_uid6_fpMultAddTest_qi <= "1" WHEN redist21_z0_uid286_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c_1_q = c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid291_excZ_x_uid18_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid291_excZ_x_uid18_p_uid6_fpMultAddTest_qi, xout => eq1_uid291_excZ_x_uid18_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq1_uid526_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest(LOGICAL,525)@0 + 1
    eq1_uid526_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid521_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid526_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid526_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_qi, xout => eq1_uid526_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid523_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest(LOGICAL,522)@0 + 1
    eq0_uid523_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid521_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid523_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid523_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_qi, xout => eq0_uid523_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid527_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest(LOGICAL,526)@1 + 1
    andEq_uid527_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_qi <= eq0_uid523_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_q and eq1_uid526_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_q;
    andEq_uid527_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid527_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_qi, xout => andEq_uid527_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest(LOGICAL,291)@2 + 1
    and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_qi <= andEq_uid527_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_q and eq1_uid291_excZ_x_uid18_p_uid6_fpMultAddTest_q;
    and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_qi, xout => and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist125_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_13(DELAY,1285)
    redist125_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q, xout => redist125_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_13_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid90_p_uid6_fpMultAddTest(LOGICAL,89)@15 + 1
    excXZAndExcYI_uid90_p_uid6_fpMultAddTest_qi <= redist125_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_13_q and excI_y_uid36_p_uid6_fpMultAddTest_q;
    excXZAndExcYI_uid90_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYI_uid90_p_uid6_fpMultAddTest_qi, xout => excXZAndExcYI_uid90_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- ZeroTimesInf_uid91_p_uid6_fpMultAddTest(LOGICAL,90)@16 + 1
    ZeroTimesInf_uid91_p_uid6_fpMultAddTest_qi <= excXZAndExcYI_uid90_p_uid6_fpMultAddTest_q or excYZAndExcXI_uid89_p_uid6_fpMultAddTest_q;
    ZeroTimesInf_uid91_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ZeroTimesInf_uid91_p_uid6_fpMultAddTest_qi, xout => ZeroTimesInf_uid91_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid35_p_uid6_fpMultAddTest(LOGICAL,34)@14
    fracXIsNotZero_uid35_p_uid6_fpMultAddTest_q <= not (redist116_and_lev0_uid339_fracXIsZero_uid34_p_uid6_fpMultAddTest_q_12_q);

    -- excN_y_uid37_p_uid6_fpMultAddTest(LOGICAL,36)@14 + 1
    excN_y_uid37_p_uid6_fpMultAddTest_qi <= redist118_and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q_12_q and fracXIsNotZero_uid35_p_uid6_fpMultAddTest_q;
    excN_y_uid37_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_y_uid37_p_uid6_fpMultAddTest_qi, xout => excN_y_uid37_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist165_excN_y_uid37_p_uid6_fpMultAddTest_q_3(DELAY,1325)
    redist165_excN_y_uid37_p_uid6_fpMultAddTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_y_uid37_p_uid6_fpMultAddTest_q, xout => redist165_excN_y_uid37_p_uid6_fpMultAddTest_q_3_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid21_p_uid6_fpMultAddTest(LOGICAL,20)@14 + 1
    fracXIsNotZero_uid21_p_uid6_fpMultAddTest_qi <= not (redist121_and_lev0_uid312_fracXIsZero_uid20_p_uid6_fpMultAddTest_q_12_q);
    fracXIsNotZero_uid21_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsNotZero_uid21_p_uid6_fpMultAddTest_qi, xout => fracXIsNotZero_uid21_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist124_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_13(DELAY,1284)
    redist124_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist123_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_12_q, xout => redist124_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_13_q, clk => clk, aclr => areset );

    -- excN_x_uid23_p_uid6_fpMultAddTest(LOGICAL,22)@15 + 1
    excN_x_uid23_p_uid6_fpMultAddTest_qi <= redist124_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_13_q and fracXIsNotZero_uid21_p_uid6_fpMultAddTest_q;
    excN_x_uid23_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid23_p_uid6_fpMultAddTest_qi, xout => excN_x_uid23_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist167_excN_x_uid23_p_uid6_fpMultAddTest_q_2(DELAY,1327)
    redist167_excN_x_uid23_p_uid6_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid23_p_uid6_fpMultAddTest_q, xout => redist167_excN_x_uid23_p_uid6_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- excRNaN_uid92_p_uid6_fpMultAddTest(LOGICAL,91)@17 + 1
    excRNaN_uid92_p_uid6_fpMultAddTest_qi <= redist167_excN_x_uid23_p_uid6_fpMultAddTest_q_2_q or redist165_excN_y_uid37_p_uid6_fpMultAddTest_q_3_q or ZeroTimesInf_uid91_p_uid6_fpMultAddTest_q;
    excRNaN_uid92_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid92_p_uid6_fpMultAddTest_qi, xout => excRNaN_uid92_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid104_p_uid6_fpMultAddTest(LOGICAL,103)@18
    invExcRNaN_uid104_p_uid6_fpMultAddTest_q <= not (excRNaN_uid92_p_uid6_fpMultAddTest_q);

    -- signY_uid12_p_uid6_fpMultAddTest(BITSELECT,11)@0
    signY_uid12_p_uid6_fpMultAddTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid11_p_uid6_fpMultAddTest(BITSELECT,10)@0
    signX_uid11_p_uid6_fpMultAddTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- signR_uid51_p_uid6_fpMultAddTest(LOGICAL,50)@0 + 1
    signR_uid51_p_uid6_fpMultAddTest_qi <= signX_uid11_p_uid6_fpMultAddTest_b xor signY_uid12_p_uid6_fpMultAddTest_b;
    signR_uid51_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid51_p_uid6_fpMultAddTest_qi, xout => signR_uid51_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist164_signR_uid51_p_uid6_fpMultAddTest_q_18(DELAY,1324)
    redist164_signR_uid51_p_uid6_fpMultAddTest_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid51_p_uid6_fpMultAddTest_q, xout => redist164_signR_uid51_p_uid6_fpMultAddTest_q_18_q, clk => clk, aclr => areset );

    -- signRPostExc_uid105_p_uid6_fpMultAddTest(LOGICAL,104)@18 + 1
    signRPostExc_uid105_p_uid6_fpMultAddTest_qi <= redist164_signR_uid51_p_uid6_fpMultAddTest_q_18_q and invExcRNaN_uid104_p_uid6_fpMultAddTest_q;
    signRPostExc_uid105_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid105_p_uid6_fpMultAddTest_qi, xout => signRPostExc_uid105_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist159_signRPostExc_uid105_p_uid6_fpMultAddTest_q_2(DELAY,1319)
    redist159_signRPostExc_uid105_p_uid6_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid105_p_uid6_fpMultAddTest_q, xout => redist159_signRPostExc_uid105_p_uid6_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- wEP2AllZ_uid214_r_uid7_fpMultAddTest(CONSTANT,213)
    wEP2AllZ_uid214_r_uid7_fpMultAddTest_q <= "0000000000";

    -- ofracY_uid46_p_uid6_fpMultAddTest(BITJOIN,45)@0
    ofracY_uid46_p_uid6_fpMultAddTest_q <= VCC_q & frac_y_uid31_p_uid6_fpMultAddTest_b;

    -- ofracX_uid43_p_uid6_fpMultAddTest(BITJOIN,42)@0
    ofracX_uid43_p_uid6_fpMultAddTest_q <= VCC_q & frac_x_uid17_p_uid6_fpMultAddTest_b;

    -- prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma(CHAINMULTADD,1092)@0 + 2
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_reset <= areset;
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ena0 <= '1';
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ena1 <= prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ena0;
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_p(0) <= prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_a0(0) * prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_c0(0);
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_u(0) <= RESIZE(prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_p(0),48);
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_w(0) <= prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_u(0);
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_x(0) <= prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_w(0);
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_y(0) <= prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_x(0);
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_a0 <= (others => (others => '0'));
            prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ena0 = '1') THEN
                prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_a0(0) <= RESIZE(UNSIGNED(ofracX_uid43_p_uid6_fpMultAddTest_q),24);
                prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_c0(0) <= RESIZE(UNSIGNED(ofracY_uid46_p_uid6_fpMultAddTest_q),24);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_ena1 = '1') THEN
                prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_s(0) <= prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 48, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_s(0)(47 downto 0)), xout => prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_qq, clk => clk, aclr => areset );
    prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_qq(47 downto 0));

    -- redist22_prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q_1(DELAY,1182)
    redist22_prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 48, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q, xout => redist22_prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q_1_q, clk => clk, aclr => areset );

    -- normalizeBit_uid52_p_uid6_fpMultAddTest(BITSELECT,51)@3
    normalizeBit_uid52_p_uid6_fpMultAddTest_b <= STD_LOGIC_VECTOR(redist22_prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q_1_q(47 downto 47));

    -- redist163_normalizeBit_uid52_p_uid6_fpMultAddTest_b_5(DELAY,1323)
    redist163_normalizeBit_uid52_p_uid6_fpMultAddTest_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => normalizeBit_uid52_p_uid6_fpMultAddTest_b, xout => redist163_normalizeBit_uid52_p_uid6_fpMultAddTest_b_5_q, clk => clk, aclr => areset );

    -- roundBitDetectionConstant_uid66_p_uid6_fpMultAddTest(CONSTANT,65)
    roundBitDetectionConstant_uid66_p_uid6_fpMultAddTest_q <= "010";

    -- fracRPostNormHigh_uid54_p_uid6_fpMultAddTest(BITSELECT,53)@3
    fracRPostNormHigh_uid54_p_uid6_fpMultAddTest_in <= redist22_prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q_1_q(46 downto 0);
    fracRPostNormHigh_uid54_p_uid6_fpMultAddTest_b <= fracRPostNormHigh_uid54_p_uid6_fpMultAddTest_in(46 downto 23);

    -- fracRPostNormLow_uid55_p_uid6_fpMultAddTest(BITSELECT,54)@3
    fracRPostNormLow_uid55_p_uid6_fpMultAddTest_in <= redist22_prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q_1_q(45 downto 0);
    fracRPostNormLow_uid55_p_uid6_fpMultAddTest_b <= fracRPostNormLow_uid55_p_uid6_fpMultAddTest_in(45 downto 22);

    -- fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0(MUX,882)@3 + 1
    fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_s <= normalizeBit_uid52_p_uid6_fpMultAddTest_b;
    fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_s) IS
                WHEN "0" => fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q <= fracRPostNormLow_uid55_p_uid6_fpMultAddTest_b;
                WHEN "1" => fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q <= fracRPostNormHigh_uid54_p_uid6_fpMultAddTest_b;
                WHEN OTHERS => fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist54_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_4(DELAY,1214)
    redist54_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_4 : dspba_delay
    GENERIC MAP ( width => 24, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q, xout => redist54_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_4_q, clk => clk, aclr => areset );

    -- fracRPostNorm1dto0_uid64_p_uid6_fpMultAddTest(BITSELECT,63)@7
    fracRPostNorm1dto0_uid64_p_uid6_fpMultAddTest_in <= redist54_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_4_q(1 downto 0);
    fracRPostNorm1dto0_uid64_p_uid6_fpMultAddTest_b <= fracRPostNorm1dto0_uid64_p_uid6_fpMultAddTest_in(1 downto 0);

    -- extraStickyBitOfProd_uid58_p_uid6_fpMultAddTest(BITSELECT,57)@3
    extraStickyBitOfProd_uid58_p_uid6_fpMultAddTest_in <= STD_LOGIC_VECTOR(redist22_prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q_1_q(22 downto 0));
    extraStickyBitOfProd_uid58_p_uid6_fpMultAddTest_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid58_p_uid6_fpMultAddTest_in(22 downto 22));

    -- extraStickyBit_uid59_p_uid6_fpMultAddTest(MUX,58)@3 + 1
    extraStickyBit_uid59_p_uid6_fpMultAddTest_s <= normalizeBit_uid52_p_uid6_fpMultAddTest_b;
    extraStickyBit_uid59_p_uid6_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            extraStickyBit_uid59_p_uid6_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (extraStickyBit_uid59_p_uid6_fpMultAddTest_s) IS
                WHEN "0" => extraStickyBit_uid59_p_uid6_fpMultAddTest_q <= GND_q;
                WHEN "1" => extraStickyBit_uid59_p_uid6_fpMultAddTest_q <= extraStickyBitOfProd_uid58_p_uid6_fpMultAddTest_b;
                WHEN OTHERS => extraStickyBit_uid59_p_uid6_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- stickyRange_uid57_p_uid6_fpMultAddTest(BITSELECT,56)@3
    stickyRange_uid57_p_uid6_fpMultAddTest_in <= redist22_prodXY_uid252_prod_uid50_p_uid6_fpMultAddTest_cma_q_1_q(21 downto 0);
    stickyRange_uid57_p_uid6_fpMultAddTest_b <= stickyRange_uid57_p_uid6_fpMultAddTest_in(21 downto 0);

    -- redist162_stickyRange_uid57_p_uid6_fpMultAddTest_b_1(DELAY,1322)
    redist162_stickyRange_uid57_p_uid6_fpMultAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyRange_uid57_p_uid6_fpMultAddTest_b, xout => redist162_stickyRange_uid57_p_uid6_fpMultAddTest_b_1_q, clk => clk, aclr => areset );

    -- stickyExtendedRange_uid60_p_uid6_fpMultAddTest(BITJOIN,59)@4
    stickyExtendedRange_uid60_p_uid6_fpMultAddTest_q <= extraStickyBit_uid59_p_uid6_fpMultAddTest_q & redist162_stickyRange_uid57_p_uid6_fpMultAddTest_b_1_q;

    -- z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1098)@4
    z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b <= stickyExtendedRange_uid60_p_uid6_fpMultAddTest_q(5 downto 0);
    z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c <= stickyExtendedRange_uid60_p_uid6_fpMultAddTest_q(11 downto 6);
    z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_d <= stickyExtendedRange_uid60_p_uid6_fpMultAddTest_q(17 downto 12);
    z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_e <= stickyExtendedRange_uid60_p_uid6_fpMultAddTest_q(22 downto 18);

    -- eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,350)@4 + 1
    eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= "1" WHEN z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_e = c3_uid310_fracXIsZero_uid20_p_uid6_fpMultAddTest_b ELSE "0";
    eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist115_eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q_2(DELAY,1275)
    redist115_eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, xout => redist115_eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid605_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1142)@4
    x0_uid605_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_d(2 downto 0);
    x0_uid605_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid610_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,609)@4 + 1
    eq1_uid610_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid605_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid610_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid610_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => eq1_uid610_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid607_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,606)@4 + 1
    eq0_uid607_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid605_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid607_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid607_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => eq0_uid607_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid611_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,610)@5 + 1
    andEq_uid611_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= eq0_uid607_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q and eq1_uid610_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q;
    andEq_uid611_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid611_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => andEq_uid611_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid598_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1141)@4
    x0_uid598_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c(2 downto 0);
    x0_uid598_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid603_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,602)@4 + 1
    eq1_uid603_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid598_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid603_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid603_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => eq1_uid603_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid600_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,599)@4 + 1
    eq0_uid600_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid598_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid600_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid600_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => eq0_uid600_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid604_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,603)@5 + 1
    andEq_uid604_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= eq0_uid600_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q and eq1_uid603_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q;
    andEq_uid604_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid604_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => andEq_uid604_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid591_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select(BITSELECT,1140)@4
    x0_uid591_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b <= z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid591_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c <= z0_uid340_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid596_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,595)@4 + 1
    eq1_uid596_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid591_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_c = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid596_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid596_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => eq1_uid596_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid593_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,592)@4 + 1
    eq0_uid593_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= "1" WHEN x0_uid591_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_merged_bit_select_b = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid593_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid593_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => eq0_uid593_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid597_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,596)@5 + 1
    andEq_uid597_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= eq0_uid593_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q and eq1_uid596_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q;
    andEq_uid597_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid597_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => andEq_uid597_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid352_stickyRangeComparator_uid62_p_uid6_fpMultAddTest(LOGICAL,351)@6 + 1
    and_lev0_uid352_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi <= andEq_uid597_eq0_uid342_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q and andEq_uid604_eq1_uid345_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q and andEq_uid611_eq2_uid348_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q and redist115_eq3_uid351_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q_2_q;
    and_lev0_uid352_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid352_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_qi, xout => and_lev0_uid352_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- sticky_uid63_p_uid6_fpMultAddTest(LOGICAL,62)@7
    sticky_uid63_p_uid6_fpMultAddTest_q <= not (and_lev0_uid352_stickyRangeComparator_uid62_p_uid6_fpMultAddTest_q);

    -- lrs_uid65_p_uid6_fpMultAddTest(BITJOIN,64)@7
    lrs_uid65_p_uid6_fpMultAddTest_q <= fracRPostNorm1dto0_uid64_p_uid6_fpMultAddTest_b & sticky_uid63_p_uid6_fpMultAddTest_q;

    -- roundBitDetectionPattern_uid67_p_uid6_fpMultAddTest(LOGICAL,66)@7 + 1
    roundBitDetectionPattern_uid67_p_uid6_fpMultAddTest_qi <= "1" WHEN lrs_uid65_p_uid6_fpMultAddTest_q = roundBitDetectionConstant_uid66_p_uid6_fpMultAddTest_q ELSE "0";
    roundBitDetectionPattern_uid67_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => roundBitDetectionPattern_uid67_p_uid6_fpMultAddTest_qi, xout => roundBitDetectionPattern_uid67_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- roundBit_uid68_p_uid6_fpMultAddTest(LOGICAL,67)@8
    roundBit_uid68_p_uid6_fpMultAddTest_q <= not (roundBitDetectionPattern_uid67_p_uid6_fpMultAddTest_q);

    -- roundBitAndNormalizationOp_uid71_p_uid6_fpMultAddTest(BITJOIN,70)@8
    roundBitAndNormalizationOp_uid71_p_uid6_fpMultAddTest_q <= GND_q & redist163_normalizeBit_uid52_p_uid6_fpMultAddTest_b_5_q & cstZeroWF_uid14_p_uid6_fpMultAddTest_q & roundBit_uid68_p_uid6_fpMultAddTest_q;

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitExpansion_for_b(BITJOIN,759)@8
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitExpansion_for_b_q <= wEP2AllZ_uid214_r_uid7_fpMultAddTest_q & roundBitAndNormalizationOp_uid71_p_uid6_fpMultAddTest_q;

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b(BITSELECT,762)@8
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_b <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitExpansion_for_b_q(5 downto 0);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_f <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitExpansion_for_b_q(29 downto 24);

    -- redist55_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_5(DELAY,1215)
    redist55_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_5 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist54_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_4_q, xout => redist55_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_5_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_0(BITSELECT,943)@8
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(redist55_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_5_q(5 downto 0));

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6(ADD,763)@8 + 1
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_0_b);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_b);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_a) + UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_c(0) <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_o(6);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_q <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_o(5 downto 0);

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0(BITSELECT,956)
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(cstZeroWF_uid14_p_uid6_fpMultAddTest_q(10 downto 5));

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel1_0(BITSELECT,945)@8
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(redist55_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_5_q(11 downto 6));

    -- redist30_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel1_0_b_1(DELAY,1190)
    redist30_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel1_0_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel1_0_b, xout => redist30_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel1_0_b_1_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6(ADD,764)@9 + 1
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_cin <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_c;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & redist30_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel1_0_b_1_q) & '1';
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0_b) & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_cin(0);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_a) + UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_c(0) <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_o(7);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_q <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel2_0(BITSELECT,958)
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(cstZeroWF_uid14_p_uid6_fpMultAddTest_q(16 downto 11));

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0(BITSELECT,947)@8
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(redist55_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_5_q(17 downto 12));

    -- redist29_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_2(DELAY,1189)
    redist29_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b, xout => redist29_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_2_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6(ADD,765)@10 + 1
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_cin <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_c;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & redist29_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_2_q) & '1';
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel2_0_b) & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_cin(0);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_a) + UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_c(0) <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_o(7);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_q <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel3_0(BITSELECT,960)
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel3_0_b <= STD_LOGIC_VECTOR(cstZeroWF_uid14_p_uid6_fpMultAddTest_q(22 downto 17));

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel3_0(BITSELECT,949)@8
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel3_0_b <= STD_LOGIC_VECTOR(redist55_fracRPostNorm_uid56_p_uid6_fpMultAddTest_p0_q_5_q(23 downto 18));

    -- redist28_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel3_0_b_3(DELAY,1188)
    redist28_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel3_0_b_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel3_0_b, xout => redist28_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel3_0_b_3_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6(ADD,766)@11 + 1
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_cin <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_c;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & redist28_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel3_0_b_3_q) & '1';
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel3_0_b) & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_cin(0);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_a) + UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_c(0) <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_o(7);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_q <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_o(6 downto 1);

    -- redist91_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_f_4(DELAY,1251)
    redist91_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_f_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_f, xout => redist91_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_f_4_q, clk => clk, aclr => areset );

    -- biasInc_uid48_p_uid6_fpMultAddTest(CONSTANT,47)
    biasInc_uid48_p_uid6_fpMultAddTest_q <= "0001111111";

    -- expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel0_0(BITSELECT,938)
    expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(biasInc_uid48_p_uid6_fpMultAddTest_q(5 downto 0));

    -- expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_b(BITJOIN,739)@0
    expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_b_q <= GND_q & expY_uid10_p_uid6_fpMultAddTest_b;

    -- expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b(BITSELECT,742)@0
    expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_b <= expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_b_q(5 downto 0);
    expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_c <= expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_b_q(8 downto 6);

    -- expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_a(BITJOIN,737)@0
    expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_a_q <= GND_q & expX_uid9_p_uid6_fpMultAddTest_b;

    -- expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a(BITSELECT,741)@0
    expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_b <= expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_a_q(5 downto 0);
    expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_c <= expSum_uid47_p_uid6_fpMultAddTest_BitExpansion_for_a_q(8 downto 6);

    -- expSum_uid47_p_uid6_fpMultAddTest_p1_of_2(ADD,743)@0 + 1
    expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_b);
    expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_b);
    expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_a) + UNSIGNED(expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_c(0) <= expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_o(6);
    expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_q <= expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_o(5 downto 0);

    -- redist93_expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_q_10(DELAY,1253)
    redist93_expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_q_10 : dspba_delay
    GENERIC MAP ( width => 6, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_q, xout => redist93_expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_q_10_q, clk => clk, aclr => areset );

    -- expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2(SUB,753)@11 + 1
    expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & redist93_expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_q_10_q);
    expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel0_0_b);
    expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_a) - UNSIGNED(expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_c(0) <= expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_o(6);
    expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_q <= expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_o(5 downto 0);

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6(ADD,767)@12 + 1
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_cin <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_c;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_q) & '1';
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & redist91_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_f_4_q) & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_cin(0);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_a) + UNSIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_c(0) <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_o(7);
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel5_0(BITSELECT,962)
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel5_0_b <= STD_LOGIC_VECTOR(wEP2AllZ_uid214_r_uid7_fpMultAddTest_q(9 downto 4));

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel5_1(BITSELECT,954)@13
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel5_1_b <= STD_LOGIC_VECTOR(expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_q(4 downto 4));

    -- expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1(BITSELECT,941)
    expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_b <= STD_LOGIC_VECTOR(biasInc_uid48_p_uid6_fpMultAddTest_q(9 downto 9));

    -- expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0(BITSELECT,940)
    expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(biasInc_uid48_p_uid6_fpMultAddTest_q(9 downto 6));

    -- expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,942)@12
    expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q <= expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_b & expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0_b;

    -- zs_uid275_lzCountVal_uid187_r_uid7_fpMultAddTest(CONSTANT,274)
    zs_uid275_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= "00";

    -- redist94_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_c_1(DELAY,1254)
    redist94_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_c, xout => redist94_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_c_1_q, clk => clk, aclr => areset );

    -- redist95_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_c_1(DELAY,1255)
    redist95_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_c, xout => redist95_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_c_1_q, clk => clk, aclr => areset );

    -- expSum_uid47_p_uid6_fpMultAddTest_p2_of_2(ADD,744)@1 + 1
    expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_cin <= expSum_uid47_p_uid6_fpMultAddTest_p1_of_2_c;
    expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist95_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_a_c_1_q) & '1';
    expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist94_expSum_uid47_p_uid6_fpMultAddTest_BitSelect_for_b_c_1_q) & expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_cin(0);
    expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_a) + UNSIGNED(expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_q <= expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_o(3 downto 1);

    -- redist92_expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_q_10(DELAY,1252)
    redist92_expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_q_10 : dspba_delay
    GENERIC MAP ( width => 3, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_q, xout => redist92_expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_q_10_q, clk => clk, aclr => areset );

    -- expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,937)@12
    expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q <= zs_uid275_lzCountVal_uid187_r_uid7_fpMultAddTest_q & redist92_expSum_uid47_p_uid6_fpMultAddTest_p2_of_2_q_10_q;

    -- expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2(SUB,754)@12 + 1
    expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_cin <= expSumMBias_uid49_p_uid6_fpMultAddTest_p1_of_2_c;
    expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q) & '0');
    expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q(4)) & expSumMBias_uid49_p_uid6_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q) & expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_cin(0));
    expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_a) - SIGNED(expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_q <= expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_o(5 downto 1);

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_g(BITJOIN,955)@13
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_g_q <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_tessel5_1_b & expSumMBias_uid49_p_uid6_fpMultAddTest_p2_of_2_q;

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6(ADD,768)@13 + 1
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_cin <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_c;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_g_q(5)) & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_g_q) & '1');
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitSelect_for_b_tessel5_0_b) & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_cin(0));
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_a) + SIGNED(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_q <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_o(6 downto 1);

    -- redist86_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q_1(DELAY,1246)
    redist86_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q, xout => redist86_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q_1_q, clk => clk, aclr => areset );

    -- redist87_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_q_2(DELAY,1247)
    redist87_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_q, xout => redist87_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_q_2_q, clk => clk, aclr => areset );

    -- redist88_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_q_3(DELAY,1248)
    redist88_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_q, xout => redist88_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_q_3_q, clk => clk, aclr => areset );

    -- redist89_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_q_4(DELAY,1249)
    redist89_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_q, xout => redist89_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_q_4_q, clk => clk, aclr => areset );

    -- redist90_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_q_5(DELAY,1250)
    redist90_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_q_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_q, xout => redist90_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_q_5_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitJoin_for_q(BITJOIN,769)@14
    expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitJoin_for_q_q <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_q & redist86_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q_1_q & redist87_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p4_of_6_q_2_q & redist88_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p3_of_6_q_3_q & redist89_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p2_of_6_q_4_q & redist90_expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p1_of_6_q_5_q;

    -- expRPreExcExt_uid74_p_uid6_fpMultAddTest(BITSELECT,73)@14
    expRPreExcExt_uid74_p_uid6_fpMultAddTest_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitJoin_for_q_q(35 downto 24));

    -- expRPreExc_uid75_p_uid6_fpMultAddTest(BITSELECT,74)@14
    expRPreExc_uid75_p_uid6_fpMultAddTest_in <= expRPreExcExt_uid74_p_uid6_fpMultAddTest_b(7 downto 0);
    expRPreExc_uid75_p_uid6_fpMultAddTest_b <= expRPreExc_uid75_p_uid6_fpMultAddTest_in(7 downto 0);

    -- redist160_expRPreExc_uid75_p_uid6_fpMultAddTest_b_5(DELAY,1320)
    redist160_expRPreExc_uid75_p_uid6_fpMultAddTest_b_5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid75_p_uid6_fpMultAddTest_b, xout => redist160_expRPreExc_uid75_p_uid6_fpMultAddTest_b_5_q, clk => clk, aclr => areset );

    -- expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel0_0(BITSELECT,983)
    expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(cstAllOWE_uid13_p_uid6_fpMultAddTest_q(5 downto 0));

    -- expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3(COMPARE,789)@13 + 1
    expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q);
    expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_b <= STD_LOGIC_VECTOR("0" & expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel0_0_b);
    expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_a) - UNSIGNED(expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_b));
        END IF;
    END PROCESS;
    expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_c(0) <= expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_o(6);

    -- expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0(BITSELECT,985)
    expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(cstAllOWE_uid13_p_uid6_fpMultAddTest_q(7 downto 6));

    -- expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,987)@14
    expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q <= expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_merged_bit_select_b & expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_0_b;

    -- expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3(COMPARE,790)@14 + 1
    expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_cin <= expOvf_uid78_p_uid6_fpMultAddTest_p1_of_3_c;
    expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_q) & '0';
    expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_b <= STD_LOGIC_VECTOR("0" & expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q) & expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_cin(0);
    expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_a) - UNSIGNED(expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_b));
        END IF;
    END PROCESS;
    expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_c(0) <= expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_o(7);

    -- expOvf_uid78_p_uid6_fpMultAddTest_UpperBits_for_b(CONSTANT,786)
    expOvf_uid78_p_uid6_fpMultAddTest_UpperBits_for_b_q <= "00000";

    -- expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_merged_bit_select(BITSELECT,1123)
    expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_merged_bit_select_b <= STD_LOGIC_VECTOR(expOvf_uid78_p_uid6_fpMultAddTest_UpperBits_for_b_q(3 downto 0));
    expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_merged_bit_select_c <= STD_LOGIC_VECTOR(expOvf_uid78_p_uid6_fpMultAddTest_UpperBits_for_b_q(4 downto 4));

    -- expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_b_tessel2_0(BITSELECT,975)@14
    expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_q(5 downto 5));

    -- redist26_expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_1(DELAY,1186)
    redist26_expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_b_tessel2_0_b, xout => redist26_expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3(COMPARE,791)@15 + 1
    expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_cin <= expOvf_uid78_p_uid6_fpMultAddTest_p2_of_3_c;
    expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => redist26_expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_1_q(0)) & redist26_expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_1_q) & '0');
    expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_b_tessel1_1_merged_bit_select_c) & expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_cin(0));
    expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_a) - SIGNED(expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_b));
        END IF;
    END PROCESS;
    expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_c(0) <= expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_o(2);

    -- expOvf_uid78_p_uid6_fpMultAddTest_cout_n(LOGICAL,793)@16
    expOvf_uid78_p_uid6_fpMultAddTest_cout_n_q <= STD_LOGIC_VECTOR(not (expOvf_uid78_p_uid6_fpMultAddTest_p3_of_3_c));

    -- invExpXIsMax_uid38_p_uid6_fpMultAddTest(LOGICAL,37)@14 + 1
    invExpXIsMax_uid38_p_uid6_fpMultAddTest_qi <= not (redist118_and_lev0_uid326_expXIsMax_uid33_p_uid6_fpMultAddTest_q_12_q);
    invExpXIsMax_uid38_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invExpXIsMax_uid38_p_uid6_fpMultAddTest_qi, xout => invExpXIsMax_uid38_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid39_p_uid6_fpMultAddTest(LOGICAL,38)@15
    InvExpXIsZero_uid39_p_uid6_fpMultAddTest_q <= not (redist119_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_13_q);

    -- excR_y_uid40_p_uid6_fpMultAddTest(LOGICAL,39)@15 + 1
    excR_y_uid40_p_uid6_fpMultAddTest_qi <= InvExpXIsZero_uid39_p_uid6_fpMultAddTest_q and invExpXIsMax_uid38_p_uid6_fpMultAddTest_q;
    excR_y_uid40_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_y_uid40_p_uid6_fpMultAddTest_qi, xout => excR_y_uid40_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid24_p_uid6_fpMultAddTest(LOGICAL,23)@15
    invExpXIsMax_uid24_p_uid6_fpMultAddTest_q <= not (redist124_and_lev0_uid299_expXIsMax_uid19_p_uid6_fpMultAddTest_q_13_q);

    -- InvExpXIsZero_uid25_p_uid6_fpMultAddTest(LOGICAL,24)@15
    InvExpXIsZero_uid25_p_uid6_fpMultAddTest_q <= not (redist125_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_13_q);

    -- excR_x_uid26_p_uid6_fpMultAddTest(LOGICAL,25)@15 + 1
    excR_x_uid26_p_uid6_fpMultAddTest_qi <= InvExpXIsZero_uid25_p_uid6_fpMultAddTest_q and invExpXIsMax_uid24_p_uid6_fpMultAddTest_q;
    excR_x_uid26_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_x_uid26_p_uid6_fpMultAddTest_qi, xout => excR_x_uid26_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- ExcROvfAndInReg_uid87_p_uid6_fpMultAddTest(LOGICAL,86)@16 + 1
    ExcROvfAndInReg_uid87_p_uid6_fpMultAddTest_qi <= excR_x_uid26_p_uid6_fpMultAddTest_q and excR_y_uid40_p_uid6_fpMultAddTest_q and expOvf_uid78_p_uid6_fpMultAddTest_cout_n_q;
    ExcROvfAndInReg_uid87_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ExcROvfAndInReg_uid87_p_uid6_fpMultAddTest_qi, xout => ExcROvfAndInReg_uid87_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist168_excI_x_uid22_p_uid6_fpMultAddTest_q_2(DELAY,1328)
    redist168_excI_x_uid22_p_uid6_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid22_p_uid6_fpMultAddTest_q, xout => redist168_excI_x_uid22_p_uid6_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- excYRAndExcXI_uid86_p_uid6_fpMultAddTest(LOGICAL,85)@16 + 1
    excYRAndExcXI_uid86_p_uid6_fpMultAddTest_qi <= excR_y_uid40_p_uid6_fpMultAddTest_q and redist168_excI_x_uid22_p_uid6_fpMultAddTest_q_2_q;
    excYRAndExcXI_uid86_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYRAndExcXI_uid86_p_uid6_fpMultAddTest_qi, xout => excYRAndExcXI_uid86_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist166_excI_y_uid36_p_uid6_fpMultAddTest_q_2(DELAY,1326)
    redist166_excI_y_uid36_p_uid6_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid36_p_uid6_fpMultAddTest_q, xout => redist166_excI_y_uid36_p_uid6_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- excXRAndExcYI_uid85_p_uid6_fpMultAddTest(LOGICAL,84)@16 + 1
    excXRAndExcYI_uid85_p_uid6_fpMultAddTest_qi <= excR_x_uid26_p_uid6_fpMultAddTest_q and redist166_excI_y_uid36_p_uid6_fpMultAddTest_q_2_q;
    excXRAndExcYI_uid85_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXRAndExcYI_uid85_p_uid6_fpMultAddTest_qi, xout => excXRAndExcYI_uid85_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- excXIAndExcYI_uid84_p_uid6_fpMultAddTest(LOGICAL,83)@16 + 1
    excXIAndExcYI_uid84_p_uid6_fpMultAddTest_qi <= redist168_excI_x_uid22_p_uid6_fpMultAddTest_q_2_q and redist166_excI_y_uid36_p_uid6_fpMultAddTest_q_2_q;
    excXIAndExcYI_uid84_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXIAndExcYI_uid84_p_uid6_fpMultAddTest_qi, xout => excXIAndExcYI_uid84_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- excRInf_uid88_p_uid6_fpMultAddTest(LOGICAL,87)@17 + 1
    excRInf_uid88_p_uid6_fpMultAddTest_qi <= excXIAndExcYI_uid84_p_uid6_fpMultAddTest_q or excXRAndExcYI_uid85_p_uid6_fpMultAddTest_q or excYRAndExcXI_uid86_p_uid6_fpMultAddTest_q or ExcROvfAndInReg_uid87_p_uid6_fpMultAddTest_q;
    excRInf_uid88_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInf_uid88_p_uid6_fpMultAddTest_qi, xout => excRInf_uid88_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,966)@13
    expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q <= expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_b & GND_q;

    -- expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3(COMPARE,777)@13 + 1
    expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_a <= STD_LOGIC_VECTOR("0" & expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q);
    expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p5_of_6_q);
    expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_a) - UNSIGNED(expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_b));
        END IF;
    END PROCESS;
    expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_c(0) <= expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_o(6);

    -- expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3(COMPARE,778)@14 + 1
    expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_cin <= expUdf_uid76_p_uid6_fpMultAddTest_p1_of_3_c;
    expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_a <= STD_LOGIC_VECTOR("0" & expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_c) & '0';
    expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid72_p_uid6_fpMultAddTest_p6_of_6_q) & expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_cin(0);
    expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_a) - UNSIGNED(expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_b));
        END IF;
    END PROCESS;
    expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_c(0) <= expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_o(7);

    -- rightShiftStage1Idx3Pad12_uid429_alignmentShifter_uid166_r_uid7_fpMultAddTest(CONSTANT,428)
    rightShiftStage1Idx3Pad12_uid429_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= "000000000000";

    -- expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,1122)
    expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(rightShiftStage1Idx3Pad12_uid429_alignmentShifter_uid166_r_uid7_fpMultAddTest_q(4 downto 0));
    expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(rightShiftStage1Idx3Pad12_uid429_alignmentShifter_uid166_r_uid7_fpMultAddTest_q(10 downto 5));
    expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_d <= STD_LOGIC_VECTOR(rightShiftStage1Idx3Pad12_uid429_alignmentShifter_uid166_r_uid7_fpMultAddTest_q(11 downto 11));

    -- expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3(COMPARE,779)@15 + 1
    expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_cin <= expUdf_uid76_p_uid6_fpMultAddTest_p2_of_3_c;
    expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expUdf_uid76_p_uid6_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_d) & '0');
    expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => redist26_expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_1_q(0)) & redist26_expOvf_uid78_p_uid6_fpMultAddTest_BitSelect_for_a_tessel2_0_b_1_q) & expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_cin(0));
    expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_a) - SIGNED(expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_b));
        END IF;
    END PROCESS;
    expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_c(0) <= expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_o(2);

    -- expUdf_uid76_p_uid6_fpMultAddTest_cout_n(LOGICAL,781)@16
    expUdf_uid76_p_uid6_fpMultAddTest_cout_n_q <= STD_LOGIC_VECTOR(not (expUdf_uid76_p_uid6_fpMultAddTest_p3_of_3_c));

    -- excZC3_uid82_p_uid6_fpMultAddTest(LOGICAL,81)@16 + 1
    excZC3_uid82_p_uid6_fpMultAddTest_qi <= excR_x_uid26_p_uid6_fpMultAddTest_q and excR_y_uid40_p_uid6_fpMultAddTest_q and expUdf_uid76_p_uid6_fpMultAddTest_cout_n_q;
    excZC3_uid82_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZC3_uid82_p_uid6_fpMultAddTest_qi, xout => excZC3_uid82_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist120_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_14(DELAY,1280)
    redist120_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist119_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_13_q, xout => redist120_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_14_q, clk => clk, aclr => areset );

    -- excYZAndExcXR_uid81_p_uid6_fpMultAddTest(LOGICAL,80)@16 + 1
    excYZAndExcXR_uid81_p_uid6_fpMultAddTest_qi <= redist120_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_14_q and excR_x_uid26_p_uid6_fpMultAddTest_q;
    excYZAndExcXR_uid81_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYZAndExcXR_uid81_p_uid6_fpMultAddTest_qi, xout => excYZAndExcXR_uid81_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist126_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_14(DELAY,1286)
    redist126_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist125_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_13_q, xout => redist126_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_14_q, clk => clk, aclr => areset );

    -- excXZAndExcYR_uid80_p_uid6_fpMultAddTest(LOGICAL,79)@16 + 1
    excXZAndExcYR_uid80_p_uid6_fpMultAddTest_qi <= redist126_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_14_q and excR_y_uid40_p_uid6_fpMultAddTest_q;
    excXZAndExcYR_uid80_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYR_uid80_p_uid6_fpMultAddTest_qi, xout => excXZAndExcYR_uid80_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- excXZAndExcYZ_uid79_p_uid6_fpMultAddTest(LOGICAL,78)@16 + 1
    excXZAndExcYZ_uid79_p_uid6_fpMultAddTest_qi <= redist126_and_lev0_uid292_excZ_x_uid18_p_uid6_fpMultAddTest_q_14_q and redist120_and_lev0_uid319_excZ_y_uid32_p_uid6_fpMultAddTest_q_14_q;
    excXZAndExcYZ_uid79_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYZ_uid79_p_uid6_fpMultAddTest_qi, xout => excXZAndExcYZ_uid79_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- excRZero_uid83_p_uid6_fpMultAddTest(LOGICAL,82)@17 + 1
    excRZero_uid83_p_uid6_fpMultAddTest_qi <= excXZAndExcYZ_uid79_p_uid6_fpMultAddTest_q or excXZAndExcYR_uid80_p_uid6_fpMultAddTest_q or excYZAndExcXR_uid81_p_uid6_fpMultAddTest_q or excZC3_uid82_p_uid6_fpMultAddTest_q;
    excRZero_uid83_p_uid6_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid83_p_uid6_fpMultAddTest_qi, xout => excRZero_uid83_p_uid6_fpMultAddTest_q, clk => clk, aclr => areset );

    -- concExc_uid93_p_uid6_fpMultAddTest(BITJOIN,92)@18
    concExc_uid93_p_uid6_fpMultAddTest_q <= excRNaN_uid92_p_uid6_fpMultAddTest_q & excRInf_uid88_p_uid6_fpMultAddTest_q & excRZero_uid83_p_uid6_fpMultAddTest_q;

    -- excREnc_uid94_p_uid6_fpMultAddTest(LOOKUP,93)@18 + 1
    excREnc_uid94_p_uid6_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid94_p_uid6_fpMultAddTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid93_p_uid6_fpMultAddTest_q) IS
                WHEN "000" => excREnc_uid94_p_uid6_fpMultAddTest_q <= "01";
                WHEN "001" => excREnc_uid94_p_uid6_fpMultAddTest_q <= "00";
                WHEN "010" => excREnc_uid94_p_uid6_fpMultAddTest_q <= "10";
                WHEN "011" => excREnc_uid94_p_uid6_fpMultAddTest_q <= "00";
                WHEN "100" => excREnc_uid94_p_uid6_fpMultAddTest_q <= "11";
                WHEN "101" => excREnc_uid94_p_uid6_fpMultAddTest_q <= "00";
                WHEN "110" => excREnc_uid94_p_uid6_fpMultAddTest_q <= "00";
                WHEN "111" => excREnc_uid94_p_uid6_fpMultAddTest_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREnc_uid94_p_uid6_fpMultAddTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExc_uid103_p_uid6_fpMultAddTest(MUX,102)@19 + 1
    expRPostExc_uid103_p_uid6_fpMultAddTest_s <= excREnc_uid94_p_uid6_fpMultAddTest_q;
    expRPostExc_uid103_p_uid6_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc_uid103_p_uid6_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPostExc_uid103_p_uid6_fpMultAddTest_s) IS
                WHEN "00" => expRPostExc_uid103_p_uid6_fpMultAddTest_q <= cstAllZWE_uid15_p_uid6_fpMultAddTest_q;
                WHEN "01" => expRPostExc_uid103_p_uid6_fpMultAddTest_q <= redist160_expRPreExc_uid75_p_uid6_fpMultAddTest_b_5_q;
                WHEN "10" => expRPostExc_uid103_p_uid6_fpMultAddTest_q <= cstAllOWE_uid13_p_uid6_fpMultAddTest_q;
                WHEN "11" => expRPostExc_uid103_p_uid6_fpMultAddTest_q <= cstAllOWE_uid13_p_uid6_fpMultAddTest_q;
                WHEN OTHERS => expRPostExc_uid103_p_uid6_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oneFracRPostExc2_uid95_p_uid6_fpMultAddTest(CONSTANT,94)
    oneFracRPostExc2_uid95_p_uid6_fpMultAddTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid73_p_uid6_fpMultAddTest(BITSELECT,72)@14
    fracRPreExc_uid73_p_uid6_fpMultAddTest_in <= expFracRPostRounding_uid72_p_uid6_fpMultAddTest_BitJoin_for_q_q(23 downto 0);
    fracRPreExc_uid73_p_uid6_fpMultAddTest_b <= fracRPreExc_uid73_p_uid6_fpMultAddTest_in(23 downto 1);

    -- redist161_fracRPreExc_uid73_p_uid6_fpMultAddTest_b_5(DELAY,1321)
    redist161_fracRPreExc_uid73_p_uid6_fpMultAddTest_b_5 : dspba_delay
    GENERIC MAP ( width => 23, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid73_p_uid6_fpMultAddTest_b, xout => redist161_fracRPreExc_uid73_p_uid6_fpMultAddTest_b_5_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid98_p_uid6_fpMultAddTest(MUX,97)@19 + 1
    fracRPostExc_uid98_p_uid6_fpMultAddTest_s <= excREnc_uid94_p_uid6_fpMultAddTest_q;
    fracRPostExc_uid98_p_uid6_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostExc_uid98_p_uid6_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostExc_uid98_p_uid6_fpMultAddTest_s) IS
                WHEN "00" => fracRPostExc_uid98_p_uid6_fpMultAddTest_q <= cstZeroWF_uid14_p_uid6_fpMultAddTest_q;
                WHEN "01" => fracRPostExc_uid98_p_uid6_fpMultAddTest_q <= redist161_fracRPreExc_uid73_p_uid6_fpMultAddTest_b_5_q;
                WHEN "10" => fracRPostExc_uid98_p_uid6_fpMultAddTest_q <= cstZeroWF_uid14_p_uid6_fpMultAddTest_q;
                WHEN "11" => fracRPostExc_uid98_p_uid6_fpMultAddTest_q <= oneFracRPostExc2_uid95_p_uid6_fpMultAddTest_q;
                WHEN OTHERS => fracRPostExc_uid98_p_uid6_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- R_uid106_p_uid6_fpMultAddTest(BITJOIN,105)@20
    R_uid106_p_uid6_fpMultAddTest_q <= redist159_signRPostExc_uid105_p_uid6_fpMultAddTest_q_2_q & expRPostExc_uid103_p_uid6_fpMultAddTest_q & fracRPostExc_uid98_p_uid6_fpMultAddTest_q;

    -- redist158_R_uid106_p_uid6_fpMultAddTest_q_6(DELAY,1318)
    redist158_R_uid106_p_uid6_fpMultAddTest_q_6 : dspba_delay
    GENERIC MAP ( width => 32, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => R_uid106_p_uid6_fpMultAddTest_q, xout => redist158_R_uid106_p_uid6_fpMultAddTest_q_6_q, clk => clk, aclr => areset );

    -- aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b(BITSELECT,884)@26
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_b <= STD_LOGIC_VECTOR(redist158_R_uid106_p_uid6_fpMultAddTest_q_6_q(4 downto 0));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_c <= STD_LOGIC_VECTOR(redist158_R_uid106_p_uid6_fpMultAddTest_q_6_q(10 downto 5));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_d <= STD_LOGIC_VECTOR(redist158_R_uid106_p_uid6_fpMultAddTest_q_6_q(16 downto 11));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_e <= STD_LOGIC_VECTOR(redist158_R_uid106_p_uid6_fpMultAddTest_q_6_q(22 downto 17));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_f <= STD_LOGIC_VECTOR(redist158_R_uid106_p_uid6_fpMultAddTest_q_6_q(28 downto 23));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_g <= STD_LOGIC_VECTOR(redist158_R_uid106_p_uid6_fpMultAddTest_q_6_q(30 downto 29));
    aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_h <= STD_LOGIC_VECTOR(redist158_R_uid106_p_uid6_fpMultAddTest_q_6_q(31 downto 31));

    -- expFracY_uid109_r_uid7_fpMultAddTest(BITSELECT,108)@20
    expFracY_uid109_r_uid7_fpMultAddTest_b <= redist169_xIn_c_20_q(30 downto 0);

    -- xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_b(BITJOIN,796)@20
    xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_b_q <= GND_q & expFracY_uid109_r_uid7_fpMultAddTest_b;

    -- xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b(BITSELECT,799)@20
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_b <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_b_q(5 downto 0);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_c <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_b_q(11 downto 6);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_d <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_b_q(17 downto 12);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_e <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_b_q(23 downto 18);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_f <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_b_q(29 downto 24);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_g <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_b_q(31 downto 30);

    -- expFracX_uid108_r_uid7_fpMultAddTest(BITSELECT,107)@20
    expFracX_uid108_r_uid7_fpMultAddTest_b <= R_uid106_p_uid6_fpMultAddTest_q(30 downto 0);

    -- xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_a(BITJOIN,794)@20
    xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_a_q <= GND_q & expFracX_uid108_r_uid7_fpMultAddTest_b;

    -- xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a(BITSELECT,798)@20
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_b <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_a_q(5 downto 0);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_c <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_a_q(11 downto 6);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_d <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_a_q(17 downto 12);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_e <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_a_q(23 downto 18);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_f <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_a_q(29 downto 24);
    xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_g <= xGTEy_uid110_r_uid7_fpMultAddTest_BitExpansion_for_a_q(31 downto 30);

    -- xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6(COMPARE,800)@20 + 1
    xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_b);
    xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_b);
    xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_a) - UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_c(0) <= xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_o(6);

    -- redist76_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_c_1(DELAY,1236)
    redist76_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_c, xout => redist76_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_c_1_q, clk => clk, aclr => areset );

    -- redist81_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_c_1(DELAY,1241)
    redist81_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_c, xout => redist81_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_c_1_q, clk => clk, aclr => areset );

    -- xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6(COMPARE,801)@21 + 1
    xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_cin <= xGTEy_uid110_r_uid7_fpMultAddTest_p1_of_6_c;
    xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & redist81_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_c_1_q) & '0';
    xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & redist76_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_c_1_q) & xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_cin(0);
    xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_a) - UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_c(0) <= xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_o(7);

    -- redist77_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_d_2(DELAY,1237)
    redist77_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_d_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_d, xout => redist77_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_d_2_q, clk => clk, aclr => areset );

    -- redist82_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_d_2(DELAY,1242)
    redist82_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_d_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_d, xout => redist82_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_d_2_q, clk => clk, aclr => areset );

    -- xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6(COMPARE,802)@22 + 1
    xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_cin <= xGTEy_uid110_r_uid7_fpMultAddTest_p2_of_6_c;
    xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & redist82_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_d_2_q) & '0';
    xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & redist77_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_d_2_q) & xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_cin(0);
    xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_a) - UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_c(0) <= xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_o(7);

    -- redist78_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_e_3(DELAY,1238)
    redist78_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_e_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_e, xout => redist78_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_e_3_q, clk => clk, aclr => areset );

    -- redist83_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_e_3(DELAY,1243)
    redist83_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_e_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_e, xout => redist83_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_e_3_q, clk => clk, aclr => areset );

    -- xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6(COMPARE,803)@23 + 1
    xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_cin <= xGTEy_uid110_r_uid7_fpMultAddTest_p3_of_6_c;
    xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & redist83_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_e_3_q) & '0';
    xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & redist78_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_e_3_q) & xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_cin(0);
    xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_a) - UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_c(0) <= xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_o(7);

    -- redist79_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_f_4(DELAY,1239)
    redist79_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_f_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_f, xout => redist79_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_f_4_q, clk => clk, aclr => areset );

    -- redist84_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_f_4(DELAY,1244)
    redist84_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_f_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_f, xout => redist84_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_f_4_q, clk => clk, aclr => areset );

    -- xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6(COMPARE,804)@24 + 1
    xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_cin <= xGTEy_uid110_r_uid7_fpMultAddTest_p4_of_6_c;
    xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & redist84_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_f_4_q) & '0';
    xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & redist79_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_f_4_q) & xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_cin(0);
    xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_a) - UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_c(0) <= xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_o(7);

    -- redist80_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_g_5(DELAY,1240)
    redist80_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_g_5 : dspba_delay
    GENERIC MAP ( width => 2, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_g, xout => redist80_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_g_5_q, clk => clk, aclr => areset );

    -- redist85_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_g_5(DELAY,1245)
    redist85_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_g_5 : dspba_delay
    GENERIC MAP ( width => 2, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_g, xout => redist85_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_g_5_q, clk => clk, aclr => areset );

    -- xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6(COMPARE,805)@25 + 1
    xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_cin <= xGTEy_uid110_r_uid7_fpMultAddTest_p5_of_6_c;
    xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_a <= STD_LOGIC_VECTOR("0" & redist85_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_a_g_5_q) & '0';
    xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_b <= STD_LOGIC_VECTOR("0" & redist80_xGTEy_uid110_r_uid7_fpMultAddTest_BitSelect_for_b_g_5_q) & xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_cin(0);
    xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_a) - UNSIGNED(xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_c(0) <= xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_o(3);

    -- xGTEy_uid110_r_uid7_fpMultAddTest_cout_n(LOGICAL,807)@26
    xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q <= STD_LOGIC_VECTOR(not (xGTEy_uid110_r_uid7_fpMultAddTest_p6_of_6_c));

    -- bSig_uid119_r_uid7_fpMultAddTest_p6(MUX,902)@26 + 1
    bSig_uid119_r_uid7_fpMultAddTest_p6_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    bSig_uid119_r_uid7_fpMultAddTest_p6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            bSig_uid119_r_uid7_fpMultAddTest_p6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (bSig_uid119_r_uid7_fpMultAddTest_p6_s) IS
                WHEN "0" => bSig_uid119_r_uid7_fpMultAddTest_p6_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_h;
                WHEN "1" => bSig_uid119_r_uid7_fpMultAddTest_p6_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_h;
                WHEN OTHERS => bSig_uid119_r_uid7_fpMultAddTest_p6_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- bSig_uid119_r_uid7_fpMultAddTest_p5(MUX,901)@26 + 1
    bSig_uid119_r_uid7_fpMultAddTest_p5_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    bSig_uid119_r_uid7_fpMultAddTest_p5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            bSig_uid119_r_uid7_fpMultAddTest_p5_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (bSig_uid119_r_uid7_fpMultAddTest_p5_s) IS
                WHEN "0" => bSig_uid119_r_uid7_fpMultAddTest_p5_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_g;
                WHEN "1" => bSig_uid119_r_uid7_fpMultAddTest_p5_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_g;
                WHEN OTHERS => bSig_uid119_r_uid7_fpMultAddTest_p5_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- bSig_uid119_r_uid7_fpMultAddTest_p4(MUX,900)@26 + 1
    bSig_uid119_r_uid7_fpMultAddTest_p4_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    bSig_uid119_r_uid7_fpMultAddTest_p4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            bSig_uid119_r_uid7_fpMultAddTest_p4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (bSig_uid119_r_uid7_fpMultAddTest_p4_s) IS
                WHEN "0" => bSig_uid119_r_uid7_fpMultAddTest_p4_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_f;
                WHEN "1" => bSig_uid119_r_uid7_fpMultAddTest_p4_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_f;
                WHEN OTHERS => bSig_uid119_r_uid7_fpMultAddTest_p4_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- bSig_uid119_r_uid7_fpMultAddTest_p3(MUX,899)@26 + 1
    bSig_uid119_r_uid7_fpMultAddTest_p3_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    bSig_uid119_r_uid7_fpMultAddTest_p3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            bSig_uid119_r_uid7_fpMultAddTest_p3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (bSig_uid119_r_uid7_fpMultAddTest_p3_s) IS
                WHEN "0" => bSig_uid119_r_uid7_fpMultAddTest_p3_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_e;
                WHEN "1" => bSig_uid119_r_uid7_fpMultAddTest_p3_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_e;
                WHEN OTHERS => bSig_uid119_r_uid7_fpMultAddTest_p3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- bSig_uid119_r_uid7_fpMultAddTest_p2(MUX,898)@26 + 1
    bSig_uid119_r_uid7_fpMultAddTest_p2_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    bSig_uid119_r_uid7_fpMultAddTest_p2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            bSig_uid119_r_uid7_fpMultAddTest_p2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (bSig_uid119_r_uid7_fpMultAddTest_p2_s) IS
                WHEN "0" => bSig_uid119_r_uid7_fpMultAddTest_p2_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_d;
                WHEN "1" => bSig_uid119_r_uid7_fpMultAddTest_p2_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_d;
                WHEN OTHERS => bSig_uid119_r_uid7_fpMultAddTest_p2_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- bSig_uid119_r_uid7_fpMultAddTest_p1(MUX,897)@26 + 1
    bSig_uid119_r_uid7_fpMultAddTest_p1_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    bSig_uid119_r_uid7_fpMultAddTest_p1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            bSig_uid119_r_uid7_fpMultAddTest_p1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (bSig_uid119_r_uid7_fpMultAddTest_p1_s) IS
                WHEN "0" => bSig_uid119_r_uid7_fpMultAddTest_p1_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_c;
                WHEN "1" => bSig_uid119_r_uid7_fpMultAddTest_p1_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_c;
                WHEN OTHERS => bSig_uid119_r_uid7_fpMultAddTest_p1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- bSig_uid119_r_uid7_fpMultAddTest_p0(MUX,896)@26 + 1
    bSig_uid119_r_uid7_fpMultAddTest_p0_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    bSig_uid119_r_uid7_fpMultAddTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            bSig_uid119_r_uid7_fpMultAddTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (bSig_uid119_r_uid7_fpMultAddTest_p0_s) IS
                WHEN "0" => bSig_uid119_r_uid7_fpMultAddTest_p0_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_b;
                WHEN "1" => bSig_uid119_r_uid7_fpMultAddTest_p0_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_b;
                WHEN OTHERS => bSig_uid119_r_uid7_fpMultAddTest_p0_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- bSig_uid119_r_uid7_fpMultAddTest_BitJoin_for_q(BITJOIN,903)@27
    bSig_uid119_r_uid7_fpMultAddTest_BitJoin_for_q_q <= bSig_uid119_r_uid7_fpMultAddTest_p6_q & bSig_uid119_r_uid7_fpMultAddTest_p5_q & bSig_uid119_r_uid7_fpMultAddTest_p4_q & bSig_uid119_r_uid7_fpMultAddTest_p3_q & bSig_uid119_r_uid7_fpMultAddTest_p2_q & bSig_uid119_r_uid7_fpMultAddTest_p1_q & bSig_uid119_r_uid7_fpMultAddTest_p0_q;

    -- sigB_uid153_r_uid7_fpMultAddTest(BITSELECT,152)@27
    sigB_uid153_r_uid7_fpMultAddTest_b <= STD_LOGIC_VECTOR(bSig_uid119_r_uid7_fpMultAddTest_BitJoin_for_q_q(31 downto 31));

    -- redist145_sigB_uid153_r_uid7_fpMultAddTest_b_11(DELAY,1305)
    redist145_sigB_uid153_r_uid7_fpMultAddTest_b_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid153_r_uid7_fpMultAddTest_b, xout => redist145_sigB_uid153_r_uid7_fpMultAddTest_b_11_q, clk => clk, aclr => areset );

    -- aSig_uid118_r_uid7_fpMultAddTest_p6(MUX,892)@26 + 1
    aSig_uid118_r_uid7_fpMultAddTest_p6_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    aSig_uid118_r_uid7_fpMultAddTest_p6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aSig_uid118_r_uid7_fpMultAddTest_p6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (aSig_uid118_r_uid7_fpMultAddTest_p6_s) IS
                WHEN "0" => aSig_uid118_r_uid7_fpMultAddTest_p6_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_h;
                WHEN "1" => aSig_uid118_r_uid7_fpMultAddTest_p6_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_h;
                WHEN OTHERS => aSig_uid118_r_uid7_fpMultAddTest_p6_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist44_aSig_uid118_r_uid7_fpMultAddTest_p6_q_12(DELAY,1204)
    redist44_aSig_uid118_r_uid7_fpMultAddTest_p6_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => aSig_uid118_r_uid7_fpMultAddTest_p6_q, xout => redist44_aSig_uid118_r_uid7_fpMultAddTest_p6_q_12_q, clk => clk, aclr => areset );

    -- aSig_uid118_r_uid7_fpMultAddTest_p5(MUX,891)@26 + 1
    aSig_uid118_r_uid7_fpMultAddTest_p5_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    aSig_uid118_r_uid7_fpMultAddTest_p5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aSig_uid118_r_uid7_fpMultAddTest_p5_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (aSig_uid118_r_uid7_fpMultAddTest_p5_s) IS
                WHEN "0" => aSig_uid118_r_uid7_fpMultAddTest_p5_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_g;
                WHEN "1" => aSig_uid118_r_uid7_fpMultAddTest_p5_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_g;
                WHEN OTHERS => aSig_uid118_r_uid7_fpMultAddTest_p5_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist45_aSig_uid118_r_uid7_fpMultAddTest_p5_q_2(DELAY,1205)
    redist45_aSig_uid118_r_uid7_fpMultAddTest_p5_q_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aSig_uid118_r_uid7_fpMultAddTest_p5_q, xout => redist45_aSig_uid118_r_uid7_fpMultAddTest_p5_q_2_q, clk => clk, aclr => areset );

    -- redist46_aSig_uid118_r_uid7_fpMultAddTest_p5_q_12(DELAY,1206)
    redist46_aSig_uid118_r_uid7_fpMultAddTest_p5_q_12 : dspba_delay
    GENERIC MAP ( width => 2, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist45_aSig_uid118_r_uid7_fpMultAddTest_p5_q_2_q, xout => redist46_aSig_uid118_r_uid7_fpMultAddTest_p5_q_12_q, clk => clk, aclr => areset );

    -- aSig_uid118_r_uid7_fpMultAddTest_p4(MUX,890)@26 + 1
    aSig_uid118_r_uid7_fpMultAddTest_p4_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    aSig_uid118_r_uid7_fpMultAddTest_p4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aSig_uid118_r_uid7_fpMultAddTest_p4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (aSig_uid118_r_uid7_fpMultAddTest_p4_s) IS
                WHEN "0" => aSig_uid118_r_uid7_fpMultAddTest_p4_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_f;
                WHEN "1" => aSig_uid118_r_uid7_fpMultAddTest_p4_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_f;
                WHEN OTHERS => aSig_uid118_r_uid7_fpMultAddTest_p4_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist48_aSig_uid118_r_uid7_fpMultAddTest_p4_q_12(DELAY,1208)
    redist48_aSig_uid118_r_uid7_fpMultAddTest_p4_q_12 : dspba_delay
    GENERIC MAP ( width => 6, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => aSig_uid118_r_uid7_fpMultAddTest_p4_q, xout => redist48_aSig_uid118_r_uid7_fpMultAddTest_p4_q_12_q, clk => clk, aclr => areset );

    -- aSig_uid118_r_uid7_fpMultAddTest_p3(MUX,889)@26 + 1
    aSig_uid118_r_uid7_fpMultAddTest_p3_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    aSig_uid118_r_uid7_fpMultAddTest_p3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aSig_uid118_r_uid7_fpMultAddTest_p3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (aSig_uid118_r_uid7_fpMultAddTest_p3_s) IS
                WHEN "0" => aSig_uid118_r_uid7_fpMultAddTest_p3_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_e;
                WHEN "1" => aSig_uid118_r_uid7_fpMultAddTest_p3_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_e;
                WHEN OTHERS => aSig_uid118_r_uid7_fpMultAddTest_p3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist50_aSig_uid118_r_uid7_fpMultAddTest_p3_q_12(DELAY,1210)
    redist50_aSig_uid118_r_uid7_fpMultAddTest_p3_q_12 : dspba_delay
    GENERIC MAP ( width => 6, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => aSig_uid118_r_uid7_fpMultAddTest_p3_q, xout => redist50_aSig_uid118_r_uid7_fpMultAddTest_p3_q_12_q, clk => clk, aclr => areset );

    -- aSig_uid118_r_uid7_fpMultAddTest_p2(MUX,888)@26 + 1
    aSig_uid118_r_uid7_fpMultAddTest_p2_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    aSig_uid118_r_uid7_fpMultAddTest_p2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aSig_uid118_r_uid7_fpMultAddTest_p2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (aSig_uid118_r_uid7_fpMultAddTest_p2_s) IS
                WHEN "0" => aSig_uid118_r_uid7_fpMultAddTest_p2_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_d;
                WHEN "1" => aSig_uid118_r_uid7_fpMultAddTest_p2_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_d;
                WHEN OTHERS => aSig_uid118_r_uid7_fpMultAddTest_p2_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist51_aSig_uid118_r_uid7_fpMultAddTest_p2_q_12(DELAY,1211)
    redist51_aSig_uid118_r_uid7_fpMultAddTest_p2_q_12 : dspba_delay
    GENERIC MAP ( width => 6, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => aSig_uid118_r_uid7_fpMultAddTest_p2_q, xout => redist51_aSig_uid118_r_uid7_fpMultAddTest_p2_q_12_q, clk => clk, aclr => areset );

    -- aSig_uid118_r_uid7_fpMultAddTest_p1(MUX,887)@26 + 1
    aSig_uid118_r_uid7_fpMultAddTest_p1_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    aSig_uid118_r_uid7_fpMultAddTest_p1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aSig_uid118_r_uid7_fpMultAddTest_p1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (aSig_uid118_r_uid7_fpMultAddTest_p1_s) IS
                WHEN "0" => aSig_uid118_r_uid7_fpMultAddTest_p1_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_c;
                WHEN "1" => aSig_uid118_r_uid7_fpMultAddTest_p1_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_c;
                WHEN OTHERS => aSig_uid118_r_uid7_fpMultAddTest_p1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist52_aSig_uid118_r_uid7_fpMultAddTest_p1_q_12(DELAY,1212)
    redist52_aSig_uid118_r_uid7_fpMultAddTest_p1_q_12 : dspba_delay
    GENERIC MAP ( width => 6, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => aSig_uid118_r_uid7_fpMultAddTest_p1_q, xout => redist52_aSig_uid118_r_uid7_fpMultAddTest_p1_q_12_q, clk => clk, aclr => areset );

    -- aSig_uid118_r_uid7_fpMultAddTest_p0(MUX,886)@26 + 1
    aSig_uid118_r_uid7_fpMultAddTest_p0_s <= xGTEy_uid110_r_uid7_fpMultAddTest_cout_n_q;
    aSig_uid118_r_uid7_fpMultAddTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aSig_uid118_r_uid7_fpMultAddTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (aSig_uid118_r_uid7_fpMultAddTest_p0_s) IS
                WHEN "0" => aSig_uid118_r_uid7_fpMultAddTest_p0_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_a_b;
                WHEN "1" => aSig_uid118_r_uid7_fpMultAddTest_p0_q <= aSig_uid118_r_uid7_fpMultAddTest_BitSelect_for_b_b;
                WHEN OTHERS => aSig_uid118_r_uid7_fpMultAddTest_p0_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist53_aSig_uid118_r_uid7_fpMultAddTest_p0_q_12(DELAY,1213)
    redist53_aSig_uid118_r_uid7_fpMultAddTest_p0_q_12 : dspba_delay
    GENERIC MAP ( width => 5, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => aSig_uid118_r_uid7_fpMultAddTest_p0_q, xout => redist53_aSig_uid118_r_uid7_fpMultAddTest_p0_q_12_q, clk => clk, aclr => areset );

    -- aSig_uid118_r_uid7_fpMultAddTest_BitJoin_for_q(BITJOIN,893)@38
    aSig_uid118_r_uid7_fpMultAddTest_BitJoin_for_q_q <= redist44_aSig_uid118_r_uid7_fpMultAddTest_p6_q_12_q & redist46_aSig_uid118_r_uid7_fpMultAddTest_p5_q_12_q & redist48_aSig_uid118_r_uid7_fpMultAddTest_p4_q_12_q & redist50_aSig_uid118_r_uid7_fpMultAddTest_p3_q_12_q & redist51_aSig_uid118_r_uid7_fpMultAddTest_p2_q_12_q & redist52_aSig_uid118_r_uid7_fpMultAddTest_p1_q_12_q & redist53_aSig_uid118_r_uid7_fpMultAddTest_p0_q_12_q;

    -- sigA_uid152_r_uid7_fpMultAddTest(BITSELECT,151)@38
    sigA_uid152_r_uid7_fpMultAddTest_b <= STD_LOGIC_VECTOR(aSig_uid118_r_uid7_fpMultAddTest_BitJoin_for_q_q(31 downto 31));

    -- effSub_uid154_r_uid7_fpMultAddTest(LOGICAL,153)@38 + 1
    effSub_uid154_r_uid7_fpMultAddTest_qi <= sigA_uid152_r_uid7_fpMultAddTest_b xor redist145_sigB_uid153_r_uid7_fpMultAddTest_b_11_q;
    effSub_uid154_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid154_r_uid7_fpMultAddTest_qi, xout => effSub_uid154_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2(SUB,814)@27 + 1
    expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & aSig_uid118_r_uid7_fpMultAddTest_p4_q);
    expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & bSig_uid119_r_uid7_fpMultAddTest_p4_q);
    expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_a) - UNSIGNED(expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_c(0) <= expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_o(6);
    expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q <= expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_o(5 downto 0);

    -- cWFP2_uid163_r_uid7_fpMultAddTest(CONSTANT,162)
    cWFP2_uid163_r_uid7_fpMultAddTest_q <= "11001";

    -- shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,1002)@28
    shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q <= shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_b & cWFP2_uid163_r_uid7_fpMultAddTest_q;

    -- shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2(COMPARE,823)@28 + 1
    shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q);
    shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q);
    shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_a) - UNSIGNED(shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_b));
        END IF;
    END PROCESS;
    shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_c(0) <= shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_o(6);

    -- redist43_bSig_uid119_r_uid7_fpMultAddTest_p5_q_2(DELAY,1203)
    redist43_bSig_uid119_r_uid7_fpMultAddTest_p5_q_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => bSig_uid119_r_uid7_fpMultAddTest_p5_q, xout => redist43_bSig_uid119_r_uid7_fpMultAddTest_p5_q_2_q, clk => clk, aclr => areset );

    -- expAmExpB_uid162_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,999)@28
    expAmExpB_uid162_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q <= GND_q & redist43_bSig_uid119_r_uid7_fpMultAddTest_p5_q_2_q;

    -- expAmExpB_uid162_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,994)@28
    expAmExpB_uid162_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q <= GND_q & redist45_aSig_uid118_r_uid7_fpMultAddTest_p5_q_2_q;

    -- expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2(SUB,815)@28 + 1
    expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_cin <= expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_c;
    expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & expAmExpB_uid162_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q) & '0';
    expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & expAmExpB_uid162_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q) & expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_cin(0);
    expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_a) - UNSIGNED(expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_q <= expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_o(3 downto 1);

    -- shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,1009)@29
    shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q <= GND_q & expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_q;

    -- shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,1125)
    shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(expOvf_uid78_p_uid6_fpMultAddTest_UpperBits_for_b_q(0 downto 0));
    shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(expOvf_uid78_p_uid6_fpMultAddTest_UpperBits_for_b_q(4 downto 1));

    -- shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2(COMPARE,824)@29 + 1
    shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_cin <= shiftedOut_uid165_r_uid7_fpMultAddTest_p1_of_2_c;
    shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_a_tessel0_1_merged_bit_select_c) & '0';
    shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q) & shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_cin(0);
    shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_a) - UNSIGNED(shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_b));
        END IF;
    END PROCESS;
    shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_c(0) <= shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_o(5);

    -- redist74_shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_c_5(DELAY,1234)
    redist74_shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_c_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_c, xout => redist74_shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_c_5_q, clk => clk, aclr => areset );

    -- iShiftedOut_uid169_r_uid7_fpMultAddTest(LOGICAL,168)@35
    iShiftedOut_uid169_r_uid7_fpMultAddTest_q <= not (redist74_shiftedOut_uid165_r_uid7_fpMultAddTest_p2_of_2_c_5_q);

    -- zeroOutCst_uid444_alignmentShifter_uid166_r_uid7_fpMultAddTest(CONSTANT,443)
    zeroOutCst_uid444_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= "0000000000000000000000000000000000000000000000000";

    -- rightShiftStage2Idx3Pad3_uid440_alignmentShifter_uid166_r_uid7_fpMultAddTest(CONSTANT,439)
    rightShiftStage2Idx3Pad3_uid440_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= "000";

    -- rightShiftStage2Idx3Rng3_uid439_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITSELECT,438)@33
    rightShiftStage2Idx3Rng3_uid439_alignmentShifter_uid166_r_uid7_fpMultAddTest_b <= rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q(48 downto 3);

    -- rightShiftStage2Idx3_uid441_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITJOIN,440)@33
    rightShiftStage2Idx3_uid441_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage2Idx3Pad3_uid440_alignmentShifter_uid166_r_uid7_fpMultAddTest_q & rightShiftStage2Idx3Rng3_uid439_alignmentShifter_uid166_r_uid7_fpMultAddTest_b;

    -- rightShiftStage2Idx2Rng2_uid436_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITSELECT,435)@33
    rightShiftStage2Idx2Rng2_uid436_alignmentShifter_uid166_r_uid7_fpMultAddTest_b <= rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q(48 downto 2);

    -- rightShiftStage2Idx2_uid438_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITJOIN,437)@33
    rightShiftStage2Idx2_uid438_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= zs_uid275_lzCountVal_uid187_r_uid7_fpMultAddTest_q & rightShiftStage2Idx2Rng2_uid436_alignmentShifter_uid166_r_uid7_fpMultAddTest_b;

    -- rightShiftStage2Idx1Rng1_uid433_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITSELECT,432)@33
    rightShiftStage2Idx1Rng1_uid433_alignmentShifter_uid166_r_uid7_fpMultAddTest_b <= rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q(48 downto 1);

    -- rightShiftStage2Idx1_uid435_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITJOIN,434)@33
    rightShiftStage2Idx1_uid435_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid433_alignmentShifter_uid166_r_uid7_fpMultAddTest_b;

    -- rightShiftStage1Idx3Rng12_uid428_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITSELECT,427)@32
    rightShiftStage1Idx3Rng12_uid428_alignmentShifter_uid166_r_uid7_fpMultAddTest_b <= rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q(48 downto 12);

    -- rightShiftStage1Idx3_uid430_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITJOIN,429)@32
    rightShiftStage1Idx3_uid430_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage1Idx3Pad12_uid429_alignmentShifter_uid166_r_uid7_fpMultAddTest_q & rightShiftStage1Idx3Rng12_uid428_alignmentShifter_uid166_r_uid7_fpMultAddTest_b;

    -- rightShiftStage1Idx2Rng8_uid425_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITSELECT,424)@32
    rightShiftStage1Idx2Rng8_uid425_alignmentShifter_uid166_r_uid7_fpMultAddTest_b <= rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q(48 downto 8);

    -- rightShiftStage1Idx2_uid427_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITJOIN,426)@32
    rightShiftStage1Idx2_uid427_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= cstAllZWE_uid15_p_uid6_fpMultAddTest_q & rightShiftStage1Idx2Rng8_uid425_alignmentShifter_uid166_r_uid7_fpMultAddTest_b;

    -- zs_uid269_lzCountVal_uid187_r_uid7_fpMultAddTest(CONSTANT,268)
    zs_uid269_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid422_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITSELECT,421)@32
    rightShiftStage1Idx1Rng4_uid422_alignmentShifter_uid166_r_uid7_fpMultAddTest_b <= rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q(48 downto 4);

    -- rightShiftStage1Idx1_uid424_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITJOIN,423)@32
    rightShiftStage1Idx1_uid424_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= zs_uid269_lzCountVal_uid187_r_uid7_fpMultAddTest_q & rightShiftStage1Idx1Rng4_uid422_alignmentShifter_uid166_r_uid7_fpMultAddTest_b;

    -- rightShiftStage0Idx3Pad48_uid418_alignmentShifter_uid166_r_uid7_fpMultAddTest(CONSTANT,417)
    rightShiftStage0Idx3Pad48_uid418_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid417_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITSELECT,416)@31
    rightShiftStage0Idx3Rng48_uid417_alignmentShifter_uid166_r_uid7_fpMultAddTest_b <= rightPaddedIn_uid167_r_uid7_fpMultAddTest_q(48 downto 48);

    -- rightShiftStage0Idx3_uid419_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITJOIN,418)@31
    rightShiftStage0Idx3_uid419_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage0Idx3Pad48_uid418_alignmentShifter_uid166_r_uid7_fpMultAddTest_q & rightShiftStage0Idx3Rng48_uid417_alignmentShifter_uid166_r_uid7_fpMultAddTest_b;

    -- rightShiftStage0Idx2Pad32_uid415_alignmentShifter_uid166_r_uid7_fpMultAddTest(CONSTANT,414)
    rightShiftStage0Idx2Pad32_uid415_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= "00000000000000000000000000000000";

    -- rightShiftStage0Idx2Rng32_uid414_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITSELECT,413)@31
    rightShiftStage0Idx2Rng32_uid414_alignmentShifter_uid166_r_uid7_fpMultAddTest_b <= rightPaddedIn_uid167_r_uid7_fpMultAddTest_q(48 downto 32);

    -- rightShiftStage0Idx2_uid416_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITJOIN,415)@31
    rightShiftStage0Idx2_uid416_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage0Idx2Pad32_uid415_alignmentShifter_uid166_r_uid7_fpMultAddTest_q & rightShiftStage0Idx2Rng32_uid414_alignmentShifter_uid166_r_uid7_fpMultAddTest_b;

    -- rightShiftStage0Idx1Rng16_uid411_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITSELECT,410)@31
    rightShiftStage0Idx1Rng16_uid411_alignmentShifter_uid166_r_uid7_fpMultAddTest_b <= rightPaddedIn_uid167_r_uid7_fpMultAddTest_q(48 downto 16);

    -- rightShiftStage0Idx1_uid413_alignmentShifter_uid166_r_uid7_fpMultAddTest(BITJOIN,412)@31
    rightShiftStage0Idx1_uid413_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= zs_uid255_lzCountVal_uid187_r_uid7_fpMultAddTest_q & rightShiftStage0Idx1Rng16_uid411_alignmentShifter_uid166_r_uid7_fpMultAddTest_b;

    -- exp_bSig_uid137_r_uid7_fpMultAddTest(BITSELECT,136)@27
    exp_bSig_uid137_r_uid7_fpMultAddTest_in <= bSig_uid119_r_uid7_fpMultAddTest_BitJoin_for_q_q(30 downto 0);
    exp_bSig_uid137_r_uid7_fpMultAddTest_b <= exp_bSig_uid137_r_uid7_fpMultAddTest_in(30 downto 23);

    -- z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1101)@27
    z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_b <= exp_bSig_uid137_r_uid7_fpMultAddTest_b(5 downto 0);
    z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c <= exp_bSig_uid137_r_uid7_fpMultAddTest_b(7 downto 6);

    -- redist18_z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c_1(DELAY,1178)
    redist18_z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c, xout => redist18_z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- eq1_uid385_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest(LOGICAL,384)@28 + 1
    eq1_uid385_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi <= "1" WHEN redist18_z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c_1_q = c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid385_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid385_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi, xout => eq1_uid385_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid647_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1147)@27
    x0_uid647_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid647_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid652_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest(LOGICAL,651)@27 + 1
    eq1_uid652_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid647_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid652_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid652_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi, xout => eq1_uid652_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid649_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest(LOGICAL,648)@27 + 1
    eq0_uid649_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid647_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid649_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid649_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi, xout => eq0_uid649_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid653_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest(LOGICAL,652)@28 + 1
    andEq_uid653_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi <= eq0_uid649_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q and eq1_uid652_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q;
    andEq_uid653_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid653_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi, xout => andEq_uid653_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest(LOGICAL,385)@29 + 1
    and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi <= andEq_uid653_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q and eq1_uid385_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q;
    and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist106_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_2(DELAY,1266)
    redist106_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q, xout => redist106_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid146_r_uid7_fpMultAddTest(LOGICAL,145)@31
    InvExpXIsZero_uid146_r_uid7_fpMultAddTest_q <= not (redist106_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_2_q);

    -- frac_bSig_uid138_r_uid7_fpMultAddTest(BITSELECT,137)@27
    frac_bSig_uid138_r_uid7_fpMultAddTest_in <= bSig_uid119_r_uid7_fpMultAddTest_BitJoin_for_q_q(22 downto 0);
    frac_bSig_uid138_r_uid7_fpMultAddTest_b <= frac_bSig_uid138_r_uid7_fpMultAddTest_in(22 downto 0);

    -- redist151_frac_bSig_uid138_r_uid7_fpMultAddTest_b_3(DELAY,1311)
    redist151_frac_bSig_uid138_r_uid7_fpMultAddTest_b_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_bSig_uid138_r_uid7_fpMultAddTest_b, xout => redist151_frac_bSig_uid138_r_uid7_fpMultAddTest_b_3_q, clk => clk, aclr => areset );

    -- fracBz_uid158_r_uid7_fpMultAddTest(MUX,157)@30 + 1
    fracBz_uid158_r_uid7_fpMultAddTest_s <= and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q;
    fracBz_uid158_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracBz_uid158_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracBz_uid158_r_uid7_fpMultAddTest_s) IS
                WHEN "0" => fracBz_uid158_r_uid7_fpMultAddTest_q <= redist151_frac_bSig_uid138_r_uid7_fpMultAddTest_b_3_q;
                WHEN "1" => fracBz_uid158_r_uid7_fpMultAddTest_q <= cstZeroWF_uid14_p_uid6_fpMultAddTest_q;
                WHEN OTHERS => fracBz_uid158_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracB_uid161_r_uid7_fpMultAddTest(BITJOIN,160)@31
    oFracB_uid161_r_uid7_fpMultAddTest_q <= InvExpXIsZero_uid146_r_uid7_fpMultAddTest_q & fracBz_uid158_r_uid7_fpMultAddTest_q;

    -- padConst_uid166_r_uid7_fpMultAddTest(CONSTANT,165)
    padConst_uid166_r_uid7_fpMultAddTest_q <= "0000000000000000000000000";

    -- rightPaddedIn_uid167_r_uid7_fpMultAddTest(BITJOIN,166)@31
    rightPaddedIn_uid167_r_uid7_fpMultAddTest_q <= oFracB_uid161_r_uid7_fpMultAddTest_q & padConst_uid166_r_uid7_fpMultAddTest_q;

    -- redist75_expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q_1(DELAY,1235)
    redist75_expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q, xout => redist75_expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q_1_q, clk => clk, aclr => areset );

    -- expAmExpB_uid162_r_uid7_fpMultAddTest_BitJoin_for_q(BITJOIN,816)@29
    expAmExpB_uid162_r_uid7_fpMultAddTest_BitJoin_for_q_q <= expAmExpB_uid162_r_uid7_fpMultAddTest_p2_of_2_q & redist75_expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q_1_q;

    -- rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1124)@29
    rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_in <= expAmExpB_uid162_r_uid7_fpMultAddTest_BitJoin_for_q_q(5 downto 0);
    rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_b <= rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_in(5 downto 4);
    rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_c <= rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_in(3 downto 2);
    rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_d <= rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_in(1 downto 0);

    -- redist6_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_b_2(DELAY,1166)
    redist6_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_b, xout => redist6_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest(MUX,420)@31 + 1
    rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_s <= redist6_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_b_2_q;
    rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_s) IS
                WHEN "00" => rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightPaddedIn_uid167_r_uid7_fpMultAddTest_q;
                WHEN "01" => rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage0Idx1_uid413_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN "10" => rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage0Idx2_uid416_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN "11" => rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage0Idx3_uid419_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN OTHERS => rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist7_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_c_3(DELAY,1167)
    redist7_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 2, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_c, xout => redist7_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_c_3_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest(MUX,431)@32 + 1
    rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_s <= redist7_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_c_3_q;
    rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_s) IS
                WHEN "00" => rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage0_uid421_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN "01" => rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage1Idx1_uid424_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN "10" => rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage1Idx2_uid427_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN "11" => rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage1Idx3_uid430_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN OTHERS => rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist8_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_d_4(DELAY,1168)
    redist8_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_d_4 : dspba_delay
    GENERIC MAP ( width => 2, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_d, xout => redist8_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_d_4_q, clk => clk, aclr => areset );

    -- rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest(MUX,442)@33 + 1
    rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_s <= redist8_rightShiftStageSel5Dto4_uid420_alignmentShifter_uid166_r_uid7_fpMultAddTest_merged_bit_select_d_4_q;
    rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_s) IS
                WHEN "00" => rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage1_uid432_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN "01" => rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage2Idx1_uid435_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN "10" => rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage2Idx2_uid438_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN "11" => rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage2Idx3_uid441_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN OTHERS => rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- wIntCst_uid409_alignmentShifter_uid166_r_uid7_fpMultAddTest(CONSTANT,408)
    wIntCst_uid409_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= "110001";

    -- shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2(COMPARE,876)@28 + 1
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expAmExpB_uid162_r_uid7_fpMultAddTest_p1_of_2_q);
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & wIntCst_uid409_alignmentShifter_uid166_r_uid7_fpMultAddTest_q);
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_a) - UNSIGNED(shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_b));
        END IF;
    END PROCESS;
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_c(0) <= shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_o(6);

    -- shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2(COMPARE,877)@29 + 1
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_cin <= shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p1_of_2_c;
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & shiftedOut_uid165_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q) & '0';
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & zs_uid269_lzCountVal_uid187_r_uid7_fpMultAddTest_q) & shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_cin(0);
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_a) - UNSIGNED(shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_b));
        END IF;
    END PROCESS;
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_c(0) <= shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_o(5);

    -- redist56_shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_c_4(DELAY,1216)
    redist56_shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_c_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_c, xout => redist56_shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_c_4_q, clk => clk, aclr => areset );

    -- shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_cout_n(LOGICAL,879)@34
    shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_cout_n_q <= STD_LOGIC_VECTOR(not (redist56_shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_p2_of_2_c_4_q));

    -- r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest(MUX,444)@34 + 1
    r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_s <= shiftedOut_uid410_alignmentShifter_uid166_r_uid7_fpMultAddTest_cout_n_q;
    r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_s) IS
                WHEN "0" => r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= rightShiftStage2_uid443_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN "1" => r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= zeroOutCst_uid444_alignmentShifter_uid166_r_uid7_fpMultAddTest_q;
                WHEN OTHERS => r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest(LOGICAL,169)@35 + 1
    alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 1 => iShiftedOut_uid169_r_uid7_fpMultAddTest_q(0)) & iShiftedOut_uid169_r_uid7_fpMultAddTest_q));
    alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_qi <= r_uid445_alignmentShifter_uid166_r_uid7_fpMultAddTest_q and alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_b;
    alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 49, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_qi, xout => alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1103)@36
    stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_b <= alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_q(22 downto 0);
    stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_c <= alignFracBPostShiftOut_uid170_r_uid7_fpMultAddTest_q(48 downto 23);

    -- redist17_stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_c_3(DELAY,1177)
    redist17_stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 26, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_c, xout => redist17_stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_c_3_q, clk => clk, aclr => areset );

    -- fracBAddOp_uid182_r_uid7_fpMultAddTest(BITJOIN,181)@39
    fracBAddOp_uid182_r_uid7_fpMultAddTest_q <= GND_q & redist17_stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_c_3_q;

    -- fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest(LOGICAL,182)@39 + 1
    fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid154_r_uid7_fpMultAddTest_q(0)) & effSub_uid154_r_uid7_fpMultAddTest_q));
    fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_qi <= fracBAddOp_uid182_r_uid7_fpMultAddTest_q xor fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_b;
    fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_qi, xout => fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_b(BITJOIN,829)@40
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_b_q <= GND_q & fracBAddOpPostXor_uid183_r_uid7_fpMultAddTest_q;

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b(BITSELECT,832)@40
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_b <= fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_b_q(5 downto 0);
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_c <= fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_b_q(11 downto 6);
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_d <= fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_b_q(17 downto 12);
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_e <= fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_b_q(23 downto 18);
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_f <= fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_b_q(27 downto 24);

    -- zocst_uid178_r_uid7_fpMultAddTest(CONSTANT,177)
    zocst_uid178_r_uid7_fpMultAddTest_q <= "01";

    -- frac_aSig_uid124_r_uid7_fpMultAddTest(BITSELECT,123)@38
    frac_aSig_uid124_r_uid7_fpMultAddTest_in <= aSig_uid118_r_uid7_fpMultAddTest_BitJoin_for_q_q(22 downto 0);
    frac_aSig_uid124_r_uid7_fpMultAddTest_b <= frac_aSig_uid124_r_uid7_fpMultAddTest_in(22 downto 0);

    -- redist154_frac_aSig_uid124_r_uid7_fpMultAddTest_b_1(DELAY,1314)
    redist154_frac_aSig_uid124_r_uid7_fpMultAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid124_r_uid7_fpMultAddTest_b, xout => redist154_frac_aSig_uid124_r_uid7_fpMultAddTest_b_1_q, clk => clk, aclr => areset );

    -- z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1151)@36
    z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b <= stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 0);
    z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c <= stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_b(11 downto 6);
    z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_d <= stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_b(17 downto 12);
    z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_e <= stickyBits_uid171_r_uid7_fpMultAddTest_merged_bit_select_b(22 downto 18);

    -- eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,457)@36 + 1
    eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= "1" WHEN z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_e = c3_uid310_fracXIsZero_uid20_p_uid6_fpMultAddTest_b ELSE "0";
    eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist102_eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q_2(DELAY,1262)
    redist102_eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, xout => redist102_eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid696_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1120)@36
    x0_uid696_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_d(2 downto 0);
    x0_uid696_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid701_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,700)@36 + 1
    eq1_uid701_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid696_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid701_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid701_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => eq1_uid701_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid698_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,697)@36 + 1
    eq0_uid698_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid696_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid698_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid698_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => eq0_uid698_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid702_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,701)@37 + 1
    andEq_uid702_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= eq0_uid698_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q and eq1_uid701_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q;
    andEq_uid702_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid702_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => andEq_uid702_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid689_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1119)@36
    x0_uid689_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c(2 downto 0);
    x0_uid689_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid694_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,693)@36 + 1
    eq1_uid694_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid689_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid694_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid694_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => eq1_uid694_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid691_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,690)@36 + 1
    eq0_uid691_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid689_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid691_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid691_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => eq0_uid691_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid695_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,694)@37 + 1
    andEq_uid695_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= eq0_uid691_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q and eq1_uid694_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q;
    andEq_uid695_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid695_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => andEq_uid695_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid682_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1118)@36
    x0_uid682_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid682_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid447_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid687_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,686)@36 + 1
    eq1_uid687_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid682_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid687_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid687_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => eq1_uid687_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid684_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,683)@36 + 1
    eq0_uid684_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid682_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid684_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid684_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => eq0_uid684_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid688_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,687)@37 + 1
    andEq_uid688_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= eq0_uid684_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q and eq1_uid687_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q;
    andEq_uid688_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid688_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => andEq_uid688_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid459_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest(LOGICAL,458)@38 + 1
    and_lev0_uid459_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi <= andEq_uid688_eq0_uid449_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q and andEq_uid695_eq1_uid452_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q and andEq_uid702_eq2_uid455_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q and redist102_eq3_uid458_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q_2_q;
    and_lev0_uid459_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid459_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid459_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- effSubInvSticky_uid176_r_uid7_fpMultAddTest(LOGICAL,175)@39
    effSubInvSticky_uid176_r_uid7_fpMultAddTest_q <= effSub_uid154_r_uid7_fpMultAddTest_q and and_lev0_uid459_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q;

    -- fracAAddOp_uid179_r_uid7_fpMultAddTest(BITJOIN,178)@39
    fracAAddOp_uid179_r_uid7_fpMultAddTest_q <= zocst_uid178_r_uid7_fpMultAddTest_q & redist154_frac_aSig_uid124_r_uid7_fpMultAddTest_b_1_q & GND_q & effSubInvSticky_uid176_r_uid7_fpMultAddTest_q;

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_a(BITJOIN,827)@39
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_a_q <= GND_q & fracAAddOp_uid179_r_uid7_fpMultAddTest_q;

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a(BITSELECT,831)@39
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_b <= fracAddResult_uid184_r_uid7_fpMultAddTest_BitExpansion_for_a_q(5 downto 0);

    -- redist73_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_b_1(DELAY,1233)
    redist73_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_b, xout => redist73_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_b_1_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5(ADD,833)@40 + 1
    fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_a <= STD_LOGIC_VECTOR("0" & redist73_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_b_1_q);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_b <= STD_LOGIC_VECTOR("0" & fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_b);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_a) + UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_b));
        END IF;
    END PROCESS;
    fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_c(0) <= fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_o(6);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_q <= fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_o(5 downto 0);

    -- redist69_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_c_1(DELAY,1229)
    redist69_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_c, xout => redist69_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_c_1_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select(BITSELECT,1127)@38
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist52_aSig_uid118_r_uid7_fpMultAddTest_p1_q_12_q(4 downto 0));
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist52_aSig_uid118_r_uid7_fpMultAddTest_p1_q_12_q(5 downto 5));

    -- redist4_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_b_3(DELAY,1164)
    redist4_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 5, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_b, xout => redist4_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_b_3_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_0(BITSELECT,1010)@38
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(redist53_aSig_uid118_r_uid7_fpMultAddTest_p0_q_12_q(4 downto 4));

    -- redist25_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_0_b_3(DELAY,1185)
    redist25_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_0_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_0_b, xout => redist25_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_0_b_3_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,1012)@41
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q <= redist4_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_b_3_q & redist25_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_0_b_3_q;

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5(ADD,834)@41 + 1
    fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_cin <= fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_c;
    fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_a <= STD_LOGIC_VECTOR("0" & fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q) & '1';
    fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_b <= STD_LOGIC_VECTOR("0" & redist69_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_c_1_q) & fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_cin(0);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_a) + UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_b));
        END IF;
    END PROCESS;
    fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_c(0) <= fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_o(7);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_q <= fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_o(6 downto 1);

    -- redist70_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_d_2(DELAY,1230)
    redist70_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_d_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_d, xout => redist70_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_d_2_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select(BITSELECT,1128)@38
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist51_aSig_uid118_r_uid7_fpMultAddTest_p2_q_12_q(4 downto 0));
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist51_aSig_uid118_r_uid7_fpMultAddTest_p2_q_12_q(5 downto 5));

    -- redist2_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_b_4(DELAY,1162)
    redist2_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_b_4 : dspba_delay
    GENERIC MAP ( width => 5, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_b, xout => redist2_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_b_4_q, clk => clk, aclr => areset );

    -- redist5_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_4(DELAY,1165)
    redist5_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_c, xout => redist5_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_4_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_d(BITJOIN,1015)@42
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_d_q <= redist2_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_b_4_q & redist5_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_4_q;

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5(ADD,835)@42 + 1
    fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_cin <= fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_c;
    fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_a <= STD_LOGIC_VECTOR("0" & fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_d_q) & '1';
    fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_b <= STD_LOGIC_VECTOR("0" & redist70_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_d_2_q) & fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_cin(0);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_a) + UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_b));
        END IF;
    END PROCESS;
    fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_c(0) <= fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_o(7);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_q <= fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_o(6 downto 1);

    -- redist71_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_e_3(DELAY,1231)
    redist71_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_e_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_e, xout => redist71_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_e_3_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select(BITSELECT,1129)@38
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist50_aSig_uid118_r_uid7_fpMultAddTest_p3_q_12_q(4 downto 0));
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist50_aSig_uid118_r_uid7_fpMultAddTest_p3_q_12_q(5 downto 5));

    -- redist0_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_b_5(DELAY,1160)
    redist0_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_b_5 : dspba_delay
    GENERIC MAP ( width => 5, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_b, xout => redist0_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_b_5_q, clk => clk, aclr => areset );

    -- redist3_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_c_5(DELAY,1163)
    redist3_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_c_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_c, xout => redist3_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_c_5_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e(BITJOIN,1018)@43
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q <= redist0_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_b_5_q & redist3_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel2_1_merged_bit_select_c_5_q;

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5(ADD,836)@43 + 1
    fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_cin <= fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_c;
    fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_a <= STD_LOGIC_VECTOR("0" & fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q) & '1';
    fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_b <= STD_LOGIC_VECTOR("0" & redist71_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_e_3_q) & fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_cin(0);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_a) + UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_b));
        END IF;
    END PROCESS;
    fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_c(0) <= fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_o(7);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_q <= fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_o(6 downto 1);

    -- redist72_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_f_4(DELAY,1232)
    redist72_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_f_4 : dspba_delay
    GENERIC MAP ( width => 4, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_f, xout => redist72_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_f_4_q, clk => clk, aclr => areset );

    -- redist1_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_c_6(DELAY,1161)
    redist1_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_c_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_c, xout => redist1_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_c_6_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_f(BITJOIN,1022)@44
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_f_q <= GND_q & zocst_uid178_r_uid7_fpMultAddTest_q & redist1_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_tessel3_1_merged_bit_select_c_6_q;

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5(ADD,837)@44 + 1
    fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_cin <= fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_c;
    fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_a <= STD_LOGIC_VECTOR("0" & fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_f_q) & '1';
    fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_b <= STD_LOGIC_VECTOR("0" & redist72_fracAddResult_uid184_r_uid7_fpMultAddTest_BitSelect_for_b_f_4_q) & fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_cin(0);
    fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_a) + UNSIGNED(fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_b));
        END IF;
    END PROCESS;
    fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_q <= fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_o(4 downto 1);

    -- redist65_fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_q_1(DELAY,1225)
    redist65_fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_q, xout => redist65_fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_q_1_q, clk => clk, aclr => areset );

    -- redist66_fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_q_2(DELAY,1226)
    redist66_fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_q, xout => redist66_fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_q_2_q, clk => clk, aclr => areset );

    -- redist67_fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_q_3(DELAY,1227)
    redist67_fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_q, xout => redist67_fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_q_3_q, clk => clk, aclr => areset );

    -- redist68_fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_q_4(DELAY,1228)
    redist68_fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_q, xout => redist68_fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_q_4_q, clk => clk, aclr => areset );

    -- fracAddResult_uid184_r_uid7_fpMultAddTest_BitJoin_for_q(BITJOIN,838)@45
    fracAddResult_uid184_r_uid7_fpMultAddTest_BitJoin_for_q_q <= fracAddResult_uid184_r_uid7_fpMultAddTest_p5_of_5_q & redist65_fracAddResult_uid184_r_uid7_fpMultAddTest_p4_of_5_q_1_q & redist66_fracAddResult_uid184_r_uid7_fpMultAddTest_p3_of_5_q_2_q & redist67_fracAddResult_uid184_r_uid7_fpMultAddTest_p2_of_5_q_3_q & redist68_fracAddResult_uid184_r_uid7_fpMultAddTest_p1_of_5_q_4_q;

    -- rangeFracAddResultMwfp3Dto0_uid185_r_uid7_fpMultAddTest(BITSELECT,184)@45
    rangeFracAddResultMwfp3Dto0_uid185_r_uid7_fpMultAddTest_in <= fracAddResult_uid184_r_uid7_fpMultAddTest_BitJoin_for_q_q(26 downto 0);
    rangeFracAddResultMwfp3Dto0_uid185_r_uid7_fpMultAddTest_b <= rangeFracAddResultMwfp3Dto0_uid185_r_uid7_fpMultAddTest_in(26 downto 0);

    -- invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest(LOGICAL,173)@39 + 1
    invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_qi <= not (and_lev0_uid459_cmpEQ_stickyBits_cZwF_uid173_r_uid7_fpMultAddTest_q);
    invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_qi, xout => invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist143_invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_q_6(DELAY,1303)
    redist143_invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_q, xout => redist143_invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_q_6_q, clk => clk, aclr => areset );

    -- fracGRS_uid186_r_uid7_fpMultAddTest(BITJOIN,185)@45
    fracGRS_uid186_r_uid7_fpMultAddTest_q <= rangeFracAddResultMwfp3Dto0_uid185_r_uid7_fpMultAddTest_b & redist143_invCmpEQ_stickyBits_cZwF_uid174_r_uid7_fpMultAddTest_q_6_q;

    -- rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest(BITSELECT,255)@45
    rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b <= fracGRS_uid186_r_uid7_fpMultAddTest_q(27 downto 12);

    -- z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1109)@45
    z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b(5 downto 0);
    z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b(11 downto 6);
    z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_d <= rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b(15 downto 12);

    -- eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,511)@45 + 1
    eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_d = c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_d ELSE "0";
    eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist99_eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2(DELAY,1259)
    redist99_eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, xout => redist99_eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- y0_uid725_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1156)
    y0_uid725_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c(2 downto 0);
    y0_uid725_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c(5 downto 3);

    -- x0_uid724_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1158)@45
    x0_uid724_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c(2 downto 0);
    x0_uid724_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid729_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,728)@45 + 1
    eq1_uid729_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid724_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid725_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid729_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid729_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => eq1_uid729_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid726_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,725)@45 + 1
    eq0_uid726_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid724_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid725_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid726_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid726_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => eq0_uid726_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid730_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,729)@46 + 1
    andEq_uid730_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= eq0_uid726_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q and eq1_uid729_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q;
    andEq_uid730_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid730_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => andEq_uid730_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- y0_uid718_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1155)
    y0_uid718_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    y0_uid718_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= c0_uid505_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- x0_uid717_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1157)@45
    x0_uid717_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid717_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid504_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid722_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,721)@45 + 1
    eq1_uid722_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid717_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid718_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid722_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid722_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => eq1_uid722_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid719_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,718)@45 + 1
    eq0_uid719_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid717_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid718_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid719_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid719_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => eq0_uid719_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid723_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,722)@46 + 1
    andEq_uid723_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= eq0_uid719_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q and eq1_uid722_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q;
    andEq_uid723_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid723_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => andEq_uid723_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,512)@47 + 1
    and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= andEq_uid723_eq0_uid506_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q and andEq_uid730_eq1_uid509_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q and redist99_eq2_uid512_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2_q;
    and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist98_and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_9(DELAY,1258)
    redist98_and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q, xout => redist98_and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_9_q, clk => clk, aclr => areset );

    -- redist141_fracGRS_uid186_r_uid7_fpMultAddTest_q_3(DELAY,1301)
    redist141_fracGRS_uid186_r_uid7_fpMultAddTest_q_3 : dspba_delay
    GENERIC MAP ( width => 28, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracGRS_uid186_r_uid7_fpMultAddTest_q, xout => redist141_fracGRS_uid186_r_uid7_fpMultAddTest_q_3_q, clk => clk, aclr => areset );

    -- vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest(BITSELECT,258)@48
    vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_in <= redist141_fracGRS_uid186_r_uid7_fpMultAddTest_q_3_q(11 downto 0);
    vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_b <= vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_in(11 downto 0);

    -- mO_uid258_lzCountVal_uid187_r_uid7_fpMultAddTest(CONSTANT,257)
    mO_uid258_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= "1111";

    -- cStage_uid260_lzCountVal_uid187_r_uid7_fpMultAddTest(BITJOIN,259)@48
    cStage_uid260_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_b & mO_uid258_lzCountVal_uid187_r_uid7_fpMultAddTest_q;

    -- redist130_rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b_3(DELAY,1290)
    redist130_rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b_3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b, xout => redist130_rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b_3_q, clk => clk, aclr => areset );

    -- vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest(MUX,261)@48 + 1
    vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_s <= and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q;
    vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_s) IS
                WHEN "0" => vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= redist130_rVStage_uid256_lzCountVal_uid187_r_uid7_fpMultAddTest_b_3_q;
                WHEN "1" => vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= cStage_uid260_lzCountVal_uid187_r_uid7_fpMultAddTest_q;
                WHEN OTHERS => vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1110)@49
    rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_q(15 downto 8);
    rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= vStagei_uid262_lzCountVal_uid187_r_uid7_fpMultAddTest_q(7 downto 0);

    -- z0_uid514_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1159)@49
    z0_uid514_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 0);
    z0_uid514_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b(7 downto 6);

    -- eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,518)@49 + 1
    eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN z0_uid514_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c = c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist97_eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2(DELAY,1257)
    redist97_eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q, xout => redist97_eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid731_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1121)@49
    x0_uid731_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid514_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid731_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid514_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid736_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,735)@49 + 1
    eq1_uid736_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid731_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid736_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid736_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => eq1_uid736_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid733_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,732)@49 + 1
    eq0_uid733_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid731_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid733_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid733_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => eq0_uid733_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid737_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,736)@50 + 1
    andEq_uid737_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= eq0_uid733_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q and eq1_uid736_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q;
    andEq_uid737_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid737_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => andEq_uid737_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,519)@51 + 1
    and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= andEq_uid737_eq0_uid516_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q and redist97_eq1_uid519_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_2_q;
    and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist96_and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_5(DELAY,1256)
    redist96_and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q, xout => redist96_and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_5_q, clk => clk, aclr => areset );

    -- redist16_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_3(DELAY,1176)
    redist16_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c, xout => redist16_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_3_q, clk => clk, aclr => areset );

    -- redist15_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_3(DELAY,1175)
    redist15_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b, xout => redist15_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_3_q, clk => clk, aclr => areset );

    -- vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest(MUX,267)@52 + 1
    vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_s <= and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q;
    vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_s) IS
                WHEN "0" => vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= redist15_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_3_q;
                WHEN "1" => vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= redist16_rVStage_uid264_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_3_q;
                WHEN OTHERS => vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1111)@53
    rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_q(7 downto 4);
    rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= vStagei_uid268_lzCountVal_uid187_r_uid7_fpMultAddTest_q(3 downto 0);

    -- vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,270)@53 + 1
    vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b = zs_uid269_lzCountVal_uid187_r_uid7_fpMultAddTest_q ELSE "0";
    vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist128_vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_q_3(DELAY,1288)
    redist128_vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_q, xout => redist128_vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_q_3_q, clk => clk, aclr => areset );

    -- redist14_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1(DELAY,1174)
    redist14_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c, xout => redist14_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist13_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1(DELAY,1173)
    redist13_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b, xout => redist13_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest(MUX,273)@54 + 1
    vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_s <= vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_q;
    vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_s) IS
                WHEN "0" => vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= redist13_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1_q;
                WHEN "1" => vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= redist14_rVStage_uid270_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1_q;
                WHEN OTHERS => vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1112)@55
    rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b <= vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_q(3 downto 2);
    rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c <= vStagei_uid274_lzCountVal_uid187_r_uid7_fpMultAddTest_q(1 downto 0);

    -- vCount_uid277_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,276)@55 + 1
    vCount_uid277_lzCountVal_uid187_r_uid7_fpMultAddTest_qi <= "1" WHEN rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b = zs_uid275_lzCountVal_uid187_r_uid7_fpMultAddTest_q ELSE "0";
    vCount_uid277_lzCountVal_uid187_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid277_lzCountVal_uid187_r_uid7_fpMultAddTest_qi, xout => vCount_uid277_lzCountVal_uid187_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist12_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1(DELAY,1172)
    redist12_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c, xout => redist12_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist11_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1(DELAY,1171)
    redist11_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b, xout => redist11_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest(MUX,279)@56
    vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_s <= vCount_uid277_lzCountVal_uid187_r_uid7_fpMultAddTest_q;
    vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_combproc: PROCESS (vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_s, redist11_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1_q, redist12_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_s) IS
            WHEN "0" => vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= redist11_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= redist12_rVStage_uid276_lzCountVal_uid187_r_uid7_fpMultAddTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid282_lzCountVal_uid187_r_uid7_fpMultAddTest(BITSELECT,281)@56
    rVStage_uid282_lzCountVal_uid187_r_uid7_fpMultAddTest_b <= vStagei_uid280_lzCountVal_uid187_r_uid7_fpMultAddTest_q(1 downto 1);

    -- vCount_uid283_lzCountVal_uid187_r_uid7_fpMultAddTest(LOGICAL,282)@56
    vCount_uid283_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= "1" WHEN rVStage_uid282_lzCountVal_uid187_r_uid7_fpMultAddTest_b = GND_q ELSE "0";

    -- r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest(BITJOIN,283)@56
    r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q <= redist98_and_lev0_uid513_vCount_uid257_lzCountVal_uid187_r_uid7_fpMultAddTest_q_9_q & redist96_and_lev0_uid520_vCount_uid265_lzCountVal_uid187_r_uid7_fpMultAddTest_q_5_q & redist128_vCount_uid271_lzCountVal_uid187_r_uid7_fpMultAddTest_q_3_q & vCount_uid277_lzCountVal_uid187_r_uid7_fpMultAddTest_q & vCount_uid283_lzCountVal_uid187_r_uid7_fpMultAddTest_q;

    -- redist127_r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q_1(DELAY,1287)
    redist127_r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q, xout => redist127_r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q_1_q, clk => clk, aclr => areset );

    -- aMinusA_uid189_r_uid7_fpMultAddTest(LOGICAL,188)@57 + 1
    aMinusA_uid189_r_uid7_fpMultAddTest_qi <= "1" WHEN redist127_r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q_1_q = cAmA_uid188_r_uid7_fpMultAddTest_q ELSE "0";
    aMinusA_uid189_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid189_r_uid7_fpMultAddTest_qi, xout => aMinusA_uid189_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- invAMinusA_uid231_r_uid7_fpMultAddTest(LOGICAL,230)@58
    invAMinusA_uid231_r_uid7_fpMultAddTest_q <= not (aMinusA_uid189_r_uid7_fpMultAddTest_q);

    -- redist147_sigA_uid152_r_uid7_fpMultAddTest_b_20(DELAY,1307)
    redist147_sigA_uid152_r_uid7_fpMultAddTest_b_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 20, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid152_r_uid7_fpMultAddTest_b, xout => redist147_sigA_uid152_r_uid7_fpMultAddTest_b_20_q, clk => clk, aclr => areset );

    -- eq1_uid392_expXIsMax_uid140_r_uid7_fpMultAddTest(LOGICAL,391)@28 + 1
    eq1_uid392_expXIsMax_uid140_r_uid7_fpMultAddTest_qi <= "1" WHEN redist18_z0_uid380_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c_1_q = c1_uid297_expXIsMax_uid19_p_uid6_fpMultAddTest_b ELSE "0";
    eq1_uid392_expXIsMax_uid140_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid392_expXIsMax_uid140_r_uid7_fpMultAddTest_qi, xout => eq1_uid392_expXIsMax_uid140_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq1_uid659_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest(LOGICAL,658)@27 + 1
    eq1_uid659_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid647_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid659_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid659_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_qi, xout => eq1_uid659_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid656_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest(LOGICAL,655)@27 + 1
    eq0_uid656_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid647_eq0_uid382_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid656_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid656_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_qi, xout => eq0_uid656_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid660_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest(LOGICAL,659)@28 + 1
    andEq_uid660_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_qi <= eq0_uid656_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_q and eq1_uid659_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_q;
    andEq_uid660_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid660_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_qi, xout => andEq_uid660_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest(LOGICAL,392)@29 + 1
    and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_qi <= andEq_uid660_eq0_uid389_expXIsMax_uid140_r_uid7_fpMultAddTest_q and eq1_uid392_expXIsMax_uid140_r_uid7_fpMultAddTest_q;
    and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist105_and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q_28(DELAY,1265)
    redist105_and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q_28 : dspba_delay
    GENERIC MAP ( width => 1, depth => 27, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q, xout => redist105_and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q_28_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid145_r_uid7_fpMultAddTest(LOGICAL,144)@57
    invExpXIsMax_uid145_r_uid7_fpMultAddTest_q <= not (redist105_and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q_28_q);

    -- redist148_InvExpXIsZero_uid146_r_uid7_fpMultAddTest_q_26(DELAY,1308)
    redist148_InvExpXIsZero_uid146_r_uid7_fpMultAddTest_q_26 : dspba_delay
    GENERIC MAP ( width => 1, depth => 26, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid146_r_uid7_fpMultAddTest_q, xout => redist148_InvExpXIsZero_uid146_r_uid7_fpMultAddTest_q_26_q, clk => clk, aclr => areset );

    -- excR_bSig_uid147_r_uid7_fpMultAddTest(LOGICAL,146)@57 + 1
    excR_bSig_uid147_r_uid7_fpMultAddTest_qi <= redist148_InvExpXIsZero_uid146_r_uid7_fpMultAddTest_q_26_q and invExpXIsMax_uid145_r_uid7_fpMultAddTest_q;
    excR_bSig_uid147_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_bSig_uid147_r_uid7_fpMultAddTest_qi, xout => excR_bSig_uid147_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- exp_aSig_uid123_r_uid7_fpMultAddTest(BITSELECT,122)@38
    exp_aSig_uid123_r_uid7_fpMultAddTest_in <= aSig_uid118_r_uid7_fpMultAddTest_BitJoin_for_q_q(30 downto 0);
    exp_aSig_uid123_r_uid7_fpMultAddTest_b <= exp_aSig_uid123_r_uid7_fpMultAddTest_in(30 downto 23);

    -- z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1099)@38
    z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_b <= exp_aSig_uid123_r_uid7_fpMultAddTest_b(5 downto 0);
    z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c <= exp_aSig_uid123_r_uid7_fpMultAddTest_b(7 downto 6);

    -- redist19_z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c_1(DELAY,1179)
    redist19_z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c, xout => redist19_z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- eq1_uid365_expXIsMax_uid126_r_uid7_fpMultAddTest(LOGICAL,364)@39 + 1
    eq1_uid365_expXIsMax_uid126_r_uid7_fpMultAddTest_qi <= "1" WHEN redist19_z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c_1_q = c1_uid297_expXIsMax_uid19_p_uid6_fpMultAddTest_b ELSE "0";
    eq1_uid365_expXIsMax_uid126_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid365_expXIsMax_uid126_r_uid7_fpMultAddTest_qi, xout => eq1_uid365_expXIsMax_uid126_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid612_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1143)@38
    x0_uid612_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid612_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid624_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest(LOGICAL,623)@38 + 1
    eq1_uid624_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid612_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid624_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid624_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_qi, xout => eq1_uid624_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid621_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest(LOGICAL,620)@38 + 1
    eq0_uid621_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid612_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid529_eq0_uid295_expXIsMax_uid19_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid621_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid621_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_qi, xout => eq0_uid621_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid625_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest(LOGICAL,624)@39 + 1
    andEq_uid625_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_qi <= eq0_uid621_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_q and eq1_uid624_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_q;
    andEq_uid625_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid625_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_qi, xout => andEq_uid625_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest(LOGICAL,365)@40 + 1
    and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_qi <= andEq_uid625_eq0_uid362_expXIsMax_uid126_r_uid7_fpMultAddTest_q and eq1_uid365_expXIsMax_uid126_r_uid7_fpMultAddTest_q;
    and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist111_and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q_17(DELAY,1271)
    redist111_and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q, xout => redist111_and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q_17_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid131_r_uid7_fpMultAddTest(LOGICAL,130)@57
    invExpXIsMax_uid131_r_uid7_fpMultAddTest_q <= not (redist111_and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q_17_q);

    -- eq1_uid358_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest(LOGICAL,357)@39 + 1
    eq1_uid358_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi <= "1" WHEN redist19_z0_uid353_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c_1_q = c0_uid287_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid358_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid358_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi, xout => eq1_uid358_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq1_uid617_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest(LOGICAL,616)@38 + 1
    eq1_uid617_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid612_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid617_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid617_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi, xout => eq1_uid617_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid614_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest(LOGICAL,613)@38 + 1
    eq0_uid614_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid612_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid522_eq0_uid288_excZ_x_uid18_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid614_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid614_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi, xout => eq0_uid614_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid618_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest(LOGICAL,617)@39 + 1
    andEq_uid618_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi <= eq0_uid614_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q and eq1_uid617_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q;
    andEq_uid618_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid618_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi, xout => andEq_uid618_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest(LOGICAL,358)@40 + 1
    and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi <= andEq_uid618_eq0_uid355_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q and eq1_uid358_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q;
    and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist112_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_17(DELAY,1272)
    redist112_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q, xout => redist112_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_17_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid132_r_uid7_fpMultAddTest(LOGICAL,131)@57
    InvExpXIsZero_uid132_r_uid7_fpMultAddTest_q <= not (redist112_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_17_q);

    -- excR_aSig_uid133_r_uid7_fpMultAddTest(LOGICAL,132)@57 + 1
    excR_aSig_uid133_r_uid7_fpMultAddTest_qi <= InvExpXIsZero_uid132_r_uid7_fpMultAddTest_q and invExpXIsMax_uid131_r_uid7_fpMultAddTest_q;
    excR_aSig_uid133_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_aSig_uid133_r_uid7_fpMultAddTest_qi, xout => excR_aSig_uid133_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- signRReg_uid232_r_uid7_fpMultAddTest(LOGICAL,231)@58 + 1
    signRReg_uid232_r_uid7_fpMultAddTest_qi <= excR_aSig_uid133_r_uid7_fpMultAddTest_q and excR_bSig_uid147_r_uid7_fpMultAddTest_q and redist147_sigA_uid152_r_uid7_fpMultAddTest_b_20_q and invAMinusA_uid231_r_uid7_fpMultAddTest_q;
    signRReg_uid232_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRReg_uid232_r_uid7_fpMultAddTest_qi, xout => signRReg_uid232_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist132_signRReg_uid232_r_uid7_fpMultAddTest_q_2(DELAY,1292)
    redist132_signRReg_uid232_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRReg_uid232_r_uid7_fpMultAddTest_q, xout => redist132_signRReg_uid232_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- redist146_sigB_uid153_r_uid7_fpMultAddTest_b_31(DELAY,1306)
    redist146_sigB_uid153_r_uid7_fpMultAddTest_b_31 : dspba_delay
    GENERIC MAP ( width => 1, depth => 20, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist145_sigB_uid153_r_uid7_fpMultAddTest_b_11_q, xout => redist146_sigB_uid153_r_uid7_fpMultAddTest_b_31_q, clk => clk, aclr => areset );

    -- redist107_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_29(DELAY,1267)
    redist107_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_29 : dspba_delay
    GENERIC MAP ( width => 1, depth => 27, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist106_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_2_q, xout => redist107_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_29_q, clk => clk, aclr => areset );

    -- redist113_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_18(DELAY,1273)
    redist113_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist112_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_17_q, xout => redist113_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_18_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid236_r_uid7_fpMultAddTest(LOGICAL,235)@58 + 1
    excAZBZSigASigB_uid236_r_uid7_fpMultAddTest_qi <= redist113_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_18_q and redist107_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_29_q and redist147_sigA_uid152_r_uid7_fpMultAddTest_b_20_q and redist146_sigB_uid153_r_uid7_fpMultAddTest_b_31_q;
    excAZBZSigASigB_uid236_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excAZBZSigASigB_uid236_r_uid7_fpMultAddTest_qi, xout => excAZBZSigASigB_uid236_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- excBZARSigA_uid237_r_uid7_fpMultAddTest(LOGICAL,236)@58 + 1
    excBZARSigA_uid237_r_uid7_fpMultAddTest_qi <= redist107_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_29_q and excR_aSig_uid133_r_uid7_fpMultAddTest_q and redist147_sigA_uid152_r_uid7_fpMultAddTest_b_20_q;
    excBZARSigA_uid237_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excBZARSigA_uid237_r_uid7_fpMultAddTest_qi, xout => excBZARSigA_uid237_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- signRZero_uid238_r_uid7_fpMultAddTest(LOGICAL,237)@59 + 1
    signRZero_uid238_r_uid7_fpMultAddTest_qi <= excBZARSigA_uid237_r_uid7_fpMultAddTest_q or excAZBZSigASigB_uid236_r_uid7_fpMultAddTest_q;
    signRZero_uid238_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRZero_uid238_r_uid7_fpMultAddTest_qi, xout => signRZero_uid238_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1102)@30
    z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b <= redist151_frac_bSig_uid138_r_uid7_fpMultAddTest_b_3_q(5 downto 0);
    z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c <= redist151_frac_bSig_uid138_r_uid7_fpMultAddTest_b_3_q(11 downto 6);
    z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_d <= redist151_frac_bSig_uid138_r_uid7_fpMultAddTest_b_3_q(17 downto 12);
    z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_e <= redist151_frac_bSig_uid138_r_uid7_fpMultAddTest_b_3_q(22 downto 18);

    -- eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,404)@30 + 1
    eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= "1" WHEN z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_e = c3_uid310_fracXIsZero_uid20_p_uid6_fpMultAddTest_b ELSE "0";
    eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist104_eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_2(DELAY,1264)
    redist104_eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, xout => redist104_eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid675_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1150)@30
    x0_uid675_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_d(2 downto 0);
    x0_uid675_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid680_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,679)@30 + 1
    eq1_uid680_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid675_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid680_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid680_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => eq1_uid680_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid677_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,676)@30 + 1
    eq0_uid677_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid675_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid677_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid677_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => eq0_uid677_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid681_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,680)@31 + 1
    andEq_uid681_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= eq0_uid677_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_q and eq1_uid680_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_q;
    andEq_uid681_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid681_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => andEq_uid681_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid668_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1149)@30
    x0_uid668_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c(2 downto 0);
    x0_uid668_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid673_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,672)@30 + 1
    eq1_uid673_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid668_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid673_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid673_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => eq1_uid673_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid670_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,669)@30 + 1
    eq0_uid670_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid668_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid670_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid670_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => eq0_uid670_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid674_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,673)@31 + 1
    andEq_uid674_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= eq0_uid670_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_q and eq1_uid673_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_q;
    andEq_uid674_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid674_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => andEq_uid674_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid661_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1148)@30
    x0_uid661_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid661_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid394_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid666_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,665)@30 + 1
    eq1_uid666_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid661_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid666_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid666_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => eq1_uid666_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid663_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,662)@30 + 1
    eq0_uid663_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid661_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid663_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid663_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => eq0_uid663_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid667_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,666)@31 + 1
    andEq_uid667_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= eq0_uid663_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_q and eq1_uid666_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_q;
    andEq_uid667_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid667_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => andEq_uid667_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest(LOGICAL,405)@32 + 1
    and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi <= andEq_uid667_eq0_uid396_fracXIsZero_uid141_r_uid7_fpMultAddTest_q and andEq_uid674_eq1_uid399_fracXIsZero_uid141_r_uid7_fpMultAddTest_q and andEq_uid681_eq2_uid402_fracXIsZero_uid141_r_uid7_fpMultAddTest_q and redist104_eq3_uid405_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_2_q;
    and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist103_and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_25(DELAY,1263)
    redist103_and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_25 : dspba_delay
    GENERIC MAP ( width => 1, depth => 24, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_q, xout => redist103_and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_25_q, clk => clk, aclr => areset );

    -- excI_bSig_uid143_r_uid7_fpMultAddTest(LOGICAL,142)@57 + 1
    excI_bSig_uid143_r_uid7_fpMultAddTest_qi <= redist105_and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q_28_q and redist103_and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_25_q;
    excI_bSig_uid143_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid143_r_uid7_fpMultAddTest_qi, xout => excI_bSig_uid143_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- sigBBInf_uid233_r_uid7_fpMultAddTest(LOGICAL,232)@58 + 1
    sigBBInf_uid233_r_uid7_fpMultAddTest_qi <= redist146_sigB_uid153_r_uid7_fpMultAddTest_b_31_q and excI_bSig_uid143_r_uid7_fpMultAddTest_q;
    sigBBInf_uid233_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigBBInf_uid233_r_uid7_fpMultAddTest_qi, xout => sigBBInf_uid233_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1100)@39
    z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b <= redist154_frac_aSig_uid124_r_uid7_fpMultAddTest_b_1_q(5 downto 0);
    z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c <= redist154_frac_aSig_uid124_r_uid7_fpMultAddTest_b_1_q(11 downto 6);
    z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_d <= redist154_frac_aSig_uid124_r_uid7_fpMultAddTest_b_1_q(17 downto 12);
    z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_e <= redist154_frac_aSig_uid124_r_uid7_fpMultAddTest_b_1_q(22 downto 18);

    -- eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,377)@39 + 1
    eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= "1" WHEN z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_e = c3_uid310_fracXIsZero_uid20_p_uid6_fpMultAddTest_b ELSE "0";
    eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist110_eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_2(DELAY,1270)
    redist110_eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, xout => redist110_eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid640_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1146)@39
    x0_uid640_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_d(2 downto 0);
    x0_uid640_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid645_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,644)@39 + 1
    eq1_uid645_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid640_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid645_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid645_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => eq1_uid645_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid642_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,641)@39 + 1
    eq0_uid642_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid640_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid550_eq2_uid308_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid642_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid642_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => eq0_uid642_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid646_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,645)@40 + 1
    andEq_uid646_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= eq0_uid642_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_q and eq1_uid645_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_q;
    andEq_uid646_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid646_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => andEq_uid646_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid633_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1145)@39
    x0_uid633_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c(2 downto 0);
    x0_uid633_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid638_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,637)@39 + 1
    eq1_uid638_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid633_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid638_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid638_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => eq1_uid638_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid635_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,634)@39 + 1
    eq0_uid635_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid633_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid543_eq1_uid305_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid635_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid635_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => eq0_uid635_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid639_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,638)@40 + 1
    andEq_uid639_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= eq0_uid635_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_q and eq1_uid638_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_q;
    andEq_uid639_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid639_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => andEq_uid639_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- x0_uid626_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1144)@39
    x0_uid626_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid626_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid367_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid631_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,630)@39 + 1
    eq1_uid631_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid626_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid631_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid631_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => eq1_uid631_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid628_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,627)@39 + 1
    eq0_uid628_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid626_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid536_eq0_uid302_fracXIsZero_uid20_p_uid6_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid628_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid628_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => eq0_uid628_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid632_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,631)@40 + 1
    andEq_uid632_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= eq0_uid628_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_q and eq1_uid631_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_q;
    andEq_uid632_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid632_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => andEq_uid632_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest(LOGICAL,378)@41 + 1
    and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi <= andEq_uid632_eq0_uid369_fracXIsZero_uid127_r_uid7_fpMultAddTest_q and andEq_uid639_eq1_uid372_fracXIsZero_uid127_r_uid7_fpMultAddTest_q and andEq_uid646_eq2_uid375_fracXIsZero_uid127_r_uid7_fpMultAddTest_q and redist110_eq3_uid378_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_2_q;
    and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist109_and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_16(DELAY,1269)
    redist109_and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_q, xout => redist109_and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_16_q, clk => clk, aclr => areset );

    -- excI_aSig_uid129_r_uid7_fpMultAddTest(LOGICAL,128)@57 + 1
    excI_aSig_uid129_r_uid7_fpMultAddTest_qi <= redist111_and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q_17_q and redist109_and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_16_q;
    excI_aSig_uid129_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid129_r_uid7_fpMultAddTest_qi, xout => excI_aSig_uid129_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- sigAAInf_uid234_r_uid7_fpMultAddTest(LOGICAL,233)@58 + 1
    sigAAInf_uid234_r_uid7_fpMultAddTest_qi <= redist147_sigA_uid152_r_uid7_fpMultAddTest_b_20_q and excI_aSig_uid129_r_uid7_fpMultAddTest_q;
    sigAAInf_uid234_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigAAInf_uid234_r_uid7_fpMultAddTest_qi, xout => sigAAInf_uid234_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- signRInf_uid235_r_uid7_fpMultAddTest(LOGICAL,234)@59 + 1
    signRInf_uid235_r_uid7_fpMultAddTest_qi <= sigAAInf_uid234_r_uid7_fpMultAddTest_q or sigBBInf_uid233_r_uid7_fpMultAddTest_q;
    signRInf_uid235_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInf_uid235_r_uid7_fpMultAddTest_qi, xout => signRInf_uid235_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- signRInfRZRReg_uid239_r_uid7_fpMultAddTest(LOGICAL,238)@60 + 1
    signRInfRZRReg_uid239_r_uid7_fpMultAddTest_qi <= signRInf_uid235_r_uid7_fpMultAddTest_q or signRZero_uid238_r_uid7_fpMultAddTest_q or redist132_signRReg_uid232_r_uid7_fpMultAddTest_q_2_q;
    signRInfRZRReg_uid239_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid239_r_uid7_fpMultAddTest_qi, xout => signRInfRZRReg_uid239_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist131_signRInfRZRReg_uid239_r_uid7_fpMultAddTest_q_13(DELAY,1291)
    redist131_signRInfRZRReg_uid239_r_uid7_fpMultAddTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid239_r_uid7_fpMultAddTest_q, xout => redist131_signRInfRZRReg_uid239_r_uid7_fpMultAddTest_q_13_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid142_r_uid7_fpMultAddTest(LOGICAL,141)@57
    fracXIsNotZero_uid142_r_uid7_fpMultAddTest_q <= not (redist103_and_lev0_uid406_fracXIsZero_uid141_r_uid7_fpMultAddTest_q_25_q);

    -- excN_bSig_uid144_r_uid7_fpMultAddTest(LOGICAL,143)@57 + 1
    excN_bSig_uid144_r_uid7_fpMultAddTest_qi <= redist105_and_lev0_uid393_expXIsMax_uid140_r_uid7_fpMultAddTest_q_28_q and fracXIsNotZero_uid142_r_uid7_fpMultAddTest_q;
    excN_bSig_uid144_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid144_r_uid7_fpMultAddTest_qi, xout => excN_bSig_uid144_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist149_excN_bSig_uid144_r_uid7_fpMultAddTest_q_14(DELAY,1309)
    redist149_excN_bSig_uid144_r_uid7_fpMultAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid144_r_uid7_fpMultAddTest_q, xout => redist149_excN_bSig_uid144_r_uid7_fpMultAddTest_q_14_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid128_r_uid7_fpMultAddTest(LOGICAL,127)@57
    fracXIsNotZero_uid128_r_uid7_fpMultAddTest_q <= not (redist109_and_lev0_uid379_fracXIsZero_uid127_r_uid7_fpMultAddTest_q_16_q);

    -- excN_aSig_uid130_r_uid7_fpMultAddTest(LOGICAL,129)@57 + 1
    excN_aSig_uid130_r_uid7_fpMultAddTest_qi <= redist111_and_lev0_uid366_expXIsMax_uid126_r_uid7_fpMultAddTest_q_17_q and fracXIsNotZero_uid128_r_uid7_fpMultAddTest_q;
    excN_aSig_uid130_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid130_r_uid7_fpMultAddTest_qi, xout => excN_aSig_uid130_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist152_excN_aSig_uid130_r_uid7_fpMultAddTest_q_14(DELAY,1312)
    redist152_excN_aSig_uid130_r_uid7_fpMultAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid130_r_uid7_fpMultAddTest_q, xout => redist152_excN_aSig_uid130_r_uid7_fpMultAddTest_q_14_q, clk => clk, aclr => areset );

    -- excRNaN2_uid226_r_uid7_fpMultAddTest(LOGICAL,225)@71 + 1
    excRNaN2_uid226_r_uid7_fpMultAddTest_qi <= redist152_excN_aSig_uid130_r_uid7_fpMultAddTest_q_14_q or redist149_excN_bSig_uid144_r_uid7_fpMultAddTest_q_14_q;
    excRNaN2_uid226_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN2_uid226_r_uid7_fpMultAddTest_qi, xout => excRNaN2_uid226_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist144_effSub_uid154_r_uid7_fpMultAddTest_q_33(DELAY,1304)
    redist144_effSub_uid154_r_uid7_fpMultAddTest_q_33 : dspba_delay
    GENERIC MAP ( width => 1, depth => 32, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid154_r_uid7_fpMultAddTest_q, xout => redist144_effSub_uid154_r_uid7_fpMultAddTest_q_33_q, clk => clk, aclr => areset );

    -- redist150_excI_bSig_uid143_r_uid7_fpMultAddTest_q_14(DELAY,1310)
    redist150_excI_bSig_uid143_r_uid7_fpMultAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid143_r_uid7_fpMultAddTest_q, xout => redist150_excI_bSig_uid143_r_uid7_fpMultAddTest_q_14_q, clk => clk, aclr => areset );

    -- redist153_excI_aSig_uid129_r_uid7_fpMultAddTest_q_14(DELAY,1313)
    redist153_excI_aSig_uid129_r_uid7_fpMultAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid129_r_uid7_fpMultAddTest_q, xout => redist153_excI_aSig_uid129_r_uid7_fpMultAddTest_q_14_q, clk => clk, aclr => areset );

    -- excAIBISub_uid227_r_uid7_fpMultAddTest(LOGICAL,226)@71 + 1
    excAIBISub_uid227_r_uid7_fpMultAddTest_qi <= redist153_excI_aSig_uid129_r_uid7_fpMultAddTest_q_14_q and redist150_excI_bSig_uid143_r_uid7_fpMultAddTest_q_14_q and redist144_effSub_uid154_r_uid7_fpMultAddTest_q_33_q;
    excAIBISub_uid227_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excAIBISub_uid227_r_uid7_fpMultAddTest_qi, xout => excAIBISub_uid227_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- excRNaN_uid228_r_uid7_fpMultAddTest(LOGICAL,227)@72 + 1
    excRNaN_uid228_r_uid7_fpMultAddTest_qi <= excAIBISub_uid227_r_uid7_fpMultAddTest_q or excRNaN2_uid226_r_uid7_fpMultAddTest_q;
    excRNaN_uid228_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid228_r_uid7_fpMultAddTest_qi, xout => excRNaN_uid228_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid240_r_uid7_fpMultAddTest(LOGICAL,239)@73
    invExcRNaN_uid240_r_uid7_fpMultAddTest_q <= not (excRNaN_uid228_r_uid7_fpMultAddTest_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid241_r_uid7_fpMultAddTest(LOGICAL,240)@73 + 1
    signRPostExc_uid241_r_uid7_fpMultAddTest_qi <= invExcRNaN_uid240_r_uid7_fpMultAddTest_q and redist131_signRInfRZRReg_uid239_r_uid7_fpMultAddTest_q_13_q;
    signRPostExc_uid241_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid241_r_uid7_fpMultAddTest_qi, xout => signRPostExc_uid241_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_UpperBits_for_b(CONSTANT,860)
    rndExpFrac_uid206_r_uid7_fpMultAddTest_UpperBits_for_b_q <= "0000000000000000000000000000000000";

    -- cRBit_uid201_r_uid7_fpMultAddTest(CONSTANT,200)
    cRBit_uid201_r_uid7_fpMultAddTest_q <= "01000";

    -- leftShiftStage1Idx3Rng6_uid480_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITSELECT,479)@58
    leftShiftStage1Idx3Rng6_uid480_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in <= leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(21 downto 0);
    leftShiftStage1Idx3Rng6_uid480_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b <= leftShiftStage1Idx3Rng6_uid480_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in(21 downto 0);

    -- leftShiftStage1Idx3Pad6_uid479_fracPostNormExt_uid190_r_uid7_fpMultAddTest(CONSTANT,478)
    leftShiftStage1Idx3Pad6_uid479_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= "000000";

    -- leftShiftStage1Idx3_uid481_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITJOIN,480)@58
    leftShiftStage1Idx3_uid481_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage1Idx3Rng6_uid480_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b & leftShiftStage1Idx3Pad6_uid479_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q;

    -- leftShiftStage1Idx2Rng4_uid477_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITSELECT,476)@58
    leftShiftStage1Idx2Rng4_uid477_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in <= leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(23 downto 0);
    leftShiftStage1Idx2Rng4_uid477_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b <= leftShiftStage1Idx2Rng4_uid477_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in(23 downto 0);

    -- leftShiftStage1Idx2_uid478_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITJOIN,477)@58
    leftShiftStage1Idx2_uid478_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage1Idx2Rng4_uid477_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b & zs_uid269_lzCountVal_uid187_r_uid7_fpMultAddTest_q;

    -- leftShiftStage1Idx1Rng2_uid474_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITSELECT,473)@58
    leftShiftStage1Idx1Rng2_uid474_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in <= leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(25 downto 0);
    leftShiftStage1Idx1Rng2_uid474_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b <= leftShiftStage1Idx1Rng2_uid474_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in(25 downto 0);

    -- leftShiftStage1Idx1_uid475_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITJOIN,474)@58
    leftShiftStage1Idx1_uid475_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage1Idx1Rng2_uid474_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b & zs_uid275_lzCountVal_uid187_r_uid7_fpMultAddTest_q;

    -- leftShiftStage0Idx3Rng24_uid469_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITSELECT,468)@57
    leftShiftStage0Idx3Rng24_uid469_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in <= redist142_fracGRS_uid186_r_uid7_fpMultAddTest_q_12_q(3 downto 0);
    leftShiftStage0Idx3Rng24_uid469_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b <= leftShiftStage0Idx3Rng24_uid469_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in(3 downto 0);

    -- leftShiftStage0Idx3Pad24_uid468_fracPostNormExt_uid190_r_uid7_fpMultAddTest(CONSTANT,467)
    leftShiftStage0Idx3Pad24_uid468_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= "000000000000000000000000";

    -- leftShiftStage0Idx3_uid470_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITJOIN,469)@57
    leftShiftStage0Idx3_uid470_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage0Idx3Rng24_uid469_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b & leftShiftStage0Idx3Pad24_uid468_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q;

    -- redist129_vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_b_9(DELAY,1289)
    redist129_vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_b_9 : dspba_delay
    GENERIC MAP ( width => 12, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_b, xout => redist129_vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_b_9_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid467_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITJOIN,466)@57
    leftShiftStage0Idx2_uid467_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= redist129_vStage_uid259_lzCountVal_uid187_r_uid7_fpMultAddTest_b_9_q & zs_uid255_lzCountVal_uid187_r_uid7_fpMultAddTest_q;

    -- leftShiftStage0Idx1Rng8_uid463_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITSELECT,462)@57
    leftShiftStage0Idx1Rng8_uid463_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in <= redist142_fracGRS_uid186_r_uid7_fpMultAddTest_q_12_q(19 downto 0);
    leftShiftStage0Idx1Rng8_uid463_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b <= leftShiftStage0Idx1Rng8_uid463_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in(19 downto 0);

    -- leftShiftStage0Idx1_uid464_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITJOIN,463)@57
    leftShiftStage0Idx1_uid464_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage0Idx1Rng8_uid463_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b & cstAllZWE_uid15_p_uid6_fpMultAddTest_q;

    -- redist142_fracGRS_uid186_r_uid7_fpMultAddTest_q_12(DELAY,1302)
    redist142_fracGRS_uid186_r_uid7_fpMultAddTest_q_12 : dspba_delay
    GENERIC MAP ( width => 28, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist141_fracGRS_uid186_r_uid7_fpMultAddTest_q_3_q, xout => redist142_fracGRS_uid186_r_uid7_fpMultAddTest_q_12_q, clk => clk, aclr => areset );

    -- leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1113)@57
    leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_b <= redist127_r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q_1_q(4 downto 3);
    leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_c <= redist127_r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q_1_q(2 downto 1);
    leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d <= redist127_r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q_1_q(0 downto 0);

    -- leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest(MUX,471)@57 + 1
    leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_s <= leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_b;
    leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_s) IS
                WHEN "00" => leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= redist142_fracGRS_uid186_r_uid7_fpMultAddTest_q_12_q;
                WHEN "01" => leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage0Idx1_uid464_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q;
                WHEN "10" => leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage0Idx2_uid467_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q;
                WHEN "11" => leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage0Idx3_uid470_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q;
                WHEN OTHERS => leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist9_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_c_1(DELAY,1169)
    redist9_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_c, xout => redist9_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest(MUX,482)@58 + 1
    leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_s <= redist9_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_c_1_q;
    leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_s) IS
                WHEN "00" => leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage0_uid472_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q;
                WHEN "01" => leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage1Idx1_uid475_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q;
                WHEN "10" => leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage1Idx2_uid478_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q;
                WHEN "11" => leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage1Idx3_uid481_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q;
                WHEN OTHERS => leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2Idx1Rng1_uid485_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITSELECT,484)@59
    leftShiftStage2Idx1Rng1_uid485_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(26 downto 0);
    leftShiftStage2Idx1Rng1_uid485_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b <= leftShiftStage2Idx1Rng1_uid485_fracPostNormExt_uid190_r_uid7_fpMultAddTest_in(26 downto 0);

    -- leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest(BITJOIN,485)@59
    leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q <= leftShiftStage2Idx1Rng1_uid485_fracPostNormExt_uid190_r_uid7_fpMultAddTest_b & GND_q;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b(BITSELECT,904)@59
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_c <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(1 downto 1);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_d <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(2 downto 2);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_e <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(3 downto 3);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_f <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(6 downto 4);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_g <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(7 downto 7);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_h <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(8 downto 8);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_i <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(9 downto 9);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_j <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(10 downto 10);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_k <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(11 downto 11);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_l <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(12 downto 12);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_m <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(13 downto 13);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_n <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(14 downto 14);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_o <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(15 downto 15);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_p <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(16 downto 16);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_q <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(17 downto 17);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_r <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(18 downto 18);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_s <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(19 downto 19);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_t <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(20 downto 20);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_u <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(21 downto 21);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_v <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(22 downto 22);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_w <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(23 downto 23);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_x <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(24 downto 24);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_y <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(25 downto 25);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_z <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(26 downto 26);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_aa <= leftShiftStage2Idx1_uid486_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(27 downto 27);

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a(BITSELECT,905)@59
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_b <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(0 downto 0);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_c <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(1 downto 1);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_d <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(2 downto 2);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_e <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(3 downto 3);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_f <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(6 downto 4);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_g <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(7 downto 7);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_h <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(8 downto 8);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_i <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(9 downto 9);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_j <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(10 downto 10);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_k <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(11 downto 11);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_l <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(12 downto 12);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_m <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(13 downto 13);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_n <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(14 downto 14);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_o <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(15 downto 15);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_p <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(16 downto 16);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_q <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(17 downto 17);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_r <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(18 downto 18);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_s <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(19 downto 19);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_t <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(20 downto 20);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_u <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(21 downto 21);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_v <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(22 downto 22);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_w <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(23 downto 23);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_x <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(24 downto 24);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_y <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(25 downto 25);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_z <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(26 downto 26);
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_aa <= leftShiftStage1_uid483_fracPostNormExt_uid190_r_uid7_fpMultAddTest_q(27 downto 27);

    -- redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2(DELAY,1170)
    redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d, xout => redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q, clk => clk, aclr => areset );

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25(MUX,931)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_aa;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_aa;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24(MUX,930)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_z;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_z;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23(MUX,929)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_y;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_y;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22(MUX,928)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_x;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_x;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21(MUX,927)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_w;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_w;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20(MUX,926)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_v;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_v;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19(MUX,925)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_u;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_u;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18(MUX,924)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_t;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_t;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17(MUX,923)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_s;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_s;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16(MUX,922)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_r;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_r;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15(MUX,921)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_q;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_q;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14(MUX,920)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_p;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_p;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13(MUX,919)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_o;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_o;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12(MUX,918)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_n;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_n;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11(MUX,917)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_m;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_m;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10(MUX,916)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_l;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_l;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9(MUX,915)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_k;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_k;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8(MUX,914)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_j;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_j;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7(MUX,913)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_i;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_i;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6(MUX,912)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_h;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_h;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5(MUX,911)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_g;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_g;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4(MUX,910)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_f;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_f;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3(MUX,909)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_e;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_e;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2(MUX,908)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_d;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_d;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1(MUX,907)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_c;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_b_c;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0(MUX,906)@59 + 1
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_s <= redist10_leftShiftStageSel4Dto3_uid471_fracPostNormExt_uid190_r_uid7_fpMultAddTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_s) IS
                WHEN "0" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitSelect_for_a_b;
                WHEN "1" => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_q <= GND_q;
                WHEN OTHERS => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitJoin_for_q(BITJOIN,932)@60
    leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitJoin_for_q_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p25_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p2_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p1_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p0_q;

    -- Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1130)@60
    Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_BitJoin_for_q_q(4 downto 0));
    Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_b <= STD_LOGIC_VECTOR(Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_in(0 downto 0));
    Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_c <= STD_LOGIC_VECTOR(Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_in(1 downto 1));
    Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_d <= STD_LOGIC_VECTOR(Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_in(2 downto 2));
    Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_e <= STD_LOGIC_VECTOR(Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_in(3 downto 3));
    Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_f <= STD_LOGIC_VECTOR(Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_in(4 downto 4));

    -- rndBitCond_uid200_r_uid7_fpMultAddTest(BITJOIN,199)@60
    rndBitCond_uid200_r_uid7_fpMultAddTest_q <= Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_f & Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_e & Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_d & Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_c & Sticky0_uid195_r_uid7_fpMultAddTest_merged_bit_select_b;

    -- rBi_uid202_r_uid7_fpMultAddTest(LOGICAL,201)@60 + 1
    rBi_uid202_r_uid7_fpMultAddTest_qi <= "1" WHEN rndBitCond_uid200_r_uid7_fpMultAddTest_q = cRBit_uid201_r_uid7_fpMultAddTest_q ELSE "0";
    rBi_uid202_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_uid202_r_uid7_fpMultAddTest_qi, xout => rBi_uid202_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- roundBit_uid203_r_uid7_fpMultAddTest(LOGICAL,202)@61
    roundBit_uid203_r_uid7_fpMultAddTest_q <= not (rBi_uid202_r_uid7_fpMultAddTest_q);

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_BitExpansion_for_b(BITJOIN,859)@61
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitExpansion_for_b_q <= rndExpFrac_uid206_r_uid7_fpMultAddTest_UpperBits_for_b_q & roundBit_uid203_r_uid7_fpMultAddTest_q;

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b(BITSELECT,862)@61
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_b <= rndExpFrac_uid206_r_uid7_fpMultAddTest_BitExpansion_for_b_q(5 downto 0);

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,1044)@60
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p6_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p5_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p4_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p3_q;

    -- redist24_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q_1(DELAY,1184)
    redist24_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q, xout => redist24_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q_1_q, clk => clk, aclr => areset );

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6(ADD,863)@61 + 1
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & redist24_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_b_q_1_q);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_b);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_a) + UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_b));
        END IF;
    END PROCESS;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_c(0) <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_o(6);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_q <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_o(5 downto 0);

    -- redist37_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q_3(DELAY,1197)
    redist37_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q, xout => redist37_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q_3_q, clk => clk, aclr => areset );

    -- redist38_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q_3(DELAY,1198)
    redist38_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q, xout => redist38_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q_3_q, clk => clk, aclr => areset );

    -- redist39_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q_3(DELAY,1199)
    redist39_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q, xout => redist39_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q_3_q, clk => clk, aclr => areset );

    -- redist40_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q_3(DELAY,1200)
    redist40_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q, xout => redist40_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q_3_q, clk => clk, aclr => areset );

    -- redist41_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q_3(DELAY,1201)
    redist41_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q, xout => redist41_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q_3_q, clk => clk, aclr => areset );

    -- redist42_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q_3(DELAY,1202)
    redist42_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q, xout => redist42_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q_3_q, clk => clk, aclr => areset );

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,1051)@62
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q <= redist37_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p12_q_3_q & redist38_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p11_q_3_q & redist39_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p10_q_3_q & redist40_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p9_q_3_q & redist41_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p8_q_3_q & redist42_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p7_q_3_q;

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6(ADD,864)@62 + 1
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_cin <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_c;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q) & '1';
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_b) & rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_cin(0);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_a) + UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_b));
        END IF;
    END PROCESS;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_c(0) <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_o(7);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_q <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_o(6 downto 1);

    -- redist31_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q_4(DELAY,1191)
    redist31_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q, xout => redist31_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q_4_q, clk => clk, aclr => areset );

    -- redist32_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q_4(DELAY,1192)
    redist32_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q, xout => redist32_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q_4_q, clk => clk, aclr => areset );

    -- redist33_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q_4(DELAY,1193)
    redist33_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q, xout => redist33_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q_4_q, clk => clk, aclr => areset );

    -- redist34_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q_4(DELAY,1194)
    redist34_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q, xout => redist34_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q_4_q, clk => clk, aclr => areset );

    -- redist35_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q_4(DELAY,1195)
    redist35_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q, xout => redist35_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q_4_q, clk => clk, aclr => areset );

    -- redist36_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q_4(DELAY,1196)
    redist36_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q, xout => redist36_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q_4_q, clk => clk, aclr => areset );

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_d(BITJOIN,1058)@63
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_d_q <= redist31_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p18_q_4_q & redist32_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p17_q_4_q & redist33_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p16_q_4_q & redist34_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p15_q_4_q & redist35_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p14_q_4_q & redist36_leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p13_q_4_q;

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6(ADD,865)@63 + 1
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_cin <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_c;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_d_q) & '1';
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_c) & rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_cin(0);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_a) + UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_b));
        END IF;
    END PROCESS;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_c(0) <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_o(7);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_q <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_o(6 downto 1);

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e(BITJOIN,1065)@60
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q <= leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p24_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p23_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p22_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p21_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p20_q & leftShiftStage2_uid488_fracPostNormExt_uid190_r_uid7_fpMultAddTest_p19_q;

    -- redist23_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q_4(DELAY,1183)
    redist23_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q, xout => redist23_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q_4_q, clk => clk, aclr => areset );

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6(ADD,866)@64 + 1
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_cin <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_c;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & redist23_rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_e_q_4_q) & '1';
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_d) & rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_cin(0);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_a) + UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_b));
        END IF;
    END PROCESS;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_c(0) <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_o(7);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_q <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_o(6 downto 1);

    -- expPostNorm_uid194_r_uid7_fpMultAddTest_BitExpansion_for_b(BITJOIN,850)@57
    expPostNorm_uid194_r_uid7_fpMultAddTest_BitExpansion_for_b_q <= expOvf_uid78_p_uid6_fpMultAddTest_UpperBits_for_b_q & redist127_r_uid284_lzCountVal_uid187_r_uid7_fpMultAddTest_q_1_q;

    -- expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_b(BITSELECT,853)@57
    expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_b_b <= expPostNorm_uid194_r_uid7_fpMultAddTest_BitExpansion_for_b_q(5 downto 0);

    -- oneCST_uid192_r_uid7_fpMultAddTest(CONSTANT,191)
    oneCST_uid192_r_uid7_fpMultAddTest_q <= "00000001";

    -- expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,1104)
    expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(oneCST_uid192_r_uid7_fpMultAddTest_q(5 downto 0));
    expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(oneCST_uid192_r_uid7_fpMultAddTest_q(7 downto 6));

    -- redist49_aSig_uid118_r_uid7_fpMultAddTest_p4_q_30(DELAY,1209)
    redist49_aSig_uid118_r_uid7_fpMultAddTest_p4_q_30 : dspba_delay
    GENERIC MAP ( width => 6, depth => 18, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist48_aSig_uid118_r_uid7_fpMultAddTest_p4_q_12_q, xout => redist49_aSig_uid118_r_uid7_fpMultAddTest_p4_q_30_q, clk => clk, aclr => areset );

    -- expInc_uid193_r_uid7_fpMultAddTest_p1_of_2(ADD,845)@56 + 1
    expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & redist49_aSig_uid118_r_uid7_fpMultAddTest_p4_q_30_q);
    expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_a) + UNSIGNED(expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_c(0) <= expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_o(6);
    expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_q <= expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_o(5 downto 0);

    -- expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2(SUB,854)@57 + 1
    expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_q);
    expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_b_b);
    expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_a) - UNSIGNED(expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_c(0) <= expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_o(6);
    expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_q <= expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_o(5 downto 0);

    -- redist62_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_q_7(DELAY,1222)
    redist62_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_q_7 : dspba_delay
    GENERIC MAP ( width => 6, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_q, xout => redist62_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_q_7_q, clk => clk, aclr => areset );

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6(ADD,867)@65 + 1
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_cin <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_c;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & redist62_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_q_7_q) & '1';
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_e) & rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_cin(0);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_a) + UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_b));
        END IF;
    END PROCESS;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_c(0) <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_o(7);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_q <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_o(6 downto 1);

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select(BITSELECT,1126)
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_b <= STD_LOGIC_VECTOR(rndExpFrac_uid206_r_uid7_fpMultAddTest_UpperBits_for_b_q(10 downto 5));
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_c <= STD_LOGIC_VECTOR(rndExpFrac_uid206_r_uid7_fpMultAddTest_UpperBits_for_b_q(16 downto 11));
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_d <= STD_LOGIC_VECTOR(rndExpFrac_uid206_r_uid7_fpMultAddTest_UpperBits_for_b_q(22 downto 17));
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_e <= STD_LOGIC_VECTOR(rndExpFrac_uid206_r_uid7_fpMultAddTest_UpperBits_for_b_q(28 downto 23));
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_f <= STD_LOGIC_VECTOR(rndExpFrac_uid206_r_uid7_fpMultAddTest_UpperBits_for_b_q(33 downto 29));

    -- redist63_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_c_7(DELAY,1223)
    redist63_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_c_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_c, xout => redist63_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_c_7_q, clk => clk, aclr => areset );

    -- expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0(BITSELECT,1038)
    expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(expOvf_uid78_p_uid6_fpMultAddTest_UpperBits_for_b_q(4 downto 1));

    -- redist64_expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_c_7(DELAY,1224)
    redist64_expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_c_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_c, xout => redist64_expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_c_7_q, clk => clk, aclr => areset );

    -- expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,1032)@64
    expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q <= GND_q & expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_tessel0_0_merged_bit_select_c;

    -- redist47_aSig_uid118_r_uid7_fpMultAddTest_p5_q_38(DELAY,1207)
    redist47_aSig_uid118_r_uid7_fpMultAddTest_p5_q_38 : dspba_delay
    GENERIC MAP ( width => 2, depth => 26, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist46_aSig_uid118_r_uid7_fpMultAddTest_p5_q_12_q, xout => redist47_aSig_uid118_r_uid7_fpMultAddTest_p5_q_38_q, clk => clk, aclr => areset );

    -- expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,1027)@64
    expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q <= GND_q & redist47_aSig_uid118_r_uid7_fpMultAddTest_p5_q_38_q;

    -- expInc_uid193_r_uid7_fpMultAddTest_p2_of_2(ADD,846)@64 + 1
    expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_cin <= redist64_expInc_uid193_r_uid7_fpMultAddTest_p1_of_2_c_7_q;
    expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q) & '1';
    expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & expInc_uid193_r_uid7_fpMultAddTest_BitSelect_for_b_BitJoin_for_c_q) & expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_cin(0);
    expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_a) + UNSIGNED(expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_q <= expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_o(3 downto 1);

    -- expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,1037)@65
    expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q <= GND_q & expInc_uid193_r_uid7_fpMultAddTest_p2_of_2_q;

    -- expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2(SUB,855)@65 + 1
    expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_cin <= redist63_expPostNorm_uid194_r_uid7_fpMultAddTest_p1_of_2_c_7_q;
    expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_c_q) & '0';
    expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & expPostNorm_uid194_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_b) & expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_cin(0);
    expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_a) - UNSIGNED(expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_q <= expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_o(4 downto 1);

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_g(BITJOIN,1070)@66
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_g_q <= GND_q & expPostNorm_uid194_r_uid7_fpMultAddTest_p2_of_2_q;

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6(ADD,868)@66 + 1
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_cin <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_c;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_a <= STD_LOGIC_VECTOR("0" & rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_a_BitJoin_for_g_q) & '1';
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_b <= STD_LOGIC_VECTOR("0" & rndExpFrac_uid206_r_uid7_fpMultAddTest_BitSelect_for_b_tessel1_0_merged_bit_select_f) & rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_cin(0);
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_a) + UNSIGNED(rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_b));
        END IF;
    END PROCESS;
    rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_q <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_o(5 downto 1);

    -- redist57_rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_q_1(DELAY,1217)
    redist57_rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_q, xout => redist57_rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_q_1_q, clk => clk, aclr => areset );

    -- redist58_rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_q_2(DELAY,1218)
    redist58_rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_q, xout => redist58_rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_q_2_q, clk => clk, aclr => areset );

    -- redist59_rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_q_3(DELAY,1219)
    redist59_rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_q, xout => redist59_rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_q_3_q, clk => clk, aclr => areset );

    -- redist60_rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_q_4(DELAY,1220)
    redist60_rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_q, xout => redist60_rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_q_4_q, clk => clk, aclr => areset );

    -- redist61_rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_q_5(DELAY,1221)
    redist61_rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_q_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_q, xout => redist61_rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_q_5_q, clk => clk, aclr => areset );

    -- rndExpFrac_uid206_r_uid7_fpMultAddTest_BitJoin_for_q(BITJOIN,869)@67
    rndExpFrac_uid206_r_uid7_fpMultAddTest_BitJoin_for_q_q <= rndExpFrac_uid206_r_uid7_fpMultAddTest_p6_of_6_q & redist57_rndExpFrac_uid206_r_uid7_fpMultAddTest_p5_of_6_q_1_q & redist58_rndExpFrac_uid206_r_uid7_fpMultAddTest_p4_of_6_q_2_q & redist59_rndExpFrac_uid206_r_uid7_fpMultAddTest_p3_of_6_q_3_q & redist60_rndExpFrac_uid206_r_uid7_fpMultAddTest_p2_of_6_q_4_q & redist61_rndExpFrac_uid206_r_uid7_fpMultAddTest_p1_of_6_q_5_q;

    -- expRPreExc_uid219_r_uid7_fpMultAddTest(BITSELECT,218)@67
    expRPreExc_uid219_r_uid7_fpMultAddTest_in <= rndExpFrac_uid206_r_uid7_fpMultAddTest_BitJoin_for_q_q(31 downto 0);
    expRPreExc_uid219_r_uid7_fpMultAddTest_b <= expRPreExc_uid219_r_uid7_fpMultAddTest_in(31 downto 24);

    -- redist136_expRPreExc_uid219_r_uid7_fpMultAddTest_b_7(DELAY,1296)
    redist136_expRPreExc_uid219_r_uid7_fpMultAddTest_b_7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid219_r_uid7_fpMultAddTest_b, xout => redist136_expRPreExc_uid219_r_uid7_fpMultAddTest_b_7_q, clk => clk, aclr => areset );

    -- rndExpFracOvfBits_uid211_r_uid7_fpMultAddTest(BITSELECT,210)@67
    rndExpFracOvfBits_uid211_r_uid7_fpMultAddTest_in <= rndExpFrac_uid206_r_uid7_fpMultAddTest_BitJoin_for_q_q(33 downto 0);
    rndExpFracOvfBits_uid211_r_uid7_fpMultAddTest_b <= rndExpFracOvfBits_uid211_r_uid7_fpMultAddTest_in(33 downto 32);

    -- rOvfExtraBits_uid212_r_uid7_fpMultAddTest(LOGICAL,211)@67 + 1
    rOvfExtraBits_uid212_r_uid7_fpMultAddTest_qi <= "1" WHEN rndExpFracOvfBits_uid211_r_uid7_fpMultAddTest_b = zocst_uid178_r_uid7_fpMultAddTest_q ELSE "0";
    rOvfExtraBits_uid212_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rOvfExtraBits_uid212_r_uid7_fpMultAddTest_qi, xout => rOvfExtraBits_uid212_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist139_rOvfExtraBits_uid212_r_uid7_fpMultAddTest_q_3(DELAY,1299)
    redist139_rOvfExtraBits_uid212_r_uid7_fpMultAddTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rOvfExtraBits_uid212_r_uid7_fpMultAddTest_q, xout => redist139_rOvfExtraBits_uid212_r_uid7_fpMultAddTest_q_3_q, clk => clk, aclr => areset );

    -- wEP2AllOwE_uid207_r_uid7_fpMultAddTest(CONSTANT,206)
    wEP2AllOwE_uid207_r_uid7_fpMultAddTest_q <= "0011111111";

    -- c0_uid491_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1105)
    c0_uid491_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b <= wEP2AllOwE_uid207_r_uid7_fpMultAddTest_q(5 downto 0);
    c0_uid491_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c <= wEP2AllOwE_uid207_r_uid7_fpMultAddTest_q(9 downto 6);

    -- rndExp_uid208_r_uid7_fpMultAddTest(BITSELECT,207)@67
    rndExp_uid208_r_uid7_fpMultAddTest_in <= rndExpFrac_uid206_r_uid7_fpMultAddTest_BitJoin_for_q_q(33 downto 0);
    rndExp_uid208_r_uid7_fpMultAddTest_b <= rndExp_uid208_r_uid7_fpMultAddTest_in(33 downto 24);

    -- z0_uid490_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1106)@67
    z0_uid490_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b <= rndExp_uid208_r_uid7_fpMultAddTest_b(5 downto 0);
    z0_uid490_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c <= rndExp_uid208_r_uid7_fpMultAddTest_b(9 downto 6);

    -- eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest(LOGICAL,494)@67 + 1
    eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi <= "1" WHEN z0_uid490_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c = c0_uid491_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi, xout => eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist101_eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q_2(DELAY,1261)
    redist101_eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q, xout => redist101_eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- y0_uid704_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1152)
    y0_uid704_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b <= c0_uid491_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    y0_uid704_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c <= c0_uid491_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- x0_uid703_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1153)@67
    x0_uid703_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b <= z0_uid490_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    x0_uid703_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c <= z0_uid490_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid708_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest(LOGICAL,707)@67 + 1
    eq1_uid708_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid703_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid704_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid708_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid708_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi, xout => eq1_uid708_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid705_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest(LOGICAL,704)@67 + 1
    eq0_uid705_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid703_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid704_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid705_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid705_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi, xout => eq0_uid705_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid709_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest(LOGICAL,708)@68 + 1
    andEq_uid709_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi <= eq0_uid705_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q and eq1_uid708_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q;
    andEq_uid709_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid709_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi, xout => andEq_uid709_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid496_rOvfEQMax_uid209_r_uid7_fpMultAddTest(LOGICAL,495)@69 + 1
    and_lev0_uid496_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi <= andEq_uid709_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q and redist101_eq1_uid495_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q_2_q;
    and_lev0_uid496_rOvfEQMax_uid209_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid496_rOvfEQMax_uid209_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid496_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- rOvf_uid213_r_uid7_fpMultAddTest(LOGICAL,212)@70 + 1
    rOvf_uid213_r_uid7_fpMultAddTest_qi <= and_lev0_uid496_rOvfEQMax_uid209_r_uid7_fpMultAddTest_q or redist139_rOvfExtraBits_uid212_r_uid7_fpMultAddTest_q_3_q;
    rOvf_uid213_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rOvf_uid213_r_uid7_fpMultAddTest_qi, xout => rOvf_uid213_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- regInputs_uid220_r_uid7_fpMultAddTest(LOGICAL,219)@58 + 1
    regInputs_uid220_r_uid7_fpMultAddTest_qi <= excR_aSig_uid133_r_uid7_fpMultAddTest_q and excR_bSig_uid147_r_uid7_fpMultAddTest_q;
    regInputs_uid220_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid220_r_uid7_fpMultAddTest_qi, xout => regInputs_uid220_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist135_regInputs_uid220_r_uid7_fpMultAddTest_q_13(DELAY,1295)
    redist135_regInputs_uid220_r_uid7_fpMultAddTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid220_r_uid7_fpMultAddTest_q, xout => redist135_regInputs_uid220_r_uid7_fpMultAddTest_q_13_q, clk => clk, aclr => areset );

    -- rInfOvf_uid223_r_uid7_fpMultAddTest(LOGICAL,222)@71
    rInfOvf_uid223_r_uid7_fpMultAddTest_q <= redist135_regInputs_uid220_r_uid7_fpMultAddTest_q_13_q and rOvf_uid213_r_uid7_fpMultAddTest_q;

    -- excRInfVInC_uid224_r_uid7_fpMultAddTest(BITJOIN,223)@71
    excRInfVInC_uid224_r_uid7_fpMultAddTest_q <= rInfOvf_uid223_r_uid7_fpMultAddTest_q & redist149_excN_bSig_uid144_r_uid7_fpMultAddTest_q_14_q & redist152_excN_aSig_uid130_r_uid7_fpMultAddTest_q_14_q & redist150_excI_bSig_uid143_r_uid7_fpMultAddTest_q_14_q & redist153_excI_aSig_uid129_r_uid7_fpMultAddTest_q_14_q & redist144_effSub_uid154_r_uid7_fpMultAddTest_q_33_q;

    -- redist133_excRInfVInC_uid224_r_uid7_fpMultAddTest_q_1(DELAY,1293)
    redist133_excRInfVInC_uid224_r_uid7_fpMultAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInfVInC_uid224_r_uid7_fpMultAddTest_q, xout => redist133_excRInfVInC_uid224_r_uid7_fpMultAddTest_q_1_q, clk => clk, aclr => areset );

    -- excRInf_uid225_r_uid7_fpMultAddTest(LOOKUP,224)@72 + 1
    excRInf_uid225_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (redist133_excRInfVInC_uid224_r_uid7_fpMultAddTest_q_1_q) IS
                WHEN "000000" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "000001" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "000010" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "1";
                WHEN "000011" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "1";
                WHEN "000100" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "1";
                WHEN "000101" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "1";
                WHEN "000110" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "1";
                WHEN "000111" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "001000" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "001001" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "001010" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "001011" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "001100" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "001101" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "001110" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "001111" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "010000" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "010001" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "010010" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "010011" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "010100" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "010101" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "010110" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "010111" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "011000" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "011001" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "011010" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "011011" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "011100" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "011101" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "011110" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "011111" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "100000" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "1";
                WHEN "100001" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "100010" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "100011" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "100100" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "100101" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "100110" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "100111" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "101000" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "101001" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "101010" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "101011" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "101100" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "101101" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "101110" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "101111" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "110000" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "110001" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "110010" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "110011" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "110100" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "110101" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "110110" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "110111" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "111000" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "111001" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "111010" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "111011" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "111100" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "111101" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "111110" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN "111111" => excRInf_uid225_r_uid7_fpMultAddTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRInf_uid225_r_uid7_fpMultAddTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist140_aMinusA_uid189_r_uid7_fpMultAddTest_q_14(DELAY,1300)
    redist140_aMinusA_uid189_r_uid7_fpMultAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid189_r_uid7_fpMultAddTest_q, xout => redist140_aMinusA_uid189_r_uid7_fpMultAddTest_q_14_q, clk => clk, aclr => areset );

    -- rUdfExtraBit_uid216_r_uid7_fpMultAddTest(BITSELECT,215)@67
    rUdfExtraBit_uid216_r_uid7_fpMultAddTest_in <= STD_LOGIC_VECTOR(rndExpFrac_uid206_r_uid7_fpMultAddTest_BitJoin_for_q_q(33 downto 0));
    rUdfExtraBit_uid216_r_uid7_fpMultAddTest_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid216_r_uid7_fpMultAddTest_in(33 downto 33));

    -- redist138_rUdfExtraBit_uid216_r_uid7_fpMultAddTest_b_3(DELAY,1298)
    redist138_rUdfExtraBit_uid216_r_uid7_fpMultAddTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rUdfExtraBit_uid216_r_uid7_fpMultAddTest_b, xout => redist138_rUdfExtraBit_uid216_r_uid7_fpMultAddTest_b_3_q, clk => clk, aclr => areset );

    -- c0_uid498_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1107)
    c0_uid498_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_b <= wEP2AllZ_uid214_r_uid7_fpMultAddTest_q(5 downto 0);
    c0_uid498_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_c <= wEP2AllZ_uid214_r_uid7_fpMultAddTest_q(9 downto 6);

    -- eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest(LOGICAL,501)@67 + 1
    eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi <= "1" WHEN z0_uid490_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c = c0_uid498_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi, xout => eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist100_eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q_2(DELAY,1260)
    redist100_eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q, xout => redist100_eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- y0_uid711_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select(BITSELECT,1154)
    y0_uid711_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_b <= c0_uid498_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_b(2 downto 0);
    y0_uid711_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_c <= c0_uid498_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid715_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest(LOGICAL,714)@67 + 1
    eq1_uid715_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid703_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_c = y0_uid711_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_c ELSE "0";
    eq1_uid715_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid715_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi, xout => eq1_uid715_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- eq0_uid712_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest(LOGICAL,711)@67 + 1
    eq0_uid712_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi <= "1" WHEN x0_uid703_eq0_uid492_rOvfEQMax_uid209_r_uid7_fpMultAddTest_merged_bit_select_b = y0_uid711_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_merged_bit_select_b ELSE "0";
    eq0_uid712_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid712_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi, xout => eq0_uid712_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- andEq_uid716_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest(LOGICAL,715)@68 + 1
    andEq_uid716_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi <= eq0_uid712_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q and eq1_uid715_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q;
    andEq_uid716_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid716_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi, xout => andEq_uid716_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid503_rUdfEQMin_uid215_r_uid7_fpMultAddTest(LOGICAL,502)@69 + 1
    and_lev0_uid503_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi <= andEq_uid716_eq0_uid499_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q and redist100_eq1_uid502_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q_2_q;
    and_lev0_uid503_rUdfEQMin_uid215_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid503_rUdfEQMin_uid215_r_uid7_fpMultAddTest_qi, xout => and_lev0_uid503_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- rUdf_uid217_r_uid7_fpMultAddTest(LOGICAL,216)@70 + 1
    rUdf_uid217_r_uid7_fpMultAddTest_qi <= and_lev0_uid503_rUdfEQMin_uid215_r_uid7_fpMultAddTest_q or redist138_rUdfExtraBit_uid216_r_uid7_fpMultAddTest_b_3_q;
    rUdf_uid217_r_uid7_fpMultAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rUdf_uid217_r_uid7_fpMultAddTest_qi, xout => rUdf_uid217_r_uid7_fpMultAddTest_q, clk => clk, aclr => areset );

    -- redist108_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_42(DELAY,1268)
    redist108_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_42 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist107_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_29_q, xout => redist108_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_42_q, clk => clk, aclr => areset );

    -- redist114_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_31(DELAY,1274)
    redist114_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_31 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist113_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_18_q, xout => redist114_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_31_q, clk => clk, aclr => areset );

    -- excRZeroVInC_uid221_r_uid7_fpMultAddTest(BITJOIN,220)@71
    excRZeroVInC_uid221_r_uid7_fpMultAddTest_q <= redist140_aMinusA_uid189_r_uid7_fpMultAddTest_q_14_q & rUdf_uid217_r_uid7_fpMultAddTest_q & redist135_regInputs_uid220_r_uid7_fpMultAddTest_q_13_q & redist108_and_lev0_uid386_excZ_bSig_uid119_uid139_r_uid7_fpMultAddTest_q_42_q & redist114_and_lev0_uid359_excZ_aSig_uid118_uid125_r_uid7_fpMultAddTest_q_31_q;

    -- excRZero_uid222_r_uid7_fpMultAddTest(LOOKUP,221)@71 + 1
    excRZero_uid222_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRZeroVInC_uid221_r_uid7_fpMultAddTest_q) IS
                WHEN "00000" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "00001" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "00010" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "00011" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "1";
                WHEN "00100" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "00101" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "00110" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "00111" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "01000" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "01001" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "01010" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "01011" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "1";
                WHEN "01100" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "1";
                WHEN "01101" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "01110" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "01111" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "10000" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "10001" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "10010" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "10011" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "1";
                WHEN "10100" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "1";
                WHEN "10101" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "10110" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "10111" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "11000" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "11001" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "11010" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "11011" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "1";
                WHEN "11100" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "1";
                WHEN "11101" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "11110" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN "11111" => excRZero_uid222_r_uid7_fpMultAddTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRZero_uid222_r_uid7_fpMultAddTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist134_excRZero_uid222_r_uid7_fpMultAddTest_q_2(DELAY,1294)
    redist134_excRZero_uid222_r_uid7_fpMultAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid222_r_uid7_fpMultAddTest_q, xout => redist134_excRZero_uid222_r_uid7_fpMultAddTest_q_2_q, clk => clk, aclr => areset );

    -- concExc_uid229_r_uid7_fpMultAddTest(BITJOIN,228)@73
    concExc_uid229_r_uid7_fpMultAddTest_q <= excRNaN_uid228_r_uid7_fpMultAddTest_q & excRInf_uid225_r_uid7_fpMultAddTest_q & redist134_excRZero_uid222_r_uid7_fpMultAddTest_q_2_q;

    -- excREnc_uid230_r_uid7_fpMultAddTest(LOOKUP,229)@73 + 1
    excREnc_uid230_r_uid7_fpMultAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid230_r_uid7_fpMultAddTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid229_r_uid7_fpMultAddTest_q) IS
                WHEN "000" => excREnc_uid230_r_uid7_fpMultAddTest_q <= "01";
                WHEN "001" => excREnc_uid230_r_uid7_fpMultAddTest_q <= "00";
                WHEN "010" => excREnc_uid230_r_uid7_fpMultAddTest_q <= "10";
                WHEN "011" => excREnc_uid230_r_uid7_fpMultAddTest_q <= "10";
                WHEN "100" => excREnc_uid230_r_uid7_fpMultAddTest_q <= "11";
                WHEN "101" => excREnc_uid230_r_uid7_fpMultAddTest_q <= "11";
                WHEN "110" => excREnc_uid230_r_uid7_fpMultAddTest_q <= "11";
                WHEN "111" => excREnc_uid230_r_uid7_fpMultAddTest_q <= "11";
                WHEN OTHERS => -- unreachable
                               excREnc_uid230_r_uid7_fpMultAddTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExc_uid249_r_uid7_fpMultAddTest(MUX,248)@74
    expRPostExc_uid249_r_uid7_fpMultAddTest_s <= excREnc_uid230_r_uid7_fpMultAddTest_q;
    expRPostExc_uid249_r_uid7_fpMultAddTest_combproc: PROCESS (expRPostExc_uid249_r_uid7_fpMultAddTest_s, cstAllZWE_uid15_p_uid6_fpMultAddTest_q, redist136_expRPreExc_uid219_r_uid7_fpMultAddTest_b_7_q, cstAllOWE_uid13_p_uid6_fpMultAddTest_q)
    BEGIN
        CASE (expRPostExc_uid249_r_uid7_fpMultAddTest_s) IS
            WHEN "00" => expRPostExc_uid249_r_uid7_fpMultAddTest_q <= cstAllZWE_uid15_p_uid6_fpMultAddTest_q;
            WHEN "01" => expRPostExc_uid249_r_uid7_fpMultAddTest_q <= redist136_expRPreExc_uid219_r_uid7_fpMultAddTest_b_7_q;
            WHEN "10" => expRPostExc_uid249_r_uid7_fpMultAddTest_q <= cstAllOWE_uid13_p_uid6_fpMultAddTest_q;
            WHEN "11" => expRPostExc_uid249_r_uid7_fpMultAddTest_q <= cstAllOWE_uid13_p_uid6_fpMultAddTest_q;
            WHEN OTHERS => expRPostExc_uid249_r_uid7_fpMultAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid218_r_uid7_fpMultAddTest(BITSELECT,217)@67
    fracRPreExc_uid218_r_uid7_fpMultAddTest_in <= rndExpFrac_uid206_r_uid7_fpMultAddTest_BitJoin_for_q_q(23 downto 0);
    fracRPreExc_uid218_r_uid7_fpMultAddTest_b <= fracRPreExc_uid218_r_uid7_fpMultAddTest_in(23 downto 1);

    -- redist137_fracRPreExc_uid218_r_uid7_fpMultAddTest_b_7(DELAY,1297)
    redist137_fracRPreExc_uid218_r_uid7_fpMultAddTest_b_7 : dspba_delay
    GENERIC MAP ( width => 23, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid218_r_uid7_fpMultAddTest_b, xout => redist137_fracRPreExc_uid218_r_uid7_fpMultAddTest_b_7_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid245_r_uid7_fpMultAddTest(MUX,244)@74
    fracRPostExc_uid245_r_uid7_fpMultAddTest_s <= excREnc_uid230_r_uid7_fpMultAddTest_q;
    fracRPostExc_uid245_r_uid7_fpMultAddTest_combproc: PROCESS (fracRPostExc_uid245_r_uid7_fpMultAddTest_s, cstZeroWF_uid14_p_uid6_fpMultAddTest_q, redist137_fracRPreExc_uid218_r_uid7_fpMultAddTest_b_7_q, oneFracRPostExc2_uid95_p_uid6_fpMultAddTest_q)
    BEGIN
        CASE (fracRPostExc_uid245_r_uid7_fpMultAddTest_s) IS
            WHEN "00" => fracRPostExc_uid245_r_uid7_fpMultAddTest_q <= cstZeroWF_uid14_p_uid6_fpMultAddTest_q;
            WHEN "01" => fracRPostExc_uid245_r_uid7_fpMultAddTest_q <= redist137_fracRPreExc_uid218_r_uid7_fpMultAddTest_b_7_q;
            WHEN "10" => fracRPostExc_uid245_r_uid7_fpMultAddTest_q <= cstZeroWF_uid14_p_uid6_fpMultAddTest_q;
            WHEN "11" => fracRPostExc_uid245_r_uid7_fpMultAddTest_q <= oneFracRPostExc2_uid95_p_uid6_fpMultAddTest_q;
            WHEN OTHERS => fracRPostExc_uid245_r_uid7_fpMultAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid250_r_uid7_fpMultAddTest(BITJOIN,249)@74
    R_uid250_r_uid7_fpMultAddTest_q <= signRPostExc_uid241_r_uid7_fpMultAddTest_q & expRPostExc_uid249_r_uid7_fpMultAddTest_q & fracRPostExc_uid245_r_uid7_fpMultAddTest_q;

    -- xOut(GPOUT,4)@74
    q <= R_uid250_r_uid7_fpMultAddTest_q;

END normal;
