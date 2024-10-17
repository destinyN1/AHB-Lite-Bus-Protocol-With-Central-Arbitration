library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSI is
port(
   HCLK: in std_logic;
   HRESETn: in std_logic;
   shared_HWDATA: inout std_logic_vector(31 downto 0);
   shared_HRDATA: inout std_logic_vector(31 downto 0);
   shared_HADDR: inout std_logic_vector(31 downto 0);
   shared_HTRANS: inout std_logic_vector(1 downto 0);
   shared_HSIZE: inout std_logic_vector(2 downto 0);
   shared_HBURST: inout std_logic_vector(2 downto 0);
   shared_HREADY: inout std_logic;
   shared_HRESP: inout std_logic_vector(1 downto 0);
   shared_HSEL: inout std_logic;
   
  
   SSI_HADDR      : out std_logic_vector(31 downto 0);
   SSI_HTRANS     : out std_logic_vector(1 downto 0);
   SSI_HSIZE      : out std_logic_vector(2 downto 0);
   SSI_HBURST     : out std_logic_vector(2 downto 0);
   SSI_HWRITE     : out std_logic;
   SSI_HWDATA     : out std_logic_vector(31 downto 0);  -- Write Data, from master
   SSI_HRDATA     : out std_logic_vector(31 downto 0);  -- Read Data, from slave
   SSI_HREADY     : out std_logic;
   SSI_HRESP      : out std_logic_vector(1 downto 0);
   SSI_HMASTLOCK  : out std_logic;
   SSI_HSEL       : out std_logic

   
  
   

);
end SSI;

architecture Behavioral of SSI is

begin


end Behavioral;