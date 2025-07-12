module muxhot #(parameter DW = 64,
                parameter N = 16 // number of inputs
                )
   (
    input [N-1:0]    sel, // select vector
    input [N*DW-1:0] in,  // concatenated input {..,in1[DW-1:0],in0[DW-1:0]
    output [DW-1:0]  out  // output
    );

   reg [DW-1:0]     mux;
   integer          i;
   always @*
     begin
	mux[DW-1:0] = 'b0;
	for(i=0;i<N;i=i+1)
	  mux[DW-1:0] = mux[DW-1:0] | {(DW){sel[i]}} & in[((i+1)*DW-1)-:DW];
     end
   assign out[DW-1:0] = mux[DW-1:0];

endmodule
