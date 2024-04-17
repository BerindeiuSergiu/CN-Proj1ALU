module FACD(
    input x,
    input y,
    input cin,
    output z,
    output cout
);

assign z = x ^ y ^ cin;
assign cout = (x & (~y)) | (x & cin) | ((~y) & cin);

endmodule

module RCAD(a, b, cin, cout, sum);
    input [15:0] a, b;
    input cin;
    output [15:0] sum;
    output cout;
    wire [15:1] c; //wire pt ca e variabila locala

generate 
    genvar k;
        for(k = 0; k < 16; k = k + 1) begin:v
        if(k == 0)
            FACD stage(.x(a[k]), .y(b[k]), .cin(cin), .z(sum[k]), .cout(c[k+1]));
        else if(k == 15)
            FACD stage(.x(a[k]), .y(b[k]), .cin(c[k]), .z(sum[k]), .cout(cout));
            else 
                FACD stage(.x(a[k]), .y(b[k]), .cin(c[k]), .z(sum[k]), .cout(c[k+1]));
        end
endgenerate

endmodule
