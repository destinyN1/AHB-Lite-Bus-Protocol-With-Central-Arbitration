-- Arbitration Module Entity
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Arbiter is
  port (
    HCLK     : in std_logic;
    HRESETn     : in std_logic;

-- Signals to represent shared data bus
   shared_HWDATA: out std_logic_vector(31 downto 0);
   shared_HRDATA: out std_logic_vector(31 downto 0);
   shared_HADDR: out std_logic_vector(31 downto 0);
   shared_HTRANS: out std_logic_vector(1 downto 0);
   shared_HSIZE: out std_logic_vector(2 downto 0);
   shared_HBURST: out std_logic_vector(2 downto 0);
   shared_HREADY: out std_logic;
   shared_HRESP: out std_logic_vector(1 downto 0);
   shared_HSEL: out std_logic;
   
   
   
    -- AHB-lite interface ports for the IPs (I2C, SPI, CCP, UART, SSI, SOSSI)
    I2C_HADDR     : in std_logic_vector(31 downto 0);
    SPI_HADDR     : in std_logic_vector(31 downto 0);
    CCP_HADDR     : in std_logic_vector(31 downto 0);
    UART_HADDR    : in std_logic_vector(31 downto 0);
    SSI_HADDR     : in std_logic_vector(31 downto 0);
    SOSSI_HADDR   : in std_logic_vector(31 downto 0);

    I2C_HTRANS    : in std_logic_vector(1 downto 0);
    SPI_HTRANS    : in std_logic_vector(1 downto 0);
    CCP_HTRANS    : in std_logic_vector(1 downto 0);
    UART_HTRANS   : in std_logic_vector(1 downto 0);
    SSI_HTRANS    : in std_logic_vector(1 downto 0);
    SOSSI_HTRANS  : in std_logic_vector(1 downto 0);

    I2C_HSIZE     : in std_logic_vector(2 downto 0);
    SPI_HSIZE     : in std_logic_vector(2 downto 0);
    CCP_HSIZE     : in std_logic_vector(2 downto 0);
    UART_HSIZE    : in std_logic_vector(2 downto 0);
    SSI_HSIZE     : in std_logic_vector(2 downto 0);
    SOSSI_HSIZE   : in std_logic_vector(2 downto 0);

    I2C_HBURST    : in std_logic_vector(2 downto 0);
    SPI_HBURST    : in std_logic_vector(2 downto 0);
    CCP_HBURST    : in std_logic_vector(2 downto 0);
    UART_HBURST   : in std_logic_vector(2 downto 0);
    SSI_HBURST    : in std_logic_vector(2 downto 0);
    SOSSI_HBURST  : in std_logic_vector(2 downto 0);

    I2C_HWRITE    : in std_logic;
    SPI_HWRITE    : in std_logic;
    CCP_HWRITE    : in std_logic;
    UART_HWRITE   : in std_logic;
    SSI_HWRITE    : in std_logic;
    SOSSI_HWRITE  : in std_logic;

    I2C_HWDATA    : in std_logic_vector(31 downto 0);  -- Write Data, from master to appropriate slave
    SPI_HWDATA    : in std_logic_vector(31 downto 0);
    CCP_HWDATA    : in std_logic_vector(31 downto 0);
    UART_HWDATA   : in std_logic_vector(31 downto 0);
    SSI_HWDATA    : in std_logic_vector(31 downto 0);
    SOSSI_HWDATA  : in std_logic_vector(31 downto 0);

    I2C_HRDATA    : in std_logic_vector(31 downto 0);  -- Read Data, from slave to appropriate master
    SPI_HRDATA    : in std_logic_vector(31 downto 0);
    CCP_HRDATA    : in std_logic_vector(31 downto 0);
    UART_HRDATA   : in std_logic_vector(31 downto 0);
    SSI_HRDATA    : in std_logic_vector(31 downto 0);
    SOSSI_HRDATA  : in std_logic_vector(31 downto 0);

    I2C_HREADY    : in std_logic;
    SPI_HREADY    : in std_logic;
    CCP_HREADY    : in std_logic;
    UART_HREADY   : in std_logic;
    SSI_HREADY    : in std_logic;
    SOSSI_HREADY  : in std_logic;

    I2C_HRESP     : in std_logic_vector(1 downto 0);
    SPI_HRESP     : in std_logic_vector(1 downto 0);
    CCP_HRESP     : in std_logic_vector(1 downto 0);
    UART_HRESP    : in std_logic_vector(1 downto 0);
    SSI_HRESP     : in std_logic_vector(1 downto 0);
    SOSSI_HRESP   : in std_logic_vector(1 downto 0);

    I2C_HMASTLOCK : in std_logic;
    SPI_HMASTLOCK : in std_logic;
    CCP_HMASTLOCK : in std_logic;
    UART_HMASTLOCK: in std_logic;
    SSI_HMASTLOCK : in std_logic;
    SOSSI_HMASTLOCK: in std_logic;

    I2C_HSEL      : in std_logic;
    SPI_HSEL      : in std_logic;
    CCP_HSEL      : in std_logic;
    UART_HSEL     : in std_logic;
    SSI_HSEL      : in std_logic;
    SOSSI_HSEL    : in std_logic;

    -- Master signals
    
    -- Bus request signals
    I2C_HBUSREQ   : in std_logic;
    SPI_HBUSREQ   : in std_logic;
    CCP_HBUSREQ   : in std_logic;
    UART_HBUSREQ  : in std_logic;
    SSI_HBUSREQ   : in std_logic;
    SOSSI_HBUSREQ : in std_logic;

    -- AHB-lite interface for the CPU
    CPU_HADDR     : in std_logic_vector(31 downto 0);
    CPU_HTRANS    : in std_logic_vector(1 downto 0);
    CPU_HSIZE     : in std_logic_vector(2 downto 0);
    CPU_HBURST    : in std_logic_vector(2 downto 0);
    CPU_HWRITE    : in std_logic;
    CPU_HWDATA    : in std_logic_vector(31 downto 0);  -- Write Data, from master
    CPU_HRDATA    : in std_logic_vector(31 downto 0);  -- Read Data, from slave
    CPU_HREADY    : in std_logic;
    CPU_HRESP     : in std_logic_vector(1 downto 0);
    CPU_HMASTLOCK : in std_logic;
    CPU_HSEL      : in std_logic;
    CPU_HBUSREQ   : in std_logic
   
   
   
  );
