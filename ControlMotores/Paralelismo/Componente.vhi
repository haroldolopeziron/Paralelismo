
-- VHDL Instantiation Created from source file Componente.vhd -- 12:34:11 05/29/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Componente
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		EN : IN std_logic;
		PWM_in : IN std_logic_vector(7 downto 0);          
		PWM_OUT : OUT std_logic
		);
	END COMPONENT;

	Inst_Componente: Componente PORT MAP(
		CLK => ,
		RST => ,
		EN => ,
		PWM_OUT => ,
		PWM_in => 
	);


