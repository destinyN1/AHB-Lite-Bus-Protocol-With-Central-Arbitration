----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 04:17:10 PM
-- Design Name: 
-- Module Name: SPI - Behavioral
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

entity SPI is
port(
   HCLK: in std_logic;
   HRESETn: in std_logic;
   shared_HWDATA: in std_logic_vector(31 downto 0);
   shared_HRDATA: in std_logic_vector(31 downto 0);
   shared_HADDR: in std_logic_vector(31 downto 0);
   shared_HTRANS: in std_logic_vector(1 downto 0);
   shared_HSIZE: in std_logic_vector(2 downto 0);
   shared_HBURST: in std_logic_vector(2 downto 0);
   shared_HREADY: in std_logic;
   shared_HRESP: in std_logic_vector(1 downto 0);
   shared_HSEL: in std_logic;
   
   
   SPI_HADDR      : out std_logic_vector(31 downto 0);
   SPI_HTRANS     : out std_logic_vector(1 downto 0);
   SPI_HSIZE      : out std_logic_vector(2 downto 0);
   SPI_HBURST     : out std_logic_vector(2 downto 0);
   SPI_HWRITE     : out std_logic;
   SPI_HWDATA     : out std_logic_vector(31 downto 0);  -- Write Data, from master
   SPI_HRDATA     : out std_logic_vector(31 downto 0);  -- Read Data, from slave
   SPI_HREADY     : out std_logic;
   SPI_HRESP      : out std_logic_vector(1 downto 0);
   SPI_HMASTLOCK  : out std_logic;
   SPI_HSEL       : out std_logic


);
end SPI;

architecture Behavioral of SPI is

begin


end Behavioral;
