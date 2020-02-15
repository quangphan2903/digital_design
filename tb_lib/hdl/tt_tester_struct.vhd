-- VHDL Entity tb_lib.tt_tester.symbol
--
-- Created:
--          by - kayra.UNKNOWN (QUANG-PHAN)
--          at - 13:56:00 09/12/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tt_tester IS
   PORT( 
      res     : IN     std_logic_vector (7 DOWNTO 0);
      correct : OUT    std_logic;
      to_duv  : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END tt_tester ;

--
-- VHDL Architecture tb_lib.tt_tester.struct
--
-- Created:
--          by - kayra.UNKNOWN (QUANG-PHAN)
--          at - 13:56:00 09/12/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY tb_lib;

ARCHITECTURE struct OF tt_tester IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ref_res : std_logic_vector(7 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL to_duv_internal : std_logic_vector (2 DOWNTO 0);


   -- Component Declarations
   COMPONENT ref_tt
   PORT (
      to_duv  : IN     std_logic_vector (2 DOWNTO 0);
      ref_res : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT tt_tester_gen
   PORT (
      ref_res : IN     std_logic_vector (7 DOWNTO 0);
      res     : IN     std_logic_vector (7 DOWNTO 0);
      correct : OUT    std_logic;
      to_duv  : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ref_tt USE ENTITY tb_lib.ref_tt;
   FOR ALL : tt_tester_gen USE ENTITY tb_lib.tt_tester_gen;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : ref_tt
      PORT MAP (
         to_duv  => to_duv_internal,
         ref_res => ref_res
      );
   U_0 : tt_tester_gen
      PORT MAP (
         res     => res,
         to_duv  => to_duv_internal,
         correct => correct,
         ref_res => ref_res
      );

   -- Implicit buffered output assignments
   to_duv <= to_duv_internal;

END struct;
