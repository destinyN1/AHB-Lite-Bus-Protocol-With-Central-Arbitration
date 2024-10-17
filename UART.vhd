library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART is
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
   
   UART_HADDR     : out std_logic_vector(31 downto 0);
   UART_HTRANS    : out std_logic_vector(1 downto 0);
   UART_HSIZE     : out std_logic_vector(2 downto 0);
   UART_HBURST    : out std_logic_vector(2 downto 0);
   UART_HWRITE    : out std_logic;
   UART_HWDATA    : out std_logic_vector(31 downto 0);  -- Write Data, from master
   UART_HRDATA    : out std_logic_vector(31 downto 0);  -- Read Data, from slave
   UART_HREADY    : out std_logic;
   UART_HRESP     : out std_logic_vector(1 downto 0);
   UART_HMASTLOCK : out std_logic;
   UART_HSEL      : out std_logic

);
end UART;

architecture Behavioral of UART is

begin


end Behavioral;