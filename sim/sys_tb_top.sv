
`timescale 1ns/10ps
`define USING_IVERILOG


module sys_tb_top();

  reg  clk;
  reg  lfextclk;
  reg  rst_n;

  wire hfclk = clk;
  wire uart_rx;
  wire [31:0] gpio; 
  assign uart_rx = gpio[17];

`ifdef USING_IVERILOG
  initial begin
    $dumpfile("waveout.vcd");
    $dumpvars(0, sys_tb_top);
  end
 `endif

`ifdef USING_VCS
  initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
  end
`endif

  initial begin
    #150ms;
    $finish;
  end


  initial begin

    clk        <=0;
    lfextclk   <=0;
    rst_n      <=0;
    #320us rst_n <=1;
  end


  always
  begin 
     #18.52 clk <= ~clk;
  end

  always
  begin 
     #33 lfextclk <= ~lfextclk;
  end

//--------------UART data transfer--------------//  

  //uart tx period
  int uart_tx_period = 1e9 /115200;
  //uart rx period
  int uart_rx_period = 8750; //8.75us

  //uart tx signal
  reg [31:0] gpio_in; // default value bit 16 (uart_tx) should be 1
  //uart rx signal
  reg [31:0] gpio_out;  // bit 17 is uart rx. 


  reg [7:0] uart_rx_byte;

// send uart data
  task uart_tx_data(input bit [7:0] tx_data);

    //1 bit start bit
    gpio_in[16] = 1'b0;
    #uart_tx_period;

    // 8 bit data: LSB first
    for(int i=0; i<8; i++)
    begin
      gpio_in[16] = tx_data[i];
      #uart_tx_period;      
    end

    //1 bit stop bit
    gpio_in[16] = 1'b1;
    #uart_tx_period;

  endtask
/*
//receive uart data
  task uart_rx_data(output bit [7:0] rx_data);

    //1 bit start bit
    @(negedge gpio_out[17]);
    #uart_rx_period;

    // 8 bit data: LSB first
    for(int i=0; i<8; i++)
    begin
      #(uart_rx_period/2);        
      rx_data[i] = gpio_out[17];
      #(uart_rx_period/2);          
    end

    //1 bit stop bit
    #(uart_tx_period/2);

  endtask

*/


  //read file and send data to e203 core
  initial begin

    reg [7:0] sim_data[3:0];

    gpio_in[16] = 1'b1;

    $readmemh("./input.txt", sim_data);    

    #7ms;

    foreach(sim_data[x])
    begin
      $display("tx_data[%x] = %x", x, sim_data[x]);
      uart_tx_data(sim_data[x]);

      //delay between tx byte

    end
    

  end


/*// receive data from e203 core
initial begin
  int j = 0;

  #5ms;

  forever begin
    uart_rx_data(uart_rx_byte);
    $display("rx_data[%x] = %x", j, uart_rx_byte);    
  end

end  */



    e203_soc_demo uut (
        .V_sync             (),
        .H_sync             (),
        .hdmi_data_out      (),

    
        .clk_in              (clk),  

        .tck                 (), 
        .tms                 (), 
        .tdi                 (), 
        .tdo                 (),  

        .gpio_in             (gpio_in),
        .gpio_out            (gpio_out),
        .qspi_in             (),
        .qspi_out            (),      
        .qspi_sck            (),  
        .qspi_cs             (),   

        .erstn               (rst_n), 

        .dbgmode0_n          (1'b1), 
        .dbgmode1_n          (1'b1),
        .dbgmode3_n          (1'b1),
  
        .bootrom_n           (1'b0), 
  
        .aon_pmu_dwakeup_n   (), 
        .aon_pmu_padrst      (),    
        .aon_pmu_vddpaden    () 
    );

endmodule
