-------------------------------------------------------------------------------
-- system.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system is
  port (
    fpga_0_RS232_Uart_1_RX_pin : in std_logic;
    fpga_0_RS232_Uart_1_TX_pin : out std_logic;
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clk_pin : out std_logic_vector(0 to 2);
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clkn_pin : out std_logic_vector(0 to 2);
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Addr_pin : out std_logic_vector(0 to 12);
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_BankAddr_pin : out std_logic_vector(0 to 1);
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CASn_pin : out std_logic;
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_RASn_pin : out std_logic;
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_WEn_pin : out std_logic;
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DM_pin : out std_logic_vector(0 to 7);
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_pin : inout std_logic_vector(0 to 7);
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin : inout std_logic_vector(0 to 63);
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CKE_pin : out std_logic_vector(0 to 1);
    fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CSn_pin : out std_logic_vector(0 to 1);
    fpga_0_net_gnd_pin : out std_logic;
    fpga_0_net_gnd_1_pin : out std_logic;
    fpga_0_net_gnd_2_pin : out std_logic;
    fpga_0_net_gnd_3_pin : out std_logic;
    fpga_0_net_gnd_4_pin : out std_logic;
    fpga_0_net_gnd_5_pin : out std_logic;
    fpga_0_net_gnd_6_pin : out std_logic;
    fpga_0_DDR_CLK_FB : in std_logic;
    fpga_0_DDR_CLK_FB_OUT : out std_logic;
    sys_clk_pin : in std_logic;
    sys_rst_pin : in std_logic
  );
