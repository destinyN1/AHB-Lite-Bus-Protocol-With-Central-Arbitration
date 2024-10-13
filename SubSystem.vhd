-- SoC Subsystem Entity
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SubSystem is
  port (
    HCLK     : in std_logic; --AHB clock signal
    HRESETn   : in std_logic -- AHB active low reset
       
  );
end SubSystem;

-- SoC Subsystem Architecture
architecture Behavioral of SubSystem is
-- Signal declarations for AHB-Lite buses

--signal respresenting shared data buses for reading and writing data
signal  shared_HWDATA, shared_HRDATA : std_logic_vector(31 downto 0);

-- Address Bus (32-bit)
signal I2C_HADDR, SPI_HADDR, CCP_HADDR, UART_HADDR, SSI_HADDR, SOSSI_HADDR : std_logic_vector(31 downto 0);
-- Transfer Type (2-bit)
signal I2C_HTRANS, SPI_HTRANS, CCP_HTRANS, UART_HTRANS, SSI_HTRANS, SOSSI_HTRANS : std_logic_vector(1 downto 0);
-- Transfer Size (3-bit)
signal I2C_HSIZE, SPI_HSIZE, CCP_HSIZE, UART_HSIZE, SSI_HSIZE, SOSSI_HSIZE : std_logic_vector(2 downto 0);
-- Burst Type (3-bit)
signal I2C_HBURST, SPI_HBURST, CCP_HBURST, UART_HBURST, SSI_HBURST, SOSSI_HBURST : std_logic_vector(2 downto 0);
-- Write/Read (1-bit: 1 = write, 0 = read)
signal I2C_HWRITE, SPI_HWRITE, CCP_HWRITE, UART_HWRITE, SSI_HWRITE, SOSSI_HWRITE : std_logic;
-- Write Data Bus (32-bit for writing data)
signal I2C_HWDATA, SPI_HWDATA, CCP_HWDATA, UART_HWDATA, SSI_HWDATA, SOSSI_HWDATA : std_logic_vector(31 downto 0);
-- Read Data Bus (32-bit for reading data)
signal I2C_HRDATA, SPI_HRDATA, CCP_HRDATA, UART_HRDATA, SSI_HRDATA, SOSSI_HRDATA : std_logic_vector(31 downto 0);
-- Ready Signal (1-bit, slave to master)
signal I2C_HREADY, SPI_HREADY, CCP_HREADY, UART_HREADY, SSI_HREADY, SOSSI_HREADY : std_logic;
-- Response Signal (2-bit response type: OKAY, ERROR, RETRY, SPLIT)
signal I2C_HRESP, SPI_HRESP, CCP_HRESP, UART_HRESP, SSI_HRESP, SOSSI_HRESP : std_logic_vector(1 downto 0);
-- Select signal (indicates the active slave)
signal I2C_HSEL, SPI_HSEL, CCP_HSEL, UART_HSEL, SSI_HSEL, SOSSI_HSEL : std_logic;
-- Bus request signal (Master to Arbiter)
signal I2C_HBUSREQ, SPI_HBUSREQ, CCP_HBUSREQ, UART_HBUSREQ, SSI_HBUSREQ, SOSSI_HBUSREQ : std_logic;
-- Bus grant signal (Arbiter to Master)
signal I2C_HGRANT, SPI_HGRANT, CCP_HGRANT, UART_HGRANT, SSI_HGRANT, SOSSI_HGRANT : std_logic;
-- Master lock signal (1-bit: 1 = locked transfer, 0 = unlocked)
signal I2C_HMASTLOCK, SPI_HMASTLOCK, CCP_HMASTLOCK, UART_HMASTLOCK, SSI_HMASTLOCK, SOSSI_HMASTLOCK : std_logic;

--CPU Signal Declerations
 
-- Address Bus (32-bit)
signal CPU_HADDR : std_logic_vector(31 downto 0);
-- Transfer Type (2-bit)
signal CPU_HTRANS : std_logic_vector(1 downto 0);
-- Transfer Size (3-bit)
signal CPU_HSIZE : std_logic_vector(2 downto 0);
-- Burst Type (3-bit)
signal CPU_HBURST : std_logic_vector(2 downto 0);
-- Write/Read (1-bit: 1 = write, 0 = read)
signal CPU_HWRITE : std_logic;
-- Write Data Bus (32-bit for writing data)
signal CPU_HWDATA : std_logic_vector(31 downto 0);
-- Read Data Bus (32-bit for reading data)
signal CPU_HRDATA : std_logic_vector(31 downto 0);
-- Ready Signal (1-bit, slave to master)
signal CPU_HREADY : std_logic;
-- Response Signal (2-bit response type: OKAY, ERROR, RETRY, SPLIT)
signal CPU_HRESP : std_logic_vector(1 downto 0);
-- Master lock signal (1-bit: 1 = locked transfer, 0 = unlocked)
signal CPU_HMASTLOCK : std_logic;
-- Select signal (indicates the active slave for current transfer)
signal CPU_HSEL : std_logic;
-- Bus request signal (Master to Arbiter)
signal CPU_HBUSREQ : std_logic;
-- Bus grant signal (Arbiter to Master)
signal CPU_HGRANT : std_logic;


begin