end Arbiter;

-- Arbitration Module Architecture
architecture Behavioral of Arbiter is
--Definition for IP
type master_type is (I2C, SPI, CCP, UART, SSI, SOSSI, CPU);


--Bus access signals
signal I2C_HGRANT : std_logic;
signal SPI_HGRANT : std_logic;
signal CCP_HGRANT : std_logic;
signal UART_HGRANT : std_logic;
signal SSI_HGRANT : std_logic;
signal SOSSI_HGRANT : std_logic;
signal CPU_HGRANT : std_logic;







-- Signal to hold the current master
signal current_master : master_type;

begin
  Round_Robin: process(HCLK, HRESETn)
  begin
    if HRESETn = '0' then
        -- Reset all grants
        I2C_HGRANT  <= '0';
        SPI_HGRANT  <= '0';
        CCP_HGRANT  <= '0';
        UART_HGRANT <= '0';
        SSI_HGRANT  <= '0';
        SOSSI_HGRANT <= '0';
        CPU_HGRANT  <= '0';
        current_master <= I2C;  -- Start with I2C
        
    elsif rising_edge(HCLK) then
        -- Round-robin arbitration process with HBUSREQ checking
        case current_master is
            when I2C =>
                if I2C_HBUSREQ = '1' or I2C_HMASTLOCK ='1' then
                    -- Grant bus to I2C if it has requested the bus
                    I2C_HGRANT  <= '1';
                    SPI_HGRANT  <= '0';
                    CCP_HGRANT  <= '0';
                    UART_HGRANT <= '0';
                    SSI_HGRANT  <= '0';
                    SOSSI_HGRANT <= '0';
                    CPU_HGRANT  <= '0';
                else
                    -- Move to next master (SPI) if I2C does not request the bus
                    current_master <= SPI;
                end if;

            when SPI =>
                if SPI_HBUSREQ = '1' or SPI_HMASTLOCK ='1' then
                    -- Grant bus to SPI if it has requested the bus
                    I2C_HGRANT  <= '0';
                    SPI_HGRANT  <= '1';
                    CCP_HGRANT  <= '0';
                    UART_HGRANT <= '0';
                    SSI_HGRANT  <= '0';
                    SOSSI_HGRANT <= '0';
                    CPU_HGRANT  <= '0';
                else
                    -- Move to next master (CCP) if SPI does not request the bus
                    current_master <= CCP;
                end if;

            when CCP =>
                if CCP_HBUSREQ = '1' or CCP_HMASTLOCK ='1' then
                    -- Grant bus to CCP if it has requested the bus
                    I2C_HGRANT  <= '0';
                    SPI_HGRANT  <= '0';
                    CCP_HGRANT  <= '1';
                    UART_HGRANT <= '0';
                    SSI_HGRANT  <= '0';
                    SOSSI_HGRANT <= '0';
                    CPU_HGRANT  <= '0';
                else
                    -- Move to next master (UART) if CCP does not request the bus
                    current_master <= UART;
                end if;

            when UART =>
                if UART_HBUSREQ = '1' or UART_HMASTLOCK ='1' then
                    -- Grant bus to UART if it has requested the bus
                    I2C_HGRANT  <= '0';
                    SPI_HGRANT  <= '0';
                    CCP_HGRANT  <= '0';
                    UART_HGRANT <= '1';
                    SSI_HGRANT  <= '0';
                    SOSSI_HGRANT <= '0';
                    CPU_HGRANT  <= '0';
                else
                    -- Move to next master (SSI) if UART does not request the bus
                    current_master <= SSI;
                end if;

            when SSI =>
                if SSI_HBUSREQ = '1' or SSI_HMASTLOCK ='1' then
                    -- Grant bus to SSI if it has requested the bus
                    I2C_HGRANT  <= '0';
                    SPI_HGRANT  <= '0';
                    CCP_HGRANT  <= '0';
                    UART_HGRANT <= '0';
                    SSI_HGRANT  <= '1';
                    SOSSI_HGRANT <= '0';
                    CPU_HGRANT  <= '0';
                else
                    -- Move to next master (SOSSI) if SSI does not request the bus
                    current_master <= SOSSI;
                end if;

            when SOSSI =>
                if SOSSI_HBUSREQ = '1' or SOSSI_HMASTLOCK ='1' then
                    -- Grant bus to SOSSI if it has requested the bus
                    I2C_HGRANT  <= '0';
                    SPI_HGRANT  <= '0';
                    CCP_HGRANT  <= '0';
                    UART_HGRANT <= '0';
                    SSI_HGRANT  <= '0';
                    SOSSI_HGRANT <= '1';
                    CPU_HGRANT  <= '0';
                else
                    -- Move to next master (CPU) if SOSSI does not request the bus
                    current_master <= CPU;
                end if;

            when CPU =>
                if CPU_HBUSREQ = '1' or CPU_HMASTLOCK ='1' then
                    -- Grant bus to CPU if it has requested the bus
                    I2C_HGRANT  <= '0';
                    SPI_HGRANT  <= '0';
                    CCP_HGRANT  <= '0';
                    UART_HGRANT <= '0';
                    SSI_HGRANT  <= '0';
                    SOSSI_HGRANT <= '0';
                    CPU_HGRANT  <= '1';
                else
                    -- Return to I2C if CPU does not request the bus
                    current_master <= I2C;
                end if;

            when others =>
                -- Default case to avoid latching: Set all grants to zero
                I2C_HGRANT  <= '0';
                SPI_HGRANT  <= '0';
                CCP_HGRANT  <= '0';
                UART_HGRANT <= '0';
                SSI_HGRANT  <= '0';
                SOSSI_HGRANT <= '0';
                CPU_HGRANT  <= '0';
                current_master <= I2C;  -- Reset to I2C as default
        end case;
        
        
    end if;
  end process;


  -- Forward the HWDATA from the currently granted master to the slave
  FWD_HWDATA_p: process(HCLK, HRESETn)
  begin
    if HRESETn = '0' then
        -- Reset logic here
        shared_HWDATA <= (others => '0');  -- Default zero to avoid latching
    elsif rising_edge(HCLK) then
    
        if I2C_HGRANT = '1' and I2C_HWRITE ='1' then
            shared_HWDATA <= I2C_HWDATA;
            
        elsif SPI_HGRANT = '1' and SPI_HWRITE ='1' then
            shared_HWDATA <= SPI_HWDATA;
            
        elsif CCP_HGRANT = '1' and CCP_HWRITE ='1' then
            shared_HWDATA <= CCP_HWDATA;
            
        elsif UART_HGRANT = '1' and UART_HWRITE ='1' then
            shared_HWDATA <= UART_HWDATA;
            
        elsif SSI_HGRANT = '1' and SSI_HWRITE ='1' then
            shared_HWDATA <= SSI_HWDATA;
            
        elsif SOSSI_HGRANT = '1' and SOSSI_HWRITE ='1' then
            shared_HWDATA <= SOSSI_HWDATA;
            
        elsif CPU_HGRANT = '1' and CPU_HWRITE ='1' then
            shared_HWDATA <= CPU_HWDATA;
        
             
        end if;
    end if;
  end process;

  -- Forward the HRDATA from the slave to the currently granted master
 FWD_HRDATA_p: process(HCLK, HRESETn)
  begin
  
   if HRESETn = '0' then
        -- Reset logic here
        shared_HRDATA <= (others => '0');  -- Default zero to avoid latching
        
    if rising_edge(HCLK) then
    
        if I2C_HGRANT = '1' and I2C_HWRITE ='0'  then
            shared_HRDATA <= I2C_HRDATA;  -- Forward slave data to I2C master
            
        elsif SPI_HGRANT = '1' and SPI_HWRITE ='0' then       
            shared_HRDATA <= SPI_HRDATA;  -- Forward slave data to SPI master
            
        elsif CCP_HGRANT = '1' and CCP_HWRITE ='0' then
           shared_HRDATA<= CCP_HRDATA;  -- Forward slave data to CCP master
            
        elsif UART_HGRANT = '1' and UART_HWRITE ='0' then
            shared_HRDATA <= UART_HRDATA; -- Forward slave data to UART master
            
        elsif SSI_HGRANT = '1' and SSI_HWRITE ='0' then
           shared_HRDATA<= SSI_HRDATA;  -- Forward slave data to SSI master
            
        elsif SOSSI_HGRANT = '1' and SOSSI_HWRITE ='0' then 
            shared_HRDATA<= SOSSI_HRDATA;-- Forward slave data to SOSSI master
            
        elsif CPU_HGRANT = '1' and CPU_HWRITE ='0' then
            shared_HRDATA <= CPU_HRDATA;  -- Forward slave data to CPU master
        end if;
        end if;
        end if;
 end process;