end system;
architecture STRUCTURE of system is
  component microblaze_0_wrapper is
    port (
      CLK : in std_logic;
      RESET : in std_logic;
      INTERRUPT : in std_logic;
      DEBUG_RST : in std_logic;
      EXT_BRK : in std_logic;
      EXT_NM_BRK : in std_logic;
      DBG_STOP : in std_logic;
      MB_Halted : out std_logic;
      INSTR : in std_logic_vector(0 to 31);
      I_ADDRTAG : out std_logic_vector(0 to 3);
      IREADY : in std_logic;
      IWAIT : in std_logic;
      INSTR_ADDR : out std_logic_vector(0 to 31);
      IFETCH : out std_logic;
      I_AS : out std_logic;
      DATA_READ : in std_logic_vector(0 to 31);
      DREADY : in std_logic;
      DWAIT : in std_logic;
      DATA_WRITE : out std_logic_vector(0 to 31);
      DATA_ADDR : out std_logic_vector(0 to 31);
      D_ADDRTAG : out std_logic_vector(0 to 3);
      D_AS : out std_logic;
      READ_STROBE : out std_logic;
      WRITE_STROBE : out std_logic;
      BYTE_ENABLE : out std_logic_vector(0 to 3);
      DM_ABUS : out std_logic_vector(0 to 31);
      DM_BE : out std_logic_vector(0 to 3);
      DM_BUSLOCK : out std_logic;
      DM_DBUS : out std_logic_vector(0 to 31);
      DM_REQUEST : out std_logic;
      DM_RNW : out std_logic;
      DM_SELECT : out std_logic;
      DM_SEQADDR : out std_logic;
      DOPB_DBUS : in std_logic_vector(0 to 31);
      DOPB_ERRACK : in std_logic;
      DOPB_MGRANT : in std_logic;
      DOPB_RETRY : in std_logic;
      DOPB_TIMEOUT : in std_logic;
      DOPB_XFERACK : in std_logic;
      IM_ABUS : out std_logic_vector(0 to 31);
      IM_BE : out std_logic_vector(0 to 3);
      IM_BUSLOCK : out std_logic;
      IM_DBUS : out std_logic_vector(0 to 31);
      IM_REQUEST : out std_logic;
      IM_RNW : out std_logic;
      IM_SELECT : out std_logic;
      IM_SEQADDR : out std_logic;
      IOPB_DBUS : in std_logic_vector(0 to 31);
      IOPB_ERRACK : in std_logic;
      IOPB_MGRANT : in std_logic;
      IOPB_RETRY : in std_logic;
      IOPB_TIMEOUT : in std_logic;
      IOPB_XFERACK : in std_logic;
      DBG_CLK : in std_logic;
      DBG_TDI : in std_logic;
      DBG_TDO : out std_logic;
      DBG_REG_EN : in std_logic_vector(0 to 4);
      DBG_CAPTURE : in std_logic;
      DBG_UPDATE : in std_logic;
      Trace_Instruction : out std_logic_vector(0 to 31);
      Trace_Valid_Instr : out std_logic;
      Trace_PC : out std_logic_vector(0 to 31);
      Trace_Reg_Write : out std_logic;
      Trace_Reg_Addr : out std_logic_vector(0 to 4);
      Trace_MSR_Reg : out std_logic_vector(0 to 10);
      Trace_New_Reg_Value : out std_logic_vector(0 to 31);
      Trace_Exception_Taken : out std_logic;
      Trace_Exception_Kind : out std_logic_vector(0 to 3);
      Trace_Jump_Taken : out std_logic;
      Trace_Delay_Slot : out std_logic;
      Trace_Data_Address : out std_logic_vector(0 to 31);
      Trace_Data_Access : out std_logic;
      Trace_Data_Read : out std_logic;
      Trace_Data_Write : out std_logic;
      Trace_Data_Write_Value : out std_logic_vector(0 to 31);
      Trace_Data_Byte_Enable : out std_logic_vector(0 to 3);
      Trace_DCache_Req : out std_logic;
      Trace_DCache_Hit : out std_logic;
      Trace_ICache_Req : out std_logic;
      Trace_ICache_Hit : out std_logic;
      Trace_OF_PipeRun : out std_logic;
      Trace_EX_PipeRun : out std_logic;
      Trace_MEM_PipeRun : out std_logic;
      FSL0_S_CLK : out std_logic;
      FSL0_S_READ : out std_logic;
      FSL0_S_DATA : in std_logic_vector(0 to 31);
      FSL0_S_CONTROL : in std_logic;
      FSL0_S_EXISTS : in std_logic;
      FSL0_M_CLK : out std_logic;
      FSL0_M_WRITE : out std_logic;
      FSL0_M_DATA : out std_logic_vector(0 to 31);
      FSL0_M_CONTROL : out std_logic;
      FSL0_M_FULL : in std_logic;
      FSL1_S_CLK : out std_logic;
      FSL1_S_READ : out std_logic;
      FSL1_S_DATA : in std_logic_vector(0 to 31);
      FSL1_S_CONTROL : in std_logic;
      FSL1_S_EXISTS : in std_logic;
      FSL1_M_CLK : out std_logic;
      FSL1_M_WRITE : out std_logic;
      FSL1_M_DATA : out std_logic_vector(0 to 31);
      FSL1_M_CONTROL : out std_logic;
      FSL1_M_FULL : in std_logic;
      FSL2_S_CLK : out std_logic;
      FSL2_S_READ : out std_logic;
      FSL2_S_DATA : in std_logic_vector(0 to 31);
      FSL2_S_CONTROL : in std_logic;
      FSL2_S_EXISTS : in std_logic;
      FSL2_M_CLK : out std_logic;
      FSL2_M_WRITE : out std_logic;
      FSL2_M_DATA : out std_logic_vector(0 to 31);
      FSL2_M_CONTROL : out std_logic;
      FSL2_M_FULL : in std_logic;
      FSL3_S_CLK : out std_logic;
      FSL3_S_READ : out std_logic;
      FSL3_S_DATA : in std_logic_vector(0 to 31);
      FSL3_S_CONTROL : in std_logic;
      FSL3_S_EXISTS : in std_logic;
      FSL3_M_CLK : out std_logic;
      FSL3_M_WRITE : out std_logic;
      FSL3_M_DATA : out std_logic_vector(0 to 31);
      FSL3_M_CONTROL : out std_logic;
      FSL3_M_FULL : in std_logic;
      FSL4_S_CLK : out std_logic;
      FSL4_S_READ : out std_logic;
      FSL4_S_DATA : in std_logic_vector(0 to 31);
      FSL4_S_CONTROL : in std_logic;
      FSL4_S_EXISTS : in std_logic;
      FSL4_M_CLK : out std_logic;
      FSL4_M_WRITE : out std_logic;
      FSL4_M_DATA : out std_logic_vector(0 to 31);
      FSL4_M_CONTROL : out std_logic;
      FSL4_M_FULL : in std_logic;
      FSL5_S_CLK : out std_logic;
      FSL5_S_READ : out std_logic;
      FSL5_S_DATA : in std_logic_vector(0 to 31);
      FSL5_S_CONTROL : in std_logic;
      FSL5_S_EXISTS : in std_logic;
      FSL5_M_CLK : out std_logic;
      FSL5_M_WRITE : out std_logic;
      FSL5_M_DATA : out std_logic_vector(0 to 31);
      FSL5_M_CONTROL : out std_logic;
      FSL5_M_FULL : in std_logic;
      FSL6_S_CLK : out std_logic;
      FSL6_S_READ : out std_logic;
      FSL6_S_DATA : in std_logic_vector(0 to 31);
      FSL6_S_CONTROL : in std_logic;
      FSL6_S_EXISTS : in std_logic;
      FSL6_M_CLK : out std_logic;
      FSL6_M_WRITE : out std_logic;
      FSL6_M_DATA : out std_logic_vector(0 to 31);
      FSL6_M_CONTROL : out std_logic;
      FSL6_M_FULL : in std_logic;
      FSL7_S_CLK : out std_logic;
      FSL7_S_READ : out std_logic;
      FSL7_S_DATA : in std_logic_vector(0 to 31);
      FSL7_S_CONTROL : in std_logic;
      FSL7_S_EXISTS : in std_logic;
      FSL7_M_CLK : out std_logic;
      FSL7_M_WRITE : out std_logic;
      FSL7_M_DATA : out std_logic_vector(0 to 31);
      FSL7_M_CONTROL : out std_logic;
      FSL7_M_FULL : in std_logic;
      ICACHE_FSL_IN_CLK : out std_logic;
      ICACHE_FSL_IN_READ : out std_logic;
      ICACHE_FSL_IN_DATA : in std_logic_vector(0 to 31);
      ICACHE_FSL_IN_CONTROL : in std_logic;
      ICACHE_FSL_IN_EXISTS : in std_logic;
      ICACHE_FSL_OUT_CLK : out std_logic;
      ICACHE_FSL_OUT_WRITE : out std_logic;
      ICACHE_FSL_OUT_DATA : out std_logic_vector(0 to 31);
      ICACHE_FSL_OUT_CONTROL : out std_logic;
      ICACHE_FSL_OUT_FULL : in std_logic;
      DCACHE_FSL_IN_CLK : out std_logic;
      DCACHE_FSL_IN_READ : out std_logic;
      DCACHE_FSL_IN_DATA : in std_logic_vector(0 to 31);
      DCACHE_FSL_IN_CONTROL : in std_logic;
      DCACHE_FSL_IN_EXISTS : in std_logic;
      DCACHE_FSL_OUT_CLK : out std_logic;
      DCACHE_FSL_OUT_WRITE : out std_logic;
      DCACHE_FSL_OUT_DATA : out std_logic_vector(0 to 31);
      DCACHE_FSL_OUT_CONTROL : out std_logic;
      DCACHE_FSL_OUT_FULL : in std_logic
    );
  end component;
  component mb_opb_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : out std_logic;
      SYS_Rst : in std_logic;
      Debug_SYS_Rst : in std_logic;
      WDT_Rst : in std_logic;
      M_ABus : in std_logic_vector(0 to 63);
      M_BE : in std_logic_vector(0 to 7);
      M_beXfer : in std_logic_vector(0 to 1);
      M_busLock : in std_logic_vector(0 to 1);
      M_DBus : in std_logic_vector(0 to 63);
      M_DBusEn : in std_logic_vector(0 to 1);
      M_DBusEn32_63 : in std_logic_vector(0 to 1);
      M_dwXfer : in std_logic_vector(0 to 1);
      M_fwXfer : in std_logic_vector(0 to 1);
      M_hwXfer : in std_logic_vector(0 to 1);
      M_request : in std_logic_vector(0 to 1);
      M_RNW : in std_logic_vector(0 to 1);
      M_select : in std_logic_vector(0 to 1);
      M_seqAddr : in std_logic_vector(0 to 1);
      Sl_beAck : in std_logic_vector(0 to 2);
      Sl_DBus : in std_logic_vector(0 to 95);
      Sl_DBusEn : in std_logic_vector(0 to 2);
      Sl_DBusEn32_63 : in std_logic_vector(0 to 2);
      Sl_errAck : in std_logic_vector(0 to 2);
      Sl_dwAck : in std_logic_vector(0 to 2);
      Sl_fwAck : in std_logic_vector(0 to 2);
      Sl_hwAck : in std_logic_vector(0 to 2);
      Sl_retry : in std_logic_vector(0 to 2);
      Sl_toutSup : in std_logic_vector(0 to 2);
      Sl_xferAck : in std_logic_vector(0 to 2);
      OPB_MRequest : out std_logic_vector(0 to 1);
      OPB_ABus : out std_logic_vector(0 to 31);
      OPB_BE : out std_logic_vector(0 to 3);
      OPB_beXfer : out std_logic;
      OPB_beAck : out std_logic;
      OPB_busLock : out std_logic;
      OPB_rdDBus : out std_logic_vector(0 to 31);
      OPB_wrDBus : out std_logic_vector(0 to 31);
      OPB_DBus : out std_logic_vector(0 to 31);
      OPB_errAck : out std_logic;
      OPB_dwAck : out std_logic;
      OPB_dwXfer : out std_logic;
      OPB_fwAck : out std_logic;
      OPB_fwXfer : out std_logic;
      OPB_hwAck : out std_logic;
      OPB_hwXfer : out std_logic;
      OPB_MGrant : out std_logic_vector(0 to 1);
      OPB_pendReq : out std_logic_vector(0 to 1);
      OPB_retry : out std_logic;
      OPB_RNW : out std_logic;
      OPB_select : out std_logic;
      OPB_seqAddr : out std_logic;
      OPB_timeout : out std_logic;
      OPB_toutSup : out std_logic;
      OPB_xferAck : out std_logic
    );
  end component;
  component debug_module_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Interrupt : out std_logic;
      Debug_SYS_Rst : out std_logic;
      Debug_Rst : out std_logic;
      Ext_BRK : out std_logic;
      Ext_NM_BRK : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      OPB_DBus : in std_logic_vector(0 to 31);
      MDM_DBus : out std_logic_vector(0 to 31);
      MDM_errAck : out std_logic;
      MDM_retry : out std_logic;
      MDM_toutSup : out std_logic;
      MDM_xferAck : out std_logic;
      Dbg_Clk_0 : out std_logic;
      Dbg_TDI_0 : out std_logic;
      Dbg_TDO_0 : in std_logic;
      Dbg_Reg_En_0 : out std_logic_vector(0 to 4);
      Dbg_Capture_0 : out std_logic;
      Dbg_Update_0 : out std_logic;
      Dbg_Clk_1 : out std_logic;
      Dbg_TDI_1 : out std_logic;
      Dbg_TDO_1 : in std_logic;
      Dbg_Reg_En_1 : out std_logic_vector(0 to 4);
      Dbg_Capture_1 : out std_logic;
      Dbg_Update_1 : out std_logic;
      Dbg_Clk_2 : out std_logic;
      Dbg_TDI_2 : out std_logic;
      Dbg_TDO_2 : in std_logic;
      Dbg_Reg_En_2 : out std_logic_vector(0 to 4);
      Dbg_Capture_2 : out std_logic;
      Dbg_Update_2 : out std_logic;
      Dbg_Clk_3 : out std_logic;
      Dbg_TDI_3 : out std_logic;
      Dbg_TDO_3 : in std_logic;
      Dbg_Reg_En_3 : out std_logic_vector(0 to 4);
      Dbg_Capture_3 : out std_logic;
      Dbg_Update_3 : out std_logic;
      Dbg_Clk_4 : out std_logic;
      Dbg_TDI_4 : out std_logic;
      Dbg_TDO_4 : in std_logic;
      Dbg_Reg_En_4 : out std_logic_vector(0 to 4);
      Dbg_Capture_4 : out std_logic;
      Dbg_Update_4 : out std_logic;
      Dbg_Clk_5 : out std_logic;
      Dbg_TDI_5 : out std_logic;
      Dbg_TDO_5 : in std_logic;
      Dbg_Reg_En_5 : out std_logic_vector(0 to 4);
      Dbg_Capture_5 : out std_logic;
      Dbg_Update_5 : out std_logic;
      Dbg_Clk_6 : out std_logic;
      Dbg_TDI_6 : out std_logic;
      Dbg_TDO_6 : in std_logic;
      Dbg_Reg_En_6 : out std_logic_vector(0 to 4);
      Dbg_Capture_6 : out std_logic;
      Dbg_Update_6 : out std_logic;
      Dbg_Clk_7 : out std_logic;
      Dbg_TDI_7 : out std_logic;
      Dbg_TDO_7 : in std_logic;
      Dbg_Reg_En_7 : out std_logic_vector(0 to 4);
      Dbg_Capture_7 : out std_logic;
      Dbg_Update_7 : out std_logic;
      bscan_tdi : out std_logic;
      bscan_reset : out std_logic;
      bscan_shift : out std_logic;
      bscan_update : out std_logic;
      bscan_capture : out std_logic;
      bscan_sel1 : out std_logic;
      bscan_drck1 : out std_logic;
      bscan_tdo1 : in std_logic;
      FSL0_S_CLK : out std_logic;
      FSL0_S_READ : out std_logic;
      FSL0_S_DATA : in std_logic_vector(0 to 31);
      FSL0_S_CONTROL : in std_logic;
      FSL0_S_EXISTS : in std_logic;
      FSL0_M_CLK : out std_logic;
      FSL0_M_WRITE : out std_logic;
      FSL0_M_DATA : out std_logic_vector(0 to 31);
      FSL0_M_CONTROL : out std_logic;
      FSL0_M_FULL : in std_logic
    );
  end component;
  component ilmb_wrapper is
    port (
      LMB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      LMB_Rst : out std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_ReadStrobe : in std_logic;
      M_WriteStrobe : in std_logic;
      M_AddrStrobe : in std_logic;
      M_DBus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      Sl_DBus : in std_logic_vector(0 to 31);
      Sl_Ready : in std_logic_vector(0 to 0);
      LMB_ABus : out std_logic_vector(0 to 31);
      LMB_ReadStrobe : out std_logic;
      LMB_WriteStrobe : out std_logic;
      LMB_AddrStrobe : out std_logic;
      LMB_ReadDBus : out std_logic_vector(0 to 31);
      LMB_WriteDBus : out std_logic_vector(0 to 31);
      LMB_Ready : out std_logic;
      LMB_BE : out std_logic_vector(0 to 3)
    );
  end component;
  component dlmb_wrapper is
    port (
      LMB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      LMB_Rst : out std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_ReadStrobe : in std_logic;
      M_WriteStrobe : in std_logic;
      M_AddrStrobe : in std_logic;
      M_DBus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      Sl_DBus : in std_logic_vector(0 to 31);
      Sl_Ready : in std_logic_vector(0 to 0);
      LMB_ABus : out std_logic_vector(0 to 31);
      LMB_ReadStrobe : out std_logic;
      LMB_WriteStrobe : out std_logic;
      LMB_AddrStrobe : out std_logic;
      LMB_ReadDBus : out std_logic_vector(0 to 31);
      LMB_WriteDBus : out std_logic_vector(0 to 31);
      LMB_Ready : out std_logic;
      LMB_BE : out std_logic_vector(0 to 3)
    );
  end component;
  component dlmb_cntlr_wrapper is
    port (
      LMB_Clk : in std_logic;
      LMB_Rst : in std_logic;
      LMB_ABus : in std_logic_vector(0 to 31);
      LMB_WriteDBus : in std_logic_vector(0 to 31);
      LMB_AddrStrobe : in std_logic;
      LMB_ReadStrobe : in std_logic;
      LMB_WriteStrobe : in std_logic;
      LMB_BE : in std_logic_vector(0 to 3);
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_Ready : out std_logic;
      BRAM_Rst_A : out std_logic;
      BRAM_Clk_A : out std_logic;
      BRAM_EN_A : out std_logic;
      BRAM_WEN_A : out std_logic_vector(0 to 3);
      BRAM_Addr_A : out std_logic_vector(0 to 31);
      BRAM_Din_A : in std_logic_vector(0 to 31);
      BRAM_Dout_A : out std_logic_vector(0 to 31)
    );
  end component;
  component ilmb_cntlr_wrapper is
    port (
      LMB_Clk : in std_logic;
      LMB_Rst : in std_logic;
      LMB_ABus : in std_logic_vector(0 to 31);
      LMB_WriteDBus : in std_logic_vector(0 to 31);
      LMB_AddrStrobe : in std_logic;
      LMB_ReadStrobe : in std_logic;
      LMB_WriteStrobe : in std_logic;
      LMB_BE : in std_logic_vector(0 to 3);
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_Ready : out std_logic;
      BRAM_Rst_A : out std_logic;
      BRAM_Clk_A : out std_logic;
      BRAM_EN_A : out std_logic;
      BRAM_WEN_A : out std_logic_vector(0 to 3);
      BRAM_Addr_A : out std_logic_vector(0 to 31);
      BRAM_Din_A : in std_logic_vector(0 to 31);
      BRAM_Dout_A : out std_logic_vector(0 to 31)
    );
  end component;
  component lmb_bram_wrapper is
    port (
      BRAM_Rst_A : in std_logic;
      BRAM_Clk_A : in std_logic;
      BRAM_EN_A : in std_logic;
      BRAM_WEN_A : in std_logic_vector(0 to 3);
      BRAM_Addr_A : in std_logic_vector(0 to 31);
      BRAM_Din_A : out std_logic_vector(0 to 31);
      BRAM_Dout_A : in std_logic_vector(0 to 31);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;
  component rs232_uart_1_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Interrupt : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      OPB_DBus : in std_logic_vector(0 to 31);
      UART_DBus : out std_logic_vector(0 to 31);
      UART_errAck : out std_logic;
      UART_retry : out std_logic;
      UART_toutSup : out std_logic;
      UART_xferAck : out std_logic;
      RX : in std_logic;
      TX : out std_logic
    );
  end component;
  component ddr_512mb_64mx64_rank2_row13_col10_cl2_5_wrapper is
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
  end component;
  component sysclk_inv_wrapper is
    port (
      Op1 : in std_logic_vector(0 to 0);
      Op2 : in std_logic_vector(0 to 0);
      Res : out std_logic_vector(0 to 0)
    );
  end component;
  component clk90_inv_wrapper is
    port (
      Op1 : in std_logic_vector(0 to 0);
      Op2 : in std_logic_vector(0 to 0);
      Res : out std_logic_vector(0 to 0)
    );
  end component;
  component ddr_clk90_inv_wrapper is
    port (
      Op1 : in std_logic_vector(0 to 0);
      Op2 : in std_logic_vector(0 to 0);
      Res : out std_logic_vector(0 to 0)
    );
  end component;
  component dcm_0_wrapper is
    port (
      RST : in std_logic;
      CLKIN : in std_logic;
      CLKFB : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSCLK : in std_logic;
      DSSEN : in std_logic;
      CLK0 : out std_logic;
      CLK90 : out std_logic;
      CLK180 : out std_logic;
      CLK270 : out std_logic;
      CLKDV : out std_logic;
      CLK2X : out std_logic;
      CLK2X180 : out std_logic;
      CLKFX : out std_logic;
      CLKFX180 : out std_logic;
      STATUS : out std_logic_vector(7 downto 0);
      LOCKED : out std_logic;
      PSDONE : out std_logic
    );
  end component;
  component dcm_1_wrapper is
    port (
      RST : in std_logic;
      CLKIN : in std_logic;
      CLKFB : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSCLK : in std_logic;
      DSSEN : in std_logic;
      CLK0 : out std_logic;
      CLK90 : out std_logic;
      CLK180 : out std_logic;
      CLK270 : out std_logic;
      CLKDV : out std_logic;
      CLK2X : out std_logic;
      CLK2X180 : out std_logic;
      CLKFX : out std_logic;
      CLKFX180 : out std_logic;
      STATUS : out std_logic_vector(7 downto 0);
      LOCKED : out std_logic;
      PSDONE : out std_logic
    );
  end component;
  component aes_accel_0_to_microblaze_0_wrapper is
    port (
      FSL_Clk : in std_logic;
      SYS_Rst : in std_logic;
      FSL_Rst : out std_logic;
      FSL_M_Clk : in std_logic;
      FSL_M_Data : in std_logic_vector(0 to 31);
      FSL_M_Control : in std_logic;
      FSL_M_Write : in std_logic;
      FSL_M_Full : out std_logic;
      FSL_S_Clk : in std_logic;
      FSL_S_Data : out std_logic_vector(0 to 31);
      FSL_S_Control : out std_logic;
      FSL_S_Read : in std_logic;
      FSL_S_Exists : out std_logic;
      FSL_Full : out std_logic;
      FSL_Has_Data : out std_logic;
      FSL_Control_IRQ : out std_logic
    );
  end component;
  component aes_accel_0_wrapper is
    port (
      FSL_Clk : in std_logic;
      FSL_Rst : in std_logic;
      FSL_S_Clk : out std_logic;
      FSL_S_Read : out std_logic;
      FSL_S_Data : in std_logic_vector(0 to 31);
      FSL_S_Control : in std_logic;
      FSL_S_Exists : in std_logic;
      FSL_M_Clk : out std_logic;
      FSL_M_Write : out std_logic;
      FSL_M_Data : out std_logic_vector(0 to 31);
      FSL_M_Control : out std_logic;
      FSL_M_Full : in std_logic
    );
  end component;
  component microblaze_0_to_aes_accel_0_wrapper is
    port (
      FSL_Clk : in std_logic;
      SYS_Rst : in std_logic;
      FSL_Rst : out std_logic;
      FSL_M_Clk : in std_logic;
      FSL_M_Data : in std_logic_vector(0 to 31);
      FSL_M_Control : in std_logic;
      FSL_M_Write : in std_logic;
      FSL_M_Full : out std_logic;
      FSL_S_Clk : in std_logic;
      FSL_S_Data : out std_logic_vector(0 to 31);
      FSL_S_Control : out std_logic;
      FSL_S_Read : in std_logic;
      FSL_S_Exists : out std_logic;
      FSL_Full : out std_logic;
      FSL_Has_Data : out std_logic;
      FSL_Control_IRQ : out std_logic
    );
  end component;
  component tlb_bram_0_to_microblaze_0_wrapper is
    port (
      FSL_Clk : in std_logic;
      SYS_Rst : in std_logic;
      FSL_Rst : out std_logic;
      FSL_M_Clk : in std_logic;
      FSL_M_Data : in std_logic_vector(0 to 31);
      FSL_M_Control : in std_logic;
      FSL_M_Write : in std_logic;
      FSL_M_Full : out std_logic;
      FSL_S_Clk : in std_logic;
      FSL_S_Data : out std_logic_vector(0 to 31);
      FSL_S_Control : out std_logic;
      FSL_S_Read : in std_logic;
      FSL_S_Exists : out std_logic;
      FSL_Full : out std_logic;
      FSL_Has_Data : out std_logic;
      FSL_Control_IRQ : out std_logic
    );
  end component;
  component tlb_bram_0_wrapper is
    port (
      FSL_Clk : in std_logic;
      FSL_Rst : in std_logic;
      FSL_S_Clk : out std_logic;
      FSL_S_Read : out std_logic;
      FSL_S_Data : in std_logic_vector(0 to 31);
      FSL_S_Control : in std_logic;
      FSL_S_Exists : in std_logic;
      FSL_M_Clk : out std_logic;
      FSL_M_Write : out std_logic;
      FSL_M_Data : out std_logic_vector(0 to 31);
      FSL_M_Control : out std_logic;
      FSL_M_Full : in std_logic
    );
  end component;
  component microblaze_0_to_tlb_bram_0_wrapper is
    port (
      FSL_Clk : in std_logic;
      SYS_Rst : in std_logic;
      FSL_Rst : out std_logic;
      FSL_M_Clk : in std_logic;
      FSL_M_Data : in std_logic_vector(0 to 31);
      FSL_M_Control : in std_logic;
      FSL_M_Write : in std_logic;
      FSL_M_Full : out std_logic;
      FSL_S_Clk : in std_logic;
      FSL_S_Data : out std_logic_vector(0 to 31);
      FSL_S_Control : out std_logic;
      FSL_S_Read : in std_logic;
      FSL_S_Exists : out std_logic;
      FSL_Full : out std_logic;
      FSL_Has_Data : out std_logic;
      FSL_Control_IRQ : out std_logic
    );
  end component;
  component IOBUF is
    port (
      I : in std_logic;
      IO : inout std_logic;
      O : out std_logic;
      T : in std_logic
    );
  end component;
  -- Internal signals
  signal DBG_CAPTURE_s : std_logic;
  signal DBG_CLK_s : std_logic;
  signal DBG_REG_EN_s : std_logic_vector(0 to 4);
  signal DBG_TDI_s : std_logic;
  signal DBG_TDO_s : std_logic;
  signal DBG_UPDATE_s : std_logic;
  signal Debug_Rst : std_logic;
  signal Ext_BRK : std_logic;
  signal Ext_NM_BRK : std_logic;
  signal aes_accel_0_to_microblaze_0_FSL_M_Control : std_logic;
  signal aes_accel_0_to_microblaze_0_FSL_M_Data : std_logic_vector(0 to 31);
  signal aes_accel_0_to_microblaze_0_FSL_M_Full : std_logic;
  signal aes_accel_0_to_microblaze_0_FSL_M_Write : std_logic;
  signal aes_accel_0_to_microblaze_0_FSL_S_Control : std_logic;
  signal aes_accel_0_to_microblaze_0_FSL_S_Data : std_logic_vector(0 to 31);
  signal aes_accel_0_to_microblaze_0_FSL_S_Exists : std_logic;
  signal aes_accel_0_to_microblaze_0_FSL_S_Read : std_logic;
  signal aes_accel_0_to_microblaze_0_OPB_Rst : std_logic;
  signal clk_90_n_s : std_logic_vector(0 to 0);
  signal clk_90_s : std_logic_vector(0 to 0);
  signal dcm_0_lock : std_logic;
  signal dcm_1_FB : std_logic;
  signal dcm_clk_s : std_logic;
  signal ddr_clk_90_n_s : std_logic_vector(0 to 0);
  signal ddr_clk_90_s : std_logic_vector(0 to 0);
  signal ddr_clk_feedback_out_s : std_logic;
  signal ddr_feedback_s : std_logic;
  signal dlmb_LMB_ABus : std_logic_vector(0 to 31);
  signal dlmb_LMB_AddrStrobe : std_logic;
  signal dlmb_LMB_BE : std_logic_vector(0 to 3);
  signal dlmb_LMB_ReadDBus : std_logic_vector(0 to 31);
  signal dlmb_LMB_ReadStrobe : std_logic;
  signal dlmb_LMB_Ready : std_logic;
  signal dlmb_LMB_WriteDBus : std_logic_vector(0 to 31);
  signal dlmb_LMB_WriteStrobe : std_logic;
  signal dlmb_M_ABus : std_logic_vector(0 to 31);
  signal dlmb_M_AddrStrobe : std_logic;
  signal dlmb_M_BE : std_logic_vector(0 to 3);
  signal dlmb_M_DBus : std_logic_vector(0 to 31);
  signal dlmb_M_ReadStrobe : std_logic;
  signal dlmb_M_WriteStrobe : std_logic;
  signal dlmb_OPB_Rst : std_logic;
  signal dlmb_Sl_DBus : std_logic_vector(0 to 31);
  signal dlmb_Sl_Ready : std_logic_vector(0 to 0);
  signal dlmb_port_BRAM_Addr : std_logic_vector(0 to 31);
  signal dlmb_port_BRAM_Clk : std_logic;
  signal dlmb_port_BRAM_Din : std_logic_vector(0 to 31);
  signal dlmb_port_BRAM_Dout : std_logic_vector(0 to 31);
  signal dlmb_port_BRAM_EN : std_logic;
  signal dlmb_port_BRAM_Rst : std_logic;
  signal dlmb_port_BRAM_WEN : std_logic_vector(0 to 3);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Addr : std_logic_vector(0 to 12);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_BankAddr : std_logic_vector(0 to 1);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CASn : std_logic;
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CKE : std_logic_vector(0 to 1);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CSn : std_logic_vector(0 to 1);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clk : std_logic_vector(0 to 2);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clkn : std_logic_vector(0 to 2);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DM : std_logic_vector(0 to 7);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I : std_logic_vector(0 to 7);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O : std_logic_vector(0 to 7);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T : std_logic_vector(0 to 7);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I : std_logic_vector(0 to 63);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O : std_logic_vector(0 to 63);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T : std_logic_vector(0 to 63);
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_RASn : std_logic;
  signal fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_WEn : std_logic;
  signal fpga_0_RS232_Uart_1_RX : std_logic;
  signal fpga_0_RS232_Uart_1_TX : std_logic;
  signal ilmb_LMB_ABus : std_logic_vector(0 to 31);
  signal ilmb_LMB_AddrStrobe : std_logic;
  signal ilmb_LMB_BE : std_logic_vector(0 to 3);
  signal ilmb_LMB_ReadDBus : std_logic_vector(0 to 31);
  signal ilmb_LMB_ReadStrobe : std_logic;
  signal ilmb_LMB_Ready : std_logic;
  signal ilmb_LMB_WriteDBus : std_logic_vector(0 to 31);
  signal ilmb_LMB_WriteStrobe : std_logic;
  signal ilmb_M_ABus : std_logic_vector(0 to 31);
  signal ilmb_M_AddrStrobe : std_logic;
  signal ilmb_M_ReadStrobe : std_logic;
  signal ilmb_OPB_Rst : std_logic;
  signal ilmb_Sl_DBus : std_logic_vector(0 to 31);
  signal ilmb_Sl_Ready : std_logic_vector(0 to 0);
  signal ilmb_port_BRAM_Addr : std_logic_vector(0 to 31);
  signal ilmb_port_BRAM_Clk : std_logic;
  signal ilmb_port_BRAM_Din : std_logic_vector(0 to 31);
  signal ilmb_port_BRAM_Dout : std_logic_vector(0 to 31);
  signal ilmb_port_BRAM_EN : std_logic;
  signal ilmb_port_BRAM_Rst : std_logic;
  signal ilmb_port_BRAM_WEN : std_logic_vector(0 to 3);
  signal mb_opb_Debug_SYS_Rst : std_logic;
  signal mb_opb_M_ABus : std_logic_vector(0 to 63);
  signal mb_opb_M_BE : std_logic_vector(0 to 7);
  signal mb_opb_M_DBus : std_logic_vector(0 to 63);
  signal mb_opb_M_RNW : std_logic_vector(0 to 1);
  signal mb_opb_M_busLock : std_logic_vector(0 to 1);
  signal mb_opb_M_request : std_logic_vector(0 to 1);
  signal mb_opb_M_select : std_logic_vector(0 to 1);
  signal mb_opb_M_seqAddr : std_logic_vector(0 to 1);
  signal mb_opb_OPB_ABus : std_logic_vector(0 to 31);
  signal mb_opb_OPB_BE : std_logic_vector(0 to 3);
  signal mb_opb_OPB_DBus : std_logic_vector(0 to 31);
  signal mb_opb_OPB_MGrant : std_logic_vector(0 to 1);
  signal mb_opb_OPB_RNW : std_logic;
  signal mb_opb_OPB_Rst : std_logic;
  signal mb_opb_OPB_errAck : std_logic;
  signal mb_opb_OPB_retry : std_logic;
  signal mb_opb_OPB_select : std_logic;
  signal mb_opb_OPB_seqAddr : std_logic;
  signal mb_opb_OPB_timeout : std_logic;
  signal mb_opb_OPB_xferAck : std_logic;
  signal mb_opb_Sl_DBus : std_logic_vector(0 to 95);
  signal mb_opb_Sl_errAck : std_logic_vector(0 to 2);
  signal mb_opb_Sl_retry : std_logic_vector(0 to 2);
  signal mb_opb_Sl_toutSup : std_logic_vector(0 to 2);
  signal mb_opb_Sl_xferAck : std_logic_vector(0 to 2);
  signal microblaze_0_to_aes_accel_0_FSL_M_Control : std_logic;
  signal microblaze_0_to_aes_accel_0_FSL_M_Data : std_logic_vector(0 to 31);
  signal microblaze_0_to_aes_accel_0_FSL_M_Full : std_logic;
  signal microblaze_0_to_aes_accel_0_FSL_M_Write : std_logic;
  signal microblaze_0_to_aes_accel_0_FSL_S_Control : std_logic;
  signal microblaze_0_to_aes_accel_0_FSL_S_Data : std_logic_vector(0 to 31);
  signal microblaze_0_to_aes_accel_0_FSL_S_Exists : std_logic;
  signal microblaze_0_to_aes_accel_0_FSL_S_Read : std_logic;
  signal microblaze_0_to_tlb_bram_0_FSL_M_Control : std_logic;
  signal microblaze_0_to_tlb_bram_0_FSL_M_Data : std_logic_vector(0 to 31);
  signal microblaze_0_to_tlb_bram_0_FSL_M_Full : std_logic;
  signal microblaze_0_to_tlb_bram_0_FSL_M_Write : std_logic;
  signal microblaze_0_to_tlb_bram_0_FSL_S_Control : std_logic;
  signal microblaze_0_to_tlb_bram_0_FSL_S_Data : std_logic_vector(0 to 31);
  signal microblaze_0_to_tlb_bram_0_FSL_S_Exists : std_logic;
  signal microblaze_0_to_tlb_bram_0_FSL_S_Read : std_logic;
  signal net_gnd0 : std_logic;
  signal net_gnd1 : std_logic_vector(0 to 0);
  signal net_gnd2 : std_logic_vector(0 to 1);
  signal net_gnd3 : std_logic_vector(0 to 2);
  signal net_gnd4 : std_logic_vector(0 to 3);
  signal net_gnd32 : std_logic_vector(0 to 31);
  signal net_vcc2 : std_logic_vector(0 to 1);
  signal net_vcc3 : std_logic_vector(0 to 2);
  signal pgassign1 : std_logic_vector(0 to 0);
  signal pgassign2 : std_logic_vector(0 to 3);
  signal pgassign3 : std_logic_vector(0 to 3);
  signal sys_clk_n_s : std_logic_vector(0 to 0);
  signal sys_clk_s : std_logic_vector(0 to 0);
  signal sys_rst_s : std_logic;
  signal tlb_bram_0_to_microblaze_0_FSL_M_Control : std_logic;
  signal tlb_bram_0_to_microblaze_0_FSL_M_Data : std_logic_vector(0 to 31);
  signal tlb_bram_0_to_microblaze_0_FSL_M_Full : std_logic;
  signal tlb_bram_0_to_microblaze_0_FSL_M_Write : std_logic;
  signal tlb_bram_0_to_microblaze_0_FSL_S_Control : std_logic;
  signal tlb_bram_0_to_microblaze_0_FSL_S_Data : std_logic_vector(0 to 31);
  signal tlb_bram_0_to_microblaze_0_FSL_S_Exists : std_logic;
  signal tlb_bram_0_to_microblaze_0_FSL_S_Read : std_logic;
  signal tlb_bram_0_to_microblaze_0_OPB_Rst : std_logic;
  -- attribute box_type : STRING;
  -- attribute box_type of microblaze_0_wrapper : component is "black_box";
  -- attribute box_type of mb_opb_wrapper : component is "black_box";
  -- attribute box_type of debug_module_wrapper : component is "black_box";
  -- attribute box_type of ilmb_wrapper : component is "black_box";
  -- attribute box_type of dlmb_wrapper : component is "black_box";
  -- attribute box_type of dlmb_cntlr_wrapper : component is "black_box";
  -- attribute box_type of ilmb_cntlr_wrapper : component is "black_box";
  -- attribute box_type of lmb_bram_wrapper : component is "black_box";
  -- attribute box_type of rs232_uart_1_wrapper : component is "black_box";
  -- attribute box_type of ddr_512mb_64mx64_rank2_row13_col10_cl2_5_wrapper : component is "black_box";
  -- attribute box_type of sysclk_inv_wrapper : component is "black_box";
  -- attribute box_type of clk90_inv_wrapper : component is "black_box";
  -- attribute box_type of ddr_clk90_inv_wrapper : component is "black_box";
  -- attribute box_type of dcm_0_wrapper : component is "black_box";
  -- attribute box_type of dcm_1_wrapper : component is "black_box";
  -- attribute box_type of aes_accel_0_to_microblaze_0_wrapper : component is "black_box";
  -- attribute box_type of aes_accel_0_wrapper : component is "black_box";
  -- attribute box_type of microblaze_0_to_aes_accel_0_wrapper : component is "black_box";
  -- attribute box_type of tlb_bram_0_to_microblaze_0_wrapper : component is "black_box";
  -- attribute box_type of tlb_bram_0_wrapper : component is "black_box";
  -- attribute box_type of microblaze_0_to_tlb_bram_0_wrapper : component is "black_box";