-- Instantiate the Arbiter (which contains round-robin logic)
Arbiter_Inst : entity work.Arbiter
  port map (
    HCLK       => HCLK,  -- Single shared clock signal for all IPs and CPU
    HRESETn     => HRESETn,
    
    -- AHB-lite interfaces between IPs and arbiter (I2C, SPI, CCP, UART, SSI, SOSSI)
    I2C_HADDR => I2C_HADDR,
    SPI_HADDR => SPI_HADDR,
    CCP_HADDR => CCP_HADDR,
    UART_HADDR => UART_HADDR,
    SSI_HADDR => SSI_HADDR,
    SOSSI_HADDR => SOSSI_HADDR,
    
    -- Transfer Type (HTRANS)
    I2C_HTRANS => I2C_HTRANS, SPI_HTRANS => SPI_HTRANS, CCP_HTRANS => CCP_HTRANS, 
    UART_HTRANS => UART_HTRANS, SSI_HTRANS => SSI_HTRANS, SOSSI_HTRANS => SOSSI_HTRANS,
    
    -- Transfer Size (HSIZE)
    I2C_HSIZE => I2C_HSIZE, SPI_HSIZE => SPI_HSIZE, CCP_HSIZE => CCP_HSIZE, 
    UART_HSIZE => UART_HSIZE, SSI_HSIZE => SSI_HSIZE, SOSSI_HSIZE => SOSSI_HSIZE,
    
    -- Burst Type (HBURST)
    I2C_HBURST => I2C_HBURST, SPI_HBURST => SPI_HBURST, CCP_HBURST => CCP_HBURST,
    UART_HBURST => UART_HBURST, SSI_HBURST => SSI_HBURST, SOSSI_HBURST => SOSSI_HBURST,
    
    -- Write/Read (HWRITE)
    I2C_HWRITE => I2C_HWRITE, SPI_HWRITE => SPI_HWRITE, CCP_HWRITE => CCP_HWRITE, 
    UART_HWRITE => UART_HWRITE, SSI_HWRITE => SSI_HWRITE, SOSSI_HWRITE => SOSSI_HWRITE,
    
    -- Write Data Bus (HWDATA)
    I2C_HWDATA => I2C_HWDATA, SPI_HWDATA => SPI_HWDATA, CCP_HWDATA => CCP_HWDATA, 
    UART_HWDATA => UART_HWDATA, SSI_HWDATA => SSI_HWDATA, SOSSI_HWDATA => SOSSI_HWDATA,
    
    -- Read Data Bus (HRDATA)
    I2C_HRDATA => I2C_HRDATA, SPI_HRDATA => SPI_HRDATA, CCP_HRDATA => CCP_HRDATA, 
    UART_HRDATA => UART_HRDATA, SSI_HRDATA => SSI_HRDATA, SOSSI_HRDATA => SOSSI_HRDATA,
    
    -- Ready Signal (HREADY)
    I2C_HREADY => I2C_HREADY, SPI_HREADY => SPI_HREADY, CCP_HREADY => CCP_HREADY, 
    UART_HREADY => UART_HREADY, SSI_HREADY => SSI_HREADY, SOSSI_HREADY => SOSSI_HREADY,
    
    -- Response Signal (HRESP)
    I2C_HRESP => I2C_HRESP, SPI_HRESP => SPI_HRESP, CCP_HRESP => CCP_HRESP, 
    UART_HRESP => UART_HRESP, SSI_HRESP => SSI_HRESP, SOSSI_HRESP => SOSSI_HRESP,
    
    -- Master lock signal (HMASTLOCK)
    I2C_HMASTLOCK => I2C_HMASTLOCK, SPI_HMASTLOCK => SPI_HMASTLOCK, CCP_HMASTLOCK => CCP_HMASTLOCK, 
    UART_HMASTLOCK => UART_HMASTLOCK, SSI_HMASTLOCK => SSI_HMASTLOCK, SOSSI_HMASTLOCK => SOSSI_HMASTLOCK,
    
    -- Select signal (HSEL)
    I2C_HSEL => I2C_HSEL, SPI_HSEL => SPI_HSEL, CCP_HSEL => CCP_HSEL, 
    UART_HSEL => UART_HSEL, SSI_HSEL => SSI_HSEL, SOSSI_HSEL => SOSSI_HSEL,
    
    -- Bus request signal (HBUSREQ)
    I2C_HBUSREQ => I2C_HBUSREQ, SPI_HBUSREQ => SPI_HBUSREQ, CCP_HBUSREQ => CCP_HBUSREQ, 
    UART_HBUSREQ => UART_HBUSREQ, SSI_HBUSREQ => SSI_HBUSREQ, SOSSI_HBUSREQ => SOSSI_HBUSREQ,
    

    -- AHB-lite interface between CPU and arbiter
    CPU_HADDR  => CPU_HADDR,
    CPU_HTRANS => CPU_HTRANS,
    CPU_HSIZE  => CPU_HSIZE,
    CPU_HBURST => CPU_HBURST,
    CPU_HWRITE => CPU_HWRITE,
    CPU_HWDATA => CPU_HWDATA,
    CPU_HRDATA => CPU_HRDATA,
    CPU_HREADY => CPU_HREADY,
    CPU_HRESP  => CPU_HRESP,
    CPU_HMASTLOCK => CPU_HMASTLOCK,
    CPU_HSEL   => CPU_HSEL,
    CPU_HBUSREQ => CPU_HBUSREQ

  );

  -- Implement the interconnectivity of the IPs to the arbiter here
  -- For now, just show that each IP is connected via AHB Lite
end Behavioral;