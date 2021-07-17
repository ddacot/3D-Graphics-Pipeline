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

-- VHDL created from altfp_addsub_0002
-- VHDL created on Mon Apr 13 22:32:26 2020


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

entity altfp_addsub_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        s : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end altfp_addsub_0002;

architecture normal of altfp_addsub_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid7_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal siga_uid9_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal siga_uid9_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sigb_uid10_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sigb_uid10_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid11_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid12_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid13_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_siga_uid14_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_siga_uid14_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_siga_uid15_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_siga_uid15_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid19_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_siga_uid20_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_siga_uid20_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_siga_uid21_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_siga_uid21_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid22_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid22_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid23_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_siga_uid24_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_siga_uid24_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_sigb_uid28_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_sigb_uid28_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_sigb_uid29_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_sigb_uid29_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid33_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_sigb_uid34_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_sigb_uid34_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_sigb_uid35_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_sigb_uid35_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid36_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid37_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_sigb_uid38_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_sigb_uid38_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid43_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid44_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid45_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid45_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cWFP1_uid49_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftOutConst_uid52_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expAmExpBShiftRange_uid53_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expAmExpBShiftRange_uid53_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftValue_uid54_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValue_uid54_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal oFracB_uid56_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracA_uid57_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal padConst_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightPaddedIn_uid60_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal sticky_uid65_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracB_uid67_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal zv_uid68_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracAOp_uid69_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBOp_uid70_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal fracResSubNoSignExt_uid73_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal fracResSubNoSignExt_uid73_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracResAddNoSignExt_uid74_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal fracResAddNoSignExt_uid74_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal cAmA_uid79_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aMinusA_uid80_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMinusA_uid80_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_sub_uid93_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_sub_uid94_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_sub_uid95_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_sub_uid95_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_sub_uid96_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_add_uid103_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_add_uid105_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_add_uid105_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_add_uid106_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllOwE_uid108_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExp_uid109_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid109_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPreExcAdd_uid116_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcAdd_uid116_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcAdd_uid117_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExcAdd_uid117_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid119_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid119_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid120_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRZeroAdd_uid121_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroSub_uid122_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regInAndOvf_uid123_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsInf_uid124_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsInf_uid124_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsInfOrZero_uid125_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsInfOrZero_uid125_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addIsAlsoInf_uid126_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal addIsAlsoInf_uid126_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid127_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInfAdd_uid128_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfAddFull_uid129_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfAddFull_uid129_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfSub_uid130_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfSubFull_uid131_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfSubFull_uid131_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infMinf_uid132_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal infMinf_uid132_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaNA_uid133_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaNA_uid133_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invEffSub_uid134_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infPinfForSub_uid135_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal infPinfForSub_uid135_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaNS_uid136_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaNS_uid136_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExcSub_uid137_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal concExcAdd_uid138_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREncSub_uid139_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal excREncAdd_uid140_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPreExcAddition_uid141_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExcAddition_uid141_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcAddition_uid142_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPreExcAddition_uid142_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracRPreExcSubtraction_uid143_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcSubtraction_uid144_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPreExcSubtraction_uid144_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal oneFracRPostExc2_uid145_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExcAdd_uid148_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExcAdd_uid148_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExcAdd_uid152_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExcAdd_uid152_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invSigA_uid154_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signInputsZeroSwap_uid155_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signInputsZeroSwap_uid155_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignInputsZeroSwap_uid156_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSigB_uid157_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signInputsZeroNoSwap_uid158_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signInputsZeroNoSwap_uid158_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aMa_uid160_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMa_uid160_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invAMA_uid161_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaNA_uid162_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid163_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid163_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal RSum_uid164_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fracRPostExcSub_uid168_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExcSub_uid168_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExcSub_uid172_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExcSub_uid172_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal positiveExc_uid173_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal positiveExc_uid173_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invPositiveExc_uid174_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signInputsZeroForSub_uid175_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signInputsZeroForSub_uid175_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignInputsZeroForSub_uid176_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid177_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSigY_uid178_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yGTxYPos_uid180_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yGTxYPos_uid180_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigX_uid181_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTyXNeg_uid182_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTyXNeg_uid182_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExcSub0_uid183_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExcSub0_uid183_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaNS_uid184_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExcSub_uid185_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExcSub_uid185_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal RDiff_uid186_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid225_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid307_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage0Idx1_uid309_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng16_uid310_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid312_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng24_uid313_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx3Pad24_uid314_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3_uid315_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng2_uid318_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx1_uid320_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng4_uid321_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx2_uid323_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng6_uid324_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx3Pad6_uid325_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3_uid326_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx1Rng1_uid329_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid347_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0Idx1Rng8_uid351_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1Rng8_uid351_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1_uid352_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2_uid355_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Rng24_uid357_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3Rng24_uid357_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3_uid358_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng2_uid362_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1Rng2_uid362_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1_uid363_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng4_uid365_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2Rng4_uid365_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2_uid366_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Rng6_uid368_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3Rng6_uid368_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3_uid369_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage2Idx1Rng1_uid373_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1Rng1_uid373_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx1Rng8_uid381_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1Rng8_uid381_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1_uid382_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2_uid385_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Rng24_uid387_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3Rng24_uid387_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3_uid388_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng2_uid392_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1Rng2_uid392_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1_uid393_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng4_uid395_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2Rng4_uid395_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2_uid396_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Rng6_uid398_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3Rng6_uid398_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3_uid399_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage2Idx1Rng1_uid403_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1Rng1_uid403_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal eq1_uid413_rOvf_uid110_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid413_rOvf_uid110_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid414_rOvf_uid110_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid414_rOvf_uid110_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid451_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid451_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid454_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid454_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid455_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid455_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid458_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid458_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid461_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid461_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid462_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid462_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid465_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid465_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid468_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid468_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid469_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid469_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid472_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid472_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid475_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid475_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid476_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid476_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid479_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid479_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid482_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid482_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid483_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid483_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid486_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid486_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid489_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid489_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid490_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid490_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid493_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid493_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid496_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid496_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid497_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid497_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid500_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid500_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid503_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid503_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid504_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid504_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid507_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid507_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid510_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid510_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid511_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid511_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid514_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid514_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid517_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid517_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid518_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid518_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid521_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid521_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid524_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid524_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid525_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid525_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid528_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid528_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid531_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid531_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid532_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid532_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid535_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid535_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid538_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid538_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid539_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid539_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid542_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid542_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid545_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid545_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid546_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid546_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid549_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid549_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid552_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid552_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid553_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid553_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid556_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid556_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid559_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid559_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid560_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid560_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid563_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid563_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid566_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid566_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid567_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid567_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid570_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid570_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid573_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid573_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid574_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid574_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid577_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid577_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid580_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid580_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid581_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid581_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid584_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid584_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid587_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid587_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid588_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid588_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_d : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_e : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_f : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_g : STD_LOGIC_VECTOR (1 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_d : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_e : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (5 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_g : STD_LOGIC_VECTOR (1 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p6_of_6_a : STD_LOGIC_VECTOR (3 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p6_of_6_b : STD_LOGIC_VECTOR (3 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p6_of_6_o : STD_LOGIC_VECTOR (3 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_UpperBits_for_a_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (29 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (29 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_d : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_e : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_f : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p1_of_5_a : STD_LOGIC_VECTOR (6 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p1_of_5_b : STD_LOGIC_VECTOR (6 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p1_of_5_o : STD_LOGIC_VECTOR (6 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p1_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p1_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p2_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p2_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p2_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p2_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p2_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p2_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p3_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p3_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p3_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p3_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p3_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p3_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p4_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p4_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p4_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p4_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p4_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p4_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p5_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p5_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p5_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p5_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_p5_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (29 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_a : STD_LOGIC_VECTOR (6 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_b : STD_LOGIC_VECTOR (6 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_o : STD_LOGIC_VECTOR (6 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_a : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_o : STD_LOGIC_VECTOR (7 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (29 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b_q : STD_LOGIC_VECTOR (33 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (34 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_UpperBits_for_a_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_p2_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_p2_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_p2_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_d : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_e : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_g : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_h : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_i : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_j : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_k : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_l : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_m : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_o : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_p : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_r : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_d : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_e : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_f : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_g : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_h : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_i : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_j : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_k : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_l : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_m : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_o : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_p : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_r : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_d : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_e : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_g : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_h : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_i : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_j : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_k : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_l : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_m : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_n : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_o : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_p : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_r : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_t : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_u : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_v : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_w : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_x : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_y : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_z : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_d : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_e : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_f : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_g : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_h : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_i : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_j : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_k : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_l : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_m : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_n : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_o : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_p : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_r : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_t : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_u : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_v : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_w : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_x : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_y : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_z : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_d : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_e : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_f : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_g : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_h : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_i : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_j : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_k : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_l : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_m : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_n : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_o : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_p : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_r : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_t : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_u : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_v : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_w : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_x : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_y : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_z : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_d : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_e : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_f : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_g : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_h : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_i : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_j : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_k : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_l : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_m : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_n : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_o : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_p : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_r : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_t : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_u : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_v : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_w : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_x : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_y : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_z : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (27 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (2 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_e_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_f_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_g_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_g_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (4 downto 0);
    signal c0_uid259_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid259_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid251_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid251_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal z0_uid278_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid278_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (4 downto 0);
    signal c0_uid409_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid409_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid408_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid408_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal x0_uid561_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid561_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid582_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid582_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_f : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_in : STD_LOGIC_VECTOR (4 downto 0);
    signal Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_f : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_in : STD_LOGIC_VECTOR (4 downto 0);
    signal sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_f : STD_LOGIC_VECTOR (0 downto 0);
    signal y0_uid457_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid457_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid449_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid449_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid463_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid463_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid470_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid470_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid477_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid477_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid484_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid484_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid498_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid498_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid505_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid505_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid512_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid512_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid519_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid519_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid526_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid526_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid533_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid533_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid541_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid541_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid540_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid540_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid548_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid548_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid555_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid555_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid547_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid547_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid554_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid554_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal z0_uid425_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid425_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal x0_uid568_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid568_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid575_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid575_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal z0_uid442_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid442_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist1_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist2_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist9_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist10_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist14_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist17_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist19_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist22_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist23_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist24_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist25_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist26_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist27_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist28_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_tessel2_0_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist30_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q_7_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist41_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q_5_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist46_rUdf_uid112_fpFusedAddSubTest_p2_of_2_c_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist48_expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist49_expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist50_expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist51_expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_q_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist52_expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist53_expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist54_expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist55_expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist56_expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_q_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist57_expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist58_fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist59_fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist60_fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist61_fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist63_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist64_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_d_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist65_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_e_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist66_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_f_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist67_fracResSub_uid71_fpFusedAddSubTest_p4_of_5_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist68_fracResSub_uid71_fpFusedAddSubTest_p3_of_5_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist69_fracResSub_uid71_fpFusedAddSubTest_p2_of_5_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist70_fracResSub_uid71_fpFusedAddSubTest_p1_of_5_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist76_expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist77_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist78_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist79_xGTEy_uid8_fpFusedAddSubTest_cout_n_q_39_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c_39_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist81_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist82_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_d_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist83_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_e_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist84_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_f_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist85_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_g_5_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist86_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist87_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_d_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist88_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_e_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist89_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_f_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist90_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_g_5_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist91_and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist95_and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist97_and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist98_eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_eq1_uid413_rOvf_uid110_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist100_eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist101_and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q_30_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist103_and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q_34_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist104_eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist105_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist106_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_36_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist107_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_37_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist108_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_38_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist109_eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist110_and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q_24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist111_eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist112_eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist113_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist114_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist115_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist116_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist117_eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist118_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist119_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_8_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist120_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist121_vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_b_9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist122_rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist123_r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q_7_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist124_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist125_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist126_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist127_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist128_rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist129_signRPostExcSub_uid185_fpFusedAddSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist130_signRPostExcSub0_uid183_fpFusedAddSubTest_q_39_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist131_signRPostExc_uid163_fpFusedAddSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist132_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist133_fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist134_expRPreExcAddition_uid142_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist135_fracRPreExcAddition_uid141_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist136_excRNaNS_uid136_fpFusedAddSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist137_excRNaNA_uid133_fpFusedAddSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist138_excRInfVInC_uid127_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist139_oneIsInfOrZero_uid125_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist140_excRZeroSub_uid122_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist141_excRZeroAdd_uid121_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist142_expRPreExcAdd_uid117_fpFusedAddSubTest_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist143_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist144_aMinusA_uid80_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist145_aMinusA_uid80_fpFusedAddSubTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist146_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist147_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_12_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist148_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist149_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_12_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist150_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist151_effSub_uid45_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist152_effSub_uid45_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist153_sigB_uid44_fpFusedAddSubTest_b_36_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist154_sigB_uid44_fpFusedAddSubTest_b_38_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist155_sigA_uid43_fpFusedAddSubTest_b_37_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist156_sigA_uid43_fpFusedAddSubTest_b_39_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist157_sigA_uid43_fpFusedAddSubTest_b_40_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist158_excR_sigb_uid38_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist159_InvExpXIsZero_uid37_fpFusedAddSubTest_q_32_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist160_excN_sigb_uid35_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist161_excI_sigb_uid34_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist162_frac_sigb_uid29_fpFusedAddSubTest_b_4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist163_excR_siga_uid24_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist164_excN_siga_uid21_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist165_excI_siga_uid20_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist166_frac_siga_uid15_fpFusedAddSubTest_b_11_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist167_exp_siga_uid14_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist168_exp_siga_uid14_fpFusedAddSubTest_b_34_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist169_xIn_a_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist170_xIn_b_6_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist170_xIn_b_6(DELAY,1180)
    redist170_xIn_b_6 : dspba_delay
    GENERIC MAP ( width => 32, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => b, xout => redist170_xIn_b_6_q, clk => clk, aclr => areset );

    -- redist169_xIn_a_6(DELAY,1179)
    redist169_xIn_a_6 : dspba_delay
    GENERIC MAP ( width => 32, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => a, xout => redist169_xIn_a_6_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpFusedAddSubTest(BITSELECT,6)@0
    expFracY_uid7_fpFusedAddSubTest_b <= b(30 downto 0);

    -- xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_b(BITJOIN,590)@0
    xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_b_q <= GND_q & expFracY_uid7_fpFusedAddSubTest_b;

    -- xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,593)@0
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_b <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_b_q(5 downto 0);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_c <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_b_q(11 downto 6);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_d <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_b_q(17 downto 12);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_e <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_b_q(23 downto 18);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_f <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_b_q(29 downto 24);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_g <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_b_q(31 downto 30);

    -- expFracX_uid6_fpFusedAddSubTest(BITSELECT,5)@0
    expFracX_uid6_fpFusedAddSubTest_b <= a(30 downto 0);

    -- xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_a(BITJOIN,588)@0
    xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_a_q <= GND_q & expFracX_uid6_fpFusedAddSubTest_b;

    -- xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a(BITSELECT,592)@0
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_b <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_a_q(5 downto 0);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_c <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_a_q(11 downto 6);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_d <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_a_q(17 downto 12);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_e <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_a_q(23 downto 18);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_f <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_a_q(29 downto 24);
    xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_g <= xGTEy_uid8_fpFusedAddSubTest_BitExpansion_for_a_q(31 downto 30);

    -- xGTEy_uid8_fpFusedAddSubTest_p1_of_6(COMPARE,594)@0 + 1
    xGTEy_uid8_fpFusedAddSubTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_b);
    xGTEy_uid8_fpFusedAddSubTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_b);
    xGTEy_uid8_fpFusedAddSubTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p1_of_6_a) - UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p1_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid8_fpFusedAddSubTest_p1_of_6_c(0) <= xGTEy_uid8_fpFusedAddSubTest_p1_of_6_o(6);

    -- redist81_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_c_1(DELAY,1091)
    redist81_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_c, xout => redist81_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_c_1_q, clk => clk, aclr => areset );

    -- redist86_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_c_1(DELAY,1096)
    redist86_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_c, xout => redist86_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_c_1_q, clk => clk, aclr => areset );

    -- xGTEy_uid8_fpFusedAddSubTest_p2_of_6(COMPARE,595)@1 + 1
    xGTEy_uid8_fpFusedAddSubTest_p2_of_6_cin <= xGTEy_uid8_fpFusedAddSubTest_p1_of_6_c;
    xGTEy_uid8_fpFusedAddSubTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & redist86_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_c_1_q) & '0';
    xGTEy_uid8_fpFusedAddSubTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & redist81_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_c_1_q) & xGTEy_uid8_fpFusedAddSubTest_p2_of_6_cin(0);
    xGTEy_uid8_fpFusedAddSubTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p2_of_6_a) - UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p2_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid8_fpFusedAddSubTest_p2_of_6_c(0) <= xGTEy_uid8_fpFusedAddSubTest_p2_of_6_o(7);

    -- redist82_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_d_2(DELAY,1092)
    redist82_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_d_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_d, xout => redist82_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_d_2_q, clk => clk, aclr => areset );

    -- redist87_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_d_2(DELAY,1097)
    redist87_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_d_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_d, xout => redist87_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_d_2_q, clk => clk, aclr => areset );

    -- xGTEy_uid8_fpFusedAddSubTest_p3_of_6(COMPARE,596)@2 + 1
    xGTEy_uid8_fpFusedAddSubTest_p3_of_6_cin <= xGTEy_uid8_fpFusedAddSubTest_p2_of_6_c;
    xGTEy_uid8_fpFusedAddSubTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & redist87_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_d_2_q) & '0';
    xGTEy_uid8_fpFusedAddSubTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & redist82_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_d_2_q) & xGTEy_uid8_fpFusedAddSubTest_p3_of_6_cin(0);
    xGTEy_uid8_fpFusedAddSubTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p3_of_6_a) - UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p3_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid8_fpFusedAddSubTest_p3_of_6_c(0) <= xGTEy_uid8_fpFusedAddSubTest_p3_of_6_o(7);

    -- redist83_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_e_3(DELAY,1093)
    redist83_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_e_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_e, xout => redist83_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_e_3_q, clk => clk, aclr => areset );

    -- redist88_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_e_3(DELAY,1098)
    redist88_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_e_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_e, xout => redist88_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_e_3_q, clk => clk, aclr => areset );

    -- xGTEy_uid8_fpFusedAddSubTest_p4_of_6(COMPARE,597)@3 + 1
    xGTEy_uid8_fpFusedAddSubTest_p4_of_6_cin <= xGTEy_uid8_fpFusedAddSubTest_p3_of_6_c;
    xGTEy_uid8_fpFusedAddSubTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & redist88_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_e_3_q) & '0';
    xGTEy_uid8_fpFusedAddSubTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & redist83_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_e_3_q) & xGTEy_uid8_fpFusedAddSubTest_p4_of_6_cin(0);
    xGTEy_uid8_fpFusedAddSubTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p4_of_6_a) - UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p4_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid8_fpFusedAddSubTest_p4_of_6_c(0) <= xGTEy_uid8_fpFusedAddSubTest_p4_of_6_o(7);

    -- redist84_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_f_4(DELAY,1094)
    redist84_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_f_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_f, xout => redist84_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_f_4_q, clk => clk, aclr => areset );

    -- redist89_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_f_4(DELAY,1099)
    redist89_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_f_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_f, xout => redist89_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_f_4_q, clk => clk, aclr => areset );

    -- xGTEy_uid8_fpFusedAddSubTest_p5_of_6(COMPARE,598)@4 + 1
    xGTEy_uid8_fpFusedAddSubTest_p5_of_6_cin <= xGTEy_uid8_fpFusedAddSubTest_p4_of_6_c;
    xGTEy_uid8_fpFusedAddSubTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & redist89_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_f_4_q) & '0';
    xGTEy_uid8_fpFusedAddSubTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & redist84_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_f_4_q) & xGTEy_uid8_fpFusedAddSubTest_p5_of_6_cin(0);
    xGTEy_uid8_fpFusedAddSubTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p5_of_6_a) - UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p5_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid8_fpFusedAddSubTest_p5_of_6_c(0) <= xGTEy_uid8_fpFusedAddSubTest_p5_of_6_o(7);

    -- redist85_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_g_5(DELAY,1095)
    redist85_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_g_5 : dspba_delay
    GENERIC MAP ( width => 2, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_g, xout => redist85_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_g_5_q, clk => clk, aclr => areset );

    -- redist90_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_g_5(DELAY,1100)
    redist90_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_g_5 : dspba_delay
    GENERIC MAP ( width => 2, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_g, xout => redist90_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_g_5_q, clk => clk, aclr => areset );

    -- xGTEy_uid8_fpFusedAddSubTest_p6_of_6(COMPARE,599)@5 + 1
    xGTEy_uid8_fpFusedAddSubTest_p6_of_6_cin <= xGTEy_uid8_fpFusedAddSubTest_p5_of_6_c;
    xGTEy_uid8_fpFusedAddSubTest_p6_of_6_a <= STD_LOGIC_VECTOR("0" & redist90_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_a_g_5_q) & '0';
    xGTEy_uid8_fpFusedAddSubTest_p6_of_6_b <= STD_LOGIC_VECTOR("0" & redist85_xGTEy_uid8_fpFusedAddSubTest_BitSelect_for_b_g_5_q) & xGTEy_uid8_fpFusedAddSubTest_p6_of_6_cin(0);
    xGTEy_uid8_fpFusedAddSubTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_p6_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p6_of_6_a) - UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_p6_of_6_b));
        END IF;
    END PROCESS;
    xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c(0) <= xGTEy_uid8_fpFusedAddSubTest_p6_of_6_o(3);

    -- xGTEy_uid8_fpFusedAddSubTest_cout_n(LOGICAL,601)@6
    xGTEy_uid8_fpFusedAddSubTest_cout_n_q <= STD_LOGIC_VECTOR(not (xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c));

    -- sigb_uid10_fpFusedAddSubTest(MUX,9)@6 + 1
    sigb_uid10_fpFusedAddSubTest_s <= xGTEy_uid8_fpFusedAddSubTest_cout_n_q;
    sigb_uid10_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sigb_uid10_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (sigb_uid10_fpFusedAddSubTest_s) IS
                WHEN "0" => sigb_uid10_fpFusedAddSubTest_q <= redist169_xIn_a_6_q;
                WHEN "1" => sigb_uid10_fpFusedAddSubTest_q <= redist170_xIn_b_6_q;
                WHEN OTHERS => sigb_uid10_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- sigB_uid44_fpFusedAddSubTest(BITSELECT,43)@7
    sigB_uid44_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(sigb_uid10_fpFusedAddSubTest_q(31 downto 31));

    -- redist153_sigB_uid44_fpFusedAddSubTest_b_36(DELAY,1163)
    redist153_sigB_uid44_fpFusedAddSubTest_b_36 : dspba_delay
    GENERIC MAP ( width => 1, depth => 36, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid44_fpFusedAddSubTest_b, xout => redist153_sigB_uid44_fpFusedAddSubTest_b_36_q, clk => clk, aclr => areset );

    -- redist154_sigB_uid44_fpFusedAddSubTest_b_38(DELAY,1164)
    redist154_sigB_uid44_fpFusedAddSubTest_b_38 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist153_sigB_uid44_fpFusedAddSubTest_b_36_q, xout => redist154_sigB_uid44_fpFusedAddSubTest_b_38_q, clk => clk, aclr => areset );

    -- siga_uid9_fpFusedAddSubTest(MUX,8)@6
    siga_uid9_fpFusedAddSubTest_s <= xGTEy_uid8_fpFusedAddSubTest_cout_n_q;
    siga_uid9_fpFusedAddSubTest_combproc: PROCESS (siga_uid9_fpFusedAddSubTest_s, redist170_xIn_b_6_q, redist169_xIn_a_6_q)
    BEGIN
        CASE (siga_uid9_fpFusedAddSubTest_s) IS
            WHEN "0" => siga_uid9_fpFusedAddSubTest_q <= redist170_xIn_b_6_q;
            WHEN "1" => siga_uid9_fpFusedAddSubTest_q <= redist169_xIn_a_6_q;
            WHEN OTHERS => siga_uid9_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid43_fpFusedAddSubTest(BITSELECT,42)@6
    sigA_uid43_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(siga_uid9_fpFusedAddSubTest_q(31 downto 31));

    -- redist155_sigA_uid43_fpFusedAddSubTest_b_37(DELAY,1165)
    redist155_sigA_uid43_fpFusedAddSubTest_b_37 : dspba_delay
    GENERIC MAP ( width => 1, depth => 37, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid43_fpFusedAddSubTest_b, xout => redist155_sigA_uid43_fpFusedAddSubTest_b_37_q, clk => clk, aclr => areset );

    -- redist156_sigA_uid43_fpFusedAddSubTest_b_39(DELAY,1166)
    redist156_sigA_uid43_fpFusedAddSubTest_b_39 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist155_sigA_uid43_fpFusedAddSubTest_b_37_q, xout => redist156_sigA_uid43_fpFusedAddSubTest_b_39_q, clk => clk, aclr => areset );

    -- cAmA_uid79_fpFusedAddSubTest(CONSTANT,78)
    cAmA_uid79_fpFusedAddSubTest_q <= "11100";

    -- zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,188)
    zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q <= "0000000000000000";

    -- c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,962)
    c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q(5 downto 0);
    c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q(11 downto 6);
    c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_d <= zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q(15 downto 12);

    -- rightShiftStage1Idx3Pad6_uid325_alignmentShifter_uid59_fpFusedAddSubTest(CONSTANT,324)
    rightShiftStage1Idx3Pad6_uid325_alignmentShifter_uid59_fpFusedAddSubTest_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid324_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,323)@12
    rightShiftStage1Idx3Rng6_uid324_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q(48 downto 6);

    -- rightShiftStage1Idx3_uid326_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,325)@12
    rightShiftStage1Idx3_uid326_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx3Pad6_uid325_alignmentShifter_uid59_fpFusedAddSubTest_q & rightShiftStage1Idx3Rng6_uid324_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,202)
    zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid321_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,320)@12
    rightShiftStage1Idx2Rng4_uid321_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q(48 downto 4);

    -- rightShiftStage1Idx2_uid323_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,322)@12
    rightShiftStage1Idx2_uid323_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage1Idx2Rng4_uid321_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,208)
    zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q <= "00";

    -- rightShiftStage1Idx1Rng2_uid318_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,317)@12
    rightShiftStage1Idx1Rng2_uid318_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q(48 downto 2);

    -- rightShiftStage1Idx1_uid320_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,319)@12
    rightShiftStage1Idx1_uid320_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage1Idx1Rng2_uid318_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage0Idx3Pad24_uid314_alignmentShifter_uid59_fpFusedAddSubTest(CONSTANT,313)
    rightShiftStage0Idx3Pad24_uid314_alignmentShifter_uid59_fpFusedAddSubTest_q <= "000000000000000000000000";

    -- rightShiftStage0Idx3Rng24_uid313_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,312)@11
    rightShiftStage0Idx3Rng24_uid313_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightPaddedIn_uid60_fpFusedAddSubTest_q(48 downto 24);

    -- rightShiftStage0Idx3_uid315_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,314)@11
    rightShiftStage0Idx3_uid315_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx3Pad24_uid314_alignmentShifter_uid59_fpFusedAddSubTest_q & rightShiftStage0Idx3Rng24_uid313_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage0Idx2Rng16_uid310_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,309)@11
    rightShiftStage0Idx2Rng16_uid310_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightPaddedIn_uid60_fpFusedAddSubTest_q(48 downto 16);

    -- rightShiftStage0Idx2_uid312_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,311)@11
    rightShiftStage0Idx2_uid312_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage0Idx2Rng16_uid310_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- cstAllZWE_uid13_fpFusedAddSubTest(CONSTANT,12)
    cstAllZWE_uid13_fpFusedAddSubTest_q <= "00000000";

    -- rightShiftStage0Idx1Rng8_uid307_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,306)@11
    rightShiftStage0Idx1Rng8_uid307_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightPaddedIn_uid60_fpFusedAddSubTest_q(48 downto 8);

    -- rightShiftStage0Idx1_uid309_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,308)@11
    rightShiftStage0Idx1_uid309_alignmentShifter_uid59_fpFusedAddSubTest_q <= cstAllZWE_uid13_fpFusedAddSubTest_q & rightShiftStage0Idx1Rng8_uid307_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select(BITSELECT,953)
    c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b <= cstAllZWE_uid13_fpFusedAddSubTest_q(5 downto 0);
    c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c <= cstAllZWE_uid13_fpFusedAddSubTest_q(7 downto 6);

    -- exp_sigb_uid28_fpFusedAddSubTest(BITSELECT,27)@7
    exp_sigb_uid28_fpFusedAddSubTest_in <= sigb_uid10_fpFusedAddSubTest_q(30 downto 0);
    exp_sigb_uid28_fpFusedAddSubTest_b <= exp_sigb_uid28_fpFusedAddSubTest_in(30 downto 23);

    -- z0_uid278_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select(BITSELECT,956)@7
    z0_uid278_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_b <= exp_sigb_uid28_fpFusedAddSubTest_b(5 downto 0);
    z0_uid278_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_c <= exp_sigb_uid28_fpFusedAddSubTest_b(7 downto 6);

    -- eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest(LOGICAL,282)@7 + 1
    eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi <= "1" WHEN z0_uid278_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_c = c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi, xout => eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist109_eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2(DELAY,1119)
    redist109_eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, xout => redist109_eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select(BITSELECT,988)
    y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b <= c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c <= c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- x0_uid484_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select(BITSELECT,993)@7
    x0_uid484_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_b <= z0_uid278_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid484_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_c <= z0_uid278_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid489_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest(LOGICAL,488)@7 + 1
    eq1_uid489_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi <= "1" WHEN x0_uid484_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_c = y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid489_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid489_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi, xout => eq1_uid489_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid486_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest(LOGICAL,485)@7 + 1
    eq0_uid486_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi <= "1" WHEN x0_uid484_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_b = y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid486_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid486_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi, xout => eq0_uid486_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid490_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest(LOGICAL,489)@8 + 1
    andEq_uid490_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi <= eq0_uid486_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q and eq1_uid489_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q;
    andEq_uid490_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid490_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi, xout => andEq_uid490_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest(LOGICAL,283)@9 + 1
    and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi <= andEq_uid490_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q and redist109_eq1_uid283_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q;
    and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi, xout => and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist105_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2(DELAY,1115)
    redist105_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, xout => redist105_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid37_fpFusedAddSubTest(LOGICAL,36)@11
    InvExpXIsZero_uid37_fpFusedAddSubTest_q <= not (redist105_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q);

    -- frac_sigb_uid29_fpFusedAddSubTest(BITSELECT,28)@7
    frac_sigb_uid29_fpFusedAddSubTest_in <= sigb_uid10_fpFusedAddSubTest_q(22 downto 0);
    frac_sigb_uid29_fpFusedAddSubTest_b <= frac_sigb_uid29_fpFusedAddSubTest_in(22 downto 0);

    -- redist162_frac_sigb_uid29_fpFusedAddSubTest_b_4(DELAY,1172)
    redist162_frac_sigb_uid29_fpFusedAddSubTest_b_4 : dspba_delay
    GENERIC MAP ( width => 23, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_sigb_uid29_fpFusedAddSubTest_b, xout => redist162_frac_sigb_uid29_fpFusedAddSubTest_b_4_q, clk => clk, aclr => areset );

    -- oFracB_uid56_fpFusedAddSubTest(BITJOIN,55)@11
    oFracB_uid56_fpFusedAddSubTest_q <= InvExpXIsZero_uid37_fpFusedAddSubTest_q & redist162_frac_sigb_uid29_fpFusedAddSubTest_b_4_q;

    -- padConst_uid59_fpFusedAddSubTest(CONSTANT,58)
    padConst_uid59_fpFusedAddSubTest_q <= "0000000000000000000000000";

    -- rightPaddedIn_uid60_fpFusedAddSubTest(BITJOIN,59)@11
    rightPaddedIn_uid60_fpFusedAddSubTest_q <= oFracB_uid56_fpFusedAddSubTest_q & padConst_uid59_fpFusedAddSubTest_q;

    -- shiftOutConst_uid52_fpFusedAddSubTest(CONSTANT,51)
    shiftOutConst_uid52_fpFusedAddSubTest_q <= "11001";

    -- expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_b(BITJOIN,604)@7
    expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_b_q <= GND_q & exp_sigb_uid28_fpFusedAddSubTest_b;

    -- expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,607)@7
    expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_b <= expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_b_q(5 downto 0);
    expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_c <= expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_b_q(8 downto 6);

    -- exp_siga_uid14_fpFusedAddSubTest(BITSELECT,13)@6
    exp_siga_uid14_fpFusedAddSubTest_in <= siga_uid9_fpFusedAddSubTest_q(30 downto 0);
    exp_siga_uid14_fpFusedAddSubTest_b <= exp_siga_uid14_fpFusedAddSubTest_in(30 downto 23);

    -- redist167_exp_siga_uid14_fpFusedAddSubTest_b_1(DELAY,1177)
    redist167_exp_siga_uid14_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_siga_uid14_fpFusedAddSubTest_b, xout => redist167_exp_siga_uid14_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_a(BITJOIN,602)@7
    expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_a_q <= GND_q & redist167_exp_siga_uid14_fpFusedAddSubTest_b_1_q;

    -- expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a(BITSELECT,606)@7
    expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_b <= expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_a_q(5 downto 0);
    expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_c <= expAmExpB_uid48_fpFusedAddSubTest_BitExpansion_for_a_q(8 downto 6);

    -- expAmExpB_uid48_fpFusedAddSubTest_p1_of_2(SUB,608)@7 + 1
    expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_b);
    expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_b);
    expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_a) - UNSIGNED(expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_c(0) <= expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_o(6);
    expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_q <= expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_o(5 downto 0);

    -- redist77_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_c_1(DELAY,1087)
    redist77_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_c, xout => redist77_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_c_1_q, clk => clk, aclr => areset );

    -- redist78_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_c_1(DELAY,1088)
    redist78_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_c, xout => redist78_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_c_1_q, clk => clk, aclr => areset );

    -- expAmExpB_uid48_fpFusedAddSubTest_p2_of_2(SUB,609)@8 + 1
    expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_cin <= expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_c;
    expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist78_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_a_c_1_q) & '0';
    expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist77_expAmExpB_uid48_fpFusedAddSubTest_BitSelect_for_b_c_1_q) & expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_cin(0);
    expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_a) - UNSIGNED(expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_q <= expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_o(3 downto 1);

    -- redist76_expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_q_1(DELAY,1086)
    redist76_expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_q, xout => redist76_expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_q_1_q, clk => clk, aclr => areset );

    -- expAmExpB_uid48_fpFusedAddSubTest_BitJoin_for_q(BITJOIN,610)@9
    expAmExpB_uid48_fpFusedAddSubTest_BitJoin_for_q_q <= expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_q & redist76_expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_q_1_q;

    -- expAmExpBShiftRange_uid53_fpFusedAddSubTest(BITSELECT,52)@9
    expAmExpBShiftRange_uid53_fpFusedAddSubTest_in <= expAmExpB_uid48_fpFusedAddSubTest_BitJoin_for_q_q(4 downto 0);
    expAmExpBShiftRange_uid53_fpFusedAddSubTest_b <= expAmExpBShiftRange_uid53_fpFusedAddSubTest_in(4 downto 0);

    -- redist150_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1(DELAY,1160)
    redist150_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expAmExpBShiftRange_uid53_fpFusedAddSubTest_b, xout => redist150_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- cWFP1_uid49_fpFusedAddSubTest(CONSTANT,48)
    cWFP1_uid49_fpFusedAddSubTest_q <= "11000";

    -- shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,790)@8
    shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q <= shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_b & cWFP1_uid49_fpFusedAddSubTest_q;

    -- shiftedOut_uid51_fpFusedAddSubTest_p1_of_2(COMPARE,617)@8 + 1
    shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q);
    shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expAmExpB_uid48_fpFusedAddSubTest_p1_of_2_q);
    shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_a) - UNSIGNED(shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_b));
        END IF;
    END PROCESS;
    shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_c(0) <= shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_o(6);

    -- shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,797)@9
    shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_c_q <= GND_q & expAmExpB_uid48_fpFusedAddSubTest_p2_of_2_q;

    -- shiftedOut_uid51_fpFusedAddSubTest_UpperBits_for_a(CONSTANT,612)
    shiftedOut_uid51_fpFusedAddSubTest_UpperBits_for_a_q <= "00000";

    -- shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,975)
    shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(shiftedOut_uid51_fpFusedAddSubTest_UpperBits_for_a_q(0 downto 0));
    shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(shiftedOut_uid51_fpFusedAddSubTest_UpperBits_for_a_q(4 downto 1));

    -- shiftedOut_uid51_fpFusedAddSubTest_p2_of_2(COMPARE,618)@9 + 1
    shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_cin <= shiftedOut_uid51_fpFusedAddSubTest_p1_of_2_c;
    shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_c) & '0';
    shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & shiftedOut_uid51_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_c_q) & shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_cin(0);
    shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_a) - UNSIGNED(shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_b));
        END IF;
    END PROCESS;
    shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_c(0) <= shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_o(5);

    -- shiftValue_uid54_fpFusedAddSubTest(MUX,53)@10 + 1
    shiftValue_uid54_fpFusedAddSubTest_s <= shiftedOut_uid51_fpFusedAddSubTest_p2_of_2_c;
    shiftValue_uid54_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValue_uid54_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (shiftValue_uid54_fpFusedAddSubTest_s) IS
                WHEN "0" => shiftValue_uid54_fpFusedAddSubTest_q <= redist150_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1_q;
                WHEN "1" => shiftValue_uid54_fpFusedAddSubTest_q <= shiftOutConst_uid52_fpFusedAddSubTest_q;
                WHEN OTHERS => shiftValue_uid54_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select(BITSELECT,958)@11
    rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_b <= shiftValue_uid54_fpFusedAddSubTest_q(4 downto 3);
    rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c <= shiftValue_uid54_fpFusedAddSubTest_q(2 downto 1);
    rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d <= shiftValue_uid54_fpFusedAddSubTest_q(0 downto 0);

    -- rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest(MUX,316)@11 + 1
    rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_s <= rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_b;
    rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_s) IS
                WHEN "00" => rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightPaddedIn_uid60_fpFusedAddSubTest_q;
                WHEN "01" => rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx1_uid309_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "10" => rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx2_uid312_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "11" => rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx3_uid315_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN OTHERS => rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist19_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,1029)
    redist19_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c, xout => redist19_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest(MUX,327)@12 + 1
    rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_s <= redist19_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1_q;
    rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_s) IS
                WHEN "00" => rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0_uid317_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "01" => rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx1_uid320_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "10" => rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx2_uid323_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "11" => rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx3_uid326_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN OTHERS => rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a(BITSELECT,710)@13
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_b <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(13 downto 0);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_c <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(14 downto 14);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_d <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(15 downto 15);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_e <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(16 downto 16);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_f <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(21 downto 17);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_g <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(22 downto 22);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_h <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(23 downto 23);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_i <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(24 downto 24);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_j <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(36 downto 25);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_k <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(37 downto 37);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_l <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(38 downto 38);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_m <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(39 downto 39);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_n <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(40 downto 40);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_o <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(44 downto 41);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_p <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(45 downto 45);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_q <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(46 downto 46);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_r <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(47 downto 47);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_s <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(48 downto 48);

    -- redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2(DELAY,1030)
    redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d, xout => redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q, clk => clk, aclr => areset );

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17(MUX,728)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_s;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q <= GND_q;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2Idx1Rng1_uid329_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,328)@13
    rightShiftStage2Idx1Rng1_uid329_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage1_uid328_alignmentShifter_uid59_fpFusedAddSubTest_q(48 downto 1);

    -- rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,330)@13
    rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid329_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,709)@13
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_b <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(13 downto 0);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_c <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(14 downto 14);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_d <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(15 downto 15);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_e <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(16 downto 16);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_f <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(21 downto 17);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_g <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(22 downto 22);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_h <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(23 downto 23);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_i <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(24 downto 24);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_j <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(36 downto 25);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_k <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(37 downto 37);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_l <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(38 downto 38);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_m <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(39 downto 39);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_n <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(40 downto 40);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_o <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(44 downto 41);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_p <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(45 downto 45);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_q <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(46 downto 46);
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_r <= rightShiftStage2Idx1_uid331_alignmentShifter_uid59_fpFusedAddSubTest_q(47 downto 47);

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16(MUX,727)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_r;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_r;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15(MUX,726)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_q;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_q;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14(MUX,725)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_p;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_p;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13(MUX,724)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_o;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_o;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12(MUX,723)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_n;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_n;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11(MUX,722)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_m;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_m;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10(MUX,721)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_l;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_l;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9(MUX,720)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_k;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_k;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8(MUX,719)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_j;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_j;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7(MUX,718)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_i;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_i;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6(MUX,717)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_h;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_h;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5(MUX,716)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_g;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_g;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4(MUX,715)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_f;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_f;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3(MUX,714)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_e;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_e;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2(MUX,713)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_d;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_d;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1(MUX,712)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_c;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_c;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0(MUX,711)@13 + 1
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_s <= redist20_rightShiftStageSel4Dto3_uid316_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_s) IS
                WHEN "0" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_a_b;
                WHEN "1" => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitSelect_for_b_b;
                WHEN OTHERS => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitJoin_for_q(BITJOIN,729)@14
    rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitJoin_for_q_q <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p7_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p6_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p5_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p4_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p3_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p2_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p1_q & rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p0_q;

    -- stickyBits_uid62_fpFusedAddSubTest_merged_bit_select(BITSELECT,981)@14
    stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitJoin_for_q_q(22 downto 0);
    stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c <= rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_BitJoin_for_q_q(48 downto 23);

    -- redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2(DELAY,1010)
    redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 26, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c, xout => redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- cstZeroWF_uid12_fpFusedAddSubTest(CONSTANT,11)
    cstZeroWF_uid12_fpFusedAddSubTest_q <= "00000000000000000000000";

    -- c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,952)
    c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= cstZeroWF_uid12_fpFusedAddSubTest_q(5 downto 0);
    c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= cstZeroWF_uid12_fpFusedAddSubTest_q(11 downto 6);
    c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d <= cstZeroWF_uid12_fpFusedAddSubTest_q(17 downto 12);
    c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e <= cstZeroWF_uid12_fpFusedAddSubTest_q(22 downto 18);

    -- z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select(BITSELECT,959)@14
    z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(5 downto 0);
    z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(11 downto 6);
    z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_d <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(17 downto 12);
    z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_e <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(22 downto 18);

    -- eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,345)@14 + 1
    eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= "1" WHEN z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_e = c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e ELSE "0";
    eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist100_eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_q_2(DELAY,1110)
    redist100_eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_q, xout => redist100_eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,987)
    y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d(2 downto 0);
    y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d(5 downto 3);

    -- x0_uid533_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select(BITSELECT,999)@14
    x0_uid533_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b <= z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_d(2 downto 0);
    x0_uid533_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c <= z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid538_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,537)@14 + 1
    eq1_uid538_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= "1" WHEN x0_uid533_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c = y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid538_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid538_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => eq1_uid538_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid535_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,534)@14 + 1
    eq0_uid535_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= "1" WHEN x0_uid533_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b = y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid535_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid535_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => eq0_uid535_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid539_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,538)@15 + 1
    andEq_uid539_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= eq0_uid535_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq1_uid538_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_q;
    andEq_uid539_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid539_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => andEq_uid539_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,986)
    y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c(2 downto 0);
    y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c(5 downto 3);

    -- x0_uid526_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select(BITSELECT,998)@14
    x0_uid526_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b <= z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c(2 downto 0);
    x0_uid526_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c <= z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid531_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,530)@14 + 1
    eq1_uid531_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= "1" WHEN x0_uid526_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c = y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid531_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid531_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => eq1_uid531_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid528_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,527)@14 + 1
    eq0_uid528_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= "1" WHEN x0_uid526_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b = y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid528_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid528_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => eq0_uid528_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid532_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,531)@15 + 1
    andEq_uid532_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= eq0_uid528_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq1_uid531_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_q;
    andEq_uid532_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid532_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => andEq_uid532_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,985)
    y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- x0_uid519_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select(BITSELECT,997)@14
    x0_uid519_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b <= z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid519_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c <= z0_uid335_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid524_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,523)@14 + 1
    eq1_uid524_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= "1" WHEN x0_uid519_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c = y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid524_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid524_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => eq1_uid524_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid521_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,520)@14 + 1
    eq0_uid521_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= "1" WHEN x0_uid519_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b = y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid521_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid521_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => eq0_uid521_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid525_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,524)@15 + 1
    andEq_uid525_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= eq0_uid521_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq1_uid524_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_q;
    andEq_uid525_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid525_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => andEq_uid525_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid347_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,346)@16
    and_lev0_uid347_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= andEq_uid525_eq0_uid337_cmpStickyWZero_uid64_fpFusedAddSubTest_q and andEq_uid532_eq1_uid340_cmpStickyWZero_uid64_fpFusedAddSubTest_q and andEq_uid539_eq2_uid343_cmpStickyWZero_uid64_fpFusedAddSubTest_q and redist100_eq3_uid346_cmpStickyWZero_uid64_fpFusedAddSubTest_q_2_q;

    -- sticky_uid65_fpFusedAddSubTest(LOGICAL,64)@16
    sticky_uid65_fpFusedAddSubTest_q <= not (and_lev0_uid347_cmpStickyWZero_uid64_fpFusedAddSubTest_q);

    -- alignFracB_uid67_fpFusedAddSubTest(BITJOIN,66)@16
    alignFracB_uid67_fpFusedAddSubTest_q <= redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2_q & sticky_uid65_fpFusedAddSubTest_q;

    -- fracBOp_uid70_fpFusedAddSubTest(BITJOIN,69)@16
    fracBOp_uid70_fpFusedAddSubTest_q <= GND_q & GND_q & alignFracB_uid67_fpFusedAddSubTest_q;

    -- fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_b(BITJOIN,623)@16
    fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_b_q <= GND_q & fracBOp_uid70_fpFusedAddSubTest_q;

    -- fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,626)@16
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_b <= fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_b_q(5 downto 0);

    -- redist62_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_b_1(DELAY,1072)
    redist62_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_b, xout => redist62_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_b_1_q, clk => clk, aclr => areset );

    -- zv_uid68_fpFusedAddSubTest(CONSTANT,67)
    zv_uid68_fpFusedAddSubTest_q <= "000";

    -- frac_siga_uid15_fpFusedAddSubTest(BITSELECT,14)@6
    frac_siga_uid15_fpFusedAddSubTest_in <= siga_uid9_fpFusedAddSubTest_q(22 downto 0);
    frac_siga_uid15_fpFusedAddSubTest_b <= frac_siga_uid15_fpFusedAddSubTest_in(22 downto 0);

    -- redist166_frac_siga_uid15_fpFusedAddSubTest_b_11(DELAY,1176)
    redist166_frac_siga_uid15_fpFusedAddSubTest_b_11 : dspba_delay
    GENERIC MAP ( width => 23, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_siga_uid15_fpFusedAddSubTest_b, xout => redist166_frac_siga_uid15_fpFusedAddSubTest_b_11_q, clk => clk, aclr => areset );

    -- oFracA_uid57_fpFusedAddSubTest(BITJOIN,56)@17
    oFracA_uid57_fpFusedAddSubTest_q <= VCC_q & redist166_frac_siga_uid15_fpFusedAddSubTest_b_11_q;

    -- fracAOp_uid69_fpFusedAddSubTest(BITJOIN,68)@17
    fracAOp_uid69_fpFusedAddSubTest_q <= oFracA_uid57_fpFusedAddSubTest_q & zv_uid68_fpFusedAddSubTest_q;

    -- fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_a(BITJOIN,621)@17
    fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_a_q <= zv_uid68_fpFusedAddSubTest_q & fracAOp_uid69_fpFusedAddSubTest_q;

    -- fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a(BITSELECT,625)@17
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_b <= fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_a_q(5 downto 0);
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_c <= fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_a_q(11 downto 6);
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_d <= fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_a_q(17 downto 12);
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_e <= fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_a_q(23 downto 18);
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_f <= fracResSub_uid71_fpFusedAddSubTest_BitExpansion_for_a_q(29 downto 24);

    -- fracResSub_uid71_fpFusedAddSubTest_p1_of_5(SUB,627)@17 + 1
    fracResSub_uid71_fpFusedAddSubTest_p1_of_5_a <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_b);
    fracResSub_uid71_fpFusedAddSubTest_p1_of_5_b <= STD_LOGIC_VECTOR("0" & redist62_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_b_1_q);
    fracResSub_uid71_fpFusedAddSubTest_p1_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p1_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p1_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p1_of_5_a) - UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p1_of_5_b));
        END IF;
    END PROCESS;
    fracResSub_uid71_fpFusedAddSubTest_p1_of_5_c(0) <= fracResSub_uid71_fpFusedAddSubTest_p1_of_5_o(6);
    fracResSub_uid71_fpFusedAddSubTest_p1_of_5_q <= fracResSub_uid71_fpFusedAddSubTest_p1_of_5_o(5 downto 0);

    -- redist45_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q_5(DELAY,1055)
    redist45_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q_5 : dspba_delay
    GENERIC MAP ( width => 12, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q, xout => redist45_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q_5_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_tessel1_0(BITSELECT,798)@18
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(redist45_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q_5_q(8 downto 3));

    -- redist63_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_c_1(DELAY,1073)
    redist63_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_c, xout => redist63_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_c_1_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_p2_of_5(SUB,628)@18 + 1
    fracResSub_uid71_fpFusedAddSubTest_p2_of_5_cin <= fracResSub_uid71_fpFusedAddSubTest_p1_of_5_c;
    fracResSub_uid71_fpFusedAddSubTest_p2_of_5_a <= STD_LOGIC_VECTOR("0" & redist63_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_c_1_q) & '0';
    fracResSub_uid71_fpFusedAddSubTest_p2_of_5_b <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b) & fracResSub_uid71_fpFusedAddSubTest_p2_of_5_cin(0);
    fracResSub_uid71_fpFusedAddSubTest_p2_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p2_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p2_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p2_of_5_a) - UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p2_of_5_b));
        END IF;
    END PROCESS;
    fracResSub_uid71_fpFusedAddSubTest_p2_of_5_c(0) <= fracResSub_uid71_fpFusedAddSubTest_p2_of_5_o(7);
    fracResSub_uid71_fpFusedAddSubTest_p2_of_5_q <= fracResSub_uid71_fpFusedAddSubTest_p2_of_5_o(6 downto 1);

    -- redist42_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q_6(DELAY,1052)
    redist42_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q, xout => redist42_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q_6_q, clk => clk, aclr => areset );

    -- redist43_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q_6(DELAY,1053)
    redist43_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q, xout => redist43_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q_6_q, clk => clk, aclr => areset );

    -- redist44_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q_6(DELAY,1054)
    redist44_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q, xout => redist44_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q_6_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_tessel2_0(BITSELECT,800)@18
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(redist45_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p8_q_5_q(11 downto 9));

    -- redist28_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_tessel2_0_b_1(DELAY,1038)
    redist28_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_tessel2_0_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_tessel2_0_b, xout => redist28_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_tessel2_0_b_1_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_d(BITJOIN,804)@19
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_d_q <= redist42_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p11_q_6_q & redist43_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p10_q_6_q & redist44_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p9_q_6_q & redist28_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_tessel2_0_b_1_q;

    -- redist64_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_d_2(DELAY,1074)
    redist64_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_d_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_d, xout => redist64_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_d_2_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_p3_of_5(SUB,629)@19 + 1
    fracResSub_uid71_fpFusedAddSubTest_p3_of_5_cin <= fracResSub_uid71_fpFusedAddSubTest_p2_of_5_c;
    fracResSub_uid71_fpFusedAddSubTest_p3_of_5_a <= STD_LOGIC_VECTOR("0" & redist64_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_d_2_q) & '0';
    fracResSub_uid71_fpFusedAddSubTest_p3_of_5_b <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_d_q) & fracResSub_uid71_fpFusedAddSubTest_p3_of_5_cin(0);
    fracResSub_uid71_fpFusedAddSubTest_p3_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p3_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p3_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p3_of_5_a) - UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p3_of_5_b));
        END IF;
    END PROCESS;
    fracResSub_uid71_fpFusedAddSubTest_p3_of_5_c(0) <= fracResSub_uid71_fpFusedAddSubTest_p3_of_5_o(7);
    fracResSub_uid71_fpFusedAddSubTest_p3_of_5_q <= fracResSub_uid71_fpFusedAddSubTest_p3_of_5_o(6 downto 1);

    -- redist39_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q_7(DELAY,1049)
    redist39_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q, xout => redist39_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q_7_q, clk => clk, aclr => areset );

    -- redist40_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q_7(DELAY,1050)
    redist40_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q_7 : dspba_delay
    GENERIC MAP ( width => 4, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q, xout => redist40_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q_7_q, clk => clk, aclr => areset );

    -- redist41_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q_7(DELAY,1051)
    redist41_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q, xout => redist41_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q_7_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_e(BITJOIN,808)@20
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_e_q <= redist39_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p14_q_7_q & redist40_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p13_q_7_q & redist41_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p12_q_7_q;

    -- redist65_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_e_3(DELAY,1075)
    redist65_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_e_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_e, xout => redist65_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_e_3_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_p4_of_5(SUB,630)@20 + 1
    fracResSub_uid71_fpFusedAddSubTest_p4_of_5_cin <= fracResSub_uid71_fpFusedAddSubTest_p3_of_5_c;
    fracResSub_uid71_fpFusedAddSubTest_p4_of_5_a <= STD_LOGIC_VECTOR("0" & redist65_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_e_3_q) & '0';
    fracResSub_uid71_fpFusedAddSubTest_p4_of_5_b <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_e_q) & fracResSub_uid71_fpFusedAddSubTest_p4_of_5_cin(0);
    fracResSub_uid71_fpFusedAddSubTest_p4_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p4_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p4_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p4_of_5_a) - UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p4_of_5_b));
        END IF;
    END PROCESS;
    fracResSub_uid71_fpFusedAddSubTest_p4_of_5_c(0) <= fracResSub_uid71_fpFusedAddSubTest_p4_of_5_o(7);
    fracResSub_uid71_fpFusedAddSubTest_p4_of_5_q <= fracResSub_uid71_fpFusedAddSubTest_p4_of_5_o(6 downto 1);

    -- redist36_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q_8(DELAY,1046)
    redist36_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q, xout => redist36_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q_8_q, clk => clk, aclr => areset );

    -- redist37_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q_8(DELAY,1047)
    redist37_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q, xout => redist37_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q_8_q, clk => clk, aclr => areset );

    -- redist38_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q_8(DELAY,1048)
    redist38_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q, xout => redist38_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q_8_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_f(BITJOIN,815)@21
    fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_f_q <= GND_q & GND_q & GND_q & redist36_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p17_q_8_q & redist37_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p16_q_8_q & redist38_rightShiftStage2_uid333_alignmentShifter_uid59_fpFusedAddSubTest_p15_q_8_q;

    -- redist66_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_f_4(DELAY,1076)
    redist66_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_f_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_f, xout => redist66_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_f_4_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_p5_of_5(SUB,631)@21 + 1
    fracResSub_uid71_fpFusedAddSubTest_p5_of_5_cin <= fracResSub_uid71_fpFusedAddSubTest_p4_of_5_c;
    fracResSub_uid71_fpFusedAddSubTest_p5_of_5_a <= STD_LOGIC_VECTOR("0" & redist66_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_f_4_q) & '0';
    fracResSub_uid71_fpFusedAddSubTest_p5_of_5_b <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_f_q) & fracResSub_uid71_fpFusedAddSubTest_p5_of_5_cin(0);
    fracResSub_uid71_fpFusedAddSubTest_p5_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p5_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResSub_uid71_fpFusedAddSubTest_p5_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p5_of_5_a) - UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_p5_of_5_b));
        END IF;
    END PROCESS;
    fracResSub_uid71_fpFusedAddSubTest_p5_of_5_q <= fracResSub_uid71_fpFusedAddSubTest_p5_of_5_o(6 downto 1);

    -- redist67_fracResSub_uid71_fpFusedAddSubTest_p4_of_5_q_1(DELAY,1077)
    redist67_fracResSub_uid71_fpFusedAddSubTest_p4_of_5_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_p4_of_5_q, xout => redist67_fracResSub_uid71_fpFusedAddSubTest_p4_of_5_q_1_q, clk => clk, aclr => areset );

    -- redist68_fracResSub_uid71_fpFusedAddSubTest_p3_of_5_q_2(DELAY,1078)
    redist68_fracResSub_uid71_fpFusedAddSubTest_p3_of_5_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_p3_of_5_q, xout => redist68_fracResSub_uid71_fpFusedAddSubTest_p3_of_5_q_2_q, clk => clk, aclr => areset );

    -- redist69_fracResSub_uid71_fpFusedAddSubTest_p2_of_5_q_3(DELAY,1079)
    redist69_fracResSub_uid71_fpFusedAddSubTest_p2_of_5_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_p2_of_5_q, xout => redist69_fracResSub_uid71_fpFusedAddSubTest_p2_of_5_q_3_q, clk => clk, aclr => areset );

    -- redist70_fracResSub_uid71_fpFusedAddSubTest_p1_of_5_q_4(DELAY,1080)
    redist70_fracResSub_uid71_fpFusedAddSubTest_p1_of_5_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSub_uid71_fpFusedAddSubTest_p1_of_5_q, xout => redist70_fracResSub_uid71_fpFusedAddSubTest_p1_of_5_q_4_q, clk => clk, aclr => areset );

    -- fracResSub_uid71_fpFusedAddSubTest_BitJoin_for_q(BITJOIN,632)@22
    fracResSub_uid71_fpFusedAddSubTest_BitJoin_for_q_q <= fracResSub_uid71_fpFusedAddSubTest_p5_of_5_q & redist67_fracResSub_uid71_fpFusedAddSubTest_p4_of_5_q_1_q & redist68_fracResSub_uid71_fpFusedAddSubTest_p3_of_5_q_2_q & redist69_fracResSub_uid71_fpFusedAddSubTest_p2_of_5_q_3_q & redist70_fracResSub_uid71_fpFusedAddSubTest_p1_of_5_q_4_q;

    -- fracResSubNoSignExt_uid73_fpFusedAddSubTest(BITSELECT,72)@22
    fracResSubNoSignExt_uid73_fpFusedAddSubTest_in <= fracResSub_uid71_fpFusedAddSubTest_BitJoin_for_q_q(27 downto 0);
    fracResSubNoSignExt_uid73_fpFusedAddSubTest_b <= fracResSubNoSignExt_uid73_fpFusedAddSubTest_in(27 downto 0);

    -- rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest(BITSELECT,189)@22
    rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b <= fracResSubNoSignExt_uid73_fpFusedAddSubTest_b(27 downto 12);

    -- z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,963)@22
    z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b(5 downto 0);
    z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b(11 downto 6);
    z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_d <= rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b(15 downto 12);

    -- eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,422)@22 + 1
    eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_d = c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_d ELSE "0";
    eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist98_eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2(DELAY,1108)
    redist98_eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist98_eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- y0_uid555_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,1003)
    y0_uid555_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c(2 downto 0);
    y0_uid555_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c(5 downto 3);

    -- x0_uid554_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,1005)@22
    x0_uid554_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c(2 downto 0);
    x0_uid554_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid559_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,558)@22 + 1
    eq1_uid559_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN x0_uid554_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c = y0_uid555_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid559_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid559_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => eq1_uid559_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid556_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,555)@22 + 1
    eq0_uid556_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN x0_uid554_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = y0_uid555_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid556_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid556_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => eq0_uid556_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid560_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,559)@23 + 1
    andEq_uid560_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi <= eq0_uid556_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q and eq1_uid559_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q;
    andEq_uid560_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid560_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => andEq_uid560_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- y0_uid548_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,1002)
    y0_uid548_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    y0_uid548_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- x0_uid547_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,1004)@22
    x0_uid547_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid547_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= z0_uid415_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid552_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,551)@22 + 1
    eq1_uid552_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN x0_uid547_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c = y0_uid548_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid552_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid552_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => eq1_uid552_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid549_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,548)@22 + 1
    eq0_uid549_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN x0_uid547_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = y0_uid548_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid549_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid549_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => eq0_uid549_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid553_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,552)@23 + 1
    andEq_uid553_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi <= eq0_uid549_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q and eq1_uid552_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q;
    andEq_uid553_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid553_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => andEq_uid553_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,423)@24 + 1
    and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi <= andEq_uid553_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q and andEq_uid560_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q and redist98_eq2_uid423_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q;
    and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist97_and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_10(DELAY,1107)
    redist97_and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist97_and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_10_q, clk => clk, aclr => areset );

    -- redist148_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3(DELAY,1158)
    redist148_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3 : dspba_delay
    GENERIC MAP ( width => 28, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSubNoSignExt_uid73_fpFusedAddSubTest_b, xout => redist148_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q, clk => clk, aclr => areset );

    -- vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest(BITSELECT,192)@25
    vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_in <= redist148_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q(11 downto 0);
    vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b <= vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_in(11 downto 0);

    -- mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,191)
    mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1111";

    -- cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest(BITJOIN,193)@25
    cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest_q <= vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b & mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- redist128_rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b_3(DELAY,1138)
    redist128_rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b_3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b, xout => redist128_rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b_3_q, clk => clk, aclr => areset );

    -- vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest(MUX,195)@25 + 1
    vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_s <= and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist128_rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b_3_q;
                WHEN "1" => vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest_q;
                WHEN OTHERS => vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,964)@26
    rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q(15 downto 8);
    rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q(7 downto 0);

    -- z0_uid425_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,1006)@26
    z0_uid425_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b(5 downto 0);
    z0_uid425_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b(7 downto 6);

    -- eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,429)@26 + 1
    eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN z0_uid425_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c = c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist96_eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2(DELAY,1106)
    redist96_eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist96_eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid561_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,973)@26
    x0_uid561_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= z0_uid425_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid561_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= z0_uid425_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid566_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,565)@26 + 1
    eq1_uid566_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN x0_uid561_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c = y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid566_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid566_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => eq1_uid566_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid563_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,562)@26 + 1
    eq0_uid563_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN x0_uid561_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid563_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid563_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => eq0_uid563_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid567_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,566)@27 + 1
    andEq_uid567_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi <= eq0_uid563_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q and eq1_uid566_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q;
    andEq_uid567_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid567_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => andEq_uid567_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,430)@28 + 1
    and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi <= andEq_uid567_eq0_uid427_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q and redist96_eq1_uid430_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q;
    and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist95_and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_6(DELAY,1105)
    redist95_and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist95_and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_6_q, clk => clk, aclr => areset );

    -- redist18_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_3(DELAY,1028)
    redist18_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c, xout => redist18_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_3_q, clk => clk, aclr => areset );

    -- redist17_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_3(DELAY,1027)
    redist17_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b, xout => redist17_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_3_q, clk => clk, aclr => areset );

    -- vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest(MUX,201)@29 + 1
    vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_s <= and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist17_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_3_q;
                WHEN "1" => vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist18_rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_3_q;
                WHEN OTHERS => vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,965)@30
    rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q(7 downto 4);
    rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q(3 downto 0);

    -- vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,204)@30 + 1
    vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";
    vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist126_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_4(DELAY,1136)
    redist126_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist126_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- redist16_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,1026)
    redist16_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c, xout => redist16_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist15_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1(DELAY,1025)
    redist15_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b, xout => redist15_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest(MUX,207)@31 + 1
    vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist15_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q;
                WHEN "1" => vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist16_rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q;
                WHEN OTHERS => vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,966)@32
    rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q(3 downto 2);
    rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q(1 downto 0);

    -- vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,210)@32 + 1
    vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";
    vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist125_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_2(DELAY,1135)
    redist125_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist125_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- redist14_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,1024)
    redist14_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c, xout => redist14_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist13_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1(DELAY,1023)
    redist13_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b, xout => redist13_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest(MUX,213)@33
    vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s, redist13_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q, redist14_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist13_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist14_rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest(BITSELECT,215)@33
    rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_b <= vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q(1 downto 1);

    -- redist124_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_b_1(DELAY,1134)
    redist124_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_b, xout => redist124_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,216)@34
    vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN redist124_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_b_1_q = GND_q ELSE "0";

    -- r_uid218_lzCountValSub_uid75_fpFusedAddSubTest(BITJOIN,217)@34
    r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist97_and_lev0_uid424_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_10_q & redist95_and_lev0_uid431_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_6_q & redist126_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_4_q & redist125_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q & vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- redist123_r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q_7(DELAY,1133)
    redist123_r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q_7 : dspba_delay
    GENERIC MAP ( width => 5, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist123_r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q_7_q, clk => clk, aclr => areset );

    -- aMinusA_uid80_fpFusedAddSubTest(LOGICAL,79)@41 + 1
    aMinusA_uid80_fpFusedAddSubTest_qi <= "1" WHEN redist123_r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q_7_q = cAmA_uid79_fpFusedAddSubTest_q ELSE "0";
    aMinusA_uid80_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid80_fpFusedAddSubTest_qi, xout => aMinusA_uid80_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist144_aMinusA_uid80_fpFusedAddSubTest_q_4(DELAY,1154)
    redist144_aMinusA_uid80_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid80_fpFusedAddSubTest_q, xout => redist144_aMinusA_uid80_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid11_fpFusedAddSubTest(CONSTANT,10)
    cstAllOWE_uid11_fpFusedAddSubTest_q <= "11111111";

    -- c0_uid259_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select(BITSELECT,951)
    c0_uid259_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_b <= cstAllOWE_uid11_fpFusedAddSubTest_q(5 downto 0);
    c0_uid259_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_c <= cstAllOWE_uid11_fpFusedAddSubTest_q(7 downto 6);

    -- redist168_exp_siga_uid14_fpFusedAddSubTest_b_34(DELAY,1178)
    redist168_exp_siga_uid14_fpFusedAddSubTest_b_34 : dspba_delay
    GENERIC MAP ( width => 8, depth => 33, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist167_exp_siga_uid14_fpFusedAddSubTest_b_1_q, xout => redist168_exp_siga_uid14_fpFusedAddSubTest_b_34_q, clk => clk, aclr => areset );

    -- z0_uid251_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select(BITSELECT,954)@40
    z0_uid251_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b <= redist168_exp_siga_uid14_fpFusedAddSubTest_b_34_q(5 downto 0);
    z0_uid251_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c <= redist168_exp_siga_uid14_fpFusedAddSubTest_b_34_q(7 downto 6);

    -- eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest(LOGICAL,262)@40 + 1
    eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_qi <= "1" WHEN z0_uid251_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c = c0_uid259_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_qi, xout => eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist112_eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_q_2(DELAY,1122)
    redist112_eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_q, xout => redist112_eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- y0_uid457_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select(BITSELECT,984)
    y0_uid457_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_b <= c0_uid259_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    y0_uid457_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_c <= c0_uid259_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- x0_uid449_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select(BITSELECT,989)@40
    x0_uid449_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b <= z0_uid251_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid449_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c <= z0_uid251_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid461_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest(LOGICAL,460)@40 + 1
    eq1_uid461_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_qi <= "1" WHEN x0_uid449_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c = y0_uid457_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid461_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid461_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_qi, xout => eq1_uid461_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid458_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest(LOGICAL,457)@40 + 1
    eq0_uid458_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_qi <= "1" WHEN x0_uid449_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b = y0_uid457_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid458_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid458_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_qi, xout => eq0_uid458_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid462_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest(LOGICAL,461)@41 + 1
    andEq_uid462_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_qi <= eq0_uid458_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_q and eq1_uid461_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_q;
    andEq_uid462_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid462_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_qi, xout => andEq_uid462_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest(LOGICAL,263)@42 + 1
    and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest_qi <= andEq_uid462_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_q and redist112_eq1_uid263_expXIsMax_uid17_fpFusedAddSubTest_q_2_q;
    and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest_qi, xout => and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid22_fpFusedAddSubTest(LOGICAL,21)@43 + 1
    invExpXIsMax_uid22_fpFusedAddSubTest_qi <= not (and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest_q);
    invExpXIsMax_uid22_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invExpXIsMax_uid22_fpFusedAddSubTest_qi, xout => invExpXIsMax_uid22_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest(LOGICAL,255)@40 + 1
    eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi <= "1" WHEN z0_uid251_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c = c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi, xout => eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist117_eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2(DELAY,1127)
    redist117_eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_q, xout => redist117_eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- eq1_uid454_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest(LOGICAL,453)@40 + 1
    eq1_uid454_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi <= "1" WHEN x0_uid449_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c = y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid454_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid454_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi, xout => eq1_uid454_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid451_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest(LOGICAL,450)@40 + 1
    eq0_uid451_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi <= "1" WHEN x0_uid449_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b = y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid451_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid451_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi, xout => eq0_uid451_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid455_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest(LOGICAL,454)@41 + 1
    andEq_uid455_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi <= eq0_uid451_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_q and eq1_uid454_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_q;
    andEq_uid455_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid455_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi, xout => andEq_uid455_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest(LOGICAL,256)@42 + 1
    and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi <= andEq_uid455_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_q and redist117_eq1_uid256_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q;
    and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_qi, xout => and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist113_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2(DELAY,1123)
    redist113_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q, xout => redist113_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid23_fpFusedAddSubTest(LOGICAL,22)@44
    InvExpXIsZero_uid23_fpFusedAddSubTest_q <= not (redist113_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q);

    -- excR_siga_uid24_fpFusedAddSubTest(LOGICAL,23)@44 + 1
    excR_siga_uid24_fpFusedAddSubTest_qi <= InvExpXIsZero_uid23_fpFusedAddSubTest_q and invExpXIsMax_uid22_fpFusedAddSubTest_q;
    excR_siga_uid24_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_siga_uid24_fpFusedAddSubTest_qi, xout => excR_siga_uid24_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- positiveExc_uid173_fpFusedAddSubTest(LOGICAL,172)@45 + 1
    positiveExc_uid173_fpFusedAddSubTest_qi <= excR_siga_uid24_fpFusedAddSubTest_q and redist144_aMinusA_uid80_fpFusedAddSubTest_q_4_q and redist156_sigA_uid43_fpFusedAddSubTest_b_39_q and redist154_sigB_uid44_fpFusedAddSubTest_b_38_q;
    positiveExc_uid173_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => positiveExc_uid173_fpFusedAddSubTest_qi, xout => positiveExc_uid173_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invPositiveExc_uid174_fpFusedAddSubTest(LOGICAL,173)@46
    invPositiveExc_uid174_fpFusedAddSubTest_q <= not (positiveExc_uid173_fpFusedAddSubTest_q);

    -- redist106_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_36(DELAY,1116)
    redist106_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_36 : dspba_delay
    GENERIC MAP ( width => 1, depth => 34, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist105_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q, xout => redist106_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_36_q, clk => clk, aclr => areset );

    -- redist114_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3(DELAY,1124)
    redist114_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist113_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q, xout => redist114_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- signInputsZeroForSub_uid175_fpFusedAddSubTest(LOGICAL,174)@45 + 1
    signInputsZeroForSub_uid175_fpFusedAddSubTest_qi <= redist114_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q and redist106_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_36_q and redist156_sigA_uid43_fpFusedAddSubTest_b_39_q and redist154_sigB_uid44_fpFusedAddSubTest_b_38_q;
    signInputsZeroForSub_uid175_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signInputsZeroForSub_uid175_fpFusedAddSubTest_qi, xout => signInputsZeroForSub_uid175_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invSignInputsZeroForSub_uid176_fpFusedAddSubTest(LOGICAL,175)@46
    invSignInputsZeroForSub_uid176_fpFusedAddSubTest_q <= not (signInputsZeroForSub_uid175_fpFusedAddSubTest_q);

    -- sigY_uid177_fpFusedAddSubTest(BITSELECT,176)@6
    sigY_uid177_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(redist170_xIn_b_6_q(31 downto 31));

    -- invSigY_uid178_fpFusedAddSubTest(LOGICAL,177)@6
    invSigY_uid178_fpFusedAddSubTest_q <= not (sigY_uid177_fpFusedAddSubTest_b);

    -- yGTxYPos_uid180_fpFusedAddSubTest(LOGICAL,179)@6 + 1
    yGTxYPos_uid180_fpFusedAddSubTest_qi <= xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c and invSigY_uid178_fpFusedAddSubTest_q;
    yGTxYPos_uid180_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yGTxYPos_uid180_fpFusedAddSubTest_qi, xout => yGTxYPos_uid180_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- sigX_uid181_fpFusedAddSubTest(BITSELECT,180)@6
    sigX_uid181_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(redist169_xIn_a_6_q(31 downto 31));

    -- xGTyXNeg_uid182_fpFusedAddSubTest(LOGICAL,181)@6 + 1
    xGTyXNeg_uid182_fpFusedAddSubTest_qi <= xGTEy_uid8_fpFusedAddSubTest_cout_n_q and sigX_uid181_fpFusedAddSubTest_b;
    xGTyXNeg_uid182_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTyXNeg_uid182_fpFusedAddSubTest_qi, xout => xGTyXNeg_uid182_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- signRPostExcSub0_uid183_fpFusedAddSubTest(LOGICAL,182)@7 + 1
    signRPostExcSub0_uid183_fpFusedAddSubTest_qi <= xGTyXNeg_uid182_fpFusedAddSubTest_q or yGTxYPos_uid180_fpFusedAddSubTest_q;
    signRPostExcSub0_uid183_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub0_uid183_fpFusedAddSubTest_qi, xout => signRPostExcSub0_uid183_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist130_signRPostExcSub0_uid183_fpFusedAddSubTest_q_39(DELAY,1140)
    redist130_signRPostExcSub0_uid183_fpFusedAddSubTest_q_39 : dspba_delay
    GENERIC MAP ( width => 1, depth => 38, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub0_uid183_fpFusedAddSubTest_q, xout => redist130_signRPostExcSub0_uid183_fpFusedAddSubTest_q_39_q, clk => clk, aclr => areset );

    -- z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select(BITSELECT,957)@11
    z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b <= redist162_frac_sigb_uid29_fpFusedAddSubTest_b_4_q(5 downto 0);
    z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c <= redist162_frac_sigb_uid29_fpFusedAddSubTest_b_4_q(11 downto 6);
    z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_d <= redist162_frac_sigb_uid29_fpFusedAddSubTest_b_4_q(17 downto 12);
    z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_e <= redist162_frac_sigb_uid29_fpFusedAddSubTest_b_4_q(22 downto 18);

    -- eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,302)@11 + 1
    eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_qi <= "1" WHEN z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_e = c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e ELSE "0";
    eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist102_eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_q_2(DELAY,1112)
    redist102_eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_q, xout => redist102_eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid512_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select(BITSELECT,996)@11
    x0_uid512_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b <= z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_d(2 downto 0);
    x0_uid512_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c <= z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid517_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,516)@11 + 1
    eq1_uid517_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_qi <= "1" WHEN x0_uid512_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c = y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid517_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid517_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => eq1_uid517_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid514_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,513)@11 + 1
    eq0_uid514_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_qi <= "1" WHEN x0_uid512_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b = y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid514_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid514_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => eq0_uid514_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid518_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,517)@12 + 1
    andEq_uid518_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_qi <= eq0_uid514_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_q and eq1_uid517_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_q;
    andEq_uid518_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid518_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => andEq_uid518_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- x0_uid505_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select(BITSELECT,995)@11
    x0_uid505_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b <= z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c(2 downto 0);
    x0_uid505_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c <= z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid510_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,509)@11 + 1
    eq1_uid510_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_qi <= "1" WHEN x0_uid505_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c = y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid510_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid510_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => eq1_uid510_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid507_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,506)@11 + 1
    eq0_uid507_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_qi <= "1" WHEN x0_uid505_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b = y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid507_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid507_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => eq0_uid507_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid511_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,510)@12 + 1
    andEq_uid511_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_qi <= eq0_uid507_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_q and eq1_uid510_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_q;
    andEq_uid511_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid511_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => andEq_uid511_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- x0_uid498_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select(BITSELECT,994)@11
    x0_uid498_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b <= z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid498_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c <= z0_uid292_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid503_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,502)@11 + 1
    eq1_uid503_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_qi <= "1" WHEN x0_uid498_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c = y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid503_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid503_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => eq1_uid503_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid500_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,499)@11 + 1
    eq0_uid500_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_qi <= "1" WHEN x0_uid498_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b = y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid500_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid500_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => eq0_uid500_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid504_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,503)@12 + 1
    andEq_uid504_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_qi <= eq0_uid500_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_q and eq1_uid503_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_q;
    andEq_uid504_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid504_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => andEq_uid504_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,303)@13 + 1
    and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_qi <= andEq_uid504_eq0_uid294_fracXIsZero_uid32_fpFusedAddSubTest_q and andEq_uid511_eq1_uid297_fracXIsZero_uid32_fpFusedAddSubTest_q and andEq_uid518_eq2_uid300_fracXIsZero_uid32_fpFusedAddSubTest_q and redist102_eq3_uid303_fracXIsZero_uid32_fpFusedAddSubTest_q_2_q;
    and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist101_and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q_30(DELAY,1111)
    redist101_and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q_30 : dspba_delay
    GENERIC MAP ( width => 1, depth => 29, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q, xout => redist101_and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q_30_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid33_fpFusedAddSubTest(LOGICAL,32)@43
    fracXIsNotZero_uid33_fpFusedAddSubTest_q <= not (redist101_and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q_30_q);

    -- eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest(LOGICAL,289)@7 + 1
    eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_qi <= "1" WHEN z0_uid278_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_c = c0_uid259_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_qi, xout => eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist104_eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_q_2(DELAY,1114)
    redist104_eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_q, xout => redist104_eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- eq1_uid496_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest(LOGICAL,495)@7 + 1
    eq1_uid496_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_qi <= "1" WHEN x0_uid484_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_c = y0_uid457_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid496_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid496_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_qi, xout => eq1_uid496_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid493_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest(LOGICAL,492)@7 + 1
    eq0_uid493_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_qi <= "1" WHEN x0_uid484_eq0_uid280_excZ_sigb_uid10_uid30_fpFusedAddSubTest_merged_bit_select_b = y0_uid457_eq0_uid260_expXIsMax_uid17_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid493_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid493_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_qi, xout => eq0_uid493_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid497_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest(LOGICAL,496)@8 + 1
    andEq_uid497_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_qi <= eq0_uid493_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_q and eq1_uid496_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_q;
    andEq_uid497_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid497_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_qi, xout => andEq_uid497_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest(LOGICAL,290)@9 + 1
    and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_qi <= andEq_uid497_eq0_uid287_expXIsMax_uid31_fpFusedAddSubTest_q and redist104_eq1_uid290_expXIsMax_uid31_fpFusedAddSubTest_q_2_q;
    and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_qi, xout => and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist103_and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q_34(DELAY,1113)
    redist103_and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q_34 : dspba_delay
    GENERIC MAP ( width => 1, depth => 33, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q, xout => redist103_and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q_34_q, clk => clk, aclr => areset );

    -- excN_sigb_uid35_fpFusedAddSubTest(LOGICAL,34)@43 + 1
    excN_sigb_uid35_fpFusedAddSubTest_qi <= redist103_and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q_34_q and fracXIsNotZero_uid33_fpFusedAddSubTest_q;
    excN_sigb_uid35_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_sigb_uid35_fpFusedAddSubTest_qi, xout => excN_sigb_uid35_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist160_excN_sigb_uid35_fpFusedAddSubTest_q_2(DELAY,1170)
    redist160_excN_sigb_uid35_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_sigb_uid35_fpFusedAddSubTest_q, xout => redist160_excN_sigb_uid35_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,955)@17
    z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= redist166_frac_siga_uid15_fpFusedAddSubTest_b_11_q(5 downto 0);
    z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= redist166_frac_siga_uid15_fpFusedAddSubTest_b_11_q(11 downto 6);
    z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d <= redist166_frac_siga_uid15_fpFusedAddSubTest_b_11_q(17 downto 12);
    z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e <= redist166_frac_siga_uid15_fpFusedAddSubTest_b_11_q(22 downto 18);

    -- eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,275)@17 + 1
    eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_qi <= "1" WHEN z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e = c0_uid266_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e ELSE "0";
    eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist111_eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_q_2(DELAY,1121)
    redist111_eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_q, xout => redist111_eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid477_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,992)@17
    x0_uid477_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d(2 downto 0);
    x0_uid477_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d(5 downto 3);

    -- eq1_uid482_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,481)@17 + 1
    eq1_uid482_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_qi <= "1" WHEN x0_uid477_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c = y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid482_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid482_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => eq1_uid482_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid479_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,478)@17 + 1
    eq0_uid479_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_qi <= "1" WHEN x0_uid477_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b = y0_uid478_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid479_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid479_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => eq0_uid479_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid483_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,482)@18 + 1
    andEq_uid483_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_qi <= eq0_uid479_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_q and eq1_uid482_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_q;
    andEq_uid483_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid483_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => andEq_uid483_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- x0_uid470_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,991)@17
    x0_uid470_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c(2 downto 0);
    x0_uid470_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid475_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,474)@17 + 1
    eq1_uid475_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_qi <= "1" WHEN x0_uid470_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c = y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid475_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid475_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => eq1_uid475_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid472_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,471)@17 + 1
    eq0_uid472_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_qi <= "1" WHEN x0_uid470_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b = y0_uid471_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid472_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid472_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => eq0_uid472_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid476_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,475)@18 + 1
    andEq_uid476_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_qi <= eq0_uid472_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_q and eq1_uid475_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_q;
    andEq_uid476_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid476_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => andEq_uid476_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- x0_uid463_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,990)@17
    x0_uid463_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid463_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= z0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid468_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,467)@17 + 1
    eq1_uid468_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_qi <= "1" WHEN x0_uid463_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c = y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid468_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid468_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => eq1_uid468_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid465_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,464)@17 + 1
    eq0_uid465_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_qi <= "1" WHEN x0_uid463_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b = y0_uid464_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid465_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid465_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => eq0_uid465_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid469_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,468)@18 + 1
    andEq_uid469_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_qi <= eq0_uid465_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_q and eq1_uid468_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_q;
    andEq_uid469_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid469_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => andEq_uid469_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,276)@19 + 1
    and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_qi <= andEq_uid469_eq0_uid267_fracXIsZero_uid18_fpFusedAddSubTest_q and andEq_uid476_eq1_uid270_fracXIsZero_uid18_fpFusedAddSubTest_q and andEq_uid483_eq2_uid273_fracXIsZero_uid18_fpFusedAddSubTest_q and redist111_eq3_uid276_fracXIsZero_uid18_fpFusedAddSubTest_q_2_q;
    and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist110_and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q_24(DELAY,1120)
    redist110_and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q, xout => redist110_and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q_24_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid19_fpFusedAddSubTest(LOGICAL,18)@43
    fracXIsNotZero_uid19_fpFusedAddSubTest_q <= not (redist110_and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q_24_q);

    -- excN_siga_uid21_fpFusedAddSubTest(LOGICAL,20)@43 + 1
    excN_siga_uid21_fpFusedAddSubTest_qi <= and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest_q and fracXIsNotZero_uid19_fpFusedAddSubTest_q;
    excN_siga_uid21_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_siga_uid21_fpFusedAddSubTest_qi, xout => excN_siga_uid21_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist164_excN_siga_uid21_fpFusedAddSubTest_q_2(DELAY,1174)
    redist164_excN_siga_uid21_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_siga_uid21_fpFusedAddSubTest_q, xout => redist164_excN_siga_uid21_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- effSub_uid45_fpFusedAddSubTest(LOGICAL,44)@43 + 1
    effSub_uid45_fpFusedAddSubTest_qi <= redist155_sigA_uid43_fpFusedAddSubTest_b_37_q xor redist153_sigB_uid44_fpFusedAddSubTest_b_36_q;
    effSub_uid45_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid45_fpFusedAddSubTest_qi, xout => effSub_uid45_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invEffSub_uid134_fpFusedAddSubTest(LOGICAL,133)@44
    invEffSub_uid134_fpFusedAddSubTest_q <= not (effSub_uid45_fpFusedAddSubTest_q);

    -- excI_sigb_uid34_fpFusedAddSubTest(LOGICAL,33)@43 + 1
    excI_sigb_uid34_fpFusedAddSubTest_qi <= redist103_and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q_34_q and redist101_and_lev0_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q_30_q;
    excI_sigb_uid34_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_sigb_uid34_fpFusedAddSubTest_qi, xout => excI_sigb_uid34_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- excI_siga_uid20_fpFusedAddSubTest(LOGICAL,19)@43 + 1
    excI_siga_uid20_fpFusedAddSubTest_qi <= and_lev0_uid264_expXIsMax_uid17_fpFusedAddSubTest_q and redist110_and_lev0_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q_24_q;
    excI_siga_uid20_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_siga_uid20_fpFusedAddSubTest_qi, xout => excI_siga_uid20_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- infPinfForSub_uid135_fpFusedAddSubTest(LOGICAL,134)@44 + 1
    infPinfForSub_uid135_fpFusedAddSubTest_qi <= excI_siga_uid20_fpFusedAddSubTest_q and excI_sigb_uid34_fpFusedAddSubTest_q and invEffSub_uid134_fpFusedAddSubTest_q;
    infPinfForSub_uid135_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => infPinfForSub_uid135_fpFusedAddSubTest_qi, xout => infPinfForSub_uid135_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- excRNaNS_uid136_fpFusedAddSubTest(LOGICAL,135)@45 + 1
    excRNaNS_uid136_fpFusedAddSubTest_qi <= infPinfForSub_uid135_fpFusedAddSubTest_q or redist164_excN_siga_uid21_fpFusedAddSubTest_q_2_q or redist160_excN_sigb_uid35_fpFusedAddSubTest_q_2_q;
    excRNaNS_uid136_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaNS_uid136_fpFusedAddSubTest_qi, xout => excRNaNS_uid136_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invExcRNaNS_uid184_fpFusedAddSubTest(LOGICAL,183)@46
    invExcRNaNS_uid184_fpFusedAddSubTest_q <= not (excRNaNS_uid136_fpFusedAddSubTest_q);

    -- signRPostExcSub_uid185_fpFusedAddSubTest(LOGICAL,184)@46 + 1
    signRPostExcSub_uid185_fpFusedAddSubTest_qi <= invExcRNaNS_uid184_fpFusedAddSubTest_q and redist130_signRPostExcSub0_uid183_fpFusedAddSubTest_q_39_q and invSignInputsZeroForSub_uid176_fpFusedAddSubTest_q and invPositiveExc_uid174_fpFusedAddSubTest_q;
    signRPostExcSub_uid185_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub_uid185_fpFusedAddSubTest_qi, xout => signRPostExcSub_uid185_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist129_signRPostExcSub_uid185_fpFusedAddSubTest_q_5(DELAY,1139)
    redist129_signRPostExcSub_uid185_fpFusedAddSubTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub_uid185_fpFusedAddSubTest_q, xout => redist129_signRPostExcSub_uid185_fpFusedAddSubTest_q_5_q, clk => clk, aclr => areset );

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b(CONSTANT,675)
    expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b_q <= "0000000000000000000000000000000000";

    -- cRBit_sub_uid94_fpFusedAddSubTest(CONSTANT,93)
    cRBit_sub_uid94_fpFusedAddSubTest_q <= "01000";

    -- leftShiftStage1Idx3Rng6_uid398_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,397)@35
    leftShiftStage1Idx3Rng6_uid398_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q(21 downto 0);
    leftShiftStage1Idx3Rng6_uid398_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage1Idx3Rng6_uid398_fracPostNormAdd_uid78_fpFusedAddSubTest_in(21 downto 0);

    -- leftShiftStage1Idx3_uid399_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,398)@35
    leftShiftStage1Idx3_uid399_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx3Rng6_uid398_fracPostNormAdd_uid78_fpFusedAddSubTest_b & rightShiftStage1Idx3Pad6_uid325_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx2Rng4_uid395_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,394)@35
    leftShiftStage1Idx2Rng4_uid395_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q(23 downto 0);
    leftShiftStage1Idx2Rng4_uid395_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage1Idx2Rng4_uid395_fracPostNormAdd_uid78_fpFusedAddSubTest_in(23 downto 0);

    -- leftShiftStage1Idx2_uid396_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,395)@35
    leftShiftStage1Idx2_uid396_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx2Rng4_uid395_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx1Rng2_uid392_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,391)@35
    leftShiftStage1Idx1Rng2_uid392_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q(25 downto 0);
    leftShiftStage1Idx1Rng2_uid392_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage1Idx1Rng2_uid392_fracPostNormAdd_uid78_fpFusedAddSubTest_in(25 downto 0);

    -- leftShiftStage1Idx1_uid393_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,392)@35
    leftShiftStage1Idx1_uid393_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx1Rng2_uid392_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx3Rng24_uid387_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,386)@34
    leftShiftStage0Idx3Rng24_uid387_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= redist147_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_12_q(3 downto 0);
    leftShiftStage0Idx3Rng24_uid387_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage0Idx3Rng24_uid387_fracPostNormAdd_uid78_fpFusedAddSubTest_in(3 downto 0);

    -- leftShiftStage0Idx3_uid388_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,387)@34
    leftShiftStage0Idx3_uid388_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx3Rng24_uid387_fracPostNormAdd_uid78_fpFusedAddSubTest_b & rightShiftStage0Idx3Pad24_uid314_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- fracResAdd_uid72_fpFusedAddSubTest_p1_of_5(ADD,639)@17 + 1
    fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_a <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_a_b);
    fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_b <= STD_LOGIC_VECTOR("0" & redist62_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_b_b_1_q);
    fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_a) + UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_b));
        END IF;
    END PROCESS;
    fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_c(0) <= fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_o(6);
    fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_q <= fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_o(5 downto 0);

    -- fracResAdd_uid72_fpFusedAddSubTest_p2_of_5(ADD,640)@18 + 1
    fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_cin <= fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_c;
    fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_a <= STD_LOGIC_VECTOR("0" & redist63_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_c_1_q) & '1';
    fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_b <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b) & fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_cin(0);
    fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_a) + UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_b));
        END IF;
    END PROCESS;
    fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_c(0) <= fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_o(7);
    fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_q <= fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_o(6 downto 1);

    -- fracResAdd_uid72_fpFusedAddSubTest_p3_of_5(ADD,641)@19 + 1
    fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_cin <= fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_c;
    fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_a <= STD_LOGIC_VECTOR("0" & redist64_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_d_2_q) & '1';
    fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_b <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_d_q) & fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_cin(0);
    fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_a) + UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_b));
        END IF;
    END PROCESS;
    fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_c(0) <= fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_o(7);
    fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_q <= fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_o(6 downto 1);

    -- fracResAdd_uid72_fpFusedAddSubTest_p4_of_5(ADD,642)@20 + 1
    fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_cin <= fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_c;
    fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_a <= STD_LOGIC_VECTOR("0" & redist65_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_e_3_q) & '1';
    fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_b <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_e_q) & fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_cin(0);
    fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_a) + UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_b));
        END IF;
    END PROCESS;
    fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_c(0) <= fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_o(7);
    fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_q <= fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_o(6 downto 1);

    -- fracResAdd_uid72_fpFusedAddSubTest_p5_of_5(ADD,643)@21 + 1
    fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_cin <= fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_c;
    fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_a <= STD_LOGIC_VECTOR("0" & redist66_fracResAdd_uid72_fpFusedAddSubTest_BitSelect_for_a_f_4_q) & '1';
    fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_b <= STD_LOGIC_VECTOR("0" & fracResSub_uid71_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_f_q) & fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_cin(0);
    fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_a) + UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_b));
        END IF;
    END PROCESS;
    fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_q <= fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_o(6 downto 1);

    -- redist58_fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_q_1(DELAY,1068)
    redist58_fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_q, xout => redist58_fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_q_1_q, clk => clk, aclr => areset );

    -- redist59_fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_q_2(DELAY,1069)
    redist59_fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_q, xout => redist59_fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_q_2_q, clk => clk, aclr => areset );

    -- redist60_fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_q_3(DELAY,1070)
    redist60_fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_q, xout => redist60_fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_q_3_q, clk => clk, aclr => areset );

    -- redist61_fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_q_4(DELAY,1071)
    redist61_fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_q, xout => redist61_fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_q_4_q, clk => clk, aclr => areset );

    -- fracResAdd_uid72_fpFusedAddSubTest_BitJoin_for_q(BITJOIN,644)@22
    fracResAdd_uid72_fpFusedAddSubTest_BitJoin_for_q_q <= fracResAdd_uid72_fpFusedAddSubTest_p5_of_5_q & redist58_fracResAdd_uid72_fpFusedAddSubTest_p4_of_5_q_1_q & redist59_fracResAdd_uid72_fpFusedAddSubTest_p3_of_5_q_2_q & redist60_fracResAdd_uid72_fpFusedAddSubTest_p2_of_5_q_3_q & redist61_fracResAdd_uid72_fpFusedAddSubTest_p1_of_5_q_4_q;

    -- fracResAddNoSignExt_uid74_fpFusedAddSubTest(BITSELECT,73)@22
    fracResAddNoSignExt_uid74_fpFusedAddSubTest_in <= fracResAdd_uid72_fpFusedAddSubTest_BitJoin_for_q_q(27 downto 0);
    fracResAddNoSignExt_uid74_fpFusedAddSubTest_b <= fracResAddNoSignExt_uid74_fpFusedAddSubTest_in(27 downto 0);

    -- redist146_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3(DELAY,1156)
    redist146_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3 : dspba_delay
    GENERIC MAP ( width => 28, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResAddNoSignExt_uid74_fpFusedAddSubTest_b, xout => redist146_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q, clk => clk, aclr => areset );

    -- vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest(BITSELECT,223)@25
    vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_in <= redist146_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q(11 downto 0);
    vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_b <= vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_in(11 downto 0);

    -- redist121_vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_b_9(DELAY,1131)
    redist121_vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_b_9 : dspba_delay
    GENERIC MAP ( width => 12, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_b, xout => redist121_vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_b_9_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid385_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,384)@34
    leftShiftStage0Idx2_uid385_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= redist121_vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_b_9_q & zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx1Rng8_uid381_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,380)@34
    leftShiftStage0Idx1Rng8_uid381_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= redist147_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_12_q(19 downto 0);
    leftShiftStage0Idx1Rng8_uid381_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage0Idx1Rng8_uid381_fracPostNormAdd_uid78_fpFusedAddSubTest_in(19 downto 0);

    -- leftShiftStage0Idx1_uid382_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,381)@34
    leftShiftStage0Idx1_uid382_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx1Rng8_uid381_fracPostNormAdd_uid78_fpFusedAddSubTest_b & cstAllZWE_uid13_fpFusedAddSubTest_q;

    -- redist147_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_12(DELAY,1157)
    redist147_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_12 : dspba_delay
    GENERIC MAP ( width => 28, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist146_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q, xout => redist147_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_12_q, clk => clk, aclr => areset );

    -- rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest(BITSELECT,220)@22
    rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b <= fracResAddNoSignExt_uid74_fpFusedAddSubTest_b(27 downto 12);

    -- z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,968)@22
    z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b(5 downto 0);
    z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b(11 downto 6);
    z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_d <= rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b(15 downto 12);

    -- eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,439)@22 + 1
    eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_d = c0_uid416_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_d ELSE "0";
    eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist94_eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_2(DELAY,1104)
    redist94_eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist94_eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid575_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,1008)@22
    x0_uid575_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c(2 downto 0);
    x0_uid575_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c(5 downto 3);

    -- eq1_uid580_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,579)@22 + 1
    eq1_uid580_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN x0_uid575_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c = y0_uid555_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid580_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid580_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => eq1_uid580_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid577_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,576)@22 + 1
    eq0_uid577_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN x0_uid575_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = y0_uid555_eq1_uid420_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid577_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid577_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => eq0_uid577_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid581_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,580)@23 + 1
    andEq_uid581_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= eq0_uid577_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q and eq1_uid580_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    andEq_uid581_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid581_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => andEq_uid581_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- x0_uid568_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,1007)@22
    x0_uid568_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid568_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= z0_uid432_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid573_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,572)@22 + 1
    eq1_uid573_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN x0_uid568_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c = y0_uid548_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid573_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid573_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => eq1_uid573_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid570_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,569)@22 + 1
    eq0_uid570_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN x0_uid568_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = y0_uid548_eq0_uid417_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid570_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid570_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => eq0_uid570_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid574_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,573)@23 + 1
    andEq_uid574_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= eq0_uid570_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q and eq1_uid573_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    andEq_uid574_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid574_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => andEq_uid574_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,440)@24 + 1
    and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= andEq_uid574_eq0_uid434_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q and andEq_uid581_eq1_uid437_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q and redist94_eq2_uid440_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q;
    and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist93_and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_9(DELAY,1103)
    redist93_and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist93_and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_9_q, clk => clk, aclr => areset );

    -- cStage_uid225_lzCountValAdd_uid77_fpFusedAddSubTest(BITJOIN,224)@25
    cStage_uid225_lzCountValAdd_uid77_fpFusedAddSubTest_q <= vStage_uid224_lzCountValAdd_uid77_fpFusedAddSubTest_b & mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- redist122_rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b_3(DELAY,1132)
    redist122_rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b_3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b, xout => redist122_rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b_3_q, clk => clk, aclr => areset );

    -- vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,226)@25 + 1
    vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_s <= and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist122_rVStage_uid221_lzCountValAdd_uid77_fpFusedAddSubTest_b_3_q;
                WHEN "1" => vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_q <= cStage_uid225_lzCountValAdd_uid77_fpFusedAddSubTest_q;
                WHEN OTHERS => vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,969)@26
    rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_q(15 downto 8);
    rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_q(7 downto 0);

    -- z0_uid442_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,1009)@26
    z0_uid442_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b(5 downto 0);
    z0_uid442_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b(7 downto 6);

    -- eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,446)@26 + 1
    eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN z0_uid442_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c = c0_uid252_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist92_eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_2(DELAY,1102)
    redist92_eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist92_eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- x0_uid582_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,974)@26
    x0_uid582_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= z0_uid442_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid582_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= z0_uid442_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid587_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,586)@26 + 1
    eq1_uid587_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN x0_uid582_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c = y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid587_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid587_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => eq1_uid587_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid584_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,583)@26 + 1
    eq0_uid584_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN x0_uid582_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = y0_uid450_eq0_uid253_excZ_siga_uid9_uid16_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid584_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid584_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => eq0_uid584_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid588_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,587)@27 + 1
    andEq_uid588_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= eq0_uid584_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q and eq1_uid587_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    andEq_uid588_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid588_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => andEq_uid588_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,447)@28 + 1
    and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= andEq_uid588_eq0_uid444_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q and redist92_eq1_uid447_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q;
    and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist91_and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_5(DELAY,1101)
    redist91_and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist91_and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_5_q, clk => clk, aclr => areset );

    -- redist10_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_3(DELAY,1020)
    redist10_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c, xout => redist10_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_3_q, clk => clk, aclr => areset );

    -- redist9_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_3(DELAY,1019)
    redist9_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b, xout => redist9_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_3_q, clk => clk, aclr => areset );

    -- vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,232)@29 + 1
    vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_s <= and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist9_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_3_q;
                WHEN "1" => vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist10_rVStage_uid229_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_3_q;
                WHEN OTHERS => vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,970)@30
    rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q(7 downto 4);
    rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q(3 downto 0);

    -- vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,235)@30 + 1
    vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";
    vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist120_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3(DELAY,1130)
    redist120_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist120_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- redist8_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,1018)
    redist8_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c, xout => redist8_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist7_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1(DELAY,1017)
    redist7_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b, xout => redist7_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,238)@31 + 1
    vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist7_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q;
                WHEN "1" => vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist8_rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q;
                WHEN OTHERS => vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,971)@32
    rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q(3 downto 2);
    rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q(1 downto 0);

    -- vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,241)@32 + 1
    vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";
    vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist6_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,1016)
    redist6_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c, xout => redist6_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist5_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1(DELAY,1015)
    redist5_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b, xout => redist5_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,244)@33
    vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s, redist5_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q, redist6_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist5_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist6_rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest(BITSELECT,246)@33
    rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_b <= vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q(1 downto 1);

    -- vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,247)@33
    vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_b = GND_q ELSE "0";

    -- r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest(BITJOIN,248)@33
    r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist93_and_lev0_uid441_vCount_uid222_lzCountValAdd_uid77_fpFusedAddSubTest_q_9_q & redist91_and_lev0_uid448_vCount_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_q_5_q & redist120_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3_q & vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q & vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q;

    -- redist118_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_1(DELAY,1128)
    redist118_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist118_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select(BITSELECT,972)@34
    leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_b <= redist118_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q(4 downto 3);
    leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c <= redist118_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q(2 downto 1);
    leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d <= redist118_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q(0 downto 0);

    -- leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest(MUX,389)@34 + 1
    leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_s <= leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_b;
    leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_s) IS
                WHEN "00" => leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= redist147_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_12_q;
                WHEN "01" => leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx1_uid382_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "10" => leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx2_uid385_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "11" => leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx3_uid388_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN OTHERS => leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist3_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,1013)
    redist3_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c, xout => redist3_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest(MUX,400)@35 + 1
    leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_s <= redist3_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1_q;
    leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_s) IS
                WHEN "00" => leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0_uid390_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "01" => leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx1_uid393_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "10" => leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx2_uid396_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "11" => leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx3_uid399_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN OTHERS => leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2Idx1Rng1_uid403_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,402)@36
    leftShiftStage2Idx1Rng1_uid403_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(26 downto 0);
    leftShiftStage2Idx1Rng1_uid403_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage2Idx1Rng1_uid403_fracPostNormAdd_uid78_fpFusedAddSubTest_in(26 downto 0);

    -- leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,403)@36
    leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx1Rng1_uid403_fracPostNormAdd_uid78_fpFusedAddSubTest_b & GND_q;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,759)@36
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_c <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(1 downto 1);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_d <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(2 downto 2);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_e <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(5 downto 3);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_f <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(6 downto 6);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_g <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(7 downto 7);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_h <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(8 downto 8);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_i <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(9 downto 9);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_j <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(10 downto 10);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_k <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(11 downto 11);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_l <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(12 downto 12);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_m <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(13 downto 13);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_n <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(14 downto 14);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_o <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(15 downto 15);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_p <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(16 downto 16);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_q <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(17 downto 17);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_r <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(18 downto 18);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_s <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(19 downto 19);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_t <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(20 downto 20);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_u <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(21 downto 21);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_v <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(22 downto 22);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_w <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(23 downto 23);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_x <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(24 downto 24);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_y <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(25 downto 25);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_z <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(26 downto 26);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_aa <= leftShiftStage2Idx1_uid404_fracPostNormAdd_uid78_fpFusedAddSubTest_q(27 downto 27);

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a(BITSELECT,760)@36
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_b <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(0 downto 0);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_c <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(1 downto 1);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_d <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(2 downto 2);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_e <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(5 downto 3);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_f <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(6 downto 6);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_g <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(7 downto 7);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_h <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(8 downto 8);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_i <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(9 downto 9);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_j <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(10 downto 10);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_k <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(11 downto 11);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_l <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(12 downto 12);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_m <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(13 downto 13);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_n <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(14 downto 14);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_o <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(15 downto 15);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_p <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(16 downto 16);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_q <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(17 downto 17);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_r <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(18 downto 18);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_s <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(19 downto 19);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_t <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(20 downto 20);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_u <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(21 downto 21);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_v <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(22 downto 22);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_w <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(23 downto 23);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_x <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(24 downto 24);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_y <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(25 downto 25);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_z <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(26 downto 26);
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_aa <= leftShiftStage1_uid401_fracPostNormAdd_uid78_fpFusedAddSubTest_q(27 downto 27);

    -- redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2(DELAY,1014)
    redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d, xout => redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q, clk => clk, aclr => areset );

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25(MUX,786)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_aa;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_aa;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24(MUX,785)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_z;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_z;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23(MUX,784)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_y;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_y;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22(MUX,783)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_x;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_x;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21(MUX,782)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_w;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_w;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20(MUX,781)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_v;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_v;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19(MUX,780)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_u;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_u;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18(MUX,779)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_t;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_t;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17(MUX,778)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_s;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_s;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16(MUX,777)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_r;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_r;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15(MUX,776)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_q;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_q;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14(MUX,775)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_p;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_p;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13(MUX,774)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_o;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_o;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12(MUX,773)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_n;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_n;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11(MUX,772)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_m;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_m;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10(MUX,771)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_l;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_l;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9(MUX,770)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_k;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_k;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8(MUX,769)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_j;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_j;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7(MUX,768)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_i;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_i;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6(MUX,767)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_h;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_h;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5(MUX,766)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_g;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_g;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4(MUX,765)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_f;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_f;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3(MUX,764)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_e;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_e;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2(MUX,763)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_d;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_d;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1(MUX,762)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_c;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_b_c;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0(MUX,761)@36 + 1
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_s <= redist4_leftShiftStageSel4Dto3_uid389_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_s) IS
                WHEN "0" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitSelect_for_a_b;
                WHEN "1" => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_q <= GND_q;
                WHEN OTHERS => leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitJoin_for_q(BITJOIN,787)@37
    leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitJoin_for_q_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p25_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p2_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p1_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p0_q;

    -- sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select(BITSELECT,983)@37
    sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_BitJoin_for_q_q(4 downto 0));
    sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_b <= STD_LOGIC_VECTOR(sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_in(0 downto 0));
    sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_c <= STD_LOGIC_VECTOR(sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_in(1 downto 1));
    sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_d <= STD_LOGIC_VECTOR(sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_in(2 downto 2));
    sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_e <= STD_LOGIC_VECTOR(sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_in(3 downto 3));
    sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_f <= STD_LOGIC_VECTOR(sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_in(4 downto 4));

    -- rndBitCond_add_uid103_fpFusedAddSubTest(BITJOIN,102)@37
    rndBitCond_add_uid103_fpFusedAddSubTest_q <= sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_f & sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_e & sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_d & sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_c & sticky0_add_uid98_fpFusedAddSubTest_merged_bit_select_b;

    -- rBi_add_uid105_fpFusedAddSubTest(LOGICAL,104)@37 + 1
    rBi_add_uid105_fpFusedAddSubTest_qi <= "1" WHEN rndBitCond_add_uid103_fpFusedAddSubTest_q = cRBit_sub_uid94_fpFusedAddSubTest_q ELSE "0";
    rBi_add_uid105_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_add_uid105_fpFusedAddSubTest_qi, xout => rBi_add_uid105_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- roundBit_add_uid106_fpFusedAddSubTest(LOGICAL,105)@38
    roundBit_add_uid106_fpFusedAddSubTest_q <= not (rBi_add_uid105_fpFusedAddSubTest_q);

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_BitExpansion_for_b(BITJOIN,687)@38
    expFracRAddPostRound_uid107_fpFusedAddSubTest_BitExpansion_for_b_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b_q & roundBit_add_uid106_fpFusedAddSubTest_q;

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,690)@38
    expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_b_b <= expFracRAddPostRound_uid107_fpFusedAddSubTest_BitExpansion_for_b_q(5 downto 0);

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,898)@37
    expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p6_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p5_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p4_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p3_q;

    -- redist24_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1(DELAY,1034)
    redist24_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q, xout => redist24_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1_q, clk => clk, aclr => areset );

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6(ADD,691)@38 + 1
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & redist24_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1_q);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_b_b);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_a) + UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_b));
        END IF;
    END PROCESS;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_c(0) <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_o(6);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_q <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_o(5 downto 0);

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,905)@37
    expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p12_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p11_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p10_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p9_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p8_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p7_q;

    -- redist23_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q_2(DELAY,1033)
    redist23_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q, xout => redist23_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q_2_q, clk => clk, aclr => areset );

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6(ADD,692)@39 + 1
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_cin <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_c;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & redist23_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q_2_q) & '1';
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_b) & expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_cin(0);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_a) + UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_b));
        END IF;
    END PROCESS;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_c(0) <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_o(7);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_q <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_o(6 downto 1);

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d(BITJOIN,912)@37
    expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p18_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p17_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p16_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p15_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p14_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p13_q;

    -- redist22_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3(DELAY,1032)
    redist22_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q, xout => redist22_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3_q, clk => clk, aclr => areset );

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6(ADD,693)@40 + 1
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_cin <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_c;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & redist22_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3_q) & '1';
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_c) & expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_cin(0);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_a) + UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_b));
        END IF;
    END PROCESS;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_c(0) <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_o(7);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_q <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_o(6 downto 1);

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e(BITJOIN,919)@37
    expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q <= leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p24_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p23_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p22_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p21_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p20_q & leftShiftStage2_uid406_fracPostNormAdd_uid78_fpFusedAddSubTest_p19_q;

    -- redist21_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4(DELAY,1031)
    redist21_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q, xout => redist21_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4_q, clk => clk, aclr => areset );

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6(ADD,694)@41 + 1
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_cin <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_c;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & redist21_expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4_q) & '1';
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_d) & expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_cin(0);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_a) + UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_b));
        END IF;
    END PROCESS;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_c(0) <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_o(7);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_q <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_o(6 downto 1);

    -- redist119_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_8(DELAY,1129)
    redist119_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_8 : dspba_delay
    GENERIC MAP ( width => 5, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist118_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q, xout => redist119_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_8_q, clk => clk, aclr => areset );

    -- expPostNormAdd_uid83_fpFusedAddSubTest_BitExpansion_for_b(BITJOIN,665)@41
    expPostNormAdd_uid83_fpFusedAddSubTest_BitExpansion_for_b_q <= shiftedOut_uid51_fpFusedAddSubTest_UpperBits_for_a_q & redist119_r_uid249_lzCountValAdd_uid77_fpFusedAddSubTest_q_8_q;

    -- expPostNormAdd_uid83_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,668)@41
    expPostNormAdd_uid83_fpFusedAddSubTest_BitSelect_for_b_b <= expPostNormAdd_uid83_fpFusedAddSubTest_BitExpansion_for_b_q(5 downto 0);

    -- expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_tessel0_1_merged_bit_select(BITSELECT,976)
    expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(cstAllZWE_uid13_fpFusedAddSubTest_q(4 downto 0));
    expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(cstAllZWE_uid13_fpFusedAddSubTest_q(7 downto 5));

    -- expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_b(BITJOIN,836)@40
    expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_b_q <= expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_tessel0_1_merged_bit_select_b & VCC_q;

    -- expInc_uid81_fpFusedAddSubTest_BitExpansion_for_a(BITJOIN,645)@40
    expInc_uid81_fpFusedAddSubTest_BitExpansion_for_a_q <= GND_q & redist168_exp_siga_uid14_fpFusedAddSubTest_b_34_q;

    -- expInc_uid81_fpFusedAddSubTest_BitSelect_for_a(BITSELECT,649)@40
    expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_b <= expInc_uid81_fpFusedAddSubTest_BitExpansion_for_a_q(5 downto 0);
    expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_c <= expInc_uid81_fpFusedAddSubTest_BitExpansion_for_a_q(8 downto 6);

    -- expInc_uid81_fpFusedAddSubTest_p1_of_2(ADD,651)@40 + 1
    expInc_uid81_fpFusedAddSubTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_b);
    expInc_uid81_fpFusedAddSubTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_b_q);
    expInc_uid81_fpFusedAddSubTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expInc_uid81_fpFusedAddSubTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expInc_uid81_fpFusedAddSubTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid81_fpFusedAddSubTest_p1_of_2_a) + UNSIGNED(expInc_uid81_fpFusedAddSubTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expInc_uid81_fpFusedAddSubTest_p1_of_2_c(0) <= expInc_uid81_fpFusedAddSubTest_p1_of_2_o(6);
    expInc_uid81_fpFusedAddSubTest_p1_of_2_q <= expInc_uid81_fpFusedAddSubTest_p1_of_2_o(5 downto 0);

    -- expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2(SUB,669)@41 + 1
    expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expInc_uid81_fpFusedAddSubTest_p1_of_2_q);
    expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expPostNormAdd_uid83_fpFusedAddSubTest_BitSelect_for_b_b);
    expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_a) - UNSIGNED(expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_c(0) <= expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_o(6);
    expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_q <= expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_o(5 downto 0);

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6(ADD,695)@42 + 1
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_cin <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_c;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_q) & '1';
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_e) & expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_cin(0);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_a) + UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_b));
        END IF;
    END PROCESS;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_c(0) <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_o(7);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_q <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_o(6 downto 1);

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select(BITSELECT,977)
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_b <= STD_LOGIC_VECTOR(expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b_q(10 downto 5));
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_c <= STD_LOGIC_VECTOR(expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b_q(16 downto 11));
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_d <= STD_LOGIC_VECTOR(expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b_q(22 downto 17));
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_e <= STD_LOGIC_VECTOR(expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b_q(28 downto 23));
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_f <= STD_LOGIC_VECTOR(expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b_q(33 downto 29));

    -- expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_b_tessel1_0(BITSELECT,844)
    expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(shiftedOut_uid51_fpFusedAddSubTest_UpperBits_for_a_q(4 downto 1));

    -- redist57_expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_c_1(DELAY,1067)
    redist57_expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_c, xout => redist57_expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_c_1_q, clk => clk, aclr => areset );

    -- expInc_uid81_fpFusedAddSubTest_p2_of_2(ADD,652)@41 + 1
    expInc_uid81_fpFusedAddSubTest_p2_of_2_cin <= expInc_uid81_fpFusedAddSubTest_p1_of_2_c;
    expInc_uid81_fpFusedAddSubTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist57_expInc_uid81_fpFusedAddSubTest_BitSelect_for_a_c_1_q) & '1';
    expInc_uid81_fpFusedAddSubTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & expInc_uid81_fpFusedAddSubTest_BitSelect_for_b_tessel0_1_merged_bit_select_c) & expInc_uid81_fpFusedAddSubTest_p2_of_2_cin(0);
    expInc_uid81_fpFusedAddSubTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expInc_uid81_fpFusedAddSubTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expInc_uid81_fpFusedAddSubTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid81_fpFusedAddSubTest_p2_of_2_a) + UNSIGNED(expInc_uid81_fpFusedAddSubTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expInc_uid81_fpFusedAddSubTest_p2_of_2_q <= expInc_uid81_fpFusedAddSubTest_p2_of_2_o(3 downto 1);

    -- expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,843)@42
    expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q <= GND_q & expInc_uid81_fpFusedAddSubTest_p2_of_2_q;

    -- expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2(SUB,670)@42 + 1
    expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_cin <= expPostNormAdd_uid83_fpFusedAddSubTest_p1_of_2_c;
    expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q) & '0';
    expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b) & expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_cin(0);
    expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_a) - UNSIGNED(expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_q <= expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_o(4 downto 1);

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_g(BITJOIN,924)@43
    expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_g_q <= GND_q & expPostNormAdd_uid83_fpFusedAddSubTest_p2_of_2_q;

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6(ADD,696)@43 + 1
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_cin <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_c;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_a <= STD_LOGIC_VECTOR("0" & expFracRAddPostRound_uid107_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_g_q) & '1';
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_f) & expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_cin(0);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_a) + UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_b));
        END IF;
    END PROCESS;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_q <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_o(5 downto 1);

    -- redist47_expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_q_1(DELAY,1057)
    redist47_expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_q, xout => redist47_expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_q_1_q, clk => clk, aclr => areset );

    -- redist48_expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_q_2(DELAY,1058)
    redist48_expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_q, xout => redist48_expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_q_2_q, clk => clk, aclr => areset );

    -- redist49_expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_q_3(DELAY,1059)
    redist49_expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_q, xout => redist49_expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_q_3_q, clk => clk, aclr => areset );

    -- redist50_expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_q_4(DELAY,1060)
    redist50_expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_q, xout => redist50_expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_q_4_q, clk => clk, aclr => areset );

    -- redist51_expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_q_5(DELAY,1061)
    redist51_expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_q_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_q, xout => redist51_expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_q_5_q, clk => clk, aclr => areset );

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest_BitJoin_for_q(BITJOIN,697)@44
    expFracRAddPostRound_uid107_fpFusedAddSubTest_BitJoin_for_q_q <= expFracRAddPostRound_uid107_fpFusedAddSubTest_p6_of_6_q & redist47_expFracRAddPostRound_uid107_fpFusedAddSubTest_p5_of_6_q_1_q & redist48_expFracRAddPostRound_uid107_fpFusedAddSubTest_p4_of_6_q_2_q & redist49_expFracRAddPostRound_uid107_fpFusedAddSubTest_p3_of_6_q_3_q & redist50_expFracRAddPostRound_uid107_fpFusedAddSubTest_p2_of_6_q_4_q & redist51_expFracRAddPostRound_uid107_fpFusedAddSubTest_p1_of_6_q_5_q;

    -- expRPreExcAdd_uid117_fpFusedAddSubTest(BITSELECT,116)@44
    expRPreExcAdd_uid117_fpFusedAddSubTest_in <= expFracRAddPostRound_uid107_fpFusedAddSubTest_BitJoin_for_q_q(31 downto 0);
    expRPreExcAdd_uid117_fpFusedAddSubTest_b <= expRPreExcAdd_uid117_fpFusedAddSubTest_in(31 downto 24);

    -- redist142_expRPreExcAdd_uid117_fpFusedAddSubTest_b_3(DELAY,1152)
    redist142_expRPreExcAdd_uid117_fpFusedAddSubTest_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExcAdd_uid117_fpFusedAddSubTest_b, xout => redist142_expRPreExcAdd_uid117_fpFusedAddSubTest_b_3_q, clk => clk, aclr => areset );

    -- leftShiftStage1Idx3Rng6_uid368_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,367)@35
    leftShiftStage1Idx3Rng6_uid368_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q(21 downto 0);
    leftShiftStage1Idx3Rng6_uid368_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage1Idx3Rng6_uid368_fracPostNormSub_uid76_fpFusedAddSubTest_in(21 downto 0);

    -- leftShiftStage1Idx3_uid369_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,368)@35
    leftShiftStage1Idx3_uid369_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx3Rng6_uid368_fracPostNormSub_uid76_fpFusedAddSubTest_b & rightShiftStage1Idx3Pad6_uid325_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx2Rng4_uid365_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,364)@35
    leftShiftStage1Idx2Rng4_uid365_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q(23 downto 0);
    leftShiftStage1Idx2Rng4_uid365_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage1Idx2Rng4_uid365_fracPostNormSub_uid76_fpFusedAddSubTest_in(23 downto 0);

    -- leftShiftStage1Idx2_uid366_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,365)@35
    leftShiftStage1Idx2_uid366_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx2Rng4_uid365_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx1Rng2_uid362_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,361)@35
    leftShiftStage1Idx1Rng2_uid362_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q(25 downto 0);
    leftShiftStage1Idx1Rng2_uid362_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage1Idx1Rng2_uid362_fracPostNormSub_uid76_fpFusedAddSubTest_in(25 downto 0);

    -- leftShiftStage1Idx1_uid363_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,362)@35
    leftShiftStage1Idx1_uid363_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx1Rng2_uid362_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx3Rng24_uid357_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,356)@34
    leftShiftStage0Idx3Rng24_uid357_fracPostNormSub_uid76_fpFusedAddSubTest_in <= redist149_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_12_q(3 downto 0);
    leftShiftStage0Idx3Rng24_uid357_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage0Idx3Rng24_uid357_fracPostNormSub_uid76_fpFusedAddSubTest_in(3 downto 0);

    -- leftShiftStage0Idx3_uid358_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,357)@34
    leftShiftStage0Idx3_uid358_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx3Rng24_uid357_fracPostNormSub_uid76_fpFusedAddSubTest_b & rightShiftStage0Idx3Pad24_uid314_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- redist127_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_9(DELAY,1137)
    redist127_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_9 : dspba_delay
    GENERIC MAP ( width => 12, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b, xout => redist127_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_9_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid355_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,354)@34
    leftShiftStage0Idx2_uid355_fracPostNormSub_uid76_fpFusedAddSubTest_q <= redist127_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_9_q & zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx1Rng8_uid351_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,350)@34
    leftShiftStage0Idx1Rng8_uid351_fracPostNormSub_uid76_fpFusedAddSubTest_in <= redist149_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_12_q(19 downto 0);
    leftShiftStage0Idx1Rng8_uid351_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage0Idx1Rng8_uid351_fracPostNormSub_uid76_fpFusedAddSubTest_in(19 downto 0);

    -- leftShiftStage0Idx1_uid352_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,351)@34
    leftShiftStage0Idx1_uid352_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx1Rng8_uid351_fracPostNormSub_uid76_fpFusedAddSubTest_b & cstAllZWE_uid13_fpFusedAddSubTest_q;

    -- redist149_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_12(DELAY,1159)
    redist149_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_12 : dspba_delay
    GENERIC MAP ( width => 28, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist148_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q, xout => redist149_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_12_q, clk => clk, aclr => areset );

    -- leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select(BITSELECT,967)@34
    leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_b <= r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q(4 downto 3);
    leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c <= r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q(2 downto 1);
    leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d <= r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q(0 downto 0);

    -- leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest(MUX,359)@34 + 1
    leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_s <= leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_b;
    leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_s) IS
                WHEN "00" => leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q <= redist149_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_12_q;
                WHEN "01" => leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx1_uid352_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "10" => leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx2_uid355_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "11" => leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx3_uid358_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN OTHERS => leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist11_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,1021)
    redist11_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c, xout => redist11_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest(MUX,370)@35 + 1
    leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_s <= redist11_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1_q;
    leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_s) IS
                WHEN "00" => leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0_uid360_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "01" => leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx1_uid363_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "10" => leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx2_uid366_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "11" => leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx3_uid369_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN OTHERS => leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2Idx1Rng1_uid373_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,372)@36
    leftShiftStage2Idx1Rng1_uid373_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(26 downto 0);
    leftShiftStage2Idx1Rng1_uid373_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage2Idx1Rng1_uid373_fracPostNormSub_uid76_fpFusedAddSubTest_in(26 downto 0);

    -- leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,373)@36
    leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx1Rng1_uid373_fracPostNormSub_uid76_fpFusedAddSubTest_b & GND_q;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,730)@36
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_c <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(1 downto 1);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_d <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(2 downto 2);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_e <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(5 downto 3);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_f <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(6 downto 6);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_g <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(7 downto 7);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_h <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(8 downto 8);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_i <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(9 downto 9);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_j <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(10 downto 10);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_k <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(11 downto 11);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_l <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(12 downto 12);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_m <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(13 downto 13);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_n <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(14 downto 14);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_o <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(15 downto 15);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_p <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(16 downto 16);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_q <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(17 downto 17);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_r <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(18 downto 18);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_s <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(19 downto 19);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_t <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(20 downto 20);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_u <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(21 downto 21);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_v <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(22 downto 22);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_w <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(23 downto 23);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_x <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(24 downto 24);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_y <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(25 downto 25);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_z <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(26 downto 26);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_aa <= leftShiftStage2Idx1_uid374_fracPostNormSub_uid76_fpFusedAddSubTest_q(27 downto 27);

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a(BITSELECT,731)@36
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_b <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(0 downto 0);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_c <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(1 downto 1);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_d <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(2 downto 2);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_e <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(5 downto 3);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_f <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(6 downto 6);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_g <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(7 downto 7);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_h <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(8 downto 8);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_i <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(9 downto 9);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_j <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(10 downto 10);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_k <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(11 downto 11);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_l <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(12 downto 12);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_m <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(13 downto 13);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_n <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(14 downto 14);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_o <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(15 downto 15);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_p <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(16 downto 16);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_q <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(17 downto 17);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_r <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(18 downto 18);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_s <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(19 downto 19);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_t <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(20 downto 20);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_u <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(21 downto 21);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_v <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(22 downto 22);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_w <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(23 downto 23);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_x <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(24 downto 24);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_y <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(25 downto 25);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_z <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(26 downto 26);
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_aa <= leftShiftStage1_uid371_fracPostNormSub_uid76_fpFusedAddSubTest_q(27 downto 27);

    -- redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2(DELAY,1022)
    redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d, xout => redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q, clk => clk, aclr => areset );

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25(MUX,757)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_aa;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_aa;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24(MUX,756)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_z;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_z;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23(MUX,755)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_y;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_y;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22(MUX,754)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_x;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_x;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21(MUX,753)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_w;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_w;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20(MUX,752)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_v;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_v;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19(MUX,751)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_u;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_u;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18(MUX,750)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_t;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_t;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17(MUX,749)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_s;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_s;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16(MUX,748)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_r;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_r;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15(MUX,747)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_q;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_q;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14(MUX,746)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_p;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_p;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13(MUX,745)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_o;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_o;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12(MUX,744)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_n;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_n;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11(MUX,743)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_m;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_m;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10(MUX,742)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_l;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_l;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9(MUX,741)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_k;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_k;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8(MUX,740)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_j;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_j;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7(MUX,739)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_i;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_i;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6(MUX,738)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_h;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_h;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5(MUX,737)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_g;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_g;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4(MUX,736)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_f;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_f;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3(MUX,735)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_e;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_e;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2(MUX,734)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_d;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_d;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1(MUX,733)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_c;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_b_c;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0(MUX,732)@36 + 1
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_s <= redist12_leftShiftStageSel4Dto3_uid359_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_2_q;
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_s) IS
                WHEN "0" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitSelect_for_a_b;
                WHEN "1" => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_q <= GND_q;
                WHEN OTHERS => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitJoin_for_q(BITJOIN,758)@37
    leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitJoin_for_q_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p25_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p2_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p1_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p0_q;

    -- Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select(BITSELECT,982)@37
    Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_BitJoin_for_q_q(4 downto 0));
    Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_b <= STD_LOGIC_VECTOR(Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_in(0 downto 0));
    Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_c <= STD_LOGIC_VECTOR(Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_in(1 downto 1));
    Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_d <= STD_LOGIC_VECTOR(Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_in(2 downto 2));
    Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_e <= STD_LOGIC_VECTOR(Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_in(3 downto 3));
    Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_f <= STD_LOGIC_VECTOR(Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_in(4 downto 4));

    -- rndBitCond_sub_uid93_fpFusedAddSubTest(BITJOIN,92)@37
    rndBitCond_sub_uid93_fpFusedAddSubTest_q <= Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_f & Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_e & Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_d & Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_c & Sticky0_sub_uid88_fpFusedAddSubTest_merged_bit_select_b;

    -- rBi_sub_uid95_fpFusedAddSubTest(LOGICAL,94)@37 + 1
    rBi_sub_uid95_fpFusedAddSubTest_qi <= "1" WHEN rndBitCond_sub_uid93_fpFusedAddSubTest_q = cRBit_sub_uid94_fpFusedAddSubTest_q ELSE "0";
    rBi_sub_uid95_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_sub_uid95_fpFusedAddSubTest_qi, xout => rBi_sub_uid95_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- roundBit_sub_uid96_fpFusedAddSubTest(LOGICAL,95)@38
    roundBit_sub_uid96_fpFusedAddSubTest_q <= not (rBi_sub_uid95_fpFusedAddSubTest_q);

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_BitExpansion_for_b(BITJOIN,674)@38
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitExpansion_for_b_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_UpperBits_for_b_q & roundBit_sub_uid96_fpFusedAddSubTest_q;

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,677)@38
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_b <= expFracRSubPostRound_uid97_fpFusedAddSubTest_BitExpansion_for_b_q(5 downto 0);

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,857)@37
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p6_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p5_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p4_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p3_q;

    -- redist27_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1(DELAY,1037)
    redist27_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q, xout => redist27_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1_q, clk => clk, aclr => areset );

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6(ADD,678)@38 + 1
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & redist27_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q_1_q);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_b);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_a) + UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_b));
        END IF;
    END PROCESS;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_c(0) <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_o(6);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_o(5 downto 0);

    -- redist30_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q_3(DELAY,1040)
    redist30_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q, xout => redist30_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q_3_q, clk => clk, aclr => areset );

    -- redist31_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q_3(DELAY,1041)
    redist31_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q, xout => redist31_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q_3_q, clk => clk, aclr => areset );

    -- redist32_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q_3(DELAY,1042)
    redist32_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q, xout => redist32_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q_3_q, clk => clk, aclr => areset );

    -- redist33_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q_3(DELAY,1043)
    redist33_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q, xout => redist33_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q_3_q, clk => clk, aclr => areset );

    -- redist34_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q_3(DELAY,1044)
    redist34_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q, xout => redist34_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q_3_q, clk => clk, aclr => areset );

    -- redist35_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q_3(DELAY,1045)
    redist35_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q, xout => redist35_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q_3_q, clk => clk, aclr => areset );

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,864)@39
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q <= redist30_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p12_q_3_q & redist31_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p11_q_3_q & redist32_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p10_q_3_q & redist33_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p9_q_3_q & redist34_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p8_q_3_q & redist35_leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p7_q_3_q;

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6(ADD,679)@39 + 1
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_cin <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_c;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q) & '1';
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_b) & expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_cin(0);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_a) + UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_b));
        END IF;
    END PROCESS;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_c(0) <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_o(7);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_o(6 downto 1);

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d(BITJOIN,871)@37
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p18_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p17_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p16_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p15_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p14_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p13_q;

    -- redist26_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3(DELAY,1036)
    redist26_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q, xout => redist26_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3_q, clk => clk, aclr => areset );

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6(ADD,680)@40 + 1
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_cin <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_c;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & redist26_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_d_q_3_q) & '1';
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_c) & expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_cin(0);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_a) + UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_b));
        END IF;
    END PROCESS;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_c(0) <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_o(7);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_o(6 downto 1);

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e(BITJOIN,878)@37
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q <= leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p24_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p23_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p22_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p21_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p20_q & leftShiftStage2_uid376_fracPostNormSub_uid76_fpFusedAddSubTest_p19_q;

    -- redist25_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4(DELAY,1035)
    redist25_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q, xout => redist25_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4_q, clk => clk, aclr => areset );

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6(ADD,681)@41 + 1
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_cin <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_c;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & redist25_expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_e_q_4_q) & '1';
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_d) & expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_cin(0);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_a) + UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_b));
        END IF;
    END PROCESS;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_c(0) <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_o(7);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_o(6 downto 1);

    -- expPostNormSub_uid82_fpFusedAddSubTest_BitExpansion_for_b(BITJOIN,656)@41
    expPostNormSub_uid82_fpFusedAddSubTest_BitExpansion_for_b_q <= shiftedOut_uid51_fpFusedAddSubTest_UpperBits_for_a_q & redist123_r_uid218_lzCountValSub_uid75_fpFusedAddSubTest_q_7_q;

    -- expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_b(BITSELECT,659)@41
    expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_b_b <= expPostNormSub_uid82_fpFusedAddSubTest_BitExpansion_for_b_q(5 downto 0);

    -- expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2(SUB,660)@41 + 1
    expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expInc_uid81_fpFusedAddSubTest_p1_of_2_q);
    expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_b_b);
    expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_a) - UNSIGNED(expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_c(0) <= expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_o(6);
    expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_q <= expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_o(5 downto 0);

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6(ADD,682)@42 + 1
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_cin <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_c;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_q) & '1';
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_e) & expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_cin(0);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_a) + UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_b));
        END IF;
    END PROCESS;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_c(0) <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_o(7);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_o(6 downto 1);

    -- expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2(SUB,661)@42 + 1
    expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_cin <= expPostNormSub_uid82_fpFusedAddSubTest_p1_of_2_c;
    expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_c_q) & '0';
    expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & expPostNormSub_uid82_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b) & expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_cin(0);
    expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_a) - UNSIGNED(expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_q <= expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_o(4 downto 1);

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_g(BITJOIN,883)@43
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_g_q <= GND_q & expPostNormSub_uid82_fpFusedAddSubTest_p2_of_2_q;

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6(ADD,683)@43 + 1
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_cin <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_c;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_a <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_g_q) & '1';
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_merged_bit_select_f) & expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_cin(0);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_a) + UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_b));
        END IF;
    END PROCESS;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_o(5 downto 1);

    -- redist52_expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_q_1(DELAY,1062)
    redist52_expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_q, xout => redist52_expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_q_1_q, clk => clk, aclr => areset );

    -- redist53_expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_q_2(DELAY,1063)
    redist53_expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_q, xout => redist53_expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_q_2_q, clk => clk, aclr => areset );

    -- redist54_expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_q_3(DELAY,1064)
    redist54_expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_q, xout => redist54_expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_q_3_q, clk => clk, aclr => areset );

    -- redist55_expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_q_4(DELAY,1065)
    redist55_expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_q, xout => redist55_expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_q_4_q, clk => clk, aclr => areset );

    -- redist56_expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_q_5(DELAY,1066)
    redist56_expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_q_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_q, xout => redist56_expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_q_5_q, clk => clk, aclr => areset );

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest_BitJoin_for_q(BITJOIN,684)@44
    expFracRSubPostRound_uid97_fpFusedAddSubTest_BitJoin_for_q_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_q & redist52_expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_q_1_q & redist53_expFracRSubPostRound_uid97_fpFusedAddSubTest_p4_of_6_q_2_q & redist54_expFracRSubPostRound_uid97_fpFusedAddSubTest_p3_of_6_q_3_q & redist55_expFracRSubPostRound_uid97_fpFusedAddSubTest_p2_of_6_q_4_q & redist56_expFracRSubPostRound_uid97_fpFusedAddSubTest_p1_of_6_q_5_q;

    -- fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select(BITSELECT,978)@44
    fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_in <= expFracRSubPostRound_uid97_fpFusedAddSubTest_BitJoin_for_q_q(31 downto 0);
    fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_b <= fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_in(23 downto 1);
    fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_c <= fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_in(31 downto 24);

    -- redist2_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_c_3(DELAY,1012)
    redist2_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_c, xout => redist2_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_c_3_q, clk => clk, aclr => areset );

    -- redist151_effSub_uid45_fpFusedAddSubTest_q_2(DELAY,1161)
    redist151_effSub_uid45_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid45_fpFusedAddSubTest_q, xout => redist151_effSub_uid45_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- redist152_effSub_uid45_fpFusedAddSubTest_q_4(DELAY,1162)
    redist152_effSub_uid45_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist151_effSub_uid45_fpFusedAddSubTest_q_2_q, xout => redist152_effSub_uid45_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- expRPreExcSubtraction_uid144_fpFusedAddSubTest(MUX,143)@47 + 1
    expRPreExcSubtraction_uid144_fpFusedAddSubTest_s <= redist152_effSub_uid45_fpFusedAddSubTest_q_4_q;
    expRPreExcSubtraction_uid144_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPreExcSubtraction_uid144_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPreExcSubtraction_uid144_fpFusedAddSubTest_s) IS
                WHEN "0" => expRPreExcSubtraction_uid144_fpFusedAddSubTest_q <= redist2_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_c_3_q;
                WHEN "1" => expRPreExcSubtraction_uid144_fpFusedAddSubTest_q <= redist142_expRPreExcAdd_uid117_fpFusedAddSubTest_b_3_q;
                WHEN OTHERS => expRPreExcSubtraction_uid144_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist132_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_4(DELAY,1142)
    redist132_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExcSubtraction_uid144_fpFusedAddSubTest_q, xout => redist132_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- redist136_excRNaNS_uid136_fpFusedAddSubTest_q_5(DELAY,1146)
    redist136_excRNaNS_uid136_fpFusedAddSubTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaNS_uid136_fpFusedAddSubTest_q, xout => redist136_excRNaNS_uid136_fpFusedAddSubTest_q_5_q, clk => clk, aclr => areset );

    -- wEP2AllOwE_uid108_fpFusedAddSubTest(CONSTANT,107)
    wEP2AllOwE_uid108_fpFusedAddSubTest_q <= "0011111111";

    -- c0_uid409_rOvf_uid110_fpFusedAddSubTest_merged_bit_select(BITSELECT,960)
    c0_uid409_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b <= wEP2AllOwE_uid108_fpFusedAddSubTest_q(5 downto 0);
    c0_uid409_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c <= wEP2AllOwE_uid108_fpFusedAddSubTest_q(9 downto 6);

    -- rndExp_uid109_fpFusedAddSubTest(BITSELECT,108)@44
    rndExp_uid109_fpFusedAddSubTest_in <= expFracRAddPostRound_uid107_fpFusedAddSubTest_BitJoin_for_q_q(33 downto 0);
    rndExp_uid109_fpFusedAddSubTest_b <= rndExp_uid109_fpFusedAddSubTest_in(33 downto 24);

    -- z0_uid408_rOvf_uid110_fpFusedAddSubTest_merged_bit_select(BITSELECT,961)@44
    z0_uid408_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b <= rndExp_uid109_fpFusedAddSubTest_b(5 downto 0);
    z0_uid408_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c <= rndExp_uid109_fpFusedAddSubTest_b(9 downto 6);

    -- eq1_uid413_rOvf_uid110_fpFusedAddSubTest(LOGICAL,412)@44 + 1
    eq1_uid413_rOvf_uid110_fpFusedAddSubTest_qi <= "1" WHEN z0_uid408_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c = c0_uid409_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid413_rOvf_uid110_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid413_rOvf_uid110_fpFusedAddSubTest_qi, xout => eq1_uid413_rOvf_uid110_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist99_eq1_uid413_rOvf_uid110_fpFusedAddSubTest_q_2(DELAY,1109)
    redist99_eq1_uid413_rOvf_uid110_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid413_rOvf_uid110_fpFusedAddSubTest_q, xout => redist99_eq1_uid413_rOvf_uid110_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- y0_uid541_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select(BITSELECT,1000)
    y0_uid541_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b <= c0_uid409_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    y0_uid541_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c <= c0_uid409_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- x0_uid540_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select(BITSELECT,1001)@44
    x0_uid540_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b <= z0_uid408_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b(2 downto 0);
    x0_uid540_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c <= z0_uid408_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid545_eq0_uid410_rOvf_uid110_fpFusedAddSubTest(LOGICAL,544)@44 + 1
    eq1_uid545_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_qi <= "1" WHEN x0_uid540_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c = y0_uid541_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_c ELSE "0";
    eq1_uid545_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid545_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_qi, xout => eq1_uid545_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq0_uid542_eq0_uid410_rOvf_uid110_fpFusedAddSubTest(LOGICAL,541)@44 + 1
    eq0_uid542_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_qi <= "1" WHEN x0_uid540_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b = y0_uid541_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_merged_bit_select_b ELSE "0";
    eq0_uid542_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid542_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_qi, xout => eq0_uid542_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- andEq_uid546_eq0_uid410_rOvf_uid110_fpFusedAddSubTest(LOGICAL,545)@45 + 1
    andEq_uid546_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_qi <= eq0_uid542_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_q and eq1_uid545_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_q;
    andEq_uid546_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid546_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_qi, xout => andEq_uid546_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev0_uid414_rOvf_uid110_fpFusedAddSubTest(LOGICAL,413)@46 + 1
    and_lev0_uid414_rOvf_uid110_fpFusedAddSubTest_qi <= andEq_uid546_eq0_uid410_rOvf_uid110_fpFusedAddSubTest_q and redist99_eq1_uid413_rOvf_uid110_fpFusedAddSubTest_q_2_q;
    and_lev0_uid414_rOvf_uid110_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid414_rOvf_uid110_fpFusedAddSubTest_qi, xout => and_lev0_uid414_rOvf_uid110_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid36_fpFusedAddSubTest(LOGICAL,35)@43
    invExpXIsMax_uid36_fpFusedAddSubTest_q <= not (redist103_and_lev0_uid291_expXIsMax_uid31_fpFusedAddSubTest_q_34_q);

    -- redist159_InvExpXIsZero_uid37_fpFusedAddSubTest_q_32(DELAY,1169)
    redist159_InvExpXIsZero_uid37_fpFusedAddSubTest_q_32 : dspba_delay
    GENERIC MAP ( width => 1, depth => 32, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid37_fpFusedAddSubTest_q, xout => redist159_InvExpXIsZero_uid37_fpFusedAddSubTest_q_32_q, clk => clk, aclr => areset );

    -- excR_sigb_uid38_fpFusedAddSubTest(LOGICAL,37)@43 + 1
    excR_sigb_uid38_fpFusedAddSubTest_qi <= redist159_InvExpXIsZero_uid37_fpFusedAddSubTest_q_32_q and invExpXIsMax_uid36_fpFusedAddSubTest_q;
    excR_sigb_uid38_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_sigb_uid38_fpFusedAddSubTest_qi, xout => excR_sigb_uid38_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist158_excR_sigb_uid38_fpFusedAddSubTest_q_3(DELAY,1168)
    redist158_excR_sigb_uid38_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_sigb_uid38_fpFusedAddSubTest_q, xout => redist158_excR_sigb_uid38_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- redist163_excR_siga_uid24_fpFusedAddSubTest_q_2(DELAY,1173)
    redist163_excR_siga_uid24_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_siga_uid24_fpFusedAddSubTest_q, xout => redist163_excR_siga_uid24_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- regInputs_uid119_fpFusedAddSubTest(LOGICAL,118)@46 + 1
    regInputs_uid119_fpFusedAddSubTest_qi <= redist163_excR_siga_uid24_fpFusedAddSubTest_q_2_q and redist158_excR_sigb_uid38_fpFusedAddSubTest_q_3_q;
    regInputs_uid119_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid119_fpFusedAddSubTest_qi, xout => regInputs_uid119_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- regInAndOvf_uid123_fpFusedAddSubTest(LOGICAL,122)@47
    regInAndOvf_uid123_fpFusedAddSubTest_q <= regInputs_uid119_fpFusedAddSubTest_q and and_lev0_uid414_rOvf_uid110_fpFusedAddSubTest_q;

    -- redist107_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_37(DELAY,1117)
    redist107_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_37 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist106_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_36_q, xout => redist107_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_37_q, clk => clk, aclr => areset );

    -- redist108_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_38(DELAY,1118)
    redist108_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_38 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist107_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_37_q, xout => redist108_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_38_q, clk => clk, aclr => areset );

    -- redist115_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4(DELAY,1125)
    redist115_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist114_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q, xout => redist115_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- redist116_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_5(DELAY,1126)
    redist116_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist115_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4_q, xout => redist116_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_5_q, clk => clk, aclr => areset );

    -- redist161_excI_sigb_uid34_fpFusedAddSubTest_q_4(DELAY,1171)
    redist161_excI_sigb_uid34_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_sigb_uid34_fpFusedAddSubTest_q, xout => redist161_excI_sigb_uid34_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- redist165_excI_siga_uid20_fpFusedAddSubTest_q_4(DELAY,1175)
    redist165_excI_siga_uid20_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_siga_uid20_fpFusedAddSubTest_q, xout => redist165_excI_siga_uid20_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- excRInfVInC_uid127_fpFusedAddSubTest(BITJOIN,126)@47
    excRInfVInC_uid127_fpFusedAddSubTest_q <= regInAndOvf_uid123_fpFusedAddSubTest_q & redist108_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_38_q & redist116_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_5_q & redist161_excI_sigb_uid34_fpFusedAddSubTest_q_4_q & redist165_excI_siga_uid20_fpFusedAddSubTest_q_4_q & redist152_effSub_uid45_fpFusedAddSubTest_q_4_q;

    -- redist138_excRInfVInC_uid127_fpFusedAddSubTest_q_1(DELAY,1148)
    redist138_excRInfVInC_uid127_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInfVInC_uid127_fpFusedAddSubTest_q, xout => redist138_excRInfVInC_uid127_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- excRInfSub_uid130_fpFusedAddSubTest(LOOKUP,129)@48 + 1
    excRInfSub_uid130_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (redist138_excRInfVInC_uid127_fpFusedAddSubTest_q_1_q) IS
                WHEN "000000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "000001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "000010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "000011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "000100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "000101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "000110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "000111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
                WHEN "001000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "001001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "001010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "001011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "001100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
                WHEN "001101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
                WHEN "001110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "001111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "010000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "010001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "010010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
                WHEN "010011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
                WHEN "010100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "010101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "010110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "010111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "011000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "011001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "011010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "011011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "011100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "011101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "011110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "011111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "100000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "100001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
                WHEN "100010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "100011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "100100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "100101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "100110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "100111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "101000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "101001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "101010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "101011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "101100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "101101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "101110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "101111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "110000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "110001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "110010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "110011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "110100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "110101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "110110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "110111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "111000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "111001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "111010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "111011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "111100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "111101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "111110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN "111111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRInfSub_uid130_fpFusedAddSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- oneIsInfOrZero_uid125_fpFusedAddSubTest(LOGICAL,124)@46 + 1
    oneIsInfOrZero_uid125_fpFusedAddSubTest_qi <= redist163_excR_siga_uid24_fpFusedAddSubTest_q_2_q or redist158_excR_sigb_uid38_fpFusedAddSubTest_q_3_q or redist115_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4_q or redist107_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_37_q;
    oneIsInfOrZero_uid125_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oneIsInfOrZero_uid125_fpFusedAddSubTest_qi, xout => oneIsInfOrZero_uid125_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist139_oneIsInfOrZero_uid125_fpFusedAddSubTest_q_2(DELAY,1149)
    redist139_oneIsInfOrZero_uid125_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oneIsInfOrZero_uid125_fpFusedAddSubTest_q, xout => redist139_oneIsInfOrZero_uid125_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- oneIsInf_uid124_fpFusedAddSubTest(LOGICAL,123)@47 + 1
    oneIsInf_uid124_fpFusedAddSubTest_qi <= redist165_excI_siga_uid20_fpFusedAddSubTest_q_4_q or redist161_excI_sigb_uid34_fpFusedAddSubTest_q_4_q;
    oneIsInf_uid124_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oneIsInf_uid124_fpFusedAddSubTest_qi, xout => oneIsInf_uid124_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- addIsAlsoInf_uid126_fpFusedAddSubTest(LOGICAL,125)@48 + 1
    addIsAlsoInf_uid126_fpFusedAddSubTest_qi <= oneIsInf_uid124_fpFusedAddSubTest_q and redist139_oneIsInfOrZero_uid125_fpFusedAddSubTest_q_2_q;
    addIsAlsoInf_uid126_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => addIsAlsoInf_uid126_fpFusedAddSubTest_qi, xout => addIsAlsoInf_uid126_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- excRInfSubFull_uid131_fpFusedAddSubTest(LOGICAL,130)@49 + 1
    excRInfSubFull_uid131_fpFusedAddSubTest_qi <= addIsAlsoInf_uid126_fpFusedAddSubTest_q or excRInfSub_uid130_fpFusedAddSubTest_q;
    excRInfSubFull_uid131_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInfSubFull_uid131_fpFusedAddSubTest_qi, xout => excRInfSubFull_uid131_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist145_aMinusA_uid80_fpFusedAddSubTest_q_6(DELAY,1155)
    redist145_aMinusA_uid80_fpFusedAddSubTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist144_aMinusA_uid80_fpFusedAddSubTest_q_4_q, xout => redist145_aMinusA_uid80_fpFusedAddSubTest_q_6_q, clk => clk, aclr => areset );

    -- rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,937)@43
    rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q <= rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_b & GND_q;

    -- rUdf_uid112_fpFusedAddSubTest_p1_of_2(COMPARE,705)@43 + 1
    rUdf_uid112_fpFusedAddSubTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_BitJoin_for_b_q);
    rUdf_uid112_fpFusedAddSubTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expFracRSubPostRound_uid97_fpFusedAddSubTest_p5_of_6_q);
    rUdf_uid112_fpFusedAddSubTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rUdf_uid112_fpFusedAddSubTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rUdf_uid112_fpFusedAddSubTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(rUdf_uid112_fpFusedAddSubTest_p1_of_2_a) - UNSIGNED(rUdf_uid112_fpFusedAddSubTest_p1_of_2_b));
        END IF;
    END PROCESS;
    rUdf_uid112_fpFusedAddSubTest_p1_of_2_c(0) <= rUdf_uid112_fpFusedAddSubTest_p1_of_2_o(6);

    -- rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_tessel1_1(BITSELECT,943)@44
    rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_tessel1_1_b <= STD_LOGIC_VECTOR(expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_q(3 downto 3));

    -- rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_tessel1_0(BITSELECT,942)@44
    rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(expFracRSubPostRound_uid97_fpFusedAddSubTest_p6_of_6_q(3 downto 0));

    -- rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,944)@44
    rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_c_q <= rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_tessel1_1_b & rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_tessel1_0_b;

    -- rUdf_uid112_fpFusedAddSubTest_UpperBits_for_a(CONSTANT,699)
    rUdf_uid112_fpFusedAddSubTest_UpperBits_for_a_q <= "0000000000";

    -- rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,980)
    rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(rUdf_uid112_fpFusedAddSubTest_UpperBits_for_a_q(4 downto 0));
    rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(rUdf_uid112_fpFusedAddSubTest_UpperBits_for_a_q(9 downto 5));

    -- rUdf_uid112_fpFusedAddSubTest_p2_of_2(COMPARE,706)@44 + 1
    rUdf_uid112_fpFusedAddSubTest_p2_of_2_cin <= rUdf_uid112_fpFusedAddSubTest_p1_of_2_c;
    rUdf_uid112_fpFusedAddSubTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & rUdf_uid112_fpFusedAddSubTest_BitSelect_for_a_tessel0_1_merged_bit_select_c) & '0');
    rUdf_uid112_fpFusedAddSubTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_c_q(4)) & rUdf_uid112_fpFusedAddSubTest_BitSelect_for_b_BitJoin_for_c_q) & rUdf_uid112_fpFusedAddSubTest_p2_of_2_cin(0));
    rUdf_uid112_fpFusedAddSubTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rUdf_uid112_fpFusedAddSubTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rUdf_uid112_fpFusedAddSubTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(rUdf_uid112_fpFusedAddSubTest_p2_of_2_a) - SIGNED(rUdf_uid112_fpFusedAddSubTest_p2_of_2_b));
        END IF;
    END PROCESS;
    rUdf_uid112_fpFusedAddSubTest_p2_of_2_c(0) <= rUdf_uid112_fpFusedAddSubTest_p2_of_2_o(6);

    -- redist46_rUdf_uid112_fpFusedAddSubTest_p2_of_2_c_2(DELAY,1056)
    redist46_rUdf_uid112_fpFusedAddSubTest_p2_of_2_c_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rUdf_uid112_fpFusedAddSubTest_p2_of_2_c, xout => redist46_rUdf_uid112_fpFusedAddSubTest_p2_of_2_c_2_q, clk => clk, aclr => areset );

    -- rUdf_uid112_fpFusedAddSubTest_cout_n(LOGICAL,708)@47
    rUdf_uid112_fpFusedAddSubTest_cout_n_q <= STD_LOGIC_VECTOR(not (redist46_rUdf_uid112_fpFusedAddSubTest_p2_of_2_c_2_q));

    -- excRZeroVInC_uid120_fpFusedAddSubTest(BITJOIN,119)@47
    excRZeroVInC_uid120_fpFusedAddSubTest_q <= redist152_effSub_uid45_fpFusedAddSubTest_q_4_q & redist145_aMinusA_uid80_fpFusedAddSubTest_q_6_q & rUdf_uid112_fpFusedAddSubTest_cout_n_q & regInputs_uid119_fpFusedAddSubTest_q & redist108_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_38_q & redist116_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_5_q;

    -- excRZeroSub_uid122_fpFusedAddSubTest(LOOKUP,121)@47 + 1
    excRZeroSub_uid122_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRZeroVInC_uid120_fpFusedAddSubTest_q) IS
                WHEN "000000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "1";
                WHEN "000100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "1";
                WHEN "001101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "1";
                WHEN "010101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "1";
                WHEN "011101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRZeroSub_uid122_fpFusedAddSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist140_excRZeroSub_uid122_fpFusedAddSubTest_q_3(DELAY,1150)
    redist140_excRZeroSub_uid122_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZeroSub_uid122_fpFusedAddSubTest_q, xout => redist140_excRZeroSub_uid122_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- concExcSub_uid137_fpFusedAddSubTest(BITJOIN,136)@50
    concExcSub_uid137_fpFusedAddSubTest_q <= redist136_excRNaNS_uid136_fpFusedAddSubTest_q_5_q & excRInfSubFull_uid131_fpFusedAddSubTest_q & redist140_excRZeroSub_uid122_fpFusedAddSubTest_q_3_q;

    -- excREncSub_uid139_fpFusedAddSubTest(LOOKUP,138)@50 + 1
    excREncSub_uid139_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREncSub_uid139_fpFusedAddSubTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExcSub_uid137_fpFusedAddSubTest_q) IS
                WHEN "000" => excREncSub_uid139_fpFusedAddSubTest_q <= "01";
                WHEN "001" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
                WHEN "010" => excREncSub_uid139_fpFusedAddSubTest_q <= "10";
                WHEN "011" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
                WHEN "100" => excREncSub_uid139_fpFusedAddSubTest_q <= "11";
                WHEN "101" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
                WHEN "110" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
                WHEN "111" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREncSub_uid139_fpFusedAddSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExcSub_uid172_fpFusedAddSubTest(MUX,171)@51
    expRPostExcSub_uid172_fpFusedAddSubTest_s <= excREncSub_uid139_fpFusedAddSubTest_q;
    expRPostExcSub_uid172_fpFusedAddSubTest_combproc: PROCESS (expRPostExcSub_uid172_fpFusedAddSubTest_s, cstAllZWE_uid13_fpFusedAddSubTest_q, redist132_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_4_q, cstAllOWE_uid11_fpFusedAddSubTest_q)
    BEGIN
        CASE (expRPostExcSub_uid172_fpFusedAddSubTest_s) IS
            WHEN "00" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= cstAllZWE_uid13_fpFusedAddSubTest_q;
            WHEN "01" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= redist132_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_4_q;
            WHEN "10" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN "11" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN OTHERS => expRPostExcSub_uid172_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid145_fpFusedAddSubTest(CONSTANT,144)
    oneFracRPostExc2_uid145_fpFusedAddSubTest_q <= "00000000000000000000001";

    -- fracRPreExcAdd_uid116_fpFusedAddSubTest(BITSELECT,115)@44
    fracRPreExcAdd_uid116_fpFusedAddSubTest_in <= expFracRAddPostRound_uid107_fpFusedAddSubTest_BitJoin_for_q_q(23 downto 0);
    fracRPreExcAdd_uid116_fpFusedAddSubTest_b <= fracRPreExcAdd_uid116_fpFusedAddSubTest_in(23 downto 1);

    -- redist143_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_3(DELAY,1153)
    redist143_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExcAdd_uid116_fpFusedAddSubTest_b, xout => redist143_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_3_q, clk => clk, aclr => areset );

    -- redist1_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_b_3(DELAY,1011)
    redist1_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_b, xout => redist1_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_b_3_q, clk => clk, aclr => areset );

    -- fracRPreExcSubtraction_uid143_fpFusedAddSubTest(MUX,142)@47 + 1
    fracRPreExcSubtraction_uid143_fpFusedAddSubTest_s <= redist152_effSub_uid45_fpFusedAddSubTest_q_4_q;
    fracRPreExcSubtraction_uid143_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPreExcSubtraction_uid143_fpFusedAddSubTest_s) IS
                WHEN "0" => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= redist1_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_b_3_q;
                WHEN "1" => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= redist143_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_3_q;
                WHEN OTHERS => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist133_fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q_4(DELAY,1143)
    redist133_fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q, xout => redist133_fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- fracRPostExcSub_uid168_fpFusedAddSubTest(MUX,167)@51
    fracRPostExcSub_uid168_fpFusedAddSubTest_s <= excREncSub_uid139_fpFusedAddSubTest_q;
    fracRPostExcSub_uid168_fpFusedAddSubTest_combproc: PROCESS (fracRPostExcSub_uid168_fpFusedAddSubTest_s, cstZeroWF_uid12_fpFusedAddSubTest_q, redist133_fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q_4_q, oneFracRPostExc2_uid145_fpFusedAddSubTest_q)
    BEGIN
        CASE (fracRPostExcSub_uid168_fpFusedAddSubTest_s) IS
            WHEN "00" => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= cstZeroWF_uid12_fpFusedAddSubTest_q;
            WHEN "01" => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= redist133_fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q_4_q;
            WHEN "10" => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= cstZeroWF_uid12_fpFusedAddSubTest_q;
            WHEN "11" => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= oneFracRPostExc2_uid145_fpFusedAddSubTest_q;
            WHEN OTHERS => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RDiff_uid186_fpFusedAddSubTest(BITJOIN,185)@51
    RDiff_uid186_fpFusedAddSubTest_q <= redist129_signRPostExcSub_uid185_fpFusedAddSubTest_q_5_q & expRPostExcSub_uid172_fpFusedAddSubTest_q & fracRPostExcSub_uid168_fpFusedAddSubTest_q;

    -- redist80_xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c_39(DELAY,1090)
    redist80_xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c_39 : dspba_delay
    GENERIC MAP ( width => 1, depth => 39, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c, xout => redist80_xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c_39_q, clk => clk, aclr => areset );

    -- invSigA_uid154_fpFusedAddSubTest(LOGICAL,153)@45
    invSigA_uid154_fpFusedAddSubTest_q <= not (redist156_sigA_uid43_fpFusedAddSubTest_b_39_q);

    -- signInputsZeroSwap_uid155_fpFusedAddSubTest(LOGICAL,154)@45 + 1
    signInputsZeroSwap_uid155_fpFusedAddSubTest_qi <= redist114_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q and redist106_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_36_q and invSigA_uid154_fpFusedAddSubTest_q and redist154_sigB_uid44_fpFusedAddSubTest_b_38_q and redist80_xGTEy_uid8_fpFusedAddSubTest_p6_of_6_c_39_q;
    signInputsZeroSwap_uid155_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signInputsZeroSwap_uid155_fpFusedAddSubTest_qi, xout => signInputsZeroSwap_uid155_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invSignInputsZeroSwap_uid156_fpFusedAddSubTest(LOGICAL,155)@46
    invSignInputsZeroSwap_uid156_fpFusedAddSubTest_q <= not (signInputsZeroSwap_uid155_fpFusedAddSubTest_q);

    -- redist79_xGTEy_uid8_fpFusedAddSubTest_cout_n_q_39(DELAY,1089)
    redist79_xGTEy_uid8_fpFusedAddSubTest_cout_n_q_39 : dspba_delay
    GENERIC MAP ( width => 1, depth => 39, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_cout_n_q, xout => redist79_xGTEy_uid8_fpFusedAddSubTest_cout_n_q_39_q, clk => clk, aclr => areset );

    -- invSigB_uid157_fpFusedAddSubTest(LOGICAL,156)@45
    invSigB_uid157_fpFusedAddSubTest_q <= not (redist154_sigB_uid44_fpFusedAddSubTest_b_38_q);

    -- signInputsZeroNoSwap_uid158_fpFusedAddSubTest(LOGICAL,157)@45 + 1
    signInputsZeroNoSwap_uid158_fpFusedAddSubTest_qi <= redist114_and_lev0_uid257_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q and redist106_and_lev0_uid284_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_36_q and redist156_sigA_uid43_fpFusedAddSubTest_b_39_q and invSigB_uid157_fpFusedAddSubTest_q and redist79_xGTEy_uid8_fpFusedAddSubTest_cout_n_q_39_q;
    signInputsZeroNoSwap_uid158_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signInputsZeroNoSwap_uid158_fpFusedAddSubTest_qi, xout => signInputsZeroNoSwap_uid158_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest(LOGICAL,158)@46
    invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest_q <= not (signInputsZeroNoSwap_uid158_fpFusedAddSubTest_q);

    -- aMa_uid160_fpFusedAddSubTest(LOGICAL,159)@45 + 1
    aMa_uid160_fpFusedAddSubTest_qi <= redist144_aMinusA_uid80_fpFusedAddSubTest_q_4_q and redist151_effSub_uid45_fpFusedAddSubTest_q_2_q;
    aMa_uid160_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMa_uid160_fpFusedAddSubTest_qi, xout => aMa_uid160_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invAMA_uid161_fpFusedAddSubTest(LOGICAL,160)@46
    invAMA_uid161_fpFusedAddSubTest_q <= not (aMa_uid160_fpFusedAddSubTest_q);

    -- redist157_sigA_uid43_fpFusedAddSubTest_b_40(DELAY,1167)
    redist157_sigA_uid43_fpFusedAddSubTest_b_40 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist156_sigA_uid43_fpFusedAddSubTest_b_39_q, xout => redist157_sigA_uid43_fpFusedAddSubTest_b_40_q, clk => clk, aclr => areset );

    -- infMinf_uid132_fpFusedAddSubTest(LOGICAL,131)@44 + 1
    infMinf_uid132_fpFusedAddSubTest_qi <= excI_siga_uid20_fpFusedAddSubTest_q and excI_sigb_uid34_fpFusedAddSubTest_q and effSub_uid45_fpFusedAddSubTest_q;
    infMinf_uid132_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => infMinf_uid132_fpFusedAddSubTest_qi, xout => infMinf_uid132_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- excRNaNA_uid133_fpFusedAddSubTest(LOGICAL,132)@45 + 1
    excRNaNA_uid133_fpFusedAddSubTest_qi <= infMinf_uid132_fpFusedAddSubTest_q or redist164_excN_siga_uid21_fpFusedAddSubTest_q_2_q or redist160_excN_sigb_uid35_fpFusedAddSubTest_q_2_q;
    excRNaNA_uid133_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaNA_uid133_fpFusedAddSubTest_qi, xout => excRNaNA_uid133_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invExcRNaNA_uid162_fpFusedAddSubTest(LOGICAL,161)@46
    invExcRNaNA_uid162_fpFusedAddSubTest_q <= not (excRNaNA_uid133_fpFusedAddSubTest_q);

    -- signRPostExc_uid163_fpFusedAddSubTest(LOGICAL,162)@46 + 1
    signRPostExc_uid163_fpFusedAddSubTest_qi <= invExcRNaNA_uid162_fpFusedAddSubTest_q and redist157_sigA_uid43_fpFusedAddSubTest_b_40_q and invAMA_uid161_fpFusedAddSubTest_q and invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest_q and invSignInputsZeroSwap_uid156_fpFusedAddSubTest_q;
    signRPostExc_uid163_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid163_fpFusedAddSubTest_qi, xout => signRPostExc_uid163_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist131_signRPostExc_uid163_fpFusedAddSubTest_q_5(DELAY,1141)
    redist131_signRPostExc_uid163_fpFusedAddSubTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid163_fpFusedAddSubTest_q, xout => redist131_signRPostExc_uid163_fpFusedAddSubTest_q_5_q, clk => clk, aclr => areset );

    -- expRPreExcAddition_uid142_fpFusedAddSubTest(MUX,141)@47 + 1
    expRPreExcAddition_uid142_fpFusedAddSubTest_s <= redist152_effSub_uid45_fpFusedAddSubTest_q_4_q;
    expRPreExcAddition_uid142_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPreExcAddition_uid142_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPreExcAddition_uid142_fpFusedAddSubTest_s) IS
                WHEN "0" => expRPreExcAddition_uid142_fpFusedAddSubTest_q <= redist142_expRPreExcAdd_uid117_fpFusedAddSubTest_b_3_q;
                WHEN "1" => expRPreExcAddition_uid142_fpFusedAddSubTest_q <= redist2_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_c_3_q;
                WHEN OTHERS => expRPreExcAddition_uid142_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist134_expRPreExcAddition_uid142_fpFusedAddSubTest_q_4(DELAY,1144)
    redist134_expRPreExcAddition_uid142_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExcAddition_uid142_fpFusedAddSubTest_q, xout => redist134_expRPreExcAddition_uid142_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- redist137_excRNaNA_uid133_fpFusedAddSubTest_q_5(DELAY,1147)
    redist137_excRNaNA_uid133_fpFusedAddSubTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaNA_uid133_fpFusedAddSubTest_q, xout => redist137_excRNaNA_uid133_fpFusedAddSubTest_q_5_q, clk => clk, aclr => areset );

    -- excRInfAdd_uid128_fpFusedAddSubTest(LOOKUP,127)@48 + 1
    excRInfAdd_uid128_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (redist138_excRInfVInC_uid127_fpFusedAddSubTest_q_1_q) IS
                WHEN "000000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "000001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "000010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "000011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "000100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "000101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "000110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
                WHEN "000111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "001000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "001001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "001010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "001011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "001100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
                WHEN "001101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
                WHEN "001110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "001111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "010000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "010001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "010010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
                WHEN "010011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
                WHEN "010100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "010101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "010110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "010111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "011000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "011001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "011010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "011011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "011100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "011101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "011110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "011111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "100000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
                WHEN "100001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "100010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "100011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "100100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "100101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "100110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "100111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "101000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "101001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "101010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "101011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "101100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "101101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "101110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "101111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "110000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "110001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "110010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "110011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "110100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "110101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "110110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "110111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "111000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "111001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "111010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "111011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "111100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "111101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "111110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN "111111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRInfAdd_uid128_fpFusedAddSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- excRInfAddFull_uid129_fpFusedAddSubTest(LOGICAL,128)@49 + 1
    excRInfAddFull_uid129_fpFusedAddSubTest_qi <= addIsAlsoInf_uid126_fpFusedAddSubTest_q or excRInfAdd_uid128_fpFusedAddSubTest_q;
    excRInfAddFull_uid129_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInfAddFull_uid129_fpFusedAddSubTest_qi, xout => excRInfAddFull_uid129_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- excRZeroAdd_uid121_fpFusedAddSubTest(LOOKUP,120)@47 + 1
    excRZeroAdd_uid121_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRZeroVInC_uid120_fpFusedAddSubTest_q) IS
                WHEN "000000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "1";
                WHEN "000100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "1";
                WHEN "101101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "1";
                WHEN "110101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "1";
                WHEN "111101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRZeroAdd_uid121_fpFusedAddSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist141_excRZeroAdd_uid121_fpFusedAddSubTest_q_3(DELAY,1151)
    redist141_excRZeroAdd_uid121_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZeroAdd_uid121_fpFusedAddSubTest_q, xout => redist141_excRZeroAdd_uid121_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- concExcAdd_uid138_fpFusedAddSubTest(BITJOIN,137)@50
    concExcAdd_uid138_fpFusedAddSubTest_q <= redist137_excRNaNA_uid133_fpFusedAddSubTest_q_5_q & excRInfAddFull_uid129_fpFusedAddSubTest_q & redist141_excRZeroAdd_uid121_fpFusedAddSubTest_q_3_q;

    -- excREncAdd_uid140_fpFusedAddSubTest(LOOKUP,139)@50 + 1
    excREncAdd_uid140_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREncAdd_uid140_fpFusedAddSubTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExcAdd_uid138_fpFusedAddSubTest_q) IS
                WHEN "000" => excREncAdd_uid140_fpFusedAddSubTest_q <= "01";
                WHEN "001" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
                WHEN "010" => excREncAdd_uid140_fpFusedAddSubTest_q <= "10";
                WHEN "011" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
                WHEN "100" => excREncAdd_uid140_fpFusedAddSubTest_q <= "11";
                WHEN "101" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
                WHEN "110" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
                WHEN "111" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREncAdd_uid140_fpFusedAddSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExcAdd_uid152_fpFusedAddSubTest(MUX,151)@51
    expRPostExcAdd_uid152_fpFusedAddSubTest_s <= excREncAdd_uid140_fpFusedAddSubTest_q;
    expRPostExcAdd_uid152_fpFusedAddSubTest_combproc: PROCESS (expRPostExcAdd_uid152_fpFusedAddSubTest_s, cstAllZWE_uid13_fpFusedAddSubTest_q, redist134_expRPreExcAddition_uid142_fpFusedAddSubTest_q_4_q, cstAllOWE_uid11_fpFusedAddSubTest_q)
    BEGIN
        CASE (expRPostExcAdd_uid152_fpFusedAddSubTest_s) IS
            WHEN "00" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= cstAllZWE_uid13_fpFusedAddSubTest_q;
            WHEN "01" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= redist134_expRPreExcAddition_uid142_fpFusedAddSubTest_q_4_q;
            WHEN "10" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN "11" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN OTHERS => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExcAddition_uid141_fpFusedAddSubTest(MUX,140)@47 + 1
    fracRPreExcAddition_uid141_fpFusedAddSubTest_s <= redist152_effSub_uid45_fpFusedAddSubTest_q_4_q;
    fracRPreExcAddition_uid141_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPreExcAddition_uid141_fpFusedAddSubTest_s) IS
                WHEN "0" => fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= redist143_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_3_q;
                WHEN "1" => fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= redist1_fracRPreExcSub_uid113_fpFusedAddSubTest_merged_bit_select_b_3_q;
                WHEN OTHERS => fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist135_fracRPreExcAddition_uid141_fpFusedAddSubTest_q_4(DELAY,1145)
    redist135_fracRPreExcAddition_uid141_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExcAddition_uid141_fpFusedAddSubTest_q, xout => redist135_fracRPreExcAddition_uid141_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- fracRPostExcAdd_uid148_fpFusedAddSubTest(MUX,147)@51
    fracRPostExcAdd_uid148_fpFusedAddSubTest_s <= excREncAdd_uid140_fpFusedAddSubTest_q;
    fracRPostExcAdd_uid148_fpFusedAddSubTest_combproc: PROCESS (fracRPostExcAdd_uid148_fpFusedAddSubTest_s, cstZeroWF_uid12_fpFusedAddSubTest_q, redist135_fracRPreExcAddition_uid141_fpFusedAddSubTest_q_4_q, oneFracRPostExc2_uid145_fpFusedAddSubTest_q)
    BEGIN
        CASE (fracRPostExcAdd_uid148_fpFusedAddSubTest_s) IS
            WHEN "00" => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= cstZeroWF_uid12_fpFusedAddSubTest_q;
            WHEN "01" => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= redist135_fracRPreExcAddition_uid141_fpFusedAddSubTest_q_4_q;
            WHEN "10" => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= cstZeroWF_uid12_fpFusedAddSubTest_q;
            WHEN "11" => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= oneFracRPostExc2_uid145_fpFusedAddSubTest_q;
            WHEN OTHERS => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RSum_uid164_fpFusedAddSubTest(BITJOIN,163)@51
    RSum_uid164_fpFusedAddSubTest_q <= redist131_signRPostExc_uid163_fpFusedAddSubTest_q_5_q & expRPostExcAdd_uid152_fpFusedAddSubTest_q & fracRPostExcAdd_uid148_fpFusedAddSubTest_q;

    -- xOut(GPOUT,4)@51
    q <= RSum_uid164_fpFusedAddSubTest_q;
    s <= RDiff_uid186_fpFusedAddSubTest_q;

END normal;
