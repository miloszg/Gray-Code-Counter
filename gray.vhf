--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.03
--  \   \         Application : sch2vhdl
--  /   /         Filename : gray.vhf
-- /___/   /\     Timestamp : 03/02/2018 11:21:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family spartan3 -flat -suppress -w C:/Designs/MG_MP/iup_1/nowy_gray/gray.sch gray.vhf
--Design Name: gray
--Device: spartan3
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity gray is
   port ( clk_i  : in    std_logic; 
          rst_i  : in    std_logic; 
          led_o0 : out   std_logic; 
          led_o1 : out   std_logic);
end gray;

architecture BEHAVIORAL of gray is
   attribute IOSTANDARD : string ;
   attribute SLEW       : string ;
   attribute DRIVE      : string ;
   attribute BOX_TYPE   : string ;
   attribute INIT       : string ;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_14 : std_logic;
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component FDC
      -- synopsys translate_off
      generic( INIT : bit :=  '0');
      -- synopsys translate_on
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute INIT of FDC : component is "0";
   attribute BOX_TYPE of FDC : component is "BLACK_BOX";
   
begin
   XLXI_1 : OBUF
      port map (I=>XLXN_4,
                O=>led_o1);
   
   XLXI_9 : OBUF
      port map (I=>XLXN_7,
                O=>led_o0);
   
   XLXI_12 : INV
      port map (I=>XLXN_7,
                O=>XLXN_5);
   
   XLXI_13 : IBUF
      port map (I=>clk_i,
                O=>XLXN_8);
   
   XLXI_19 : FDC
      port map (C=>XLXN_8,
                CLR=>XLXN_14,
                D=>XLXN_5,
                Q=>XLXN_4);
   
   XLXI_20 : FDC
      port map (C=>XLXN_8,
                CLR=>XLXN_14,
                D=>XLXN_4,
                Q=>XLXN_7);
   
   XLXI_21 : IBUF
      port map (I=>rst_i,
                O=>XLXN_14);
   
end BEHAVIORAL;


