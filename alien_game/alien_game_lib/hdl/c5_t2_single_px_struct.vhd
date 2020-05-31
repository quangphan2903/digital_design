-- VHDL Entity alien_game_lib.c5_t2_single_px.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 18:01:53 05/30/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t2_single_px IS
   PORT( 
      clk      : IN     std_logic;
      nullify  : IN     std_logic;
      pixd_in  : IN     std_logic_vector (23 DOWNTO 0);
      rst_n    : IN     std_logic;
      write    : IN     std_logic;
      pixd_out : OUT    std_logic_vector (23 DOWNTO 0)
   );

-- Declarations

END c5_t2_single_px ;

--
-- VHDL Architecture alien_game_lib.c5_t2_single_px.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 18:01:53 05/30/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c5_t2_single_px IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dout  : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout1 : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout2 : std_logic_vector(23 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL pixd_out_internal : std_logic_vector (23 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_0' of 'adff'
   SIGNAL mw_U_0reg_cval : std_logic_vector(23 DOWNTO 0);


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'adff'
   pixd_out_internal <= mw_U_0reg_cval;
   u_0seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_0reg_cval <= "000000000000000000000000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_0reg_cval <= dout2;
      END IF;
   END PROCESS u_0seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'constval'
   dout1 <= "000000000000000000000000";

   -- ModuleWare code(v1.12) for instance 'U_1' of 'mux'
   u_1combo_proc: PROCESS(pixd_out_internal, pixd_in, write)
   BEGIN
      CASE write IS
      WHEN '0' => dout <= pixd_out_internal;
      WHEN '1' => dout <= pixd_in;
      WHEN OTHERS => dout <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_1combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_2' of 'mux'
   u_2combo_proc: PROCESS(dout, dout1, nullify)
   BEGIN
      CASE nullify IS
      WHEN '0' => dout2 <= dout;
      WHEN '1' => dout2 <= dout1;
      WHEN OTHERS => dout2 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_2combo_proc;

   -- Instance port mappings.

   -- Implicit buffered output assignments
   pixd_out <= pixd_out_internal;

END struct;