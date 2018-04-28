-------------------------------------------------------------------------------
-- ddr_512mb_64mx64_rank2_row13_col10_cl2_5_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library mch_opb_ddr_v1_00_c;
use mch_opb_ddr_v1_00_c.All;

entity ddr_512mb_64mx64_rank2_row13_col10_cl2_5_wrapper is
  port (
    MCH0_Access_Control : in std_logic;
    MCH0_Access_Data : in std_logic_vector(0 to 31);
    MCH0_Access_Write : in std_logic;
    MCH0_Access_Full : out std_logic;
    MCH0_ReadData_Control : out std_logic;
    MCH0_ReadData_Data : out std_logic_vector(0 to 31);
    MCH0_ReadData_Read : in std_logic;
    MCH0_ReadData_Exists : out std_logic;
    MCH1_Access_Control : in std_logic;
    MCH1_Access_Data : in std_logic_vector(0 to 31);
    MCH1_Access_Write : in std_logic;
    MCH1_Access_Full : out std_logic;
    MCH1_ReadData_Control : out std_logic;
    MCH1_ReadData_Data : out std_logic_vector(0 to 31);
    MCH1_ReadData_Read : in std_logic;
    MCH1_ReadData_Exists : out std_logic;
    MCH2_Access_Control : in std_logic;
    MCH2_Access_Data : in std_logic_vector(0 to 31);
    MCH2_Access_Write : in std_logic;
    MCH2_Access_Full : out std_logic;
    MCH2_ReadData_Control : out std_logic;
    MCH2_ReadData_Data : out std_logic_vector(0 to 31);
    MCH2_ReadData_Read : in std_logic;
    MCH2_ReadData_Exists : out std_logic;
    MCH3_Access_Control : in std_logic;
    MCH3_Access_Data : in std_logic_vector(0 to 31);
    MCH3_Access_Write : in std_logic;
    MCH3_Access_Full : out std_logic;
    MCH3_ReadData_Control : out std_logic;
    MCH3_ReadData_Data : out std_logic_vector(0 to 31);
    MCH3_ReadData_Read : in std_logic;
    MCH3_ReadData_Exists : out std_logic;
    OPB_select : in std_logic;
    OPB_RNW : in std_logic;
    OPB_ABus : in std_logic_vector(0 to 31);
    OPB_DBus : in std_logic_vector(0 to 31);
    OPB_BE : in std_logic_vector(0 to 3);
    OPB_seqAddr : in std_logic;
    Sln_xferAck : out std_logic;
    Sln_errAck : out std_logic;
    Sln_toutSup : out std_logic;
    Sln_retry : out std_logic;
    Sln_DBus : out std_logic_vector(0 to 31);
    DDR_Clk : out std_logic_vector(0 to 3);
    DDR_Clkn : out std_logic_vector(0 to 3);
    DDR_CKE : out std_logic_vector(0 to 1);
    DDR_CSn : out std_logic_vector(0 to 1);
    DDR_RASn : out std_logic;
    DDR_CASn : out std_logic;
    DDR_WEn : out std_logic;
    DDR_DM : out std_logic_vector(0 to 7);
    DDR_BankAddr : out std_logic_vector(0 to 1);
    DDR_Addr : out std_logic_vector(0 to 12);
    DDR_DQ_o : out std_logic_vector(0 to 63);
    DDR_DQ_i : in std_logic_vector(0 to 63);
    DDR_DQ_t : out std_logic_vector(0 to 63);
    DDR_DQS_i : in std_logic_vector(0 to 7);
    DDR_DQS_o : out std_logic_vector(0 to 7);
    DDR_DQS_t : out std_logic_vector(0 to 7);
    DDR_Init_done : out std_logic;
    DDR_Sleep : in std_logic;
    DDR_WakeUp : in std_logic;
    MCH_OPB_Clk : in std_logic;
    MCH_OPB_Rst : in std_logic;
    Device_Clk : in std_logic;
    Device_Clk_n : in std_logic;
    Device_Clk90_in : in std_logic;
    Device_Clk90_in_n : in std_logic;
    DDR_Clk90_in : in std_logic;
    DDR_Clk90_in_n : in std_logic
  );
