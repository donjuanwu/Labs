--Name    : Don Dang
--Filename: Introvhdl.vhd
--Date    : 4/17/18
--Project : Lab1
--Class   : Microprocessor Design
--Purpose :
--Note    :
--Date        Devloper		Activities
--4/17/18     DD    		Copied code from Lab1 instruction       
--


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY intro is
	PORT (
		A	: IN STD_LOGIC;
		B	: IN STD_LOGIC;
		C	: IN STD_LOGIC;
		D	: IN STD_LOGIC;
		E	: OUT STD_LOGIC);
END intro;

ARCHITECTURE behavior OF intro IS
BEGIN 
		E <= (A OR B) AND (C OR D);
END architecture behavior;
