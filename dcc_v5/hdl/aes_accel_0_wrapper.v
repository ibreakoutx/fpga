//-----------------------------------------------------------------------------
// aes_accel_0_wrapper.v
//-----------------------------------------------------------------------------

module aes_accel_0_wrapper
  (
    FSL_Clk,
    FSL_Rst,
    FSL_S_Clk,
    FSL_S_Read,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Exists,
    FSL_M_Clk,
    FSL_M_Write,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Full
  );
  input FSL_Clk;
  input FSL_Rst;
  output FSL_S_Clk;
  output FSL_S_Read;
  input [0:31] FSL_S_Data;
  input FSL_S_Control;
  input FSL_S_Exists;
  output FSL_M_Clk;
  output FSL_M_Write;
  output [0:31] FSL_M_Data;
  output FSL_M_Control;
  input FSL_M_Full;

  aes_accel
    aes_accel_0 (
      .FSL_Clk ( FSL_Clk ),
      .FSL_Rst ( FSL_Rst ),
      .FSL_S_Clk ( FSL_S_Clk ),
      .FSL_S_Read ( FSL_S_Read ),
      .FSL_S_Data ( FSL_S_Data ),
      .FSL_S_Control ( FSL_S_Control ),
      .FSL_S_Exists ( FSL_S_Exists ),
      .FSL_M_Clk ( FSL_M_Clk ),
      .FSL_M_Write ( FSL_M_Write ),
      .FSL_M_Data ( FSL_M_Data ),
      .FSL_M_Control ( FSL_M_Control ),
      .FSL_M_Full ( FSL_M_Full )
    );

endmodule

// synthesis attribute x_core_info of aes_accel_0_wrapper is aes_accel_v1_00_a;

