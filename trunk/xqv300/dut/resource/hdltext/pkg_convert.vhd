-- *******************************************************************
-- Owner:		Xilinx Inc.
-- File:		pkg_convert.vhd
--
-- Purpose:		Utilizes vec2int and int2vec functions.  Called
--			from tst_bench module.  Convert integer to vector
--			of size 16-bits (int2vec) and converts 16-bit 
--			vector to integer (vec2int).
--
-- Author:		Jennifer Jenkins
-- Date:		3-31-2000
--
-- *******************************************************************


library ieee;
use ieee.std_logic_1164.all;

package pkg_convert is
function vec2int  (v : std_logic_vector) return integer;
function int2vec  (i : integer) return std_logic_vector;
end pkg_convert;

package body pkg_convert is

constant	VEC_SIZE	: INTEGER := 16;
constant	POW_2_VEC	: INTEGER := 32768;

------------------------------------------------------------------------
	function int2vec      (i: integer)  return std_logic_vector is
	variable temp: integer;
	variable result: std_logic_vector ((VEC_SIZE - 1) downto 0) := 
		(others => '0');
	begin
		temp := i;
		if( temp >= 0 ) then
			for b in 0 to (VEC_SIZE - 1) loop
				if temp mod 2 = 1 then
					result (b) := '1';
				end if;
				temp := temp / 2;
			end loop;
			return result;
		else
			result(VEC_SIZE - 1) := '1';
			temp := temp + (POW_2_VEC - 1);
			temp := temp + 1;
			for b in 0 to (VEC_SIZE - 2) loop
				if temp mod 2 = 1 then
					result (b) := '1';
				end if;
				temp := temp / 2;
			end loop;
			return result;
		end if;
	end;

------------------------------------------------------------------------
	function vec2int           (v: std_logic_vector) return integer is
	variable result: integer := 0;
	variable addition: integer := 1;
	begin
		for b in v'reverse_range loop
			if v (b) = '1' or v(b)='H' then
				if b = (VEC_SIZE - 1) then
					result := - POW_2_VEC + result;
				else
					result := result + addition;
				end if;
			end if;
			if( b < (VEC_SIZE - 2))then
				addition := addition * 2;
			end if;
		end loop;
		return result;
	end;

------------------------------------------------------------------------

end pkg_convert;


