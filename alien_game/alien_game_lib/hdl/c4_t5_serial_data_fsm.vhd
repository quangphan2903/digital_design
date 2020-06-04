-- VHDL Entity alien_game_lib.c4_t5_serial_data.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 22:11:44 05/28/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c4_t5_serial_data IS
   PORT( 
      bit_in   : IN     std_logic;
      clk      : IN     std_logic;
      rst_n    : IN     std_logic;
      transmit : IN     std_logic;
      ready    : OUT    std_logic;
      s_clk    : OUT    std_logic;
      s_sda    : OUT    std_logic
   );

-- Declarations

END c4_t5_serial_data ;

--
-- VHDL Architecture alien_game_lib.c4_t5_serial_data.fsm
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 15:38:08 05/29/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c4_t5_serial_data IS

   -- Architecture Declarations
   SIGNAL counter : integer RANGE 2 DOWNTO 0;  

   TYPE STATE_TYPE IS (
      init,
      ready_low,
      s_clk_low,
      s_clk_high
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

   -- Declare Wait State internal signals
   SIGNAL csm_timer : std_logic_vector(2 DOWNTO 0);
   SIGNAL csm_next_timer : std_logic_vector(2 DOWNTO 0);
   SIGNAL csm_timeout : std_logic;
   SIGNAL csm_to_s_clk_low : std_logic;
   SIGNAL csm_to_s_clk_high : std_logic;

   -- Declare any pre-registered internal signals
   SIGNAL ready_int : std_logic ;
   SIGNAL s_clk_int : std_logic ;
   SIGNAL s_sda_int : std_logic ;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      rst_n
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst_n = '0') THEN
         current_state <= init;
         csm_timer <= (OTHERS => '0');
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
         csm_timer <= csm_next_timer;
         -- Registered output assignments
         ready <= ready_int;
         s_clk <= s_clk_int;
         s_sda <= s_sda_int;
         -- Default Assignment To Internals
         counter <= 0;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      csm_timeout,
      current_state,
      transmit
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default assignments to Wait State entry flags
      csm_to_s_clk_low <= '0';
      csm_to_s_clk_high <= '0';
      CASE current_state IS
         WHEN init => 
            IF (transmit = '0') THEN 
               next_state <= init;
            ELSIF (transmit = '1') THEN 
               next_state <= ready_low;
            ELSE
               next_state <= init;
            END IF;
         WHEN ready_low => 
            next_state <= s_clk_low;
            csm_to_s_clk_low <= '1';
         WHEN s_clk_low => 
            IF (csm_timeout = '1') THEN 
               next_state <= s_clk_high;
               csm_to_s_clk_high <= '1';
            ELSE
               next_state <= s_clk_low;
            END IF;
         WHEN s_clk_high => 
            IF (csm_timeout = '1') THEN 
               next_state <= init;
            ELSE
               next_state <= s_clk_high;
            END IF;
         WHEN OTHERS =>
            next_state <= init;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      bit_in,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      ready_int <= '1';
      s_clk_int <= '1';
      s_sda_int <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN ready_low => 
            ready_int <= '0';
         WHEN s_clk_low => 
            s_sda_int <= bit_in;
            s_clk_int <= '0';
            ready_int <= '1';
         WHEN s_clk_high => 
            s_sda_int <= bit_in;
            s_clk_int <= '1';
            ready_int <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
   -----------------------------------------------------------------
   csm_wait_combo_proc: PROCESS (
      csm_timer,
      csm_to_s_clk_low,
      csm_to_s_clk_high
   )
   -----------------------------------------------------------------
   VARIABLE csm_temp_timeout : std_logic;
   BEGIN
      IF (unsigned(csm_timer) = 0) THEN
         csm_temp_timeout := '1';
      ELSE
         csm_temp_timeout := '0';
      END IF;

      IF (csm_to_s_clk_low = '1') THEN
         csm_next_timer <= "011"; -- no cycles(4)-1=3
      ELSIF (csm_to_s_clk_high = '1') THEN
         csm_next_timer <= "001"; -- no cycles(2)-1=1
      ELSE
         IF (csm_temp_timeout = '1') THEN
            csm_next_timer <= (OTHERS=>'0');
         ELSE
            csm_next_timer <= unsigned(csm_timer) - '1';
         END IF;
      END IF;
      csm_timeout <= csm_temp_timeout;
   END PROCESS csm_wait_combo_proc;

END fsm;
