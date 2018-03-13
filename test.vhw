--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.03
--  \   \         Application : ISE
--  /   /         Filename : test.vhw
-- /___/   /\     Timestamp : Fri Mar 02 11:22:07 2018
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test
--Device: Xilinx
--

library UNISIM;
use UNISIM.Vcomponents.ALL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY test IS
END test;

ARCHITECTURE testbench_arch OF test IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT gray
        PORT (
            clk_i : In std_logic;
            rst_i : In std_logic;
            led_o0 : Out std_logic;
            led_o1 : Out std_logic
        );
    END COMPONENT;

    SIGNAL clk_i : std_logic := '0';
    SIGNAL rst_i : std_logic := '0';
    SIGNAL led_o0 : std_logic := '0';
    SIGNAL led_o1 : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : gray
        PORT MAP (
            clk_i => clk_i,
            rst_i => rst_i,
            led_o0 => led_o0,
            led_o1 => led_o1
        );

        PROCESS    -- clock process for clk_i
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk_i <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk_i <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  585ns
                WAIT FOR 585 ns;
                rst_i <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  785ns
                WAIT FOR 200 ns;
                rst_i <= '0';
                -- -------------------------------------
                WAIT FOR 415 ns;

            END PROCESS;

    END testbench_arch;

