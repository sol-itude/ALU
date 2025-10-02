`timescale 1ns / 1ps

module testbench;

  // --- ��ȣ ���� (reg�� wire ��Ȯ�� ����) ---

  // �׽�Ʈ��ġ�� ���� ���� �Ҵ��ϰ� '����'�ؾ� �ϴ� ��ȣ�� (DUT�� �Է�)
  // '����ġ' �����̹Ƿ� reg Ÿ������ �����մϴ�.
  reg [31:0] A_tb, B_tb;
  reg [3:0]  ALU_control_tb;

  // DUT�� ��� ����� ���������� '����'�ޱ⸸ �ϴ� ��ȣ
  // '����' �����̹Ƿ� wire Ÿ������ �����մϴ�.
  wire [31:0] result_tb;

  // --- DUT �ν��Ͻ�ȭ ---
  ALU dut (
    .ALU_A      (A_tb),
    .ALU_B      (B_tb),
    .ALU_control (ALU_control_tb),
    .result     (result_tb)
  );

  // --- �ùķ��̼� �ó����� ---
  initial begin
    // Vivado������ $dumpfile, $dumpvars�� �ʿ� �����ϴ�.

    // --- �׽�Ʈ ���̽� 1: AND ���� ---
    $display("--- Test Case 1: AND Operation ---");
    A_tb          = 32'hFFFF0000;
    B_tb          = 32'h00FFFF00;
    ALU_control_tb = 4'b0000;
    #10;

    $display("At time %0t: A=%h, B=%h, Control=%b => Result=%h", $time, A_tb, B_tb, ALU_control_tb, result_tb);

    // --- �׽�Ʈ ���̽� 2: OR ���� ---
    $display("\n--- Test Case 2: OR Operation ---");
    ALU_control_tb = 4'b0001;
    #10;

    $display("At time %0t: A=%h, B=%h, Control=%b => Result=%h", $time, A_tb, B_tb, ALU_control_tb, result_tb);

    // --- �׽�Ʈ ���̽� 3: ����(ADD) ���� (�̱��� ���� �׽�Ʈ) ---
    $display("\n--- Test Case 3: ADD Operation (Default Case) ---");
    ALU_control_tb = 4'b0010;
    #10;
    
    $display("At time %0t: A=%h, B=%h, Control=%b => Result=%h", $time, A_tb, B_tb, ALU_control_tb, result_tb);

    #10;
        
    $finish;
  end

endmodule