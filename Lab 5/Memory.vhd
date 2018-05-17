

-- Developer : Don Dang, Brigid Kelly
-- Project   : Lab 5
-- Filename  : Memory.vhd
-- Date      : 5/14/18
-- Class     : Microprocessor Designs
-- Instructor: Ken Rabold
-- Purpose   : 
--             Design and implement a Memory and Register Bank
--
-- Notes     : 
-- This excercise is developed using Questa Sim 
			
-- Developer	Date		Activities
-- DD		5/14/18 	Download and modify Memory.vhd



LIBRARY ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Use ieee.std_logic_unsigned.all;

--RAM MODULE INTERFACE
entity RAM is
    Port(Reset:	  in std_logic;
	 Clock:	  in std_logic;	 
	 OE:      in std_logic;
	 WE:      in std_logic;
	 Address: in std_logic_vector(29 downto 0);  -- 30 bits addressable
	 DataIn:  in std_logic_vector(31 downto 0);
	 DataOut: out std_logic_vector(31 downto 0));
end entity RAM;

architecture staticRAM of RAM is

   type ram_type is array (0 to 127) of std_logic_vector(31 downto 0);
   signal i_ram : ram_type;
  -- signal addInt: integer RANGE 0 to 127;
   SIGNAL highz: STD_LOGIC_VECTOR(31 DOWNTO 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

begin

  RamProc: process(Clock, Reset, OE, WE, Address) is

  begin
    if Reset = '1' then
      for i in 0 to 127 loop   
          i_ram(i) <= X"00000000";
      end loop;
    end if;

    IF falling_edge(Clock) THEN
	-- Add code to write data to RAM
	IF (WE = '1') THEN -- ONLY write data to i_ram on falling edge and write enable = 1.	
		IF (to_integer(unsigned(Address)) <= 127) THEN
			i_ram (to_integer(unsigned(Address))) <= DataIn;
		END IF;
	END IF;

    END IF;
    
    
    IF (OE='0' AND (to_integer(unsigned(Address)) <=127)) THEN
	DataOut <=  i_ram (to_integer(unsigned(Address)));
    ELSE
	Dataout <= highz;
	--DataOut(31 DOWNTO 0) <= 'Z';
      --  DataOut := X"ZZZZZZZZ";
    END IF;



	-- DMEM Section
	
	

  end process RamProc;

end staticRAM;	


--------------------------------------------------------------------------------
LIBRARY ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Use ieee.std_logic_unsigned.all;

entity Registers is
    Port(	ReadReg1: in std_logic_vector(4 downto 0); 	-- AddrA inst[19:15]
         	ReadReg2: in std_logic_vector(4 downto 0);      -- AddrB inst[24:20]
         	WriteReg: in std_logic_vector(4 downto 0);      -- AddrD inst[11:7] 
	 	WriteData: in std_logic_vector(31 downto 0);    -- Wb -- DataD
	 	WriteCmd: in std_logic;                         -- RegWen  = 1


	 	ReadData1: out std_logic_vector(31 downto 0);   -- Reg[rs1]
	 	ReadData2: out std_logic_vector(31 downto 0));  -- Reg[rs2]
end entity Registers;

architecture remember of Registers is
	component register32
  	    port(datain: in std_logic_vector(31 downto 0);      -- 
		 enout32,enout16,enout8: in std_logic;          -- 
		 writein32, writein16, writein8: in std_logic;  -- 
		 dataout: out std_logic_vector(31 downto 0));   -- 
	end component;
	
begin
    -- Add your code here for the Register Bank implementation

	

end remember;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
