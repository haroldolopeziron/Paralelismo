--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:48:10 05/29/2015
-- Design Name:   
-- Module Name:   C:/Users/Haroldo/Documents/USAC/E6/Modulos mios/FSM/Paralelismo/TOP_TB.vhd
-- Project Name:  Paralelismo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Paralelismo_TOP
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TOP_TB IS
END TOP_TB;
 
ARCHITECTURE behavior OF TOP_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Paralelismo_TOP
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         EN : IN  std_logic;
         PWM_IN1 : IN  std_logic_vector(7 downto 0);
         PWM_IN2 : IN  std_logic_vector(7 downto 0);
         PWM_OUT1 : OUT  std_logic;
         PWM_OUT2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal EN : std_logic := '0';
   signal PWM_IN1 : std_logic_vector(7 downto 0) := (others => '0');
   signal PWM_IN2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal PWM_OUT1 : std_logic;
   signal PWM_OUT2 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Paralelismo_TOP PORT MAP (
          CLK => CLK,
          RST => RST,
          EN => EN,
          PWM_IN1 => PWM_IN1,
          PWM_IN2 => PWM_IN2,
          PWM_OUT1 => PWM_OUT1,
          PWM_OUT2 => PWM_OUT2
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '1';
		wait for 100 ns;
		rst <= '0';

		pwm_in1 <= "00110010";
		pwm_in2 <= "11001000";
		
		wait for CLK_period*10;
		
		en <= '1';

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
