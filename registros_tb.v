/*******************************
Universidad de Costa Rica
CI-0114: Fundamentos de Arquitectura

Circuito de prueba para el circuito registro.v
*********************************/

`timescale 1us/100ns

module Register_tb;
	//reg [31:0] data_Output;
	//reg  [31:0] data_Input;
	//reg  [2:0] dirr;
	
	reg [31:0] _inputData;
	reg [2:0] _dirrInput;
	reg [2:0] _dirrOutput1;
	reg [2:0] _dirrOutput2;
	reg _enableWrite;
	//reg [31:0] _outputData1;
	//reg [31:0] _outputData2;
	wire [31:0] _outputData1;
	wire [31:0] _outputData2;
  
	initial begin
		$dumpfile("registros.vcd");
		$dumpvars;
		// en 1 registor cabe 32bits, lo cual son 4 bytes, y por lo tanto 4 char
		
		//monitor instruction para saber por donde vamos en el arra
		$monitor("\n _inputData : %b \n _dirrInput : %b \n _dirrOutput1 : %b \n _dirrOutput2 : %b \n _outputData1 : %b \n _outputData2 : %b \n _enableWrite : %b \n\n################################################", _inputData, _dirrInput, _dirrOutput1, _dirrOutput2, _outputData1, _outputData2, _enableWrite);
		
		#1 _enableWrite = 'b1;
		#1 _inputData = 'hACED_CAFE; _dirrInput = 'b000; //el underscore es un simbolo "ignorado" por el compilador
		#1 _dirrOutput1 = 'b000;
		#1 _inputData = 'hDEAD_BEEF; _dirrInput = 'b011;
		#1 _dirrOutput1 = 'b010;
		#1 _inputData = 'hDEAD_BEEF; _dirrInput = 'b111;
		#1 _dirrOutput1 = 'b111; _dirrOutput2 = 'b011;
		#1 _enableWrite = 'b0;
		#1 _inputData = 'hFFFF_FFFF; _dirrInput = 'b111;
		#1 _dirrOutput1 = 'b111;  _dirrOutput1 = 'b000;
		//clk = 1; escribir = 0;
		//#1 dirr = 'b000; data_Input = 'hACED_CAFE; 
		//direccion = 4; escribir = 1;
		//#1 data_Input <= 'hHOLA;  
		//#1 data_Input = 'hACED_CAFE;
		//#1 data_Input = 'hDEAD_BEEF;
		#1 $finish;
		//#1 escribir = 0;
		//#1 direccion = 3; data_entrada = 'hDEAD_BEEF;
		//#6 $finish;
	end
	
	registersArray registro(_inputData, _dirrInput, _dirrOutput1, _dirrOutput2, _outputData1, _outputData2, _enableWrite, clk);
endmodule