end ddr_512mb_64mx64_rank2_row13_col10_cl2_5_wrapper;

architecture STRUCTURE of ddr_512mb_64mx64_rank2_row13_col10_cl2_5_wrapper is

  component mch_opb_ddr is
    generic (
      C_FAMILY : STRING;
      C_REG_DIMM : INTEGER;
      C_NUM_BANKS_MEM : INTEGER;
      C_NUM_CLK_PAIRS : INTEGER;
      C_DDR_ASYNC_SUPPORT : INTEGER;
      C_EXTRA_TSU : INTEGER;
      C_USE_OPEN_ROW_MNGT : INTEGER;
      C_INCLUDE_DDR_PIPE : INTEGER;
      C_NUM_CHANNELS : INTEGER;
      C_PRIORITY_MODE : INTEGER;
      C_INCLUDE_OPB_IPIF : INTEGER;
      C_INCLUDE_OPB_BURST_SUPPORT : INTEGER;
      C_INCLUDE_TIMEOUT_CNTR : INTEGER;
      C_TIMEOUT : INTEGER;
      C_MCH_OPB_DWIDTH : INTEGER;
      C_MCH_OPB_AWIDTH : INTEGER;
      C_MCH_OPB_CLK_PERIOD_PS : INTEGER;
      C_DDR_TMRD : INTEGER;
      C_DDR_TWR : INTEGER;
      C_DDR_TWTR : INTEGER;
      C_DDR_TRAS : INTEGER;
      C_DDR_TRC : INTEGER;
      C_DDR_TRFC : INTEGER;
      C_DDR_TRCD : INTEGER;
      C_DDR_TRRD : INTEGER;
      C_DDR_TREFI : INTEGER;
      C_DDR_TRP : INTEGER;
      C_DDR_TXSR : INTEGER;
      C_DDR_CAS_LAT : INTEGER;
      C_DDR_DWIDTH : INTEGER;
      C_DDR_AWIDTH : INTEGER;
      C_DDR_COL_AWIDTH : INTEGER;
      C_DDR_BANK_AWIDTH : INTEGER;
      C_MCH0_PROTOCOL : INTEGER;
      C_MCH0_ACCESSBUF_DEPTH : INTEGER;
      C_MCH0_RDDATABUF_DEPTH : INTEGER;
      C_MCH1_PROTOCOL : INTEGER;
      C_MCH1_ACCESSBUF_DEPTH : INTEGER;
      C_MCH1_RDDATABUF_DEPTH : INTEGER;
      C_MCH2_PROTOCOL : INTEGER;
      C_MCH2_ACCESSBUF_DEPTH : INTEGER;
      C_MCH2_RDDATABUF_DEPTH : INTEGER;
      C_MCH3_PROTOCOL : INTEGER;
      C_MCH3_ACCESSBUF_DEPTH : INTEGER;
      C_MCH3_RDDATABUF_DEPTH : INTEGER;
      C_XCL0_LINESIZE : INTEGER;
      C_XCL0_WRITEXFER : INTEGER;
      C_XCL1_LINESIZE : INTEGER;
      C_XCL1_WRITEXFER : INTEGER;
      C_XCL2_LINESIZE : INTEGER;
      C_XCL2_WRITEXFER : INTEGER;
      C_XCL3_LINESIZE : INTEGER;
      C_XCL3_WRITEXFER : INTEGER;
      C_MEM0_BASEADDR : std_logic_vector;
      C_MEM0_HIGHADDR : std_logic_vector;
      C_MEM1_BASEADDR : std_logic_vector;
      C_MEM1_HIGHADDR : std_logic_vector;
      C_MEM2_BASEADDR : std_logic_vector;
      C_MEM2_HIGHADDR : std_logic_vector;
      C_MEM3_BASEADDR : std_logic_vector;
      C_MEM3_HIGHADDR : std_logic_vector;
      C_SIM_INIT_TIME_PS : INTEGER
    );
    port (
      MCH0_Access_Control : in std_logic;
      MCH0_Access_Data : in std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      MCH0_Access_Write : in std_logic;
      MCH0_Access_Full : out std_logic;
      MCH0_ReadData_Control : out std_logic;
      MCH0_ReadData_Data : out std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      MCH0_ReadData_Read : in std_logic;
      MCH0_ReadData_Exists : out std_logic;
      MCH1_Access_Control : in std_logic;
      MCH1_Access_Data : in std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      MCH1_Access_Write : in std_logic;
      MCH1_Access_Full : out std_logic;
      MCH1_ReadData_Control : out std_logic;
      MCH1_ReadData_Data : out std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      MCH1_ReadData_Read : in std_logic;
      MCH1_ReadData_Exists : out std_logic;
      MCH2_Access_Control : in std_logic;
      MCH2_Access_Data : in std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      MCH2_Access_Write : in std_logic;
      MCH2_Access_Full : out std_logic;
      MCH2_ReadData_Control : out std_logic;
      MCH2_ReadData_Data : out std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      MCH2_ReadData_Read : in std_logic;
      MCH2_ReadData_Exists : out std_logic;
      MCH3_Access_Control : in std_logic;
      MCH3_Access_Data : in std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      MCH3_Access_Write : in std_logic;
      MCH3_Access_Full : out std_logic;
      MCH3_ReadData_Control : out std_logic;
      MCH3_ReadData_Data : out std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      MCH3_ReadData_Read : in std_logic;
      MCH3_ReadData_Exists : out std_logic;
      OPB_select : in std_logic;
      OPB_RNW : in std_logic;
      OPB_ABus : in std_logic_vector(0 to (C_MCH_OPB_AWIDTH-1));
      OPB_DBus : in std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      OPB_BE : in std_logic_vector(0 to ((C_MCH_OPB_DWIDTH/8)-1));
      OPB_seqAddr : in std_logic;
      Sln_xferAck : out std_logic;
      Sln_errAck : out std_logic;
      Sln_toutSup : out std_logic;
      Sln_retry : out std_logic;
      Sln_DBus : out std_logic_vector(0 to (C_MCH_OPB_DWIDTH-1));
      DDR_Clk : out std_logic_vector(0 to (C_NUM_CLK_PAIRS-1));
      DDR_Clkn : out std_logic_vector(0 to (C_NUM_CLK_PAIRS-1));
      DDR_CKE : out std_logic_vector(0 to (C_NUM_BANKS_MEM-1));
      DDR_CSn : out std_logic_vector(0 to (C_NUM_BANKS_MEM-1));
      DDR_RASn : out std_logic;
      DDR_CASn : out std_logic;
      DDR_WEn : out std_logic;
      DDR_DM : out std_logic_vector(0 to ((C_DDR_DWIDTH/8)-1));
      DDR_BankAddr : out std_logic_vector(0 to (C_DDR_BANK_AWIDTH-1));
      DDR_Addr : out std_logic_vector(0 to (C_DDR_AWIDTH-1));
      DDR_DQ_o : out std_logic_vector(0 to (C_DDR_DWIDTH-1));
      DDR_DQ_i : in std_logic_vector(0 to (C_DDR_DWIDTH-1));
      DDR_DQ_t : out std_logic_vector(0 to (C_DDR_DWIDTH-1));
      DDR_DQS_i : in std_logic_vector(0 to ((C_DDR_DWIDTH/8)-1));
      DDR_DQS_o : out std_logic_vector(0 to ((C_DDR_DWIDTH/8)-1));
      DDR_DQS_t : out std_logic_vector(0 to ((C_DDR_DWIDTH/8)-1));
      DDR_Init_done : out std_logic;
      DDR_Sleep : in std_logic;
      DDR_WakeUp : in std_logic;
      MCH_OPB_Clk : in std_logic;
      MCH_OPB_Rst : in std_logic;
      Device_Clk : in std_logic;
      Device_Clk_n : in std_logic;
      Device_Clk90_in : in std_logic;
      Device_Clk90_in_n : in std_logic;
      DDR_Clk90_in : in std_logic;
      DDR_Clk90_in_n : in std_logic
    );
  end component;

  attribute x_core_info : STRING;
  attribute x_core_info of mch_opb_ddr : component is "mch_opb_ddr_v1_00_c";