begin
  -- Internal assignments
  fpga_0_RS232_Uart_1_RX <= fpga_0_RS232_Uart_1_RX_pin;
  fpga_0_RS232_Uart_1_TX_pin <= fpga_0_RS232_Uart_1_TX;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clk_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clk;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clkn_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clkn;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Addr_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Addr;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_BankAddr_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_BankAddr;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CASn_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CASn;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_RASn_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_RASn;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_WEn_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_WEn;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DM_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DM;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CKE_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CKE;
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CSn_pin <= fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CSn;
  ddr_feedback_s <= fpga_0_DDR_CLK_FB;
  fpga_0_DDR_CLK_FB_OUT <= ddr_clk_feedback_out_s;
  dcm_clk_s <= sys_clk_pin;
  sys_rst_s <= sys_rst_pin;
  pgassign1(0 to 0) <= B"0";
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clk(0 to 2) <= pgassign2(0 to 2);
  ddr_clk_feedback_out_s <= pgassign2(3);
  fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Clkn(0 to 2) <= pgassign3(0 to 2);
  pgassign1(0 to 0) <= pgassign3(3 to 3);
  net_gnd0 <= '0';
  fpga_0_net_gnd_pin <= net_gnd0;
  fpga_0_net_gnd_1_pin <= net_gnd0;
  fpga_0_net_gnd_2_pin <= net_gnd0;
  fpga_0_net_gnd_3_pin <= net_gnd0;
  fpga_0_net_gnd_4_pin <= net_gnd0;
  fpga_0_net_gnd_5_pin <= net_gnd0;
  fpga_0_net_gnd_6_pin <= net_gnd0;
  net_gnd1(0 to 0) <= B"0";
  net_gnd2(0 to 1) <= B"00";
  net_gnd3(0 to 2) <= B"000";
  net_gnd32(0 to 31) <= B"00000000000000000000000000000000";
  net_gnd4(0 to 3) <= B"0000";
  net_vcc2(0 to 1) <= B"11";
  net_vcc3(0 to 2) <= B"111";
  microblaze_0 : microblaze_0_wrapper
    port map (
      CLK => sys_clk_s(0),
      RESET => mb_opb_OPB_Rst,
      INTERRUPT => net_gnd0,
      DEBUG_RST => Debug_Rst,
      EXT_BRK => Ext_BRK,
      EXT_NM_BRK => Ext_NM_BRK,
      DBG_STOP => net_gnd0,
      MB_Halted => open,
      INSTR => ilmb_LMB_ReadDBus,
      I_ADDRTAG => open,
      IREADY => ilmb_LMB_Ready,
      IWAIT => net_gnd0,
      INSTR_ADDR => ilmb_M_ABus,
      IFETCH => ilmb_M_ReadStrobe,
      I_AS => ilmb_M_AddrStrobe,
      DATA_READ => dlmb_LMB_ReadDBus,
      DREADY => dlmb_LMB_Ready,
      DWAIT => net_gnd0,
      DATA_WRITE => dlmb_M_DBus,
      DATA_ADDR => dlmb_M_ABus,
      D_ADDRTAG => open,
      D_AS => dlmb_M_AddrStrobe,
      READ_STROBE => dlmb_M_ReadStrobe,
      WRITE_STROBE => dlmb_M_WriteStrobe,
      BYTE_ENABLE => dlmb_M_BE,
      DM_ABUS => mb_opb_M_ABus(0 to 31),
      DM_BE => mb_opb_M_BE(0 to 3),
      DM_BUSLOCK => mb_opb_M_busLock(0),
      DM_DBUS => mb_opb_M_DBus(0 to 31),
      DM_REQUEST => mb_opb_M_request(0),
      DM_RNW => mb_opb_M_RNW(0),
      DM_SELECT => mb_opb_M_select(0),
      DM_SEQADDR => mb_opb_M_seqAddr(0),
      DOPB_DBUS => mb_opb_OPB_DBus,
      DOPB_ERRACK => mb_opb_OPB_errAck,
      DOPB_MGRANT => mb_opb_OPB_MGrant(0),
      DOPB_RETRY => mb_opb_OPB_retry,
      DOPB_TIMEOUT => mb_opb_OPB_timeout,
      DOPB_XFERACK => mb_opb_OPB_xferAck,
      IM_ABUS => mb_opb_M_ABus(32 to 63),
      IM_BE => mb_opb_M_BE(4 to 7),
      IM_BUSLOCK => mb_opb_M_busLock(1),
      IM_DBUS => mb_opb_M_DBus(32 to 63),
      IM_REQUEST => mb_opb_M_request(1),
      IM_RNW => mb_opb_M_RNW(1),
      IM_SELECT => mb_opb_M_select(1),
      IM_SEQADDR => mb_opb_M_seqAddr(1),
      IOPB_DBUS => mb_opb_OPB_DBus,
      IOPB_ERRACK => mb_opb_OPB_errAck,
      IOPB_MGRANT => mb_opb_OPB_MGrant(1),
      IOPB_RETRY => mb_opb_OPB_retry,
      IOPB_TIMEOUT => mb_opb_OPB_timeout,
      IOPB_XFERACK => mb_opb_OPB_xferAck,
      DBG_CLK => DBG_CLK_s,
      DBG_TDI => DBG_TDI_s,
      DBG_TDO => DBG_TDO_s,
      DBG_REG_EN => DBG_REG_EN_s,
      DBG_CAPTURE => DBG_CAPTURE_s,
      DBG_UPDATE => DBG_UPDATE_s,
      Trace_Instruction => open,
      Trace_Valid_Instr => open,
      Trace_PC => open,
      Trace_Reg_Write => open,
      Trace_Reg_Addr => open,
      Trace_MSR_Reg => open,
      Trace_New_Reg_Value => open,
      Trace_Exception_Taken => open,
      Trace_Exception_Kind => open,
      Trace_Jump_Taken => open,
      Trace_Delay_Slot => open,
      Trace_Data_Address => open,
      Trace_Data_Access => open,
      Trace_Data_Read => open,
      Trace_Data_Write => open,
      Trace_Data_Write_Value => open,
      Trace_Data_Byte_Enable => open,
      Trace_DCache_Req => open,
      Trace_DCache_Hit => open,
      Trace_ICache_Req => open,
      Trace_ICache_Hit => open,
      Trace_OF_PipeRun => open,
      Trace_EX_PipeRun => open,
      Trace_MEM_PipeRun => open,
      FSL0_S_CLK => open,
      FSL0_S_READ => aes_accel_0_to_microblaze_0_FSL_S_Read,
      FSL0_S_DATA => aes_accel_0_to_microblaze_0_FSL_S_Data,
      FSL0_S_CONTROL => aes_accel_0_to_microblaze_0_FSL_S_Control,
      FSL0_S_EXISTS => aes_accel_0_to_microblaze_0_FSL_S_Exists,
      FSL0_M_CLK => open,
      FSL0_M_WRITE => microblaze_0_to_aes_accel_0_FSL_M_Write,
      FSL0_M_DATA => microblaze_0_to_aes_accel_0_FSL_M_Data,
      FSL0_M_CONTROL => microblaze_0_to_aes_accel_0_FSL_M_Control,
      FSL0_M_FULL => microblaze_0_to_aes_accel_0_FSL_M_Full,
      FSL1_S_CLK => open,
      FSL1_S_READ => tlb_bram_0_to_microblaze_0_FSL_S_Read,
      FSL1_S_DATA => tlb_bram_0_to_microblaze_0_FSL_S_Data,
      FSL1_S_CONTROL => tlb_bram_0_to_microblaze_0_FSL_S_Control,
      FSL1_S_EXISTS => tlb_bram_0_to_microblaze_0_FSL_S_Exists,
      FSL1_M_CLK => open,
      FSL1_M_WRITE => microblaze_0_to_tlb_bram_0_FSL_M_Write,
      FSL1_M_DATA => microblaze_0_to_tlb_bram_0_FSL_M_Data,
      FSL1_M_CONTROL => microblaze_0_to_tlb_bram_0_FSL_M_Control,
      FSL1_M_FULL => microblaze_0_to_tlb_bram_0_FSL_M_Full,
      FSL2_S_CLK => open,
      FSL2_S_READ => open,
      FSL2_S_DATA => net_gnd32,
      FSL2_S_CONTROL => net_gnd0,
      FSL2_S_EXISTS => net_gnd0,
      FSL2_M_CLK => open,
      FSL2_M_WRITE => open,
      FSL2_M_DATA => open,
      FSL2_M_CONTROL => open,
      FSL2_M_FULL => net_gnd0,
      FSL3_S_CLK => open,
      FSL3_S_READ => open,
      FSL3_S_DATA => net_gnd32,
      FSL3_S_CONTROL => net_gnd0,
      FSL3_S_EXISTS => net_gnd0,
      FSL3_M_CLK => open,
      FSL3_M_WRITE => open,
      FSL3_M_DATA => open,
      FSL3_M_CONTROL => open,
      FSL3_M_FULL => net_gnd0,
      FSL4_S_CLK => open,
      FSL4_S_READ => open,
      FSL4_S_DATA => net_gnd32,
      FSL4_S_CONTROL => net_gnd0,
      FSL4_S_EXISTS => net_gnd0,
      FSL4_M_CLK => open,
      FSL4_M_WRITE => open,
      FSL4_M_DATA => open,
      FSL4_M_CONTROL => open,
      FSL4_M_FULL => net_gnd0,
      FSL5_S_CLK => open,
      FSL5_S_READ => open,
      FSL5_S_DATA => net_gnd32,
      FSL5_S_CONTROL => net_gnd0,
      FSL5_S_EXISTS => net_gnd0,
      FSL5_M_CLK => open,
      FSL5_M_WRITE => open,
      FSL5_M_DATA => open,
      FSL5_M_CONTROL => open,
      FSL5_M_FULL => net_gnd0,
      FSL6_S_CLK => open,
      FSL6_S_READ => open,
      FSL6_S_DATA => net_gnd32,
      FSL6_S_CONTROL => net_gnd0,
      FSL6_S_EXISTS => net_gnd0,
      FSL6_M_CLK => open,
      FSL6_M_WRITE => open,
      FSL6_M_DATA => open,
      FSL6_M_CONTROL => open,
      FSL6_M_FULL => net_gnd0,
      FSL7_S_CLK => open,
      FSL7_S_READ => open,
      FSL7_S_DATA => net_gnd32,
      FSL7_S_CONTROL => net_gnd0,
      FSL7_S_EXISTS => net_gnd0,
      FSL7_M_CLK => open,
      FSL7_M_WRITE => open,
      FSL7_M_DATA => open,
      FSL7_M_CONTROL => open,
      FSL7_M_FULL => net_gnd0,
      ICACHE_FSL_IN_CLK => open,
      ICACHE_FSL_IN_READ => open,
      ICACHE_FSL_IN_DATA => net_gnd32,
      ICACHE_FSL_IN_CONTROL => net_gnd0,
      ICACHE_FSL_IN_EXISTS => net_gnd0,
      ICACHE_FSL_OUT_CLK => open,
      ICACHE_FSL_OUT_WRITE => open,
      ICACHE_FSL_OUT_DATA => open,
      ICACHE_FSL_OUT_CONTROL => open,
      ICACHE_FSL_OUT_FULL => net_gnd0,
      DCACHE_FSL_IN_CLK => open,
      DCACHE_FSL_IN_READ => open,
      DCACHE_FSL_IN_DATA => net_gnd32,
      DCACHE_FSL_IN_CONTROL => net_gnd0,
      DCACHE_FSL_IN_EXISTS => net_gnd0,
      DCACHE_FSL_OUT_CLK => open,
      DCACHE_FSL_OUT_WRITE => open,
      DCACHE_FSL_OUT_DATA => open,
      DCACHE_FSL_OUT_CONTROL => open,
      DCACHE_FSL_OUT_FULL => net_gnd0
    );
  mb_opb : mb_opb_wrapper
    port map (
      OPB_Clk => sys_clk_s(0),
      OPB_Rst => mb_opb_OPB_Rst,
      SYS_Rst => sys_rst_s,
      Debug_SYS_Rst => mb_opb_Debug_SYS_Rst,
      WDT_Rst => net_gnd0,
      M_ABus => mb_opb_M_ABus,
      M_BE => mb_opb_M_BE,
      M_beXfer => net_gnd2,
      M_busLock => mb_opb_M_busLock,
      M_DBus => mb_opb_M_DBus,
      M_DBusEn => net_gnd2,
      M_DBusEn32_63 => net_vcc2,
      M_dwXfer => net_gnd2,
      M_fwXfer => net_gnd2,
      M_hwXfer => net_gnd2,
      M_request => mb_opb_M_request,
      M_RNW => mb_opb_M_RNW,
      M_select => mb_opb_M_select,
      M_seqAddr => mb_opb_M_seqAddr,
      Sl_beAck => net_gnd3,
      Sl_DBus => mb_opb_Sl_DBus,
      Sl_DBusEn => net_vcc3,
      Sl_DBusEn32_63 => net_vcc3,
      Sl_errAck => mb_opb_Sl_errAck,
      Sl_dwAck => net_gnd3,
      Sl_fwAck => net_gnd3,
      Sl_hwAck => net_gnd3,
      Sl_retry => mb_opb_Sl_retry,
      Sl_toutSup => mb_opb_Sl_toutSup,
      Sl_xferAck => mb_opb_Sl_xferAck,
      OPB_MRequest => open,
      OPB_ABus => mb_opb_OPB_ABus,
      OPB_BE => mb_opb_OPB_BE,
      OPB_beXfer => open,
      OPB_beAck => open,
      OPB_busLock => open,
      OPB_rdDBus => open,
      OPB_wrDBus => open,
      OPB_DBus => mb_opb_OPB_DBus,
      OPB_errAck => mb_opb_OPB_errAck,
      OPB_dwAck => open,
      OPB_dwXfer => open,
      OPB_fwAck => open,
      OPB_fwXfer => open,
      OPB_hwAck => open,
      OPB_hwXfer => open,
      OPB_MGrant => mb_opb_OPB_MGrant,
      OPB_pendReq => open,
      OPB_retry => mb_opb_OPB_retry,
      OPB_RNW => mb_opb_OPB_RNW,
      OPB_select => mb_opb_OPB_select,
      OPB_seqAddr => mb_opb_OPB_seqAddr,
      OPB_timeout => mb_opb_OPB_timeout,
      OPB_toutSup => open,
      OPB_xferAck => mb_opb_OPB_xferAck
    );
  debug_module : debug_module_wrapper
    port map (
      OPB_Clk => sys_clk_s(0),
      OPB_Rst => mb_opb_OPB_Rst,
      Interrupt => open,
      Debug_SYS_Rst => mb_opb_Debug_SYS_Rst,
      Debug_Rst => Debug_Rst,
      Ext_BRK => Ext_BRK,
      Ext_NM_BRK => Ext_NM_BRK,
      OPB_ABus => mb_opb_OPB_ABus,
      OPB_BE => mb_opb_OPB_BE,
      OPB_RNW => mb_opb_OPB_RNW,
      OPB_select => mb_opb_OPB_select,
      OPB_seqAddr => mb_opb_OPB_seqAddr,
      OPB_DBus => mb_opb_OPB_DBus,
      MDM_DBus => mb_opb_Sl_DBus(0 to 31),
      MDM_errAck => mb_opb_Sl_errAck(0),
      MDM_retry => mb_opb_Sl_retry(0),
      MDM_toutSup => mb_opb_Sl_toutSup(0),
      MDM_xferAck => mb_opb_Sl_xferAck(0),
      Dbg_Clk_0 => DBG_CLK_s,
      Dbg_TDI_0 => DBG_TDI_s,
      Dbg_TDO_0 => DBG_TDO_s,
      Dbg_Reg_En_0 => DBG_REG_EN_s,
      Dbg_Capture_0 => DBG_CAPTURE_s,
      Dbg_Update_0 => DBG_UPDATE_s,
      Dbg_Clk_1 => open,
      Dbg_TDI_1 => open,
      Dbg_TDO_1 => net_gnd0,
      Dbg_Reg_En_1 => open,
      Dbg_Capture_1 => open,
      Dbg_Update_1 => open,
      Dbg_Clk_2 => open,
      Dbg_TDI_2 => open,
      Dbg_TDO_2 => net_gnd0,
      Dbg_Reg_En_2 => open,
      Dbg_Capture_2 => open,
      Dbg_Update_2 => open,
      Dbg_Clk_3 => open,
      Dbg_TDI_3 => open,
      Dbg_TDO_3 => net_gnd0,
      Dbg_Reg_En_3 => open,
      Dbg_Capture_3 => open,
      Dbg_Update_3 => open,
      Dbg_Clk_4 => open,
      Dbg_TDI_4 => open,
      Dbg_TDO_4 => net_gnd0,
      Dbg_Reg_En_4 => open,
      Dbg_Capture_4 => open,
      Dbg_Update_4 => open,
      Dbg_Clk_5 => open,
      Dbg_TDI_5 => open,
      Dbg_TDO_5 => net_gnd0,
      Dbg_Reg_En_5 => open,
      Dbg_Capture_5 => open,
      Dbg_Update_5 => open,
      Dbg_Clk_6 => open,
      Dbg_TDI_6 => open,
      Dbg_TDO_6 => net_gnd0,
      Dbg_Reg_En_6 => open,
      Dbg_Capture_6 => open,
      Dbg_Update_6 => open,
      Dbg_Clk_7 => open,
      Dbg_TDI_7 => open,
      Dbg_TDO_7 => net_gnd0,
      Dbg_Reg_En_7 => open,
      Dbg_Capture_7 => open,
      Dbg_Update_7 => open,
      bscan_tdi => open,
      bscan_reset => open,
      bscan_shift => open,
      bscan_update => open,
      bscan_capture => open,
      bscan_sel1 => open,
      bscan_drck1 => open,
      bscan_tdo1 => net_gnd0,
      FSL0_S_CLK => open,
      FSL0_S_READ => open,
      FSL0_S_DATA => net_gnd32,
      FSL0_S_CONTROL => net_gnd0,
      FSL0_S_EXISTS => net_gnd0,
      FSL0_M_CLK => open,
      FSL0_M_WRITE => open,
      FSL0_M_DATA => open,
      FSL0_M_CONTROL => open,
      FSL0_M_FULL => net_gnd0
    );
  ilmb : ilmb_wrapper
    port map (
      LMB_Clk => sys_clk_s(0),
      SYS_Rst => sys_rst_s,
      LMB_Rst => ilmb_OPB_Rst,
      M_ABus => ilmb_M_ABus,
      M_ReadStrobe => ilmb_M_ReadStrobe,
      M_WriteStrobe => net_gnd0,
      M_AddrStrobe => ilmb_M_AddrStrobe,
      M_DBus => net_gnd32,
      M_BE => net_gnd4,
      Sl_DBus => ilmb_Sl_DBus,
      Sl_Ready => ilmb_Sl_Ready(0 to 0),
      LMB_ABus => ilmb_LMB_ABus,
      LMB_ReadStrobe => ilmb_LMB_ReadStrobe,
      LMB_WriteStrobe => ilmb_LMB_WriteStrobe,
      LMB_AddrStrobe => ilmb_LMB_AddrStrobe,
      LMB_ReadDBus => ilmb_LMB_ReadDBus,
      LMB_WriteDBus => ilmb_LMB_WriteDBus,
      LMB_Ready => ilmb_LMB_Ready,
      LMB_BE => ilmb_LMB_BE
    );
  dlmb : dlmb_wrapper
    port map (
      LMB_Clk => sys_clk_s(0),
      SYS_Rst => sys_rst_s,
      LMB_Rst => dlmb_OPB_Rst,
      M_ABus => dlmb_M_ABus,
      M_ReadStrobe => dlmb_M_ReadStrobe,
      M_WriteStrobe => dlmb_M_WriteStrobe,
      M_AddrStrobe => dlmb_M_AddrStrobe,
      M_DBus => dlmb_M_DBus,
      M_BE => dlmb_M_BE,
      Sl_DBus => dlmb_Sl_DBus,
      Sl_Ready => dlmb_Sl_Ready(0 to 0),
      LMB_ABus => dlmb_LMB_ABus,
      LMB_ReadStrobe => dlmb_LMB_ReadStrobe,
      LMB_WriteStrobe => dlmb_LMB_WriteStrobe,
      LMB_AddrStrobe => dlmb_LMB_AddrStrobe,
      LMB_ReadDBus => dlmb_LMB_ReadDBus,
      LMB_WriteDBus => dlmb_LMB_WriteDBus,
      LMB_Ready => dlmb_LMB_Ready,
      LMB_BE => dlmb_LMB_BE
    );
  dlmb_cntlr : dlmb_cntlr_wrapper
    port map (
      LMB_Clk => sys_clk_s(0),
      LMB_Rst => dlmb_OPB_Rst,
      LMB_ABus => dlmb_LMB_ABus,
      LMB_WriteDBus => dlmb_LMB_WriteDBus,
      LMB_AddrStrobe => dlmb_LMB_AddrStrobe,
      LMB_ReadStrobe => dlmb_LMB_ReadStrobe,
      LMB_WriteStrobe => dlmb_LMB_WriteStrobe,
      LMB_BE => dlmb_LMB_BE,
      Sl_DBus => dlmb_Sl_DBus,
      Sl_Ready => dlmb_Sl_Ready(0),
      BRAM_Rst_A => dlmb_port_BRAM_Rst,
      BRAM_Clk_A => dlmb_port_BRAM_Clk,
      BRAM_EN_A => dlmb_port_BRAM_EN,
      BRAM_WEN_A => dlmb_port_BRAM_WEN,
      BRAM_Addr_A => dlmb_port_BRAM_Addr,
      BRAM_Din_A => dlmb_port_BRAM_Din,
      BRAM_Dout_A => dlmb_port_BRAM_Dout
    );
  ilmb_cntlr : ilmb_cntlr_wrapper
    port map (
      LMB_Clk => sys_clk_s(0),
      LMB_Rst => ilmb_OPB_Rst,
      LMB_ABus => ilmb_LMB_ABus,
      LMB_WriteDBus => ilmb_LMB_WriteDBus,
      LMB_AddrStrobe => ilmb_LMB_AddrStrobe,
      LMB_ReadStrobe => ilmb_LMB_ReadStrobe,
      LMB_WriteStrobe => ilmb_LMB_WriteStrobe,
      LMB_BE => ilmb_LMB_BE,
      Sl_DBus => ilmb_Sl_DBus,
      Sl_Ready => ilmb_Sl_Ready(0),
      BRAM_Rst_A => ilmb_port_BRAM_Rst,
      BRAM_Clk_A => ilmb_port_BRAM_Clk,
      BRAM_EN_A => ilmb_port_BRAM_EN,
      BRAM_WEN_A => ilmb_port_BRAM_WEN,
      BRAM_Addr_A => ilmb_port_BRAM_Addr,
      BRAM_Din_A => ilmb_port_BRAM_Din,
      BRAM_Dout_A => ilmb_port_BRAM_Dout
    );
  lmb_bram : lmb_bram_wrapper
    port map (
      BRAM_Rst_A => ilmb_port_BRAM_Rst,
      BRAM_Clk_A => ilmb_port_BRAM_Clk,
      BRAM_EN_A => ilmb_port_BRAM_EN,
      BRAM_WEN_A => ilmb_port_BRAM_WEN,
      BRAM_Addr_A => ilmb_port_BRAM_Addr,
      BRAM_Din_A => ilmb_port_BRAM_Din,
      BRAM_Dout_A => ilmb_port_BRAM_Dout,
      BRAM_Rst_B => dlmb_port_BRAM_Rst,
      BRAM_Clk_B => dlmb_port_BRAM_Clk,
      BRAM_EN_B => dlmb_port_BRAM_EN,
      BRAM_WEN_B => dlmb_port_BRAM_WEN,
      BRAM_Addr_B => dlmb_port_BRAM_Addr,
      BRAM_Din_B => dlmb_port_BRAM_Din,
      BRAM_Dout_B => dlmb_port_BRAM_Dout
    );
  rs232_uart_1 : rs232_uart_1_wrapper
    port map (
      OPB_Clk => sys_clk_s(0),
      OPB_Rst => mb_opb_OPB_Rst,
      Interrupt => open,
      OPB_ABus => mb_opb_OPB_ABus,
      OPB_BE => mb_opb_OPB_BE,
      OPB_RNW => mb_opb_OPB_RNW,
      OPB_select => mb_opb_OPB_select,
      OPB_seqAddr => mb_opb_OPB_seqAddr,
      OPB_DBus => mb_opb_OPB_DBus,
      UART_DBus => mb_opb_Sl_DBus(32 to 63),
      UART_errAck => mb_opb_Sl_errAck(1),
      UART_retry => mb_opb_Sl_retry(1),
      UART_toutSup => mb_opb_Sl_toutSup(1),
      UART_xferAck => mb_opb_Sl_xferAck(1),
      RX => fpga_0_RS232_Uart_1_RX,
      TX => fpga_0_RS232_Uart_1_TX
    );
  ddr_512mb_64mx64_rank2_row13_col10_cl2_5 : ddr_512mb_64mx64_rank2_row13_col10_cl2_5_wrapper
    port map (
      MCH0_Access_Control => net_gnd0,
      MCH0_Access_Data => net_gnd32,
      MCH0_Access_Write => net_gnd0,
      MCH0_Access_Full => open,
      MCH0_ReadData_Control => open,
      MCH0_ReadData_Data => open,
      MCH0_ReadData_Read => net_gnd0,
      MCH0_ReadData_Exists => open,
      MCH1_Access_Control => net_gnd0,
      MCH1_Access_Data => net_gnd32,
      MCH1_Access_Write => net_gnd0,
      MCH1_Access_Full => open,
      MCH1_ReadData_Control => open,
      MCH1_ReadData_Data => open,
      MCH1_ReadData_Read => net_gnd0,
      MCH1_ReadData_Exists => open,
      MCH2_Access_Control => net_gnd0,
      MCH2_Access_Data => net_gnd32,
      MCH2_Access_Write => net_gnd0,
      MCH2_Access_Full => open,
      MCH2_ReadData_Control => open,
      MCH2_ReadData_Data => open,
      MCH2_ReadData_Read => net_gnd0,
      MCH2_ReadData_Exists => open,
      MCH3_Access_Control => net_gnd0,
      MCH3_Access_Data => net_gnd32,
      MCH3_Access_Write => net_gnd0,
      MCH3_Access_Full => open,
      MCH3_ReadData_Control => open,
      MCH3_ReadData_Data => open,
      MCH3_ReadData_Read => net_gnd0,
      MCH3_ReadData_Exists => open,
      OPB_select => mb_opb_OPB_select,
      OPB_RNW => mb_opb_OPB_RNW,
      OPB_ABus => mb_opb_OPB_ABus,
      OPB_DBus => mb_opb_OPB_DBus,
      OPB_BE => mb_opb_OPB_BE,
      OPB_seqAddr => mb_opb_OPB_seqAddr,
      Sln_xferAck => mb_opb_Sl_xferAck(2),
      Sln_errAck => mb_opb_Sl_errAck(2),
      Sln_toutSup => mb_opb_Sl_toutSup(2),
      Sln_retry => mb_opb_Sl_retry(2),
      Sln_DBus => mb_opb_Sl_DBus(64 to 95),
      DDR_Clk => pgassign2,
      DDR_Clkn => pgassign3,
      DDR_CKE => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CKE,
      DDR_CSn => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CSn,
      DDR_RASn => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_RASn,
      DDR_CASn => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_CASn,
      DDR_WEn => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_WEn,
      DDR_DM => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DM,
      DDR_BankAddr => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_BankAddr,
      DDR_Addr => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_Addr,
      DDR_DQ_o => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O,
      DDR_DQ_i => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I,
      DDR_DQ_t => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T,
      DDR_DQS_i => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I,
      DDR_DQS_o => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O,
      DDR_DQS_t => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T,
      DDR_Init_done => open,
      DDR_Sleep => net_gnd0,
      DDR_WakeUp => net_gnd0,
      MCH_OPB_Clk => sys_clk_s(0),
      MCH_OPB_Rst => mb_opb_OPB_Rst,
      Device_Clk => sys_clk_s(0),
      Device_Clk_n => sys_clk_n_s(0),
      Device_Clk90_in => clk_90_s(0),
      Device_Clk90_in_n => clk_90_n_s(0),
      DDR_Clk90_in => ddr_clk_90_s(0),
      DDR_Clk90_in_n => ddr_clk_90_n_s(0)
    );
  sysclk_inv : sysclk_inv_wrapper
    port map (
      Op1 => sys_clk_s(0 to 0),
      Op2 => net_gnd1(0 to 0),
      Res => sys_clk_n_s(0 to 0)
    );
  clk90_inv : clk90_inv_wrapper
    port map (
      Op1 => clk_90_s(0 to 0),
      Op2 => net_gnd1(0 to 0),
      Res => clk_90_n_s(0 to 0)
    );
  ddr_clk90_inv : ddr_clk90_inv_wrapper
    port map (
      Op1 => ddr_clk_90_s(0 to 0),
      Op2 => net_gnd1(0 to 0),
      Res => ddr_clk_90_n_s(0 to 0)
    );
  dcm_0 : dcm_0_wrapper
    port map (
      RST => net_gnd0,
      CLKIN => dcm_clk_s,
      CLKFB => sys_clk_s(0),
      PSEN => net_gnd0,
      PSINCDEC => net_gnd0,
      PSCLK => net_gnd0,
      DSSEN => net_gnd0,
      CLK0 => sys_clk_s(0),
      CLK90 => clk_90_s(0),
      CLK180 => open,
      CLK270 => open,
      CLKDV => open,
      CLK2X => open,
      CLK2X180 => open,
      CLKFX => open,
      CLKFX180 => open,
      STATUS => open,
      LOCKED => dcm_0_lock,
      PSDONE => open
    );
  dcm_1 : dcm_1_wrapper
    port map (
      RST => dcm_0_lock,
      CLKIN => ddr_feedback_s,
      CLKFB => dcm_1_FB,
      PSEN => net_gnd0,
      PSINCDEC => net_gnd0,
      PSCLK => net_gnd0,
      DSSEN => net_gnd0,
      CLK0 => dcm_1_FB,
      CLK90 => ddr_clk_90_s(0),
      CLK180 => open,
      CLK270 => open,
      CLKDV => open,
      CLK2X => open,
      CLK2X180 => open,
      CLKFX => open,
      CLKFX180 => open,
      STATUS => open,
      LOCKED => open,
      PSDONE => open
    );
  aes_accel_0_to_microblaze_0 : aes_accel_0_to_microblaze_0_wrapper
    port map (
      FSL_Clk => sys_clk_s(0),
      SYS_Rst => sys_rst_s,
      FSL_Rst => aes_accel_0_to_microblaze_0_OPB_Rst,
      FSL_M_Clk => net_gnd0,
      FSL_M_Data => aes_accel_0_to_microblaze_0_FSL_M_Data,
      FSL_M_Control => aes_accel_0_to_microblaze_0_FSL_M_Control,
      FSL_M_Write => aes_accel_0_to_microblaze_0_FSL_M_Write,
      FSL_M_Full => aes_accel_0_to_microblaze_0_FSL_M_Full,
      FSL_S_Clk => net_gnd0,
      FSL_S_Data => aes_accel_0_to_microblaze_0_FSL_S_Data,
      FSL_S_Control => aes_accel_0_to_microblaze_0_FSL_S_Control,
      FSL_S_Read => aes_accel_0_to_microblaze_0_FSL_S_Read,
      FSL_S_Exists => aes_accel_0_to_microblaze_0_FSL_S_Exists,
      FSL_Full => open,
      FSL_Has_Data => open,
      FSL_Control_IRQ => open
    );
  aes_accel_0 : aes_accel_0_wrapper
    port map (
      FSL_Clk => sys_clk_s(0),
      FSL_Rst => aes_accel_0_to_microblaze_0_OPB_Rst,
      FSL_S_Clk => open,
      FSL_S_Read => microblaze_0_to_aes_accel_0_FSL_S_Read,
      FSL_S_Data => microblaze_0_to_aes_accel_0_FSL_S_Data,
      FSL_S_Control => microblaze_0_to_aes_accel_0_FSL_S_Control,
      FSL_S_Exists => microblaze_0_to_aes_accel_0_FSL_S_Exists,
      FSL_M_Clk => open,
      FSL_M_Write => aes_accel_0_to_microblaze_0_FSL_M_Write,
      FSL_M_Data => aes_accel_0_to_microblaze_0_FSL_M_Data,
      FSL_M_Control => aes_accel_0_to_microblaze_0_FSL_M_Control,
      FSL_M_Full => aes_accel_0_to_microblaze_0_FSL_M_Full
    );
  microblaze_0_to_aes_accel_0 : microblaze_0_to_aes_accel_0_wrapper
    port map (
      FSL_Clk => sys_clk_s(0),
      SYS_Rst => sys_rst_s,
      FSL_Rst => open,
      FSL_M_Clk => net_gnd0,
      FSL_M_Data => microblaze_0_to_aes_accel_0_FSL_M_Data,
      FSL_M_Control => microblaze_0_to_aes_accel_0_FSL_M_Control,
      FSL_M_Write => microblaze_0_to_aes_accel_0_FSL_M_Write,
      FSL_M_Full => microblaze_0_to_aes_accel_0_FSL_M_Full,
      FSL_S_Clk => net_gnd0,
      FSL_S_Data => microblaze_0_to_aes_accel_0_FSL_S_Data,
      FSL_S_Control => microblaze_0_to_aes_accel_0_FSL_S_Control,
      FSL_S_Read => microblaze_0_to_aes_accel_0_FSL_S_Read,
      FSL_S_Exists => microblaze_0_to_aes_accel_0_FSL_S_Exists,
      FSL_Full => open,
      FSL_Has_Data => open,
      FSL_Control_IRQ => open
    );
  tlb_bram_0_to_microblaze_0 : tlb_bram_0_to_microblaze_0_wrapper
    port map (
      FSL_Clk => sys_clk_s(0),
      SYS_Rst => sys_rst_s,
      FSL_Rst => tlb_bram_0_to_microblaze_0_OPB_Rst,
      FSL_M_Clk => net_gnd0,
      FSL_M_Data => tlb_bram_0_to_microblaze_0_FSL_M_Data,
      FSL_M_Control => tlb_bram_0_to_microblaze_0_FSL_M_Control,
      FSL_M_Write => tlb_bram_0_to_microblaze_0_FSL_M_Write,
      FSL_M_Full => tlb_bram_0_to_microblaze_0_FSL_M_Full,
      FSL_S_Clk => net_gnd0,
      FSL_S_Data => tlb_bram_0_to_microblaze_0_FSL_S_Data,
      FSL_S_Control => tlb_bram_0_to_microblaze_0_FSL_S_Control,
      FSL_S_Read => tlb_bram_0_to_microblaze_0_FSL_S_Read,
      FSL_S_Exists => tlb_bram_0_to_microblaze_0_FSL_S_Exists,
      FSL_Full => open,
      FSL_Has_Data => open,
      FSL_Control_IRQ => open
    );
  tlb_bram_0 : tlb_bram_0_wrapper
    port map (
      FSL_Clk => sys_clk_s(0),
      FSL_Rst => tlb_bram_0_to_microblaze_0_OPB_Rst,
      FSL_S_Clk => open,
      FSL_S_Read => microblaze_0_to_tlb_bram_0_FSL_S_Read,
      FSL_S_Data => microblaze_0_to_tlb_bram_0_FSL_S_Data,
      FSL_S_Control => microblaze_0_to_tlb_bram_0_FSL_S_Control,
      FSL_S_Exists => microblaze_0_to_tlb_bram_0_FSL_S_Exists,
      FSL_M_Clk => open,
      FSL_M_Write => tlb_bram_0_to_microblaze_0_FSL_M_Write,
      FSL_M_Data => tlb_bram_0_to_microblaze_0_FSL_M_Data,
      FSL_M_Control => tlb_bram_0_to_microblaze_0_FSL_M_Control,
      FSL_M_Full => tlb_bram_0_to_microblaze_0_FSL_M_Full
    );
  microblaze_0_to_tlb_bram_0 : microblaze_0_to_tlb_bram_0_wrapper
    port map (
      FSL_Clk => sys_clk_s(0),
      SYS_Rst => sys_rst_s,
      FSL_Rst => open,
      FSL_M_Clk => net_gnd0,
      FSL_M_Data => microblaze_0_to_tlb_bram_0_FSL_M_Data,
      FSL_M_Control => microblaze_0_to_tlb_bram_0_FSL_M_Control,
      FSL_M_Write => microblaze_0_to_tlb_bram_0_FSL_M_Write,
      FSL_M_Full => microblaze_0_to_tlb_bram_0_FSL_M_Full,
      FSL_S_Clk => net_gnd0,
      FSL_S_Data => microblaze_0_to_tlb_bram_0_FSL_S_Data,
      FSL_S_Control => microblaze_0_to_tlb_bram_0_FSL_S_Control,
      FSL_S_Read => microblaze_0_to_tlb_bram_0_FSL_S_Read,
      FSL_S_Exists => microblaze_0_to_tlb_bram_0_FSL_S_Exists,
      FSL_Full => open,
      FSL_Has_Data => open,
      FSL_Control_IRQ => open
    );
  iobuf_0 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O(0),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_pin(0),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I(0),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T(0)
    );
  iobuf_1 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O(1),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_pin(1),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I(1),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T(1)
    );
  iobuf_2 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O(2),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_pin(2),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I(2),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T(2)
    );
  iobuf_3 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O(3),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_pin(3),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I(3),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T(3)
    );
  iobuf_4 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O(4),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_pin(4),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I(4),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T(4)
    );
  iobuf_5 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O(5),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_pin(5),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I(5),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T(5)
    );
  iobuf_6 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O(6),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_pin(6),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I(6),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T(6)
    );
  iobuf_7 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_O(7),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_pin(7),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_I(7),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQS_T(7)
    );
  iobuf_8 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(0),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(0),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(0),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(0)
    );
  iobuf_9 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(1),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(1),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(1),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(1)
    );
  iobuf_10 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(2),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(2),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(2),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(2)
    );
  iobuf_11 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(3),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(3),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(3),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(3)
    );
  iobuf_12 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(4),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(4),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(4),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(4)
    );
  iobuf_13 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(5),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(5),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(5),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(5)
    );
  iobuf_14 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(6),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(6),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(6),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(6)
    );
  iobuf_15 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(7),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(7),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(7),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(7)
    );
  iobuf_16 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(8),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(8),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(8),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(8)
    );
  iobuf_17 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(9),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(9),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(9),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(9)
    );
  iobuf_18 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(10),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(10),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(10),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(10)
    );
  iobuf_19 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(11),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(11),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(11),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(11)
    );
  iobuf_20 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(12),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(12),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(12),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(12)
    );
  iobuf_21 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(13),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(13),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(13),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(13)
    );
  iobuf_22 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(14),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(14),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(14),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(14)
    );
  iobuf_23 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(15),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(15),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(15),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(15)
    );
  iobuf_24 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(16),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(16),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(16),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(16)
    );
  iobuf_25 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(17),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(17),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(17),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(17)
    );
  iobuf_26 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(18),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(18),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(18),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(18)
    );
  iobuf_27 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(19),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(19),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(19),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(19)
    );
  iobuf_28 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(20),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(20),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(20),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(20)
    );
  iobuf_29 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(21),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(21),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(21),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(21)
    );
  iobuf_30 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(22),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(22),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(22),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(22)
    );
  iobuf_31 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(23),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(23),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(23),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(23)
    );
  iobuf_32 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(24),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(24),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(24),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(24)
    );
  iobuf_33 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(25),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(25),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(25),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(25)
    );
  iobuf_34 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(26),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(26),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(26),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(26)
    );
  iobuf_35 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(27),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(27),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(27),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(27)
    );
  iobuf_36 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(28),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(28),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(28),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(28)
    );
  iobuf_37 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(29),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(29),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(29),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(29)
    );
  iobuf_38 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(30),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(30),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(30),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(30)
    );
  iobuf_39 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(31),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(31),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(31),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(31)
    );
  iobuf_40 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(32),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(32),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(32),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(32)
    );
  iobuf_41 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(33),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(33),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(33),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(33)
    );
  iobuf_42 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(34),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(34),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(34),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(34)
    );
  iobuf_43 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(35),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(35),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(35),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(35)
    );
  iobuf_44 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(36),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(36),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(36),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(36)
    );
  iobuf_45 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(37),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(37),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(37),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(37)
    );
  iobuf_46 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(38),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(38),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(38),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(38)
    );
  iobuf_47 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(39),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(39),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(39),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(39)
    );
  iobuf_48 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(40),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(40),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(40),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(40)
    );
  iobuf_49 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(41),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(41),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(41),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(41)
    );
  iobuf_50 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(42),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(42),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(42),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(42)
    );
  iobuf_51 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(43),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(43),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(43),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(43)
    );
  iobuf_52 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(44),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(44),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(44),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(44)
    );
  iobuf_53 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(45),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(45),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(45),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(45)
    );
  iobuf_54 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(46),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(46),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(46),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(46)
    );
  iobuf_55 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(47),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(47),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(47),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(47)
    );
  iobuf_56 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(48),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(48),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(48),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(48)
    );
  iobuf_57 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(49),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(49),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(49),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(49)
    );
  iobuf_58 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(50),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(50),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(50),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(50)
    );
  iobuf_59 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(51),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(51),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(51),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(51)
    );
  iobuf_60 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(52),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(52),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(52),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(52)
    );
  iobuf_61 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(53),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(53),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(53),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(53)
    );
  iobuf_62 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(54),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(54),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(54),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(54)
    );
  iobuf_63 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(55),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(55),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(55),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(55)
    );
  iobuf_64 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(56),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(56),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(56),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(56)
    );
  iobuf_65 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(57),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(57),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(57),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(57)
    );
  iobuf_66 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(58),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(58),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(58),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(58)
    );
  iobuf_67 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(59),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(59),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(59),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(59)
    );
  iobuf_68 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(60),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(60),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(60),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(60)
    );
  iobuf_69 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(61),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(61),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(61),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(61)
    );
  iobuf_70 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(62),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(62),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(62),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(62)
    );
  iobuf_71 : IOBUF
    port map (
      I => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_O(63),
      IO => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_pin(63),
      O => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_I(63),
      T => fpga_0_DDR_512MB_64Mx64_rank2_row13_col10_cl2_5_DDR_DQ_T(63)
    );
end architecture STRUCTURE;
