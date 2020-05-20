-- VHDL Entity alien_game_lib.c3_t2_write_sequencer.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 16:32:33 05/18/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t2_write_sequencer IS
   PORT( 
      clk           : IN     std_logic;
      rst_n         : IN     std_logic;
      write_ready   : IN     std_logic;
      enable        : OUT    std_logic;
      frame_done    : OUT    std_logic;
      gun_px_idx    : OUT    std_logic_vector (1 DOWNTO 0);
      module_select : OUT    std_logic_vector (1 DOWNTO 0);
      write         : OUT    std_logic
   );

-- Declarations

END c3_t2_write_sequencer ;

--
-- VHDL Architecture alien_game_lib.c3_t2_write_sequencer.fsm
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 16:32:34 05/18/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c3_t2_write_sequencer IS

   -- Architecture Declarations
   SIGNAL counter : integer RANGE 2 DOWNTO 0;  
   SIGNAL delay : std_logic;  

   TYPE STATE_TYPE IS (
      init,
      write_alien,
      write_px_00,
      write_px_01,
      write_px_10,
      write_px_11,
      frame_finished,
      en,
      s0
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;
   -- pragma synthesis_off
   SIGNAL hds_next,hds_current,hds_clock: INTEGER;
   -- pragma synthesis_on

   -- Declare Wait State internal signals
   SIGNAL csm_timer : std_logic_vector(1 DOWNTO 0);
   SIGNAL csm_next_timer : std_logic_vector(1 DOWNTO 0);
   SIGNAL csm_timeout : std_logic;
   SIGNAL csm_to_s0 : std_logic;

   -- Declare any pre-registered internal signals
   SIGNAL enable_int : std_logic ;
   SIGNAL frame_done_int : std_logic ;
   SIGNAL gun_px_idx_int : std_logic_vector (1 DOWNTO 0);
   SIGNAL module_select_int : std_logic_vector (1 DOWNTO 0);
   SIGNAL write_int : std_logic ;

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
         -- Default Reset Values
         gun_px_idx <= "00";
         module_select <= "00";
         -- pragma synthesis_off
         hds_current <= 0;
         -- pragma synthesis_on
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
         csm_timer <= csm_next_timer;
         -- pragma synthesis_off
         hds_current <= hds_next;
         hds_clock <= -1;
         hds_clock <= 0;
         -- pragma synthesis_on
         -- Registered output assignments
         enable <= enable_int;
         frame_done <= frame_done_int;
         gun_px_idx <= gun_px_idx_int;
         module_select <= module_select_int;
         write <= write_int;
         -- Default Assignment To Internals
         counter <= 0;

         -- Combined Actions
         CASE current_state IS
            WHEN write_alien => 
               IF (counter < 1) THEN 
                  counter <= counter + 1;
               ELSIF (write_ready = '1') THEN 
                  counter <= 0;
               END IF;
            WHEN OTHERS =>
               NULL;
         END CASE;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      counter,
      current_state,
      write_ready
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default assignments to Wait State entry flags
      csm_to_s0 <= '0';
      CASE current_state IS
         WHEN init => 
            IF (write_ready = '1') THEN 
               next_state <= write_alien;
               -- pragma synthesis_off
               hds_next <= 1;
               -- pragma synthesis_on
            ELSE
               next_state <= init;
               -- pragma synthesis_off
               hds_next <= 0;
               -- pragma synthesis_on
            END IF;
         WHEN write_alien => 
            IF (counter < 1) THEN 
               next_state <= write_alien;
               -- pragma synthesis_off
               hds_next <= 2;
               -- pragma synthesis_on
            ELSIF (write_ready = '1') THEN 
               next_state <= write_px_00;
               -- pragma synthesis_off
               hds_next <= 3;
               -- pragma synthesis_on
            ELSE
               next_state <= write_alien;
               -- pragma synthesis_off
               hds_next <= 0;
               -- pragma synthesis_on
            END IF;
         WHEN write_px_00 => 
            IF (write_ready = '1') THEN 
               next_state <= write_px_01;
               -- pragma synthesis_off
               hds_next <= 4;
               -- pragma synthesis_on
            ELSIF (write_ready = '0') THEN 
               next_state <= write_px_00;
               -- pragma synthesis_off
               hds_next <= 5;
               -- pragma synthesis_on
            ELSE
               next_state <= write_px_00;
               -- pragma synthesis_off
               hds_next <= 0;
               -- pragma synthesis_on
            END IF;
         WHEN write_px_01 => 
            IF (write_ready = '1') THEN 
               next_state <= write_px_10;
               -- pragma synthesis_off
               hds_next <= 6;
               -- pragma synthesis_on
            ELSIF (write_ready = '0') THEN 
               next_state <= write_px_01;
               -- pragma synthesis_off
               hds_next <= 7;
               -- pragma synthesis_on
            ELSE
               next_state <= write_px_01;
               -- pragma synthesis_off
               hds_next <= 0;
               -- pragma synthesis_on
            END IF;
         WHEN write_px_10 => 
            IF (write_ready = '1') THEN 
               next_state <= write_px_11;
               -- pragma synthesis_off
               hds_next <= 8;
               -- pragma synthesis_on
            ELSIF (write_ready = '0') THEN 
               next_state <= write_px_10;
               -- pragma synthesis_off
               hds_next <= 9;
               -- pragma synthesis_on
            ELSE
               next_state <= write_px_10;
               -- pragma synthesis_off
               hds_next <= 0;
               -- pragma synthesis_on
            END IF;
         WHEN write_px_11 => 
            IF (write_ready = '1') THEN 
               next_state <= frame_finished;
               -- pragma synthesis_off
               hds_next <= 10;
               -- pragma synthesis_on
            ELSIF (write_ready = '0') THEN 
               next_state <= write_px_11;
               -- pragma synthesis_off
               hds_next <= 11;
               -- pragma synthesis_on
            ELSE
               next_state <= write_px_11;
               -- pragma synthesis_off
               hds_next <= 0;
               -- pragma synthesis_on
            END IF;
         WHEN frame_finished => 
            IF (write_ready = '1') THEN 
               next_state <= en;
               -- pragma synthesis_off
               hds_next <= 12;
               -- pragma synthesis_on
            ELSIF (write_ready = '0') THEN 
               next_state <= frame_finished;
               -- pragma synthesis_off
               hds_next <= 13;
               -- pragma synthesis_on
            ELSE
               next_state <= frame_finished;
               -- pragma synthesis_off
               hds_next <= 0;
               -- pragma synthesis_on
            END IF;
         WHEN en => 
            next_state <= init;
            -- pragma synthesis_off
            hds_next <= 14;
            -- pragma synthesis_on
         WHEN s0 => 
            next_state <= s0;
            -- pragma synthesis_off
            hds_next <= 0;
            -- pragma synthesis_on
         WHEN OTHERS =>
            next_state <= init;
            -- pragma synthesis_off
            hds_next <= 0;
            -- pragma synthesis_on
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      counter,
      current_state,
      write_ready
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      enable_int <= '0';
      frame_done_int <= '0';
      gun_px_idx_int <= "UU";
      module_select_int <= "UU";
      write_int <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN init => 
            IF (write_ready = '1') THEN 
               module_select_int <= "00";
               write_int <= '1';
            END IF;
         WHEN write_alien => 
            IF (counter < 1) THEN 
               write_int <= '0';
            ELSIF (write_ready = '1') THEN 
               gun_px_idx_int <= "00";
               write_int <= '1';
            END IF;
         WHEN write_px_00 => 
            IF (write_ready = '1') THEN 
               gun_px_idx_int <= "01";
               write_int <= '1';
            END IF;
         WHEN write_px_01 => 
            IF (write_ready = '1') THEN 
               gun_px_idx_int <= "10";
               write_int <= '1';
            END IF;
         WHEN write_px_10 => 
            IF (write_ready = '1') THEN 
               gun_px_idx_int <= "11";
               write_int <= '1';
            END IF;
         WHEN write_px_11 => 
            IF (write_ready = '1') THEN 
               module_select_int <= "00";
               frame_done_int <= '1';
            END IF;
         WHEN frame_finished => 
            IF (write_ready = '1') THEN 
               enable_int <= '1';
               frame_done_int <= '0';
            END IF;
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
   -----------------------------------------------------------------
   csm_wait_combo_proc: PROCESS (
      csm_timer,
      csm_to_s0
   )
   -----------------------------------------------------------------
   VARIABLE csm_temp_timeout : std_logic;
   BEGIN
      IF (unsigned(csm_timer) = 0) THEN
         csm_temp_timeout := '1';
      ELSE
         csm_temp_timeout := '0';
      END IF;

      IF (csm_to_s0 = '1') THEN
         csm_next_timer <= "01"; -- no cycles(2)-1=1
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