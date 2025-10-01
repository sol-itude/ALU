// 1. testbench 모듈 선언 (입출력이 없음)
module testbench;
  
  // 2. 신호선 만들기 (엔진에 연결할 전선)
  logic a, b;
  wire out;
  
  // 3. 설계한 모듈 불러와서 연결하기 (엔진을 테스트 장비에 올리기)
  AND_gate dut (
    .a(a),      // AND_gate의 a 포트를 testbench의 a 전선에 연결
    .b(b),      // AND_gate의 b 포트를 testbench의 b 전선에 연결
    .out(out)   // AND_gate의 out 포트를 testbench의 out 전선에 연결
  );
  
  // 4. 입력 신호 넣어주기 (엔진 돌려보기)
  initial begin

    // waveform을 관찰하기 위한 두 줄
    $dumpfile("dump.vcd");
    $dumpvars;

    // 테스트 케이스 1: a=0, b=0 -> out=0?
    a = 1'b0; b = 1'b0; #10;
    
    // 테스트 케이스 2: a=0, b=1 -> out=0?
    a = 1'b0; b = 1'b1; #10;
    
    // 테스트 케이스 3: a=1, b=0 -> out=0?
    a = 1'b1; b = 1'b0; #10;
    
    // 테스트 케이스 4: a=1, b=1 -> out=1?
    a = 1'b1; b = 1'b1; #10;
    
    $finish; // 시뮬레이션 종료
  end

endmodule