--  Forward HADDR
FWD_HADDR_p: process(HCLK, HRESETn) 
begin
    if HRESETn = '0' then
        -- Asynchronous reset: Set shared_HADDR to default value when reset is active (low)
        shared_HADDR <= (others => '0');
    elsif rising_edge(HCLK) then
        -- Synchronous logic triggered on the rising edge of the clock
        if current_master = I2C then
            shared_HADDR <= I2C_HADDR;
            
        elsif current_master = SPI then
            shared_HADDR <= SPI_HADDR;
            
        elsif current_master = CCP then
            shared_HADDR <= CCP_HADDR;
            
        elsif current_master = UART then
            shared_HADDR <= UART_HADDR;
            
        elsif current_master = SSI then
            shared_HADDR <= SSI_HADDR;
            
        elsif current_master = SOSSI then
            shared_HADDR <= SOSSI_HADDR;
            
        elsif current_master = CPU then
            shared_HADDR <= CPU_HADDR;
        else
            shared_HADDR <= (others => '0');  -- Default value for shared_HADDR if none of the conditions match
        end if;
    end if;
end process;


-- HTRANS generation process 
HTRANS_P: process(HCLK, HRESETn, current_master)
begin
    if HRESETn = '0' then
        -- Asynchronous reset: Set HTRANS to IDLE on reset
        shared_HTRANS <= "00";  -- IDLE
        
    elsif rising_edge(HCLK) then
        if current_master = I2C and I2C_HBUSREQ = '1' and I2C_HWRITE = '1' then
           
                shared_HTRANS <= I2C_HTRANS;  
    
            
        elsif current_master = SPI and SPI_HBUSREQ = '1' and CPU_HWRITE = '1' then
            
                shared_HTRANS <= SPI_HTRANS;            
 
            
        elsif current_master = CCP and CCP_HBUSREQ = '1' and CCP_HWRITE = '1' then
            
                shared_HTRANS <= CCP_HTRANS;                          
       
            
        elsif current_master = UART and UART_HBUSREQ = '1' and UART_HWRITE = '1' then
                     
                shared_HTRANS <= UART_HTRANS;   
       
            
        elsif current_master = SSI and SSI_HBUSREQ = '1'  and SSI_HWRITE = '1' then
           
          shared_HTRANS <= SSI_HTRANS; 
            
        elsif current_master = SOSSI and SOSSI_HBUSREQ = '1' and SOSSI_HWRITE = '1' then
           shared_HTRANS <= SOSSI_HTRANS;
          
            
        elsif current_master = CPU and CPU_HBUSREQ = '1' and CPU_HWRITE = '1' then
     
            shared_HTRANS <= CPU_HTRANS;
            
        else
            -- No valid request, set HTRANS to IDLE
            shared_HTRANS <= "00";  -- IDLE
        end if;
        end if;
