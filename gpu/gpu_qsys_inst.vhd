	component gpu_qsys is
		port (
			clk_clk                                 : in    std_logic                     := 'X';             -- clk
			gpu_main_external_interface_address     : in    std_logic_vector(29 downto 0) := (others => 'X'); -- address
			gpu_main_external_interface_byte_enable : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- byte_enable
			gpu_main_external_interface_read        : in    std_logic                     := 'X';             -- read
			gpu_main_external_interface_write       : in    std_logic                     := 'X';             -- write
			gpu_main_external_interface_write_data  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- write_data
			gpu_main_external_interface_acknowledge : out   std_logic;                                        -- acknowledge
			gpu_main_external_interface_read_data   : out   std_logic_vector(31 downto 0);                    -- read_data
			instr_fifo_out_valid                    : out   std_logic;                                        -- valid
			instr_fifo_out_data                     : out   std_logic_vector(31 downto 0);                    -- data
			instr_fifo_out_ready                    : in    std_logic                     := 'X';             -- ready
			memory_mem_a                            : out   std_logic_vector(12 downto 0);                    -- mem_a
			memory_mem_ba                           : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck                           : out   std_logic;                                        -- mem_ck
			memory_mem_ck_n                         : out   std_logic;                                        -- mem_ck_n
			memory_mem_cke                          : out   std_logic;                                        -- mem_cke
			memory_mem_cs_n                         : out   std_logic;                                        -- mem_cs_n
			memory_mem_ras_n                        : out   std_logic;                                        -- mem_ras_n
			memory_mem_cas_n                        : out   std_logic;                                        -- mem_cas_n
			memory_mem_we_n                         : out   std_logic;                                        -- mem_we_n
			memory_mem_reset_n                      : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq                           : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dq
			memory_mem_dqs                          : inout std_logic                     := 'X';             -- mem_dqs
			memory_mem_dqs_n                        : inout std_logic                     := 'X';             -- mem_dqs_n
			memory_mem_odt                          : out   std_logic;                                        -- mem_odt
			memory_mem_dm                           : out   std_logic;                                        -- mem_dm
			memory_oct_rzqin                        : in    std_logic                     := 'X';             -- oct_rzqin
			prim_assembly_fifo_in_valid             : in    std_logic                     := 'X';             -- valid
			prim_assembly_fifo_in_data              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- data
			prim_assembly_fifo_in_ready             : out   std_logic;                                        -- ready
			prim_assembly_fifo_out_valid            : out   std_logic;                                        -- valid
			prim_assembly_fifo_out_data             : out   std_logic_vector(31 downto 0);                    -- data
			prim_assembly_fifo_out_ready            : in    std_logic                     := 'X';             -- ready
			raster_fifo_in_valid                    : in    std_logic                     := 'X';             -- valid
			raster_fifo_in_data                     : in    std_logic_vector(31 downto 0) := (others => 'X'); -- data
			raster_fifo_in_ready                    : out   std_logic;                                        -- ready
			raster_fifo_out_valid                   : out   std_logic;                                        -- valid
			raster_fifo_out_data                    : out   std_logic_vector(31 downto 0);                    -- data
			raster_fifo_out_ready                   : in    std_logic                     := 'X';             -- ready
			reset_reset                             : in    std_logic                     := 'X';             -- reset
			vert_processing_fifo_in_valid           : in    std_logic                     := 'X';             -- valid
			vert_processing_fifo_in_data            : in    std_logic_vector(31 downto 0) := (others => 'X'); -- data
			vert_processing_fifo_in_ready           : out   std_logic;                                        -- ready
			vert_processing_fifo_out_valid          : out   std_logic;                                        -- valid
			vert_processing_fifo_out_data           : out   std_logic_vector(31 downto 0);                    -- data
			vert_processing_fifo_out_ready          : in    std_logic                     := 'X';             -- ready
			vga_controller_external_interface_CLK   : out   std_logic;                                        -- CLK
			vga_controller_external_interface_HS    : out   std_logic;                                        -- HS
			vga_controller_external_interface_VS    : out   std_logic;                                        -- VS
			vga_controller_external_interface_BLANK : out   std_logic;                                        -- BLANK
			vga_controller_external_interface_SYNC  : out   std_logic;                                        -- SYNC
			vga_controller_external_interface_R     : out   std_logic_vector(7 downto 0);                     -- R
			vga_controller_external_interface_G     : out   std_logic_vector(7 downto 0);                     -- G
			vga_controller_external_interface_B     : out   std_logic_vector(7 downto 0);                     -- B
			video_pll_ref_clk_clk                   : in    std_logic                     := 'X'              -- clk
		);
	end component gpu_qsys;

	u0 : component gpu_qsys
		port map (
			clk_clk                                 => CONNECTED_TO_clk_clk,                                 --                               clk.clk
			gpu_main_external_interface_address     => CONNECTED_TO_gpu_main_external_interface_address,     --       gpu_main_external_interface.address
			gpu_main_external_interface_byte_enable => CONNECTED_TO_gpu_main_external_interface_byte_enable, --                                  .byte_enable
			gpu_main_external_interface_read        => CONNECTED_TO_gpu_main_external_interface_read,        --                                  .read
			gpu_main_external_interface_write       => CONNECTED_TO_gpu_main_external_interface_write,       --                                  .write
			gpu_main_external_interface_write_data  => CONNECTED_TO_gpu_main_external_interface_write_data,  --                                  .write_data
			gpu_main_external_interface_acknowledge => CONNECTED_TO_gpu_main_external_interface_acknowledge, --                                  .acknowledge
			gpu_main_external_interface_read_data   => CONNECTED_TO_gpu_main_external_interface_read_data,   --                                  .read_data
			instr_fifo_out_valid                    => CONNECTED_TO_instr_fifo_out_valid,                    --                    instr_fifo_out.valid
			instr_fifo_out_data                     => CONNECTED_TO_instr_fifo_out_data,                     --                                  .data
			instr_fifo_out_ready                    => CONNECTED_TO_instr_fifo_out_ready,                    --                                  .ready
			memory_mem_a                            => CONNECTED_TO_memory_mem_a,                            --                            memory.mem_a
			memory_mem_ba                           => CONNECTED_TO_memory_mem_ba,                           --                                  .mem_ba
			memory_mem_ck                           => CONNECTED_TO_memory_mem_ck,                           --                                  .mem_ck
			memory_mem_ck_n                         => CONNECTED_TO_memory_mem_ck_n,                         --                                  .mem_ck_n
			memory_mem_cke                          => CONNECTED_TO_memory_mem_cke,                          --                                  .mem_cke
			memory_mem_cs_n                         => CONNECTED_TO_memory_mem_cs_n,                         --                                  .mem_cs_n
			memory_mem_ras_n                        => CONNECTED_TO_memory_mem_ras_n,                        --                                  .mem_ras_n
			memory_mem_cas_n                        => CONNECTED_TO_memory_mem_cas_n,                        --                                  .mem_cas_n
			memory_mem_we_n                         => CONNECTED_TO_memory_mem_we_n,                         --                                  .mem_we_n
			memory_mem_reset_n                      => CONNECTED_TO_memory_mem_reset_n,                      --                                  .mem_reset_n
			memory_mem_dq                           => CONNECTED_TO_memory_mem_dq,                           --                                  .mem_dq
			memory_mem_dqs                          => CONNECTED_TO_memory_mem_dqs,                          --                                  .mem_dqs
			memory_mem_dqs_n                        => CONNECTED_TO_memory_mem_dqs_n,                        --                                  .mem_dqs_n
			memory_mem_odt                          => CONNECTED_TO_memory_mem_odt,                          --                                  .mem_odt
			memory_mem_dm                           => CONNECTED_TO_memory_mem_dm,                           --                                  .mem_dm
			memory_oct_rzqin                        => CONNECTED_TO_memory_oct_rzqin,                        --                                  .oct_rzqin
			prim_assembly_fifo_in_valid             => CONNECTED_TO_prim_assembly_fifo_in_valid,             --             prim_assembly_fifo_in.valid
			prim_assembly_fifo_in_data              => CONNECTED_TO_prim_assembly_fifo_in_data,              --                                  .data
			prim_assembly_fifo_in_ready             => CONNECTED_TO_prim_assembly_fifo_in_ready,             --                                  .ready
			prim_assembly_fifo_out_valid            => CONNECTED_TO_prim_assembly_fifo_out_valid,            --            prim_assembly_fifo_out.valid
			prim_assembly_fifo_out_data             => CONNECTED_TO_prim_assembly_fifo_out_data,             --                                  .data
			prim_assembly_fifo_out_ready            => CONNECTED_TO_prim_assembly_fifo_out_ready,            --                                  .ready
			raster_fifo_in_valid                    => CONNECTED_TO_raster_fifo_in_valid,                    --                    raster_fifo_in.valid
			raster_fifo_in_data                     => CONNECTED_TO_raster_fifo_in_data,                     --                                  .data
			raster_fifo_in_ready                    => CONNECTED_TO_raster_fifo_in_ready,                    --                                  .ready
			raster_fifo_out_valid                   => CONNECTED_TO_raster_fifo_out_valid,                   --                   raster_fifo_out.valid
			raster_fifo_out_data                    => CONNECTED_TO_raster_fifo_out_data,                    --                                  .data
			raster_fifo_out_ready                   => CONNECTED_TO_raster_fifo_out_ready,                   --                                  .ready
			reset_reset                             => CONNECTED_TO_reset_reset,                             --                             reset.reset
			vert_processing_fifo_in_valid           => CONNECTED_TO_vert_processing_fifo_in_valid,           --           vert_processing_fifo_in.valid
			vert_processing_fifo_in_data            => CONNECTED_TO_vert_processing_fifo_in_data,            --                                  .data
			vert_processing_fifo_in_ready           => CONNECTED_TO_vert_processing_fifo_in_ready,           --                                  .ready
			vert_processing_fifo_out_valid          => CONNECTED_TO_vert_processing_fifo_out_valid,          --          vert_processing_fifo_out.valid
			vert_processing_fifo_out_data           => CONNECTED_TO_vert_processing_fifo_out_data,           --                                  .data
			vert_processing_fifo_out_ready          => CONNECTED_TO_vert_processing_fifo_out_ready,          --                                  .ready
			vga_controller_external_interface_CLK   => CONNECTED_TO_vga_controller_external_interface_CLK,   -- vga_controller_external_interface.CLK
			vga_controller_external_interface_HS    => CONNECTED_TO_vga_controller_external_interface_HS,    --                                  .HS
			vga_controller_external_interface_VS    => CONNECTED_TO_vga_controller_external_interface_VS,    --                                  .VS
			vga_controller_external_interface_BLANK => CONNECTED_TO_vga_controller_external_interface_BLANK, --                                  .BLANK
			vga_controller_external_interface_SYNC  => CONNECTED_TO_vga_controller_external_interface_SYNC,  --                                  .SYNC
			vga_controller_external_interface_R     => CONNECTED_TO_vga_controller_external_interface_R,     --                                  .R
			vga_controller_external_interface_G     => CONNECTED_TO_vga_controller_external_interface_G,     --                                  .G
			vga_controller_external_interface_B     => CONNECTED_TO_vga_controller_external_interface_B,     --                                  .B
			video_pll_ref_clk_clk                   => CONNECTED_TO_video_pll_ref_clk_clk                    --                 video_pll_ref_clk.clk
		);

