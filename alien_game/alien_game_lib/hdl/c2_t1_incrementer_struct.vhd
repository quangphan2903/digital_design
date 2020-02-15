-- VHDL Entity alien_game_lib.c2_t1_incrementer.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 15:47:25 02/15/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t1_incrementer IS
   PORT( 
      input_to_your_design : IN     std_logic_vector (2 DOWNTO 0);
      result               : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END c2_t1_incrementer ;

--
-- VHDL Architecture alien_game_lib.c2_t1_incrementer.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 15:47:25 02/15/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c2_t1_incrementer IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL carry  : std_logic;
   SIGNAL carry1 : std_logic;
   SIGNAL dout   : std_logic;
   SIGNAL dout0  : std_logic;
   SIGNAL dout1  : std_logic;
   SIGNAL dout2  : std_logic;
   SIGNAL r0     : std_logic;
   SIGNAL r1     : std_logic;
   SIGNAL r2     : std_logic;


   -- ModuleWare signal declarations(v1.12) for instance 'U_3' of 'split'
   SIGNAL mw_U_3temp_din : std_logic_vector(2 DOWNTO 0);

   -- Component Declarations
   COMPONENT c1_t1_half_adder
   PORT (
      sw0   : IN     std_logic ;
      sw1   : IN     std_logic ;
      carry : OUT    std_logic ;
      sum   : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c1_t1_half_adder USE ENTITY alien_game_lib.c1_t1_half_adder;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_5' of 'constval'
   dout <= '1';

   -- ModuleWare code(v1.12) for instance 'U_4' of 'merge'
   result <= r2 & r1 & r0;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'split'
   mw_U_3temp_din <= input_to_your_design;
   u_3combo_proc: PROCESS (mw_U_3temp_din)
   VARIABLE temp_din: std_logic_vector(2 DOWNTO 0);
   BEGIN
      temp_din := mw_U_3temp_din(2 DOWNTO 0);
      dout0 <= temp_din(0);
      dout1 <= temp_din(1);
      dout2 <= temp_din(2);
   END PROCESS u_3combo_proc;

   -- Instance port mappings.
   U_0 : c1_t1_half_adder
      PORT MAP (
         sw0   => dout,
         sw1   => dout0,
         carry => carry,
         sum   => r0
      );
   U_1 : c1_t1_half_adder
      PORT MAP (
         sw0   => carry,
         sw1   => dout1,
         carry => carry1,
         sum   => r1
      );
   U_2 : c1_t1_half_adder
      PORT MAP (
         sw0   => carry1,
         sw1   => dout2,
         carry => OPEN,
         sum   => r2
      );

END struct;
