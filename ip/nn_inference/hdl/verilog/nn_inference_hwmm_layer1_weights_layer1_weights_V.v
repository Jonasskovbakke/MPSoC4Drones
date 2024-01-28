// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module nn_inference_hwmm_layer1_weights_layer1_weights_V_rom (
addr0, ce0, q0, addr1, ce1, q1, clk);

parameter DWIDTH = 25;
parameter AWIDTH = 15;
parameter MEM_SIZE = 24576;

input[AWIDTH-1:0] addr0;
input ce0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
output reg[DWIDTH-1:0] q1;
input clk;

reg [DWIDTH-1:0] ram[0:MEM_SIZE-1];

initial begin
    $readmemh("./nn_inference_hwmm_layer1_weights_layer1_weights_V_rom.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[addr0];
    end
end



always @(posedge clk)  
begin 
    if (ce1) 
    begin
        q1 <= ram[addr1];
    end
end



endmodule

`timescale 1 ns / 1 ps
module nn_inference_hwmm_layer1_weights_layer1_weights_V(
    reset,
    clk,
    address0,
    ce0,
    q0,
    address1,
    ce1,
    q1);

parameter DataWidth = 32'd25;
parameter AddressRange = 32'd24576;
parameter AddressWidth = 32'd15;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
output[DataWidth - 1:0] q1;



nn_inference_hwmm_layer1_weights_layer1_weights_V_rom nn_inference_hwmm_layer1_weights_layer1_weights_V_rom_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .q1( q1 ));

endmodule