begin

  ddr_512mb_64mx64_rank2_row13_col10_cl2_5 : mch_opb_ddr
    generic map (
      C_FAMILY => "virtex2p",
      C_REG_DIMM => 0,
      C_NUM_BANKS_MEM => 2,
      C_NUM_CLK_PAIRS => 4,
      C_DDR_ASYNC_SUPPORT => 0,
      C_EXTRA_TSU => 0,
      C_USE_OPEN_ROW_MNGT => 0,
      C_INCLUDE_DDR_PIPE => 1,
      C_NUM_CHANNELS => 2,
      C_PRIORITY_MODE => 0,
      C_INCLUDE_OPB_IPIF => 1,
      C_INCLUDE_OPB_BURST_SUPPORT => 0,
      C_INCLUDE_TIMEOUT_CNTR => 0,
      C_TIMEOUT => 16,
      C_MCH_OPB_DWIDTH => 32,
      C_MCH_OPB_AWIDTH => 32,
      C_MCH_OPB_CLK_PERIOD_PS => 10000,
      C_DDR_TMRD => 20000,
      C_DDR_TWR => 20000,
      C_DDR_TWTR => 1,
      C_DDR_TRAS => 60000,
      C_DDR_TRC => 90000,
      C_DDR_TRFC => 100000,
      C_DDR_TRCD => 30000,
      C_DDR_TRRD => 20000,
      C_DDR_TREFI => 7800000,
      C_DDR_TRP => 30000,
      C_DDR_TXSR => 80000,
      C_DDR_CAS_LAT => 2,
      C_DDR_DWIDTH => 64,
      C_DDR_AWIDTH => 13,
      C_DDR_COL_AWIDTH => 10,
      C_DDR_BANK_AWIDTH => 2,
      C_MCH0_PROTOCOL => 0,
      C_MCH0_ACCESSBUF_DEPTH => 16,
      C_MCH0_RDDATABUF_DEPTH => 16,
      C_MCH1_PROTOCOL => 0,
      C_MCH1_ACCESSBUF_DEPTH => 16,
      C_MCH1_RDDATABUF_DEPTH => 16,
      C_MCH2_PROTOCOL => 0,
      C_MCH2_ACCESSBUF_DEPTH => 16,
      C_MCH2_RDDATABUF_DEPTH => 16,
      C_MCH3_PROTOCOL => 0,
      C_MCH3_ACCESSBUF_DEPTH => 16,
      C_MCH3_RDDATABUF_DEPTH => 16,
      C_XCL0_LINESIZE => 4,
      C_XCL0_WRITEXFER => 1,
      C_XCL1_LINESIZE => 4,
      C_XCL1_WRITEXFER => 1,
      C_XCL2_LINESIZE => 4,
      C_XCL2_WRITEXFER => 1,
      C_XCL3_LINESIZE => 4,
      C_XCL3_WRITEXFER => 1,
      C_MEM0_BASEADDR => X"60000000",
      C_MEM0_HIGHADDR => X"6fffffff",
      C_MEM1_BASEADDR => X"70000000",
      C_MEM1_HIGHADDR => X"7fffffff",
      C_MEM2_BASEADDR => X"FFFFFFFF",
      C_MEM2_HIGHADDR => X"00000000",
      C_MEM3_BASEADDR => X"FFFFFFFF",
      C_MEM3_HIGHADDR => X"00000000",
      C_SIM_INIT_TIME_PS => 100000000
    )
    port map (
      MCH0_Access_Control => MCH0_Access_Control,
      MCH0_Access_Data => MCH0_Access_Data,
      MCH0_Access_Write => MCH0_Access_Write,
      MCH0_Access_Full => MCH0_Access_Full,
      MCH0_ReadData_Control => MCH0_ReadData_Control,
      MCH0_ReadData_Data => MCH0_ReadData_Data,
      MCH0_ReadData_Read => MCH0_ReadData_Read,
      MCH0_ReadData_Exists => MCH0_ReadData_Exists,
      MCH1_Access_Control => MCH1_Access_Control,
      MCH1_Access_Data => MCH1_Access_Data,
      MCH1_Access_Write => MCH1_Access_Write,
      MCH1_Access_Full => MCH1_Access_Full,
      MCH1_ReadData_Control => MCH1_ReadData_Control,
      MCH1_ReadData_Data => MCH1_ReadData_Data,
      MCH1_ReadData_Read => MCH1_ReadData_Read,
      MCH1_ReadData_Exists => MCH1_ReadData_Exists,
      MCH2_Access_Control => MCH2_Access_Control,
      MCH2_Access_Data => MCH2_Access_Data,
      MCH2_Access_Write => MCH2_Access_Write,
      MCH2_Access_Full => MCH2_Access_Full,
      MCH2_ReadData_Control => MCH2_ReadData_Control,
      MCH2_ReadData_Data => MCH2_ReadData_Data,
      MCH2_ReadData_Read => MCH2_ReadData_Read,
      MCH2_ReadData_Exists => MCH2_ReadData_Exists,
      MCH3_Access_Control => MCH3_Access_Control,
      MCH3_Access_Data => MCH3_Access_Data,
      MCH3_Access_Write => MCH3_Access_Write,
      MCH3_Access_Full => MCH3_Access_Full,
      MCH3_ReadData_Control => MCH3_ReadData_Control,
      MCH3_ReadData_Data => MCH3_ReadData_Data,
      MCH3_ReadData_Read => MCH3_ReadData_Read,
      MCH3_ReadData_Exists => MCH3_ReadData_Exists,
      OPB_select => OPB_select,
      OPB_RNW => OPB_RNW,
      OPB_ABus => OPB_ABus,
      OPB_DBus => OPB_DBus,
      OPB_BE => OPB_BE,
      OPB_seqAddr => OPB_seqAddr,
      Sln_xferAck => Sln_xferAck,
      Sln_errAck => Sln_errAck,
      Sln_toutSup => Sln_toutSup,
      Sln_retry => Sln_retry,
      Sln_DBus => Sln_DBus,
      DDR_Clk => DDR_Clk,
      DDR_Clkn => DDR_Clkn,
      DDR_CKE => DDR_CKE,
      DDR_CSn => DDR_CSn,
      DDR_RASn => DDR_RASn,
      DDR_CASn => DDR_CASn,
      DDR_WEn => DDR_WEn,
      DDR_DM => DDR_DM,
      DDR_BankAddr => DDR_BankAddr,
      DDR_Addr => DDR_Addr,
      DDR_DQ_o => DDR_DQ_o,
      DDR_DQ_i => DDR_DQ_i,
      DDR_DQ_t => DDR_DQ_t,
      DDR_DQS_i => DDR_DQS_i,
      DDR_DQS_o => DDR_DQS_o,
      DDR_DQS_t => DDR_DQS_t,
      DDR_Init_done => DDR_Init_done,
      DDR_Sleep => DDR_Sleep,
      DDR_WakeUp => DDR_WakeUp,
      MCH_OPB_Clk => MCH_OPB_Clk,
      MCH_OPB_Rst => MCH_OPB_Rst,
      Device_Clk => Device_Clk,
      Device_Clk_n => Device_Clk_n,
      Device_Clk90_in => Device_Clk90_in,
      Device_Clk90_in_n => Device_Clk90_in_n,
      DDR_Clk90_in => DDR_Clk90_in,
      DDR_Clk90_in_n => DDR_Clk90_in_n
    );

end architecture STRUCTURE;

