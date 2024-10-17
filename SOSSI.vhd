library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SOSSI is
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
   
   SOSSI_HADDR    : out std_logic_vector(31 downto 0);
   SOSSI_HTRANS   : out std_logic_vector(1 downto 0);
   SOSSI_HSIZE    : out std_logic_vector(2 downto 0);
   SOSSI_HBURST   : out std_logic_vector(2 downto 0);
   SOSSI_HWRITE   : out std_logic;
   SOSSI_HWDATA   : out std_logic_vector(31 downto 0);  -- Write Data, from master
   SOSSI_HRDATA   : out std_logic_vector(31 downto 0);  -- Read Data, from slave
   SOSSI_HREADY   : out std_logic;
   SOSSI_HRESP    : out std_logic_vector(1 downto 0);
   SOSSI_HMASTLOCK: out std_logic;
   SOSSI_HSEL     : out std_logic

);
end SOSSI;

architecture Behavioral of SOSSI is

begin


end Behavioral;