// SISTEMA.v

// Generated using ACDS version 17.0 595

`timescale 1 ps / 1 ps
module SISTEMA (
		input  wire        clk_clk,                        //                        clk.clk
		input  wire        reset_reset_n,                  //                      reset.reset_n
		output wire [12:0] sdram_addr,                     //                      sdram.addr
		output wire [1:0]  sdram_ba,                       //                           .ba
		output wire        sdram_cas_n,                    //                           .cas_n
		output wire        sdram_cke,                      //                           .cke
		output wire        sdram_cs_n,                     //                           .cs_n
		inout  wire [15:0] sdram_dq,                       //                           .dq
		output wire [1:0]  sdram_dqm,                      //                           .dqm
		output wire        sdram_ras_n,                    //                           .ras_n
		output wire        sdram_we_n,                     //                           .we_n
		output wire        sdram_clk_1_clk,                //                sdram_clk_1.clk
		input  wire        uart_0_external_connection_rxd, // uart_0_external_connection.rxd
		output wire        uart_0_external_connection_txd  //                           .txd
	);

	wire  [31:0] cpu_data_master_readdata;                             // mm_interconnect_0:CPU_data_master_readdata -> CPU:d_readdata
	wire         cpu_data_master_waitrequest;                          // mm_interconnect_0:CPU_data_master_waitrequest -> CPU:d_waitrequest
	wire         cpu_data_master_debugaccess;                          // CPU:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:CPU_data_master_debugaccess
	wire  [27:0] cpu_data_master_address;                              // CPU:d_address -> mm_interconnect_0:CPU_data_master_address
	wire   [3:0] cpu_data_master_byteenable;                           // CPU:d_byteenable -> mm_interconnect_0:CPU_data_master_byteenable
	wire         cpu_data_master_read;                                 // CPU:d_read -> mm_interconnect_0:CPU_data_master_read
	wire         cpu_data_master_write;                                // CPU:d_write -> mm_interconnect_0:CPU_data_master_write
	wire  [31:0] cpu_data_master_writedata;                            // CPU:d_writedata -> mm_interconnect_0:CPU_data_master_writedata
	wire  [31:0] cpu_instruction_master_readdata;                      // mm_interconnect_0:CPU_instruction_master_readdata -> CPU:i_readdata
	wire         cpu_instruction_master_waitrequest;                   // mm_interconnect_0:CPU_instruction_master_waitrequest -> CPU:i_waitrequest
	wire  [27:0] cpu_instruction_master_address;                       // CPU:i_address -> mm_interconnect_0:CPU_instruction_master_address
	wire         cpu_instruction_master_read;                          // CPU:i_read -> mm_interconnect_0:CPU_instruction_master_read
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_chipselect;  // mm_interconnect_0:JTAG_avalon_jtag_slave_chipselect -> JTAG:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_avalon_jtag_slave_readdata;    // JTAG:av_readdata -> mm_interconnect_0:JTAG_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_waitrequest; // JTAG:av_waitrequest -> mm_interconnect_0:JTAG_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_avalon_jtag_slave_address;     // mm_interconnect_0:JTAG_avalon_jtag_slave_address -> JTAG:av_address
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_read;        // mm_interconnect_0:JTAG_avalon_jtag_slave_read -> JTAG:av_read_n
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_write;       // mm_interconnect_0:JTAG_avalon_jtag_slave_write -> JTAG:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_avalon_jtag_slave_writedata;   // mm_interconnect_0:JTAG_avalon_jtag_slave_writedata -> JTAG:av_writedata
	wire  [31:0] mm_interconnect_0_sys_id_control_slave_readdata;      // SYS_ID:readdata -> mm_interconnect_0:SYS_ID_control_slave_readdata
	wire   [0:0] mm_interconnect_0_sys_id_control_slave_address;       // mm_interconnect_0:SYS_ID_control_slave_address -> SYS_ID:address
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_readdata;       // CPU:debug_mem_slave_readdata -> mm_interconnect_0:CPU_debug_mem_slave_readdata
	wire         mm_interconnect_0_cpu_debug_mem_slave_waitrequest;    // CPU:debug_mem_slave_waitrequest -> mm_interconnect_0:CPU_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_cpu_debug_mem_slave_debugaccess;    // mm_interconnect_0:CPU_debug_mem_slave_debugaccess -> CPU:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_cpu_debug_mem_slave_address;        // mm_interconnect_0:CPU_debug_mem_slave_address -> CPU:debug_mem_slave_address
	wire         mm_interconnect_0_cpu_debug_mem_slave_read;           // mm_interconnect_0:CPU_debug_mem_slave_read -> CPU:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_cpu_debug_mem_slave_byteenable;     // mm_interconnect_0:CPU_debug_mem_slave_byteenable -> CPU:debug_mem_slave_byteenable
	wire         mm_interconnect_0_cpu_debug_mem_slave_write;          // mm_interconnect_0:CPU_debug_mem_slave_write -> CPU:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_writedata;      // mm_interconnect_0:CPU_debug_mem_slave_writedata -> CPU:debug_mem_slave_writedata
	wire         mm_interconnect_0_timer_s1_chipselect;                // mm_interconnect_0:TIMER_s1_chipselect -> TIMER:chipselect
	wire  [15:0] mm_interconnect_0_timer_s1_readdata;                  // TIMER:readdata -> mm_interconnect_0:TIMER_s1_readdata
	wire   [2:0] mm_interconnect_0_timer_s1_address;                   // mm_interconnect_0:TIMER_s1_address -> TIMER:address
	wire         mm_interconnect_0_timer_s1_write;                     // mm_interconnect_0:TIMER_s1_write -> TIMER:write_n
	wire  [15:0] mm_interconnect_0_timer_s1_writedata;                 // mm_interconnect_0:TIMER_s1_writedata -> TIMER:writedata
	wire         mm_interconnect_0_sdram_s1_chipselect;                // mm_interconnect_0:SDRAM_s1_chipselect -> SDRAM:az_cs
	wire  [15:0] mm_interconnect_0_sdram_s1_readdata;                  // SDRAM:za_data -> mm_interconnect_0:SDRAM_s1_readdata
	wire         mm_interconnect_0_sdram_s1_waitrequest;               // SDRAM:za_waitrequest -> mm_interconnect_0:SDRAM_s1_waitrequest
	wire  [24:0] mm_interconnect_0_sdram_s1_address;                   // mm_interconnect_0:SDRAM_s1_address -> SDRAM:az_addr
	wire         mm_interconnect_0_sdram_s1_read;                      // mm_interconnect_0:SDRAM_s1_read -> SDRAM:az_rd_n
	wire   [1:0] mm_interconnect_0_sdram_s1_byteenable;                // mm_interconnect_0:SDRAM_s1_byteenable -> SDRAM:az_be_n
	wire         mm_interconnect_0_sdram_s1_readdatavalid;             // SDRAM:za_valid -> mm_interconnect_0:SDRAM_s1_readdatavalid
	wire         mm_interconnect_0_sdram_s1_write;                     // mm_interconnect_0:SDRAM_s1_write -> SDRAM:az_wr_n
	wire  [15:0] mm_interconnect_0_sdram_s1_writedata;                 // mm_interconnect_0:SDRAM_s1_writedata -> SDRAM:az_data
	wire         mm_interconnect_0_uart_0_s1_chipselect;               // mm_interconnect_0:uart_0_s1_chipselect -> uart_0:chipselect
	wire  [15:0] mm_interconnect_0_uart_0_s1_readdata;                 // uart_0:readdata -> mm_interconnect_0:uart_0_s1_readdata
	wire   [2:0] mm_interconnect_0_uart_0_s1_address;                  // mm_interconnect_0:uart_0_s1_address -> uart_0:address
	wire         mm_interconnect_0_uart_0_s1_read;                     // mm_interconnect_0:uart_0_s1_read -> uart_0:read_n
	wire         mm_interconnect_0_uart_0_s1_begintransfer;            // mm_interconnect_0:uart_0_s1_begintransfer -> uart_0:begintransfer
	wire         mm_interconnect_0_uart_0_s1_write;                    // mm_interconnect_0:uart_0_s1_write -> uart_0:write_n
	wire  [15:0] mm_interconnect_0_uart_0_s1_writedata;                // mm_interconnect_0:uart_0_s1_writedata -> uart_0:writedata
	wire         irq_mapper_receiver0_irq;                             // TIMER:irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                             // JTAG:av_irq -> irq_mapper:receiver1_irq
	wire         irq_mapper_receiver2_irq;                             // uart_0:irq -> irq_mapper:receiver2_irq
	wire  [31:0] cpu_irq_irq;                                          // irq_mapper:sender_irq -> CPU:irq
	wire         rst_controller_reset_out_reset;                       // rst_controller:reset_out -> [CPU:reset_n, JTAG:rst_n, SDRAM:reset_n, SYS_ID:reset_n, TIMER:reset_n, irq_mapper:reset, mm_interconnect_0:CPU_reset_reset_bridge_in_reset_reset, rst_translator:in_reset, uart_0:reset_n]
	wire         rst_controller_reset_out_reset_req;                   // rst_controller:reset_req -> [CPU:reset_req, rst_translator:reset_req_in]
	wire         cpu_debug_reset_request_reset;                        // CPU:debug_reset_request -> [rst_controller:reset_in1, rst_controller_001:reset_in1]
	wire         rst_controller_001_reset_out_reset;                   // rst_controller_001:reset_out -> pll:rst

	SISTEMA_CPU cpu (
		.clk                                 (clk_clk),                                           //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                   //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                //                          .reset_req
		.d_address                           (cpu_data_master_address),                           //               data_master.address
		.d_byteenable                        (cpu_data_master_byteenable),                        //                          .byteenable
		.d_read                              (cpu_data_master_read),                              //                          .read
		.d_readdata                          (cpu_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (cpu_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (cpu_data_master_write),                             //                          .write
		.d_writedata                         (cpu_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (cpu_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (cpu_instruction_master_address),                    //        instruction_master.address
		.i_read                              (cpu_instruction_master_read),                       //                          .read
		.i_readdata                          (cpu_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (cpu_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (cpu_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (cpu_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                   // custom_instruction_master.readra
	);

	SISTEMA_JTAG jtag (
		.clk            (clk_clk),                                              //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                      //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver1_irq)                              //               irq.irq
	);

	SISTEMA_SDRAM sdram (
		.clk            (clk_clk),                                  //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset),          // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_addr),                               //  wire.export
		.zs_ba          (sdram_ba),                                 //      .export
		.zs_cas_n       (sdram_cas_n),                              //      .export
		.zs_cke         (sdram_cke),                                //      .export
		.zs_cs_n        (sdram_cs_n),                               //      .export
		.zs_dq          (sdram_dq),                                 //      .export
		.zs_dqm         (sdram_dqm),                                //      .export
		.zs_ras_n       (sdram_ras_n),                              //      .export
		.zs_we_n        (sdram_we_n)                                //      .export
	);

	SISTEMA_SYS_ID sys_id (
		.clock    (clk_clk),                                         //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                 //         reset.reset_n
		.readdata (mm_interconnect_0_sys_id_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sys_id_control_slave_address)   //              .address
	);

	SISTEMA_TIMER timer (
		.clk        (clk_clk),                               //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset),       // reset.reset_n
		.address    (mm_interconnect_0_timer_s1_address),    //    s1.address
		.writedata  (mm_interconnect_0_timer_s1_writedata),  //      .writedata
		.readdata   (mm_interconnect_0_timer_s1_readdata),   //      .readdata
		.chipselect (mm_interconnect_0_timer_s1_chipselect), //      .chipselect
		.write_n    (~mm_interconnect_0_timer_s1_write),     //      .write_n
		.irq        (irq_mapper_receiver0_irq)               //   irq.irq
	);

	SISTEMA_pll pll (
		.refclk   (clk_clk),                            //  refclk.clk
		.rst      (rst_controller_001_reset_out_reset), //   reset.reset
		.outclk_0 (sdram_clk_1_clk),                    // outclk0.clk
		.outclk_1 (),                                   // outclk1.clk
		.locked   ()                                    // (terminated)
	);

	SISTEMA_uart_0 uart_0 (
		.clk           (clk_clk),                                   //                 clk.clk
		.reset_n       (~rst_controller_reset_out_reset),           //               reset.reset_n
		.address       (mm_interconnect_0_uart_0_s1_address),       //                  s1.address
		.begintransfer (mm_interconnect_0_uart_0_s1_begintransfer), //                    .begintransfer
		.chipselect    (mm_interconnect_0_uart_0_s1_chipselect),    //                    .chipselect
		.read_n        (~mm_interconnect_0_uart_0_s1_read),         //                    .read_n
		.write_n       (~mm_interconnect_0_uart_0_s1_write),        //                    .write_n
		.writedata     (mm_interconnect_0_uart_0_s1_writedata),     //                    .writedata
		.readdata      (mm_interconnect_0_uart_0_s1_readdata),      //                    .readdata
		.rxd           (uart_0_external_connection_rxd),            // external_connection.export
		.txd           (uart_0_external_connection_txd),            //                    .export
		.irq           (irq_mapper_receiver2_irq)                   //                 irq.irq
	);

	SISTEMA_mm_interconnect_0 mm_interconnect_0 (
		.CLOCK_clk_clk                         (clk_clk),                                              //                       CLOCK_clk.clk
		.CPU_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                       // CPU_reset_reset_bridge_in_reset.reset
		.CPU_data_master_address               (cpu_data_master_address),                              //                 CPU_data_master.address
		.CPU_data_master_waitrequest           (cpu_data_master_waitrequest),                          //                                .waitrequest
		.CPU_data_master_byteenable            (cpu_data_master_byteenable),                           //                                .byteenable
		.CPU_data_master_read                  (cpu_data_master_read),                                 //                                .read
		.CPU_data_master_readdata              (cpu_data_master_readdata),                             //                                .readdata
		.CPU_data_master_write                 (cpu_data_master_write),                                //                                .write
		.CPU_data_master_writedata             (cpu_data_master_writedata),                            //                                .writedata
		.CPU_data_master_debugaccess           (cpu_data_master_debugaccess),                          //                                .debugaccess
		.CPU_instruction_master_address        (cpu_instruction_master_address),                       //          CPU_instruction_master.address
		.CPU_instruction_master_waitrequest    (cpu_instruction_master_waitrequest),                   //                                .waitrequest
		.CPU_instruction_master_read           (cpu_instruction_master_read),                          //                                .read
		.CPU_instruction_master_readdata       (cpu_instruction_master_readdata),                      //                                .readdata
		.CPU_debug_mem_slave_address           (mm_interconnect_0_cpu_debug_mem_slave_address),        //             CPU_debug_mem_slave.address
		.CPU_debug_mem_slave_write             (mm_interconnect_0_cpu_debug_mem_slave_write),          //                                .write
		.CPU_debug_mem_slave_read              (mm_interconnect_0_cpu_debug_mem_slave_read),           //                                .read
		.CPU_debug_mem_slave_readdata          (mm_interconnect_0_cpu_debug_mem_slave_readdata),       //                                .readdata
		.CPU_debug_mem_slave_writedata         (mm_interconnect_0_cpu_debug_mem_slave_writedata),      //                                .writedata
		.CPU_debug_mem_slave_byteenable        (mm_interconnect_0_cpu_debug_mem_slave_byteenable),     //                                .byteenable
		.CPU_debug_mem_slave_waitrequest       (mm_interconnect_0_cpu_debug_mem_slave_waitrequest),    //                                .waitrequest
		.CPU_debug_mem_slave_debugaccess       (mm_interconnect_0_cpu_debug_mem_slave_debugaccess),    //                                .debugaccess
		.JTAG_avalon_jtag_slave_address        (mm_interconnect_0_jtag_avalon_jtag_slave_address),     //          JTAG_avalon_jtag_slave.address
		.JTAG_avalon_jtag_slave_write          (mm_interconnect_0_jtag_avalon_jtag_slave_write),       //                                .write
		.JTAG_avalon_jtag_slave_read           (mm_interconnect_0_jtag_avalon_jtag_slave_read),        //                                .read
		.JTAG_avalon_jtag_slave_readdata       (mm_interconnect_0_jtag_avalon_jtag_slave_readdata),    //                                .readdata
		.JTAG_avalon_jtag_slave_writedata      (mm_interconnect_0_jtag_avalon_jtag_slave_writedata),   //                                .writedata
		.JTAG_avalon_jtag_slave_waitrequest    (mm_interconnect_0_jtag_avalon_jtag_slave_waitrequest), //                                .waitrequest
		.JTAG_avalon_jtag_slave_chipselect     (mm_interconnect_0_jtag_avalon_jtag_slave_chipselect),  //                                .chipselect
		.SDRAM_s1_address                      (mm_interconnect_0_sdram_s1_address),                   //                        SDRAM_s1.address
		.SDRAM_s1_write                        (mm_interconnect_0_sdram_s1_write),                     //                                .write
		.SDRAM_s1_read                         (mm_interconnect_0_sdram_s1_read),                      //                                .read
		.SDRAM_s1_readdata                     (mm_interconnect_0_sdram_s1_readdata),                  //                                .readdata
		.SDRAM_s1_writedata                    (mm_interconnect_0_sdram_s1_writedata),                 //                                .writedata
		.SDRAM_s1_byteenable                   (mm_interconnect_0_sdram_s1_byteenable),                //                                .byteenable
		.SDRAM_s1_readdatavalid                (mm_interconnect_0_sdram_s1_readdatavalid),             //                                .readdatavalid
		.SDRAM_s1_waitrequest                  (mm_interconnect_0_sdram_s1_waitrequest),               //                                .waitrequest
		.SDRAM_s1_chipselect                   (mm_interconnect_0_sdram_s1_chipselect),                //                                .chipselect
		.SYS_ID_control_slave_address          (mm_interconnect_0_sys_id_control_slave_address),       //            SYS_ID_control_slave.address
		.SYS_ID_control_slave_readdata         (mm_interconnect_0_sys_id_control_slave_readdata),      //                                .readdata
		.TIMER_s1_address                      (mm_interconnect_0_timer_s1_address),                   //                        TIMER_s1.address
		.TIMER_s1_write                        (mm_interconnect_0_timer_s1_write),                     //                                .write
		.TIMER_s1_readdata                     (mm_interconnect_0_timer_s1_readdata),                  //                                .readdata
		.TIMER_s1_writedata                    (mm_interconnect_0_timer_s1_writedata),                 //                                .writedata
		.TIMER_s1_chipselect                   (mm_interconnect_0_timer_s1_chipselect),                //                                .chipselect
		.uart_0_s1_address                     (mm_interconnect_0_uart_0_s1_address),                  //                       uart_0_s1.address
		.uart_0_s1_write                       (mm_interconnect_0_uart_0_s1_write),                    //                                .write
		.uart_0_s1_read                        (mm_interconnect_0_uart_0_s1_read),                     //                                .read
		.uart_0_s1_readdata                    (mm_interconnect_0_uart_0_s1_readdata),                 //                                .readdata
		.uart_0_s1_writedata                   (mm_interconnect_0_uart_0_s1_writedata),                //                                .writedata
		.uart_0_s1_begintransfer               (mm_interconnect_0_uart_0_s1_begintransfer),            //                                .begintransfer
		.uart_0_s1_chipselect                  (mm_interconnect_0_uart_0_s1_chipselect)                //                                .chipselect
	);

	SISTEMA_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.receiver2_irq (irq_mapper_receiver2_irq),       // receiver2.irq
		.sender_irq    (cpu_irq_irq)                     //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.reset_in1      (cpu_debug_reset_request_reset),      // reset_in1.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("none"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.reset_in1      (cpu_debug_reset_request_reset),      // reset_in1.reset
		.clk            (),                                   //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule