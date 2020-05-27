-- VHDL Entity alien_game_lib.c3_t4_bullet.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 21:54:06 05/26/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t4_bullet IS
   PORT( 
      btn            : IN     std_logic;
      clk            : IN     std_logic;
      en             : IN     std_logic;
      gun_x_coord    : IN     std_logic_vector (7 DOWNTO 0);
      rst_n          : IN     std_logic;
      bullet_color   : OUT    std_logic_vector (23 DOWNTO 0);
      bullet_x_coord : OUT    std_logic_vector (7 DOWNTO 0);
      bullet_y_coord : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c3_t4_bullet ;

--
-- VHDL Architecture alien_game_lib.c3_t4_bullet.fsm
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 14:31:30 05/27/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c3_t4_bullet IS

   -- Architecture Declarations
   SIGNAL x_coord : std_logic_vector(7 DOWNTO 0);  

   TYPE STATE_TYPE IS (
      init,
      y3,
      y4,
      y5,
      y6,
      y7,
      y8,
      get_x
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

   -- Declare any pre-registered internal signals
   SIGNAL bullet_color_int : std_logic_vector (23 DOWNTO 0);
   SIGNAL bullet_x_coord_int : std_logic_vector (7 DOWNTO 0);
   SIGNAL bullet_y_coord_int : std_logic_vector (7 DOWNTO 0);

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
      ELSIF (clk'EVENT AND clk = '1') THEN
         IF (en = '0') THEN
            current_state <= next_state;
            -- Registered output assignments
            bullet_color <= bullet_color_int;
            bullet_x_coord <= bullet_x_coord_int;
            bullet_y_coord <= bullet_y_coord_int;

            -- Combined Actions
            CASE current_state IS
               WHEN init => 
                  x_coord <= "00000000";
               WHEN y4 => 
                  x_coord <= x_coord;
               WHEN y5 => 
                  x_coord <= x_coord;
               WHEN y6 => 
                  x_coord <= x_coord;
               WHEN y7 => 
                  x_coord <= x_coord;
               WHEN y8 => 
                  x_coord <= x_coord;
               WHEN get_x => 
                  x_coord <= gun_x_coord;
               WHEN OTHERS =>
                  NULL;
            END CASE;
         END IF;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      btn,
      current_state,
      en
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN init => 
            IF (btn = '0') THEN 
               next_state <= init;
            ELSIF (en = '1' AND btn = '1') THEN 
               next_state <= get_x;
            ELSE
               next_state <= init;
            END IF;
         WHEN y3 => 
            IF (en = '1') THEN 
               next_state <= y4;
            ELSIF (en = '0') THEN 
               next_state <= y3;
            ELSE
               next_state <= y3;
            END IF;
         WHEN y4 => 
            IF (en = '1') THEN 
               next_state <= y5;
            ELSIF (en = '0') THEN 
               next_state <= y4;
            ELSE
               next_state <= y4;
            END IF;
         WHEN y5 => 
            IF (en = '1') THEN 
               next_state <= y6;
            ELSIF (en = '0') THEN 
               next_state <= y5;
            ELSE
               next_state <= y5;
            END IF;
         WHEN y6 => 
            IF (en = '1') THEN 
               next_state <= y7;
            ELSIF (en = '0') THEN 
               next_state <= y6;
            ELSE
               next_state <= y6;
            END IF;
         WHEN y7 => 
            IF (en = '1') THEN 
               next_state <= y8;
            ELSIF (en = '0') THEN 
               next_state <= y7;
            ELSE
               next_state <= y7;
            END IF;
         WHEN y8 => 
            IF (en = '1') THEN 
               next_state <= init;
            ELSIF (en = '0') THEN 
               next_state <= y8;
            ELSE
               next_state <= y8;
            END IF;
         WHEN get_x => 
            next_state <= y3;
         WHEN OTHERS =>
            next_state <= init;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state,
      x_coord
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      bullet_color_int <= (others => '0');
      bullet_x_coord_int <= (others => '0');
      bullet_y_coord_int <= (others => '0');

      -- Combined Actions
      CASE current_state IS
         WHEN init => 
            bullet_x_coord_int <= "00000000";
            bullet_y_coord_int <= "00000010";
            bullet_color_int <= "000000000000000011001100";
         WHEN y3 => 
            bullet_x_coord_int <= x_coord;
            bullet_y_coord_int <= "00000100";
            bullet_color_int <= "000000000000000011001100";
         WHEN y4 => 
            bullet_x_coord_int <= x_coord;
            bullet_y_coord_int <= "00001000";
            bullet_color_int <= "000000000000000011001100";
         WHEN y5 => 
            bullet_x_coord_int <= x_coord;
            bullet_y_coord_int <= "00010000";
            bullet_color_int <= "000000000000000011001100";
         WHEN y6 => 
            bullet_x_coord_int <= x_coord;
            bullet_y_coord_int <= "00100000";
            bullet_color_int <= "000000000000000011001100";
         WHEN y7 => 
            bullet_x_coord_int <= x_coord;
            bullet_y_coord_int <= "01000000";
            bullet_color_int <= "000000000000000011001100";
         WHEN y8 => 
            bullet_x_coord_int <= x_coord;
            bullet_y_coord_int <= "10000000";
            bullet_color_int <= "000000000000000011001100";
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
