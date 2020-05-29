-- VHDL Entity tb_lib.tx_tester_struct.symbol
--
-- Created:
--          by - kayra.UNKNOWN (QUANG-PHAN)
--          at - 11:27:13 10/07/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tx_tester_struct IS
   PORT( 
      ready    : IN     std_logic;
      s_clk    : IN     std_logic;
      s_sda    : IN     std_logic;
      bit_in   : OUT    std_logic;
      clk      : OUT    std_logic;
      rst_n    : OUT    std_logic;
      transmit : OUT    std_logic
   );

-- Declarations

END tx_tester_struct ;

--
-- VHDL Architecture tb_lib.tx_tester_struct.struct
--
-- Created:
--          by - kayra.UNKNOWN (QUANG-PHAN)
--          at - 11:27:13 10/07/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY tb_lib;

ARCHITECTURE struct OF tx_tester_struct IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL correct : std_logic;
   SIGNAL done    : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL clk_internal   : std_logic;
   SIGNAL rst_n_internal : std_logic;


   -- Component Declarations
   COMPONENT tx_test_block
   PORT (
      correct : IN     std_logic;
      done    : IN     std_logic;
      clk     : OUT    std_logic;
      rst_n   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT tx_test_sequencer
   PORT (
      clk    : IN     std_logic ;
      rdy    : IN     std_logic ;
      rst_n  : IN     std_logic ;
      bit_in : OUT    std_logic ;
      run    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT tx_tester_capture_seq
   PORT (
      clk     : IN     std_logic ;
      rst_n   : IN     std_logic ;
      sck     : IN     std_logic ;
      sda     : IN     std_logic ;
      correct : OUT    std_logic ;
      done    : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : tx_test_block USE ENTITY tb_lib.tx_test_block;
   FOR ALL : tx_test_sequencer USE ENTITY tb_lib.tx_test_sequencer;
   FOR ALL : tx_tester_capture_seq USE ENTITY tb_lib.tx_tester_capture_seq;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : tx_test_block
      PORT MAP (
         clk     => clk_internal,
         rst_n   => rst_n_internal,
         done    => done,
         correct => correct
      );
   U_1 : tx_test_sequencer
      PORT MAP (
         clk    => clk_internal,
         rdy    => ready,
         rst_n  => rst_n_internal,
         bit_in => bit_in,
         run    => transmit
      );
   U_2 : tx_tester_capture_seq
      PORT MAP (
         clk     => clk_internal,
         rst_n   => rst_n_internal,
         sck     => s_clk,
         sda     => s_sda,
         correct => correct,
         done    => done
      );

   -- Implicit buffered output assignments
   clk   <= clk_internal;
   rst_n <= rst_n_internal;

END struct;
