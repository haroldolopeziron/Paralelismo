
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

	entity Paralelismo_TOP is
		port(
			CLK : IN STD_LOGIC; -- Reloj del sistema
			RST : IN STD_LOGIC; -- Reset
			EN  : IN STD_LOGIC; -- Activar modulos
			PWM_IN1 : IN STD_LOGIC_VECTOR(7 downto 0); -- Control pwm motor 1
			PWM_IN2 : IN STD_LOGIC_VECTOR(7 downto 0); -- Control pwm motor 2
			PWM_OUT1 : out STD_LOGIC; -- Salida motor 1
			PWM_OUT2 : out STD_LOGIC  -- Salida motor 2
		);
	end Paralelismo_TOP;

architecture Structural of Paralelismo_TOP is

	COMPONENT Componente
		PORT(
			CLK : IN std_logic; -- Reloj del sistema
			RST : IN std_logic; -- Reset
			EN : IN std_logic;  -- Activar el módulo
			PWM_in : IN std_logic_vector(7 downto 0); -- Control pwm 
			PWM_OUT : OUT std_logic -- Salida con pwm
			);
	END COMPONENT;

begin

	Motor1: Componente PORT MAP(
		CLK => clk,
		RST => rst,
		EN => en,
		PWM_OUT => pwm_out1,
		PWM_in => pwm_in1
	);
	
	Motor2: Componente PORT MAP(
		CLK => clk,
		RST => rst,
		EN => en,
		PWM_OUT => pwm_out2,
		PWM_in => pwm_in2 
	);



end Structural;

