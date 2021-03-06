VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL led_o1
        SIGNAL led_o0
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL clk_i
        SIGNAL XLXN_14
        SIGNAL rst_i
        PORT Output led_o1
        PORT Output led_o0
        PORT Input clk_i
        PORT Input rst_i
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF ibuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF fdc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            RECTANGLE N 64 -320 320 -64 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
            LINE N 192 -64 192 -32 
            LINE N 192 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 obuf
            PIN I XLXN_4
            PIN O led_o1
        END BLOCK
        BEGIN BLOCK XLXI_9 obuf
            PIN I XLXN_7
            PIN O led_o0
        END BLOCK
        BEGIN BLOCK XLXI_12 inv
            PIN I XLXN_7
            PIN O XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_13 ibuf
            PIN I clk_i
            PIN O XLXN_8
        END BLOCK
        BEGIN BLOCK XLXI_19 fdc
            PIN C XLXN_8
            PIN CLR XLXN_14
            PIN D XLXN_5
            PIN Q XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_20 fdc
            PIN C XLXN_8
            PIN CLR XLXN_14
            PIN D XLXN_4
            PIN Q XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_21 ibuf
            PIN I rst_i
            PIN O XLXN_14
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 2400 912 R0
        BEGIN BRANCH led_o1
            WIRE 2624 880 2640 880
        END BRANCH
        INSTANCE XLXI_9 2400 1312 R0
        BEGIN BRANCH led_o0
            WIRE 2624 1280 2640 1280
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1840 1120 2320 1120
            WIRE 1840 1120 1840 1280
            WIRE 1840 1280 1856 1280
            WIRE 2240 880 2320 880
            WIRE 2320 880 2400 880
            WIRE 2320 880 2320 1120
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1824 880 1856 880
        END BRANCH
        INSTANCE XLXI_12 1600 912 R0
        BEGIN BRANCH XLXN_7
            WIRE 1584 880 1600 880
            WIRE 1584 880 1584 1520
            WIRE 1584 1520 2320 1520
            WIRE 2240 1280 2320 1280
            WIRE 2320 1280 2400 1280
            WIRE 2320 1280 2320 1520
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 1200 880 1280 880
            WIRE 1280 880 1280 1008
            WIRE 1280 1008 1280 1408
            WIRE 1280 1408 1856 1408
            WIRE 1280 1008 1856 1008
        END BRANCH
        INSTANCE XLXI_13 976 912 R0
        BEGIN BRANCH clk_i
            WIRE 912 880 976 880
        END BRANCH
        INSTANCE XLXI_19 1856 1136 R0
        INSTANCE XLXI_20 1856 1536 R0
        BEGIN BRANCH XLXN_14
            WIRE 1200 1504 1376 1504
            WIRE 1376 1504 1856 1504
            WIRE 1376 1104 1856 1104
            WIRE 1376 1104 1376 1504
        END BRANCH
        INSTANCE XLXI_21 976 1536 R0
        BEGIN BRANCH rst_i
            WIRE 944 1504 976 1504
        END BRANCH
        IOMARKER 912 880 clk_i R180 28
        IOMARKER 2640 880 led_o1 R0 28
        IOMARKER 2640 1280 led_o0 R0 28
        IOMARKER 944 1504 rst_i R180 28
    END SHEET
END SCHEMATIC
