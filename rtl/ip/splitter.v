module register_splitter (
    input wire clk,
    input wire [31:0] data_in_32, 
    output reg [7:0] data_out_8,
    output reg [15:0] address,  
    output reg write_enable
);

    reg [7:0] reg_array [0:3];  
    reg [15:0] addr_counter = 0;  
    reg data_valid = 1'b0;
    reg [31:0] prev_data_in_32 = 32'd0;  // Register to hold previous data_in_32
    reg [1:0] byte_index = 2'b00; // To track which byte we are writing

    // Always block for data splitting and flagging
    always @(posedge clk) begin 
        if (data_in_32 != prev_data_in_32) begin  // Detect new data
            
            reg_array[3] <= {data_in_32[0],  data_in_32[1],  data_in_32[2],  data_in_32[3],  data_in_32[4],  data_in_32[5],  data_in_32[6],  data_in_32[7]};
            reg_array[2] <= {data_in_32[8],  data_in_32[9],  data_in_32[10], data_in_32[11], data_in_32[12], data_in_32[13], data_in_32[14], data_in_32[15]};
            reg_array[1] <= {data_in_32[16], data_in_32[17], data_in_32[18], data_in_32[19], data_in_32[20], data_in_32[21], data_in_32[22], data_in_32[23]};
            reg_array[0] <= {data_in_32[24], data_in_32[25], data_in_32[26], data_in_32[27], data_in_32[28], data_in_32[29], data_in_32[30], data_in_32[31]};
            data_valid <= 1'b1; // Mark data as valid
            prev_data_in_32 <= data_in_32;  // Update previous data
            byte_index <= 2'b00;  // Reset byte index for new data
        end
    end        

    // Always block for output and address increment
    always @(posedge clk) begin
        if (data_valid) begin
            data_out_8 <= reg_array[byte_index];
            address <= addr_counter;
            write_enable <= 1'b1;  // Enable write for each byte

            // Increment byte index and address counter
            byte_index <= byte_index + 2'b01;
            addr_counter <= addr_counter + 1;

            // Reset data_valid after processing 4 bytes
            if (byte_index == 2'b11) begin
                data_valid <= 1'b0;
            end
        end else begin
            write_enable <= 1'b0; // Disable write if no new data
        end
    end
endmodule