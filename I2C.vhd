----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 04:15:31 PM
-- Design Name: 
-- Module Name: I2C - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity I2C is
port(
   HCLK           : in  std_logic;
   HRESETn        : in  std_logic;
   shared_HWDATA  : inout std_logic_vector(31 downto 0);
   shared_HRDATA  : inout std_logic_vector(31 downto 0);
   shared_HADDR   : inout std_logic_vector(31 downto 0);
   shared_HTRANS  : inout std_logic_vector(1 downto 0);
   shared_HSIZE   : inout std_logic_vector(2 downto 0);
   shared_HBURST  : inout std_logic_vector(2 downto 0);
   shared_HREADY  : inout std_logic;
   shared_HRESP   : inout std_logic_vector(1 downto 0);
   shared_HSEL    : inout std_logic;
   
   I2C_HADDR      : out std_logic_vector(31 downto 0);
   I2C_HTRANS     : out std_logic_vector(1 downto 0);
   I2C_HSIZE      : out std_logic_vector(2 downto 0);
   I2C_HBURST     : out std_logic_vector(2 downto 0);
   I2C_HWRITE     : out std_logic;
   I2C_HWDATA     : out std_logic_vector(31 downto 0);  -- Write Data, from master
   I2C_HRDATA     : out std_logic_vector(31 downto 0);  -- Read Data, from slave
   I2C_HREADY     : out std_logic;
   I2C_HRESP      : out std_logic_vector(1 downto 0);
   I2C_HMASTLOCK  : out std_logic;
   I2C_HSEL       : out std_logic




);
end I2C;

architecture Behavioral of I2C is

begin


end Behavioral;
