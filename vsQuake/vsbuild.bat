@echo off
setlocal
cd /D "%~dp0"

call .\vsclean.bat

mkdir bin

call cl ^
    sys_win.c ^
    cd_win.c ^
    chase.c ^
    cl_demo.c cl_input.c cl_main.c cl_parse.c cl_tent.c ^
    cmd.c ^
    common.c ^
    conproc.c ^
    console.c ^
    crc.c ^
    cvar.c ^
    d_edge.c d_fill.c d_init.c d_modech.c d_part.c d_polyse.c d_scan.c d_sky.c d_sprite.c d_surf.c d_vars.c d_zpoint.c ^
    draw.c ^
    host_cmd.c ^
    host.c ^
    in_win.c ^
    keys.c ^
    mathlib.c ^
    menu.c ^
    model.c ^
    net_dgrm.c net_loop.c net_main.c net_vcr.c net_win.c net_wins.c net_wipx.c ^
    nonintel.c ^
    pr_cmds.c pr_edict.c pr_exec.c ^
    r_aclip.c r_alias.c r_bsp.c r_draw.c r_edge.c r_efrag.c r_light.c r_main.c r_misc.c r_part.c r_sky.c r_sprite.c r_surf.c r_vars.c ^
    sbar.c ^
    screen.c ^
    snd_dma.c snd_mem.c snd_mix.c snd_win.c ^
    sv_main.c sv_move.c sv_phys.c sv_user.c ^
    vid_win.c ^
    view.c ^
    wad.c ^
    world.c ^
    zone.c ^
    /Z7 /Od ^
    /Fe".\\bin\\" ^
    /Fo".\\bin\\" ^
    /I ".\scitech\INCLUDE" ^
    /MT ^
    /link ^
        User32.lib ^
        Winmm.lib ^
        DXGUID.LIB ^
        wsock32.lib ^
        Gdi32.lib ^
        Advapi32.lib ^
        ".\scitech\LIB\WIN32\VC\MGLLT.LIB" ^
    /NODEFAULTLIB:LIBC.lib

move .\bin\sys_win.exe .\bin\quake.exe

xcopy /s /i "C:\Program Files (x86)\Steam\steamapps\common\Quake\id1" ".\bin\id1"
