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
   shared_HWDATA: in std_logic_vector(31 downto 0);
   shared_HRDATA: in std_logic_vector(31 downto 0);
   shared_HADDR: in std_logic_vector(31 downto 0);
   shared_HTRANS: in std_logic_vector(1 downto 0);
   shared_HSIZE: in std_logic_vector(2 downto 0);
   shared_HBURST: in std_logic_vector(2 downto 0);
   shared_HREADY: in std_logic;
   shared_HRESP: in std_logic_vector(1 downto 0);
   shared_HSEL: in std_logic;
   
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