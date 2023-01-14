-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "06/06/2022 10:45:16"

-- 
-- Device: Altera 5M40ZM64C4 Package MBGA64
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	ALU1 IS
    PORT (
	a : IN std_logic;
	b : IN std_logic;
	Ainvert : IN std_logic;
	Binvert : IN std_logic;
	CarryIn : IN std_logic;
	Operation : IN std_logic_vector(1 DOWNTO 0);
	FinalResult : OUT std_logic;
	CarryOut : OUT std_logic
	);
END ALU1;

-- Design Ports Information


ARCHITECTURE structure OF ALU1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_Ainvert : std_logic;
SIGNAL ww_Binvert : std_logic;
SIGNAL ww_CarryIn : std_logic;
SIGNAL ww_Operation : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_FinalResult : std_logic;
SIGNAL ww_CarryOut : std_logic;
SIGNAL \Binvert~combout\ : std_logic;
SIGNAL \Ainvert~combout\ : std_logic;
SIGNAL \a~combout\ : std_logic;
SIGNAL \STEP6|Mux0~1_combout\ : std_logic;
SIGNAL \b~combout\ : std_logic;
SIGNAL \STEP1|l~0_combout\ : std_logic;
SIGNAL \CarryIn~combout\ : std_logic;
SIGNAL \STEP6|Mux0~0_combout\ : std_logic;
SIGNAL \STEP6|Mux0~2_combout\ : std_logic;
SIGNAL \STEP4|CarryOut~0_combout\ : std_logic;
SIGNAL \Operation~combout\ : std_logic_vector(1 DOWNTO 0);

BEGIN

ww_a <= a;
ww_b <= b;
ww_Ainvert <= Ainvert;
ww_Binvert <= Binvert;
ww_CarryIn <= CarryIn;
ww_Operation <= Operation;
FinalResult <= ww_FinalResult;
CarryOut <= ww_CarryOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_F5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Binvert~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Binvert,
	combout => \Binvert~combout\);

-- Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Ainvert~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Ainvert,
	combout => \Ainvert~combout\);

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a,
	combout => \a~combout\);

-- Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Operation[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Operation(1),
	combout => \Operation~combout\(1));

-- Location: LC_X5_Y2_N6
\STEP6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \STEP6|Mux0~1_combout\ = \Ainvert~combout\ $ (\a~combout\ $ (((\Binvert~combout\ & \Operation~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "963c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Binvert~combout\,
	datab => \Ainvert~combout\,
	datac => \a~combout\,
	datad => \Operation~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \STEP6|Mux0~1_combout\);

-- Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b,
	combout => \b~combout\);

-- Location: LC_X5_Y2_N2
\STEP1|l~0\ : maxv_lcell
-- Equation(s):
-- \STEP1|l~0_combout\ = (\Binvert~combout\ $ (((\b~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Binvert~combout\,
	datad => \b~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \STEP1|l~0_combout\);

-- Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Operation[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Operation(0),
	combout => \Operation~combout\(0));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CarryIn~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_CarryIn,
	combout => \CarryIn~combout\);

-- Location: LC_X5_Y2_N5
\STEP6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \STEP6|Mux0~0_combout\ = (\Operation~combout\(1) & (\b~combout\ $ (((!\Operation~combout\(0) & \CarryIn~combout\))))) # (!\Operation~combout\(1) & (\Operation~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9caa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Operation~combout\(0),
	datab => \b~combout\,
	datac => \CarryIn~combout\,
	datad => \Operation~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \STEP6|Mux0~0_combout\);

-- Location: LC_X5_Y2_N4
\STEP6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \STEP6|Mux0~2_combout\ = (\STEP6|Mux0~1_combout\ & ((\STEP6|Mux0~0_combout\ & ((!\Operation~combout\(1)))) # (!\STEP6|Mux0~0_combout\ & ((\STEP1|l~0_combout\) # (\Operation~combout\(1)))))) # (!\STEP6|Mux0~1_combout\ & (\STEP6|Mux0~0_combout\ & 
-- ((\STEP1|l~0_combout\) # (\Operation~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5ae8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \STEP6|Mux0~1_combout\,
	datab => \STEP1|l~0_combout\,
	datac => \STEP6|Mux0~0_combout\,
	datad => \Operation~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \STEP6|Mux0~2_combout\);

-- Location: LC_X5_Y2_N8
\STEP4|CarryOut~0\ : maxv_lcell
-- Equation(s):
-- \STEP4|CarryOut~0_combout\ = (\CarryIn~combout\ & ((\STEP1|l~0_combout\) # (\a~combout\ $ (\Ainvert~combout\)))) # (!\CarryIn~combout\ & (\STEP1|l~0_combout\ & (\a~combout\ $ (\Ainvert~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CarryIn~combout\,
	datab => \STEP1|l~0_combout\,
	datac => \a~combout\,
	datad => \Ainvert~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \STEP4|CarryOut~0_combout\);

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\FinalResult~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \STEP6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_FinalResult);

-- Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\CarryOut~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \STEP4|CarryOut~0_combout\,
	oe => VCC,
	padio => ww_CarryOut);
END structure;


