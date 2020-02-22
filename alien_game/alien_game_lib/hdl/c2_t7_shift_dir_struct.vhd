-- VHDL Entity alien_game_lib.c2_t7_shift_dir.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 23:51:45 02/22/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t7_shift_dir IS
   PORT( 
      clk     : IN     std_logic;
      enable  : IN     std_logic;
      rst_n   : IN     std_logic;
      x_coord : IN     std_logic_vector (7 DOWNTO 0);
      dir     : OUT    std_logic_vector (1 DOWNTO 0)
   );

-- Declarations

END c2_t7_shift_dir ;

--
-- VHDL Architecture alien_game_lib.c2_t7_shift_dir.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 23:51:45 02/22/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c2_t7_shift_dir IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dout  : std_logic_vector(1 DOWNTO 0);
   SIGNAL dout1 : std_logic;
   SIGNAL dout2 : std_logic_vector(1 DOWNTO 0);
   SIGNAL q     : std_logic_vector(1 DOWNTO 0);
   SIGNAL qb    : std_logic_vector(1 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL dir_internal : std_logic_vector (1 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_2' of 'adff'
   SIGNAL mw_U_2reg_cval : std_logic_vector(1 DOWNTO 0);


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_2' of 'adff'
   q <= mw_U_2reg_cval;
   qb <= NOT(mw_U_2reg_cval);
   u_2seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_2reg_cval <= "10";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_2reg_cval <= dir_internal;
      END IF;
   END PROCESS u_2seq_proc;

   -- ModuleWare code(v1.12) for instance 'const_00' of 'constval'
   dout <= "00";

   -- ModuleWare code(v1.12) for instance 'U_0' of 'mux'
   u_0combo_proc: PROCESS(dout, dout2, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => dir_internal <= dout;
      WHEN '1' => dir_internal <= dout2;
      WHEN OTHERS => dir_internal <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_0combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'mux'
   u_3combo_proc: PROCESS(q, qb, dout1)
   BEGIN
      CASE dout1 IS
      WHEN '0' => dout2 <= q;
      WHEN '1' => dout2 <= qb;
      WHEN OTHERS => dout2 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_3combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_1' of 'or'
   dout1 <= x_coord(0) OR x_coord(7);

   -- Instance port mappings.

   -- Implicit buffered output assignments
   dir <= dir_internal;

END struct;
