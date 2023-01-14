LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ControlCircuit IS
PORT (
opcode:in std_logic_vector (2 downto 0);
Ainvert, Binvert : out  std_logic;
Operation : out std_logic_vector(1 downto 0);
CarryIn : out std_logic);               
END ControlCircuit;

ARCHITECTURE CC OF ControlCircuit IS
BEGIN
PROCESS (opcode) 
BEGIN
	case opcode is
		when "011" =>
			Operation <= "10";
			Ainvert <= '0';
			Binvert <= '1';
			CarryIn <='1';
		when "100" =>
			Operation <= "00";
			Ainvert <= '1';
			Binvert <= '1';
			CarryIn <='0';
		when "101" =>
			Operation <= "01";
			Ainvert <= '1';
			Binvert <= '1';
			CarryIn <='0';
		when "110" => 
			Operation <= "11";
			Ainvert <= '0';
			Binvert <= '0';
			CarryIn <='0';
		when "000" => 
			Operation <= "00";
			Ainvert <= '0';
			Binvert <= '0';
			CarryIn <='0';
		when "001" => 
			Operation <= "01";
			Ainvert <= '0';
			Binvert <= '0';
			CarryIn <='0';
		when "010" => 
			Operation <= "10";
			Ainvert <= '0';
			Binvert <= '0';
			CarryIn <='0';
		when others => 
			NULL;
	end case;
END PROCESS;
END;



LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ALU16 IS 
PORT (
		a, b : in std_logic_vector (15 downto 0);
		opcode : in std_logic_vector (2 downto 0);
		EndResult: out std_logic_vector (15 downto 0);
		Overflow: out std_logic);
END;

ARCHITECTURE STRUCTURAL OF ALU16 IS 

COMPONENT ALU1 IS 
PORT (
		a, b, Ainvert, Binvert, CarryIn : in std_logic;
		Operation : in std_logic_vector (1 downto 0);
		CarryOut, FinalResult: out std_logic);
END COMPONENT;

COMPONENT ControlCircuit IS 
PORT (
	opcode:in std_logic_vector (2 downto 0);
	Ainvert, Binvert : out  std_logic;
	Operation : out std_logic_vector(1 downto 0);
	CarryIn : out std_logic);               
END COMPONENT;

SIGNAL CIn, Ai, Bi: std_logic;
SIGNAL op : std_logic_vector (1 downto 0);
SIGNAL Carry: std_logic_vector (15 downto 0);

BEGIN 
	STEP0: ControlCircuit PORT MAP (opcode, Ai, Bi, op, CIn);
	STEP1: ALU1 PORT MAP (a(0), b(0), Ai, Bi, CIn, op, Carry(0), EndResult(0));

	ALUn : for i in 1 to 15 GENERATE 
		STEPn: ALU1 PORT MAP(a(i), b(i), Ai, Bi, Carry(i-1), op, Carry(i), EndResult(i));
	END GENERATE;

	OverflowCheck: Overflow <= (Carry(15) XOR Carry(14));
END STRUCTURAL;