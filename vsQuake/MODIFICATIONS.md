# Modifications

This file outlines some of the modifications that have been made to the original source code, in order to make it build with the build tooling at the time.

## Change `errno` to `lasterr`

In `net_wins.c` nad `net_winpx.c` occurrences of `errno` had to be renamed to get rid of the following build errors:

```log
net_wins.c(405): error C2072: '_errno': initialization of a function
net_wipx.c(246): error C2072: '_errno': initialization of a function
net_wipx.c(360): error C2072: '_errno': initialization of a function
```

Perhaps `errno` was not yet introduced at the time Quake was originally was written, but today, this is a generally reserved global macro. (See https://learn.microsoft.com/en-us/cpp/c-runtime-library/errno-doserrno-sys-errlist-and-sys-nerr?view=msvc-170)

Here, I followed the example of the [Quake-VS2015](https://github.com/philipbuuck/Quake-VS2015/tree/master), and simply renamed the variables.

I opted for the name `lasterr`.

## Always set `id386` to `0`

Lines 64 to 68 in `quakedef.h` contain the following pre-processor directive:
```c
#if defined __i386__ // && !defined __sun__
#define id386	1
#else
#define id386	0
#endif
```

Line 65 has be change, such that it now looks as follows:
```c
#if defined __i386__ // && !defined __sun__
#define id386	0
#else
#define id386	0
#endif
```

This helped resolve the following linking errors:
```log
r_sprite.obj : error LNK2019: unresolved external symbol _TransformVector referenced in function _R_DrawSprite
d_edge.obj : error LNK2001: unresolved external symbol _TransformVector
d_sprite.obj : error LNK2001: unresolved external symbol _TransformVector
r_draw.obj : error LNK2001: unresolved external symbol _TransformVector
r_misc.obj : error LNK2001: unresolved external symbol _TransformVector
d_edge.obj : error LNK2019: unresolved external symbol _D_DrawZSpans referenced in function _D_DrawSurfaces
d_init.obj : error LNK2019: unresolved external symbol _D_DrawSpans8 referenced in function _D_SetupFrame
d_init.obj : error LNK2019: unresolved external symbol _D_DrawSpans16 referenced in function _D_SetupFrame
d_modech.obj : error LNK2019: unresolved external symbol _D_PolysetAff8Start referenced in function _D_Patch
d_modech.obj : error LNK2019: unresolved external symbol _D_PolysetAff8End referenced in function _D_Patch
d_polyse.obj : error LNK2019: unresolved external symbol _D_PolysetDrawSpans8 referenced in function _D_RasterizeAliasPolySmooth
d_polyse.obj : error LNK2019: unresolved external symbol _D_PolysetCalcGradients referenced in function _D_RasterizeAliasPolySmooth
d_polyse.obj : error LNK2019: unresolved external symbol _D_PolysetScanLeftEdge referenced in function _D_RasterizeAliasPolySmooth
d_scan.obj : error LNK2019: unresolved external symbol _D_DrawTurbulent8Span referenced in function _Turbulent8
d_sprite.obj : error LNK2019: unresolved external symbol _D_SpriteDrawSpans referenced in function _D_DrawSprite
r_aclip.obj : error LNK2019: unresolved external symbol _D_PolysetDraw referenced in function _R_AliasClipTriangle
r_alias.obj : error LNK2001: unresolved external symbol _D_PolysetDraw
r_aclip.obj : error LNK2019: unresolved external symbol _R_Alias_clip_top referenced in function _R_AliasClipTriangle
r_aclip.obj : error LNK2019: unresolved external symbol _R_Alias_clip_bottom referenced in function _R_AliasClipTriangle
r_aclip.obj : error LNK2019: unresolved external symbol _R_Alias_clip_left referenced in function _R_AliasClipTriangle
r_aclip.obj : error LNK2019: unresolved external symbol _R_Alias_clip_right referenced in function _R_AliasClipTriangle
r_alias.obj : error LNK2019: unresolved external symbol _D_Aff8Patch referenced in function _R_AliasDrawModel
r_alias.obj : error LNK2019: unresolved external symbol _D_PolysetDrawFinalVerts referenced in function _R_AliasPrepareUnclippedPoints
r_alias.obj : error LNK2019: unresolved external symbol _R_AliasTransformAndProjectFinalVerts referenced in function _R_AliasPrepareUnclippedPoints
r_draw.obj : error LNK2019: unresolved external symbol _R_ClipEdge referenced in function _R_RenderFace
r_edge.obj : error LNK2019: unresolved external symbol _R_InsertNewEdges referenced in function _R_ScanEdges
r_edge.obj : error LNK2019: unresolved external symbol _R_StepActiveU referenced in function _R_ScanEdges
r_edge.obj : error LNK2019: unresolved external symbol _R_RemoveEdges referenced in function _R_ScanEdges
r_edge.obj : error LNK2019: unresolved external symbol _R_GenerateSpans referenced in function _R_BeginEdgeFrame
r_edge.obj : error LNK2001: unresolved external symbol _r_bmodelactive
r_efrag.obj : error LNK2019: unresolved external symbol _BoxOnPlaneSide referenced in function _R_SplitEntityOnNode2
world.obj : error LNK2001: unresolved external symbol _BoxOnPlaneSide
r_main.obj : error LNK2019: unresolved external symbol _R_Surf8Patch referenced in function _R_ViewChanged
r_main.obj : error LNK2019: unresolved external symbol _R_Surf16Patch referenced in function _R_ViewChanged
r_main.obj : error LNK2019: unresolved external symbol _R_Surf8Start referenced in function _R_ViewChanged
r_main.obj : error LNK2019: unresolved external symbol _R_Surf8End referenced in function _R_ViewChanged
r_main.obj : error LNK2019: unresolved external symbol _R_Surf16Start referenced in function _R_ViewChanged
r_main.obj : error LNK2019: unresolved external symbol _R_Surf16End referenced in function _R_ViewChanged
r_main.obj : error LNK2019: unresolved external symbol _R_EdgeCodeStart referenced in function _R_Init
r_main.obj : error LNK2019: unresolved external symbol _R_EdgeCodeEnd referenced in function _R_Init
r_main.obj : error LNK2019: unresolved external symbol _R_SurfacePatch referenced in function _R_NewMap
r_part.obj : error LNK2019: unresolved external symbol _D_DrawParticle referenced in function _R_DrawParticles
r_surf.obj : error LNK2001: unresolved external symbol _R_DrawSurfaceBlock8_mip0
r_surf.obj : error LNK2001: unresolved external symbol _R_DrawSurfaceBlock8_mip1
r_surf.obj : error LNK2001: unresolved external symbol _R_DrawSurfaceBlock8_mip2
r_surf.obj : error LNK2001: unresolved external symbol _R_DrawSurfaceBlock8_mip3
r_surf.obj : error LNK2019: unresolved external symbol _R_DrawSurfaceBlock16 referenced in function _R_DrawSurface
snd_mix.obj : error LNK2019: unresolved external symbol _Snd_WriteLinearBlastStereo16 referenced in function _S_TransferStereo16
snd_mix.obj : error LNK2019: unresolved external symbol _SND_PaintChannelFrom8 referenced in function _S_PaintChannels
world.obj : error LNK2019: unresolved external symbol _SV_HullPointContents referenced in function _SV_PointContents
```

It is still a bit unclear to me what the this line does exactly, and why this is needed. When having the file open in VS Code, the line is grayed out, which seems to hint that `__i386__` is not defined, however, it seems that this does not align with how things are actually defined during compilation.

I have a suspicion this has something to do with the assembly code they're referring to in some places.

Perhaps I'll revisit this at some point...

## Comment out `Sys_LowFPPrecision` and `Sys_HighFPPrecision` in `r_main.c`

This helps resolve the following linker errors:
```log
r_main.obj : error LNK2019: unresolved external symbol _Sys_LowFPPrecision referenced in function _R_RenderView_
r_main.obj : error LNK2019: unresolved external symbol _Sys_HighFPPrecision referenced in function _R_RenderView_
```

I don't know if there's a better solution to this.

Honestly, I just looked at what [Quake-VS2015](https://github.com/philipbuuck/Quake-VS2015/tree/master) did and copied their approach.

Perhaps I'll revisit this at some point...

## Remove `ifndef` guard in `sys_win.c`

`sys_win.c` had the following block of code:
```c
#ifndef _M_IX86

void Sys_SetFPCW (void)
{
}

void Sys_PushFPCW_SetHigh (void)
{
}

void Sys_PopFPCW (void)
{
}

void MaskExceptions (void)
{
}

#endif
```

The `#ifndef _M_IX86 ... #endif` guard has been removed to resolve the following linker errors:
```log
sys_win.obj : error LNK2019: unresolved external symbol _Sys_SetFPCW referenced in function _Sys_Init
sys_win.obj : error LNK2019: unresolved external symbol _MaskExceptions referenced in function _Sys_Init
sys_win.obj : error LNK2019: unresolved external symbol _Sys_PushFPCW_SetHigh referenced in function _Sys_FloatTime
sys_win.obj : error LNK2019: unresolved external symbol _Sys_PopFPCW referenced in function _Sys_FloatTime
```

It's not totally clear to me why this was necessary. Honestly, I just looked at what [Quake-VS2015](https://github.com/philipbuuck/Quake-VS2015/tree/master) did and copied their approach.

Perhaps I'll revisit this at some point...