end process;

-- HSIZE generation process 
HSIZE: process(HCLK, HRESETn)
begin
    if HRESETn = '0' then
        -- Asynchronous reset: Set HSIZE to a default value (Byte size) on reset
        shared_HSIZE <= "000";  -- Default to Byte transfer (8 bits)
        
    elsif rising_edge(HCLK) then
        if current_master = I2C and I2C_HBUSREQ = '1' then
            if I2C_HWRITE = '1' then
                shared_HSIZE <= I2C_HSIZE;  -- Use I2C's transfer size
            end if;
            
        elsif current_master = SPI and SPI_HBUSREQ = '1' then
            if SPI_HWRITE = '1' then
                shared_HSIZE <= SPI_HSIZE;  -- Use SPI's transfer size
            end if;
            
        elsif current_master = CCP and CCP_HBUSREQ = '1' then
            if CCP_HWRITE = '1' then
                shared_HSIZE <= CCP_HSIZE;  -- Use CCP's transfer size
            end if;
            
        elsif current_master = UART and UART_HBUSREQ = '1' then
            if UART_HWRITE = '1' then
                shared_HSIZE <= UART_HSIZE;  -- Use UART's transfer size
            end if;
            
        elsif current_master = SSI and SSI_HBUSREQ = '1' then
            if SSI_HWRITE = '1' then
                shared_HSIZE <= SSI_HSIZE;  -- Use SSI's transfer size
            end if;
            
        elsif current_master = SOSSI and SOSSI_HBUSREQ = '1' then
            if SOSSI_HWRITE ='1' then
            shared_HSIZE <= SOSSI_HSIZE;
            
        elsif current_master = CPU and CPU_HBUSREQ = '1' then
            if CPU_HWRITE = '1' then
                shared_HSIZE <= CPU_HSIZE;  -- Use CPU's transfer size
            end if;
            
        else
            -- No valid request, set HSIZE to default (Byte transfer)
            shared_HSIZE <= "000";  -- Default to Byte size transfer
        end if;
