-- VHDL Entity tb_lib.tb_alien.symbol
--
-- Created:
--          by - kayra.UNKNOWN (QUANG-PHAN)
--          at - 11:00:44 05/31/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_alien IS
-- Declarations

END tb_alien ;

--
-- VHDL Architecture tb_lib.tb_alien.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 21:56:46 06/ 4/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.numeric_std.all;

LIBRARY alien_game_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_alien IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL alien_defeated : std_logic;
   SIGNAL alien_hp       : std_logic_vector(3 DOWNTO 0);
   SIGNAL alien_x        : std_logic_vector(7 DOWNTO 0);
   SIGNAL alien_y        : std_logic_vector(7 DOWNTO 0);
   SIGNAL clk            : std_logic;
   SIGNAL color          : std_logic_vector(23 DOWNTO 0);
   SIGNAL color_end      : std_logic_vector(23 DOWNTO 0);
   SIGNAL en             : std_logic;
   SIGNAL hit            : std_logic;
   SIGNAL rst_n          : std_logic;
   SIGNAL sw0            : std_logic;
   SIGNAL x_end          : std_logic_vector(7 DOWNTO 0);
   SIGNAL y_end          : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT c4_t3_improved_alien
   PORT (
      clk            : IN     std_logic ;
      enable         : IN     std_logic ;
      hit            : IN     std_logic ;
      rst_n          : IN     std_logic ;
      alien_color    : OUT    std_logic_vector (23 DOWNTO 0);
      alien_defeated : OUT    std_logic ;
      hit_once       : OUT    std_logic ;
      x_coord        : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord        : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT alien_tester
   PORT (
      alien_defeated : IN     std_logic;
      alien_hp       : IN     std_logic_vector (3 DOWNTO 0);
      color          : IN     std_logic_vector (23 DOWNTO 0);
      color_end      : IN     std_logic_vector (23 DOWNTO 0);
      x              : IN     std_logic_vector (7  DOWNTO 0);
      x_end          : IN     std_logic_vector (7 DOWNTO 0);
      y              : IN     std_logic_vector (7  DOWNTO 0);
      y_end          : IN     std_logic_vector (7 DOWNTO 0);
      clk            : OUT    std_logic;
      en             : OUT    std_logic;
      hit            : OUT    std_logic;
      rst_n          : OUT    std_logic;
      sw0            : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : alien_tester USE ENTITY tb_lib.alien_tester;
   FOR ALL : c4_t3_improved_alien USE ENTITY alien_game_lib.c4_t3_improved_alien;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'alien_hp' of 'constval'
   alien_hp <= "0010";

   -- ModuleWare code(v1.12) for instance 'color_end' of 'constval'
   color_end <= "000000000000000011001111";

   -- ModuleWare code(v1.12) for instance 'x_end' of 'constval'
   x_end <= "00000000";

   -- ModuleWare code(v1.12) for instance 'y_end' of 'constval'
   y_end <= "00000001";

   -- Instance port mappings.
   U_0 : c4_t3_improved_alien
      PORT MAP (
         clk            => clk,
         enable         => en,
         hit            => hit,
         rst_n          => rst_n,
         alien_color    => color,
         alien_defeated => alien_defeated,
         hit_once       => OPEN,
         x_coord        => alien_x,
         y_coord        => alien_y
      );
   U_1 : alien_tester
      PORT MAP (
         color          => color,
         y              => alien_y,
         x              => alien_x,
         clk            => clk,
         rst_n          => rst_n,
         sw0            => sw0,
         en             => en,
         hit            => hit,
         alien_hp       => alien_hp,
         x_end          => x_end,
         y_end          => y_end,
         color_end      => color_end,
         alien_defeated => alien_defeated
      );

END struct;
