-- VHDL Entity alien_game_lib.c2_t2_full_adder.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 16:00:59 02/15/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t2_full_adder IS
   PORT( 
      a    : IN     std_logic;
      b    : IN     std_logic;
      cin  : IN     std_logic;
      cout : OUT    std_logic;
      sum  : OUT    std_logic
   );

-- Declarations

END c2_t2_full_adder ;

--
-- VHDL Architecture alien_game_lib.c2_t2_full_adder.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 16:00:58 02/15/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c2_t2_full_adder IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL carry  : std_logic;
   SIGNAL carry1 : std_logic;
   SIGNAL sum1   : std_logic;


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

   -- ModuleWare code(v1.12) for instance 'U_2' of 'or'
   cout <= carry OR carry1;

   -- Instance port mappings.
   U_0 : c1_t1_half_adder
      PORT MAP (
         sw0   => a,
         sw1   => b,
         carry => carry1,
         sum   => sum1
      );
   U_1 : c1_t1_half_adder
      PORT MAP (
         sw0   => sum1,
         sw1   => cin,
         carry => carry,
         sum   => sum
      );

END struct;
