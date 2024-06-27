module rv32i (
    input logic clk,
    input logic reset,
    output logic [31:0] PC,
    input logic [31:0] Instr,
    output logic MemWE,
    output logic [31:0] ALUOut,
    output logic [31:0] WData,
    input logic [31:0] RData
);


  control_unit c (
      .op(),
      .funct3(),
      .funct7(),
      .ALUBrOut(),
      .WBSel(),
      .MemWE(),
      .PCSel(),
      .ALUSrcSel(),
      .RegWE(),
      .JumpEn(),
      .BrEn(),
      .ImmSel(),
      .ALUCtrl()
  );
  datapath dp (
      .clk(),
      .reset(),
      .WBSel(),
      .ALUCtrl(),
      .PCSel(),
      .ImmSel(),
      .RegWE(),
      .ALUBr(),
      .WData(),
      .RData(),
      .ALUOut(),
      .PC(),
      .Instr(),
      .ALUSrcSel()
  );

endmodule
;
