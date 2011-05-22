-- *******************************************************************
-- Owner:		Xilinx Inc.
-- File:		pkg_spc_char.vhd
--
-- Purpose:		Function spec_char is used for transmitting a
--			series of special character test cases.
--
-- Author:		Jennifer Jenkins
-- Date:		3-31-2000
--
-- *******************************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package pkg_spc_char is
	function spec_char (count : integer) return std_logic_vector;
end pkg_spc_char;

package body pkg_spc_char is

constant VEC_SIZE : INTEGER := 16;

------------------------------------------------------------------------
	function spec_char (count: integer)  return std_logic_vector is

	constant var_23: STD_LOGIC_VECTOR(4 downto 0) := "10111";
	constant var_27: STD_LOGIC_VECTOR(4 downto 0) := "11011";
	constant var_28: STD_LOGIC_VECTOR(4 downto 0) := "11100";
	constant var_29: STD_LOGIC_VECTOR(4 downto 0) := "11101";
	constant var_30: STD_LOGIC_VECTOR(4 downto 0) := "11110";

	variable result: STD_LOGIC_VECTOR((VEC_SIZE - 1) downto 0) := 
		(others => '0');
	begin

		if count < 12 then

		case count is
		
			when 0 => result := "000" & var_28 & "000" & var_28;
			when 1 => result := "001" & var_28 & "001" & var_28;  
			when 2 => result := "010" & var_28 & "010" & var_28;
			when 3 => result := "011" & var_28 & "011" & var_28;
			when 4 => result := "100" & var_28 & "100" & var_28;
			when 5 => result := "101" & var_28 & "101" & var_28;
			when 6 => result := "110" & var_28 & "110" & var_28;
			when 7 => result := "111" & var_28 & "111" & var_28;
			when 8 => result := "111" & var_23 & "111" & var_23;
			when 9 => result := "111" & var_27 & "111" & var_27;
			when 10 => result := "111" & var_29 & "111" & var_29;
			when 11 => result := "111" & var_30 & "111" & var_30;
			when others =>  result := (others => '0');

		end case;

		end if;

		return result;

	end;

end pkg_spc_char;







