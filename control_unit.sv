`define OP_LOAD 7'b000011
`define OP_ALUIMM 7'b0010011
`define OP_AUIPC 7'b0010111
`define OP_STORE 7'b0100011
`define OP_ALUREG 7'b0110011
`define OP_LUI 7'b0110111
`define OP_BR 7'b1100011
`define OP_JALR 7'b1100111
`define OP_JAL 7'b1101111

module control_unit (
    input logic [6:0] op,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    input logic ALUBrOut,
    output logic [1:0] WBSel,
    output logic MemWE,
    output logic PCSel,
    output logic ALUSrcSel,
    output logic RegWE,
    output logic JumpEn,
    output logic BrEn,
    output logic [1:0] ImmSel,
    output logic [2:0] ALUCtrl
);

  logic [10:0] control_sig;
  logic [ 1:0] ALUOp;
  assign control_sig = {RegWE, ImmSel, ALUSrcSel, MemWE, WBSel, BrEn, ALUOp, JumpEn};

  // main decoder part
  always_comb begin : main_decoder
    case (op)
      OP_LOAD: control_sig = 11'b1_00_1_0_01_0_00_0;
      OP_ALUIMM: control_sig = 11'b1_00_1_0_00_0_10_0;
      OP_AUIPC: control_sig = 11'bx_xx_x_x_xx_x_xx_x;  // unfinished
      OP_STORE: control_sig = 11'b0_01_1_1_xx_0_00_0;
      OP_ALUREG: control_sig = 11'b1_xx_0_0_00_0_10_0;
      OP_LUI: control_sig = 11'bx_xx_x_x_xx_x_xx_x;  // unfinished
      OP_BR: control_sig = 11'b0_10_0_0_xx_1_01_0;
      OP_JALR: control_sig = 11'bx_xx_x_x_xx_x_xx_x;  // unfinished
      OP_JAL: control_sig = 11'b1_11_x_0_10_0_xx_1;
      default: ;
    endcase
  end
  // ALU decoder part
endmodule
;
