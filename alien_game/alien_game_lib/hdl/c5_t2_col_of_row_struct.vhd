-- VHDL Entity alien_game_lib.c5_t2_col_of_row.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 18:01:59 05/30/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t2_col_of_row IS
   PORT( 
      clk      : IN     std_logic;
      pixd_in  : IN     std_logic_vector (23 DOWNTO 0);
      rst_n    : IN     std_logic;
      write    : IN     std_logic;
      xr       : IN     std_logic_vector (7 DOWNTO 0);
      xw       : IN     std_logic_vector (7 DOWNTO 0);
      yr       : IN     std_logic_vector (7 DOWNTO 0);
      yw       : IN     std_logic_vector (7 DOWNTO 0);
      pixd_out : OUT    std_logic_vector (23 DOWNTO 0)
   );

-- Declarations

END c5_t2_col_of_row ;

--
-- VHDL Architecture alien_game_lib.c5_t2_col_of_row.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 18:01:59 05/30/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c5_t2_col_of_row IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din0      : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout      : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout10    : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout11    : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout12    : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout13    : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout14    : std_logic;
   SIGNAL dout2     : std_logic;
   SIGNAL dout3     : std_logic;
   SIGNAL dout4     : std_logic;
   SIGNAL dout5     : std_logic;
   SIGNAL dout6     : std_logic;
   SIGNAL dout7     : std_logic;
   SIGNAL dout8     : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout9     : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out0 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out1 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out2 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out3 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out4 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out5 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out6 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out7 : std_logic_vector(23 DOWNTO 0);
   SIGNAL sel0      : std_logic;


   -- Component Declarations
   COMPONENT c5_t2_row_px
   PORT (
      clk      : IN     std_logic ;
      pixd_in  : IN     std_logic_vector (23 DOWNTO 0);
      rst_n    : IN     std_logic ;
      this_row : IN     std_logic ;
      write    : IN     std_logic ;
      xr       : IN     std_logic_vector (7 DOWNTO 0);
      xw       : IN     std_logic_vector (7 DOWNTO 0);
      pixd_out : OUT    std_logic_vector (23 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c5_t2_row_px USE ENTITY alien_game_lib.c5_t2_row_px;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_21' of 'and'
   sel0 <= yr(0) AND NOT(write);

   -- ModuleWare code(v1.12) for instance 'U_22' of 'and'
   dout2 <= yr(1) AND NOT(write);

   -- ModuleWare code(v1.12) for instance 'U_23' of 'and'
   dout3 <= yr(2) AND NOT(write);

   -- ModuleWare code(v1.12) for instance 'U_24' of 'and'
   dout4 <= yr(3) AND NOT(write);

   -- ModuleWare code(v1.12) for instance 'U_25' of 'and'
   dout5 <= yr(4) AND NOT(write);

   -- ModuleWare code(v1.12) for instance 'U_26' of 'and'
   dout6 <= yr(5) AND NOT(write);

   -- ModuleWare code(v1.12) for instance 'U_27' of 'and'
   dout7 <= yr(6) AND NOT(write);

   -- ModuleWare code(v1.12) for instance 'U_28' of 'and'
   dout14 <= yr(7) AND NOT(write);

   -- ModuleWare code(v1.12) for instance 'zeros' of 'constval'
   din0 <= "000000000000000000000000";

   -- ModuleWare code(v1.12) for instance 'U_10' of 'mux'
   u_10combo_proc: PROCESS(din0, pixd_out0, sel0)
   BEGIN
      CASE sel0 IS
      WHEN '0' => dout <= din0;
      WHEN '1' => dout <= pixd_out0;
      WHEN OTHERS => dout <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_10combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_11' of 'mux'
   u_11combo_proc: PROCESS(dout, pixd_out1, dout2)
   BEGIN
      CASE dout2 IS
      WHEN '0' => dout8 <= dout;
      WHEN '1' => dout8 <= pixd_out1;
      WHEN OTHERS => dout8 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_11combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_12' of 'mux'
   u_12combo_proc: PROCESS(dout8, pixd_out2, dout3)
   BEGIN
      CASE dout3 IS
      WHEN '0' => dout9 <= dout8;
      WHEN '1' => dout9 <= pixd_out2;
      WHEN OTHERS => dout9 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_12combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_13' of 'mux'
   u_13combo_proc: PROCESS(dout9, pixd_out3, dout4)
   BEGIN
      CASE dout4 IS
      WHEN '0' => dout10 <= dout9;
      WHEN '1' => dout10 <= pixd_out3;
      WHEN OTHERS => dout10 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_13combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_14' of 'mux'
   u_14combo_proc: PROCESS(dout10, pixd_out4, dout5)
   BEGIN
      CASE dout5 IS
      WHEN '0' => dout11 <= dout10;
      WHEN '1' => dout11 <= pixd_out4;
      WHEN OTHERS => dout11 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_14combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_15' of 'mux'
   u_15combo_proc: PROCESS(dout11, pixd_out5, dout6)
   BEGIN
      CASE dout6 IS
      WHEN '0' => dout12 <= dout11;
      WHEN '1' => dout12 <= pixd_out5;
      WHEN OTHERS => dout12 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_15combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_16' of 'mux'
   u_16combo_proc: PROCESS(dout12, pixd_out6, dout7)
   BEGIN
      CASE dout7 IS
      WHEN '0' => dout13 <= dout12;
      WHEN '1' => dout13 <= pixd_out6;
      WHEN OTHERS => dout13 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_16combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_17' of 'mux'
   u_17combo_proc: PROCESS(dout13, pixd_out7, dout14)
   BEGIN
      CASE dout14 IS
      WHEN '0' => pixd_out <= dout13;
      WHEN '1' => pixd_out <= pixd_out7;
      WHEN OTHERS => pixd_out <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_17combo_proc;

   -- Instance port mappings.
   U_0 : c5_t2_row_px
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         this_row => yw(0),
         write    => write,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out0
      );
   U_1 : c5_t2_row_px
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         this_row => yw(1),
         write    => write,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out1
      );
   U_2 : c5_t2_row_px
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         this_row => yw(2),
         write    => write,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out2
      );
   U_3 : c5_t2_row_px
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         this_row => yw(3),
         write    => write,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out3
      );
   U_4 : c5_t2_row_px
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         this_row => yw(4),
         write    => write,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out4
      );
   U_5 : c5_t2_row_px
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         this_row => yw(5),
         write    => write,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out5
      );
   U_6 : c5_t2_row_px
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         this_row => yw(6),
         write    => write,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out6
      );
   U_7 : c5_t2_row_px
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         this_row => yw(7),
         write    => write,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out7
      );

END struct;