end if;
end if;
end process;

-- HBURST generation process 
HBURST_p: process(HCLK, HRESETn)
begin
    if HRESETn = '0' then
        -- Asynchronous reset: Set HBURST to Single transfer on reset
        shared_HBURST <= "000";  -- Default to Single transfer (no burst)
        
    elsif rising_edge(HCLK) then
        if current_master = I2C and I2C_HBUSREQ = '1' then
            shared_HBURST <= I2C_HBURST;  -- Use I2C's burst type
            
        elsif current_master = SPI and SPI_HBUSREQ = '1' then
            shared_HBURST <= SPI_HBURST;  -- Use SPI's burst type
            
        elsif current_master = CCP and CCP_HBUSREQ = '1' then
            shared_HBURST <= CCP_HBURST;  -- Use CCP's burst type
            
        elsif current_master = UART and UART_HBUSREQ = '1' then
            shared_HBURST <= UART_HBURST;  -- Use UART's burst type
            
        elsif current_master = SSI and SSI_HBUSREQ = '1' then
            shared_HBURST <= SSI_HBURST;  -- Use SSI's burst type
            
        elsif current_master = SOSSI and SOSSI_HBUSREQ = '1' then
            shared_HBURST <= SOSSI_HBURST;  -- Use SOSSI's burst type
            
        elsif current_master = CPU and CPU_HBUSREQ = '1' then
            shared_HBURST <= CPU_HBURST;  -- Use CPU's burst type
            
        else
            -- No valid request, set HBURST to Single transfer
            shared_HBURST <= "000";  -- Default to Single transfer
        end if;
    end if;
end process;

