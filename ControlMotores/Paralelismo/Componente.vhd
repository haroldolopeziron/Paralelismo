
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:20:24 05/29/2015 
-- Design Name: 
-- Module Name:    Componente - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Componente is
generic(
	width : natural := 200
);
port(
		CLK: in STD_LOGIC;
		RST: in STD_LOGIC;
		EN :  in STD_LOGIC;
		PWM_OUT : out STD_LOGIC;
		PWM_in : in STD_LOGIC_vector(7 downto 0)
);
end Componente;

	architecture Behavioral of Componente is

		SIGNAL CONTEO : INTEGER RANGE 0 TO 255 := 0; -- Contador para validar el ancho de pulso

		begin

		process(clk,rst) -- Se activa cuando hay un cambio en clk o en rst
		begin
			if rising_edge(clk) then -- Se sincroniza con el reloj
				if rst='1' then
					CONTEO <= 0; -- Cuando el reset es uno se reinicia el conteo
				elsif en = '1' then
					CONTEO <= CONTEO+1; -- Seguimiento del conteo
				end if;
			end if;
			
		end process;
		
		-- Validar la salida de PWM, cuando es mejor a la entrada pwm_in este es alto,
		-- pero cuando es mayor a este bus la salida es cero.
		PWM_OUT <= '1' when (std_logic_vector( to_unsigned(CONTEO,8)))<pwm_in else '0';
		
	end Behavioral;

	