-- HREADY generation process 
HREADY_p: process(HCLK, HRESETn)
begin
    if HRESETn = '0' then
        -- Asynchronous reset: Set HREADY to '1' (ready) on reset
        shared_HREADY <= '1';  -- Ready by default after reset
        
    elsif rising_edge(HCLK) then
        -- Check for the currently granted master and the transfer status
        if current_master = I2C and I2C_HBUSREQ = '1' then
            -- Assume HREADY depends on the slave being ready (slave-specific logic)
            shared_HREADY <= I2C_HREADY;  -- Forward the HREADY signal from the I2C slave
            
        elsif current_master = SPI and SPI_HBUSREQ = '1' then
            shared_HREADY <= SPI_HREADY;  -- Forward the HREADY signal from the SPI slave
            
        elsif current_master = CCP and CCP_HBUSREQ = '1' then
            shared_HREADY <= CCP_HREADY;  -- Forward the HREADY signal from the CCP slave
            
        elsif current_master = UART and UART_HBUSREQ = '1' then
            shared_HREADY <= UART_HREADY;  -- Forward the HREADY signal from the UART slave
            
        elsif current_master = SSI and SSI_HBUSREQ = '1' then
            shared_HREADY <= SSI_HREADY;  -- Forward the HREADY signal from the SSI slave
            
        elsif current_master = SOSSI and SOSSI_HBUSREQ = '1' then
            shared_HREADY <= SOSSI_HREADY;  -- Forward the HREADY signal from the SOSSI slave
            
        elsif current_master = CPU and CPU_HBUSREQ = '1' then
            shared_HREADY <= CPU_HREADY;  -- Forward the HREADY signal from the CPU slave
            
        else
            -- If no valid master or bus request, assume the bus is ready
            shared_HREADY <= '1';  -- Default to ready state
        end if;
    end if;
end process;

-- HRESP generation process 
HRESP_p: process(HCLK, HRESETn)
begin
    if HRESETn = '0' then
        -- Asynchronous reset: Set HRESP to OKAY (successful transfer) on reset
        shared_HRESP <= "00";  -- OKAY, default state after reset
        
    elsif rising_edge(HCLK) then
        -- Check which master is granted access and forward the corresponding slave's response
        if current_master = I2C and I2C_HBUSREQ = '1' then
            -- Forward the HRESP signal from the I2C slave
            shared_HRESP <= I2C_HRESP;
            
        elsif current_master = SPI and SPI_HBUSREQ = '1' then
            -- Forward the HRESP signal from the SPI slave
            shared_HRESP <= SPI_HRESP;
            
        elsif current_master = CCP and CCP_HBUSREQ = '1' then
            -- Forward the HRESP signal from the CCP slave
            shared_HRESP <= CCP_HRESP;
            
        elsif current_master = UART and UART_HBUSREQ = '1' then
            -- Forward the HRESP signal from the UART slave
            shared_HRESP <= UART_HRESP;
            
        elsif current_master = SSI and SSI_HBUSREQ = '1' then
            -- Forward the HRESP signal from the SSI slave
            shared_HRESP <= SSI_HRESP;
            
        elsif current_master = SOSSI and SOSSI_HBUSREQ = '1' then
            -- Forward the HRESP signal from the SOSSI slave
            shared_HRESP <= SOSSI_HRESP;
            
        elsif current_master = CPU and CPU_HBUSREQ = '1' then
            -- Forward the HRESP signal from the CPU slave
            shared_HRESP <= CPU_HRESP;
            
        else
            -- If no valid master is requesting the bus, assume OKAY response
            shared_HRESP <= "00";  -- Default to OKAY (successful transfer)
        end if;
    end if;
end process;

--Forwarding of HSEL signal
FWDHSEL_p: process(HCLK, HRESETn)
begin
if HRESETn = '0' then 
 shared_HSEL <= '0';
 
 elsif rising_edge(HCLK) then
 
  if I2C_HGRANT ='1' then
   shared_HSEL <= I2C_HSEL;
   
   
   elsif SPI_HGRANT ='1' then
   shared_HSEL <= SPI_HSEL;
   
   
   elsif CCP_HGRANT ='1' then
   shared_HSEL <= CCP_HSEL;
   
   
   elsif UART_HGRANT ='1' then
   shared_HSEL <= UART_HSEL;
   
   
   elsif SOSSI_HGRANT ='1' then
   shared_HSEL <= SOSSI_HSEL;
   
   
   elsif CPU_HGRANT ='1' then
   shared_HSEL <= CPU_HSEL;
   
   
    elsif SSI_HGRANT ='1' then
   shared_HSEL <= SSI_HSEL;
   
   
   --If no valid master is using the bus set to default value
   else 
   shared_HSEL <= '0' ;

end if;
end if;
end process;


end Behavioral;
