" Vim syntax file
" Language:	Blitz2D, Blitz3D
" Maintainer:	Stefan Schindler <stefan@boxbox.org>
" Last Change:	2007 Mar 26
"
" I've created syntax and indenting files for Blitz2D and
" Blitz3D so that you can use a serious editor along with
" those languages. ;-)

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn clear
syn case ignore

syn keyword bbStatement If Then Else ElseIf EndIf
syn keyword bbStatement For To While Do Wend Next Forever Repeat Step Until
syn keyword bbStatement Select Case Default
syn keyword bbStatement Global Local Const Dim Redim
syn keyword bbStatement Type Field New Delete Object Handle Each
syn keyword bbStatement Before After First Last Insert
syn keyword bbStatement Data Read Restore
syn keyword bbStatement Goto Gosub End Exit
syn keyword bbStatement Function Return Stop
syn keyword bbStatement Float Int Str
syn keyword bbPreProc Include
syn keyword bbFunction Abs 
syn keyword bbFunction Sgn Step
syn keyword bbFunction DebugLog
syn keyword bbFunction FreeTimer WaitTimer CreateTimer SetEnv GetEnv
syn keyword bbFunction SystemProperty CommandLine MilliSecs Delay ExecFile
syn keyword bbFunction RuntimeError AppTitle RuntimeStats
syn keyword bbFunction EntityClass EntityName NameEntity FreeEntity ShowEntity
syn keyword bbFunction HideEntity EntityOrder EntityAutoFade EntityFX EntityBlend
syn keyword bbFunction EntityTexture EntityShininess EntityAlpha EntityColor PaintEntity
syn keyword bbFunction FindChild GetChild CountChildren EntityParent Animating
syn keyword bbFunction AnimLength AnimTime AnimSeq ExtractAnimSeq AddAnimSeq
syn keyword bbFunction SetAnimKey Animate SetAnimTime AlignToVector PointEntity
syn keyword bbFunction RotateEntity ScaleEntity PositionEntity TranslateEntity TurnEntity
syn keyword bbFunction MoveEntity CollisionTriangle CollisionSurface CollisionEntity CollisionTime
syn keyword bbFunction CollisionNZ CollisionNY CollisionNX CollisionZ CollisionY
syn keyword bbFunction CollisionX CountCollisions EntityCollided EntityDistance EntityBox
syn keyword bbFunction EntityRadius GetEntityType GetParent EntityPickMode EntityType
syn keyword bbFunction ResetEntity DeltaYaw DeltaPitch VectorPitch VectorYaw
syn keyword bbFunction TFormedZ TFormedY TFormedX TFormNormal TFormVector
syn keyword bbFunction TFormPoint GetMatElement EntityRoll EntityYaw EntityPitch
syn keyword bbFunction EntityZ EntityY EntityX CopyEntity EmitSound
syn keyword bbFunction CreateListener ModifyTerrain TerrainHeight TerrainSize TerrainZ
syn keyword bbFunction TerrainY TerrainX TerrainShading TerrainDetail LoadTerrain
syn keyword bbFunction CreateTerrain CreatePlane CreateMirror BSPAmbientLight BSPLighting
syn keyword bbFunction LoadBSP MD2Animating MD2AnimLength MD2AnimTime AnimateMD2
syn keyword bbFunction LoadMD2 SpriteViewMode HandleSprite ScaleSprite RotateSprite
syn keyword bbFunction LoadSprite CreateSprite CreatePivot LightConeAngles LightRange
syn keyword bbFunction LightColor CreateLight PickedTriangle PickedSurface PickedEntity
syn keyword bbFunction PickedTime PickedNZ PickedNY PickedNX PickedZ
syn keyword bbFunction PickedY PickedX CameraPick LinePick EntityPick
syn keyword bbFunction EntityVisible EntityInView ProjectedZ ProjectedY ProjectedX
syn keyword bbFunction CameraProject CameraFogMode CameraFogRange CameraFogColor CameraViewport
syn keyword bbFunction CameraProjMode CameraClsMode CameraClsColor CameraRange CameraZoom
syn keyword bbFunction CreateCamera TriangleVertex VertexW VertexV VertexU
syn keyword bbFunction VertexAlpha VertexBlue VertexGreen VertexRed VertexNZ
syn keyword bbFunction VertexNY VertexNX VertexZ VertexY VertexX
syn keyword bbFunction CountTriangles CountVertices VertexTexCoords VertexColor VertexNormal
syn keyword bbFunction VertexCoords AddTriangle AddVertex PaintSurface ClearSurface
syn keyword bbFunction FindSurface GetEntityBrush GetSurfaceBrush CreateSurface GetSurface
syn keyword bbFunction CountSurfaces MeshesIntersect MeshDepth MeshHeight MeshWidth
syn keyword bbFunction LightMesh UpdateNormals AddMesh PaintMesh FlipMesh
syn keyword bbFunction FitMesh PositionMesh RotateMesh ScaleMesh CopyMesh
syn keyword bbFunction CreateCone CreateCylinder CreateSphere CreateCube CreateMesh
syn keyword bbFunction LoadAnimSeq LoadAnimMesh LoadMesh BrushFX BrushBlend
syn keyword bbFunction GetBrushTexture BrushTexture BrushShininess BrushAlpha BrushColor
syn keyword bbFunction FreeBrush LoadBrush CreateBrush TextureFilter ClearTextureFilters
syn keyword bbFunction TextureBuffer SetCubeMode SetCubeFace TextureName TextureHeight
syn keyword bbFunction TextureWidth PositionTexture RotateTexture ScaleTexture TextureCoords
syn keyword bbFunction TextureBlend FreeTexture LoadAnimTexture LoadTexture CreateTexture
syn keyword bbFunction Stats3D TrisRendered ActiveTextures ClearWorld RenderWorld
syn keyword bbFunction CaptureWorld UpdateWorld Collisions ClearCollisions AmbientLight
syn keyword bbFunction WireFrame AntiAlias Dither WBuffer GfxDriverCaps3D
syn keyword bbFunction HWTexUnits HWMultiTex LoaderMatrix NetMsgData NetMsgTo
syn keyword bbFunction NetMsgFrom NetMsgType RecvNetMsg SendNetMsg NetPlayerLocal
syn keyword bbFunction NetPlayerName DeleteNetPlayer CreateNetPlayer StopNetGame JoinNetGame
syn keyword bbFunction HostNetGame StartNetGame Load3DSound ChannelPlaying ChannelPan
syn keyword bbFunction ChannelVolume ChannelPitch ResumeChannel PauseChannel StopChannel
syn keyword bbFunction PlayCDTrack PlayMusic PlaySound SoundPan SoundVolume
syn keyword bbFunction SoundPitch LoopSound FreeSound LoadSound DirectInputEnabled
syn keyword bbFunction EnableDirectInput FlushJoy JoyVDir JoyUDir JoyZDir
syn keyword bbFunction JoyYDir JoyXDir JoyHat JoyRoll JoyYaw
syn keyword bbFunction JoyPitch JoyV JoyU JoyZ JoyY
syn keyword bbFunction JoyX JoyWait WaitJoy GetJoy JoyHit
syn keyword bbFunction JoyDown JoyType MoveMouse FlushMouse MouseZSpeed
syn keyword bbFunction MouseYSpeed MouseXSpeed MouseZ MouseY MouseX
syn keyword bbFunction MouseWait WaitMouse GetMouse MouseHit MouseDown
syn keyword bbFunction FlushKeys WaitKey GetKey KeyHit KeyDown
syn keyword bbFunction HidePointer ShowPointer Locate Input Print
syn keyword bbFunction Write ImageRectCollide ImageRectOverlap RectsOverlap ImagesCollide
syn keyword bbFunction ImagesOverlap TFormFilter TFormImage RotateImage ResizeImage
syn keyword bbFunction ScaleImage ImageYHandle ImageXHandle ImageHeight ImageWidth
syn keyword bbFunction AutoMidHandle MidHandle HandleImage MaskImage DrawBlockRect
syn keyword bbFunction DrawImageRect TileBlock TileImage DrawBlock DrawImage
syn keyword bbFunction ImageBuffer GrabImage SaveImage FreeImage LoadAnimImage
syn keyword bbFunction CreateImage CopyImage LoadImage CloseMovie MoviePlaying
syn keyword bbFunction MovieHeight MovieWidth DrawMovie OpenMovie StringHeight
syn keyword bbFunction StringWidth FontHeight FontWidth FreeFont LoadFont
syn keyword bbFunction CopyRect Text Line Oval Rect
syn keyword bbFunction Plot Cls SetFont ClsColor ColorBlue
syn keyword bbFunction ColorGreen ColorRed GetColor Color Viewport
syn keyword bbFunction Origin CopyPixelFast CopyPixel WritePixelFast ReadPixelFast
syn keyword bbFunction WritePixel ReadPixel UnlockBuffer LockBuffer SaveBuffer
syn keyword bbFunction LoadBuffer GraphicsBuffer SetBuffer GraphicsDepth GraphicsHeight
syn keyword bbFunction GraphicsWidth Flip VWait ScanLine BackBuffer
syn keyword bbFunction FrontBuffer GammaBlue GammaGreen GammaRed UpdateGamma
syn keyword bbFunction SetGamma EndGraphics Graphics3D Graphics Windowed3D
syn keyword bbFunction GfxMode3D GfxMode3DExists CountGfxModes3D GfxDriver3D TotalVidMem
syn keyword bbFunction AvailVidMem GfxModeDepth GfxModeHeight GfxModeWidth GfxModeExists
syn keyword bbFunction CountGfxModes SetGfxDriver GfxDriverName CountGfxDrivers CallDLL
syn keyword bbFunction WriteBytes ReadBytes PokeFloat PokeInt PokeShort
syn keyword bbFunction PokeByte PeekFloat PeekInt PeekShort PeekByte
syn keyword bbFunction CopyBank ResizeBank BankSize FreeBank CreateBank
syn keyword bbFunction DeleteFile CopyFile FileType FileSize DeleteDir
syn keyword bbFunction CreateDir ChangeDir CurrentDir NextFile CloseDir
syn keyword bbFunction ReadDir SeekFile FilePos CloseFile WriteFile
syn keyword bbFunction ReadFile OpenFile TCPTimeouts TCPStreamPort TCPStreamIP
syn keyword bbFunction AcceptTCPStream CloseTCPServer CreateTCPServer CloseTCPStream OpenTCPStream
syn keyword bbFunction UDPTimeouts UDPMsgPort UDPMsgIP UDPStreamPort UDPStreamIP
syn keyword bbFunction RecvUDPMsg SendUDPMsg CloseUDPStream CreateUDPStream HostIP
syn keyword bbFunction CountHostIPs DottedIP CopyStream WriteLine WriteString
syn keyword bbFunction WriteFloat WriteInt WriteShort WriteByte ReadLine
syn keyword bbFunction ReadString ReadFloat ReadInt ReadShort ReadByte
syn keyword bbFunction ReadAvail Eof CurrentTime CurrentDate Bin
syn keyword bbFunction Hex Len Asc Chr RSet
syn keyword bbFunction LSet Trim Lower Upper Mid
syn keyword bbFunction Instr Replace Right Left String
syn keyword bbFunction RndSeed SeedRnd Rand Rnd Log10
syn keyword bbFunction Log Exp Ceil Floor Sqr
syn keyword bbFunction ATan2 ATan ACos ASin Tan
syn keyword bbConst True False Null
syn keyword bbConst Pi

syn match bbOperator "[()+\-*/=&^]"
syn match bbOperator "[<>]=\="
syn match bbOperator "<>"
syn keyword bbOperator Not And Xor Mod Or Sar Shr Shl

" Floating point numbers with leading point character.
syn match bbNumber "\.\d\+\>"
" Floating point numbers.
syn match bbNumber "\<\d\+\.\d\+\>"
" Integers.
syn match bbNumber "\<\d\+\>"

syn region bbString start=/"/ end=/"/ skip=/""/

syn keyword bbTodo ToDo Author URL Mail E\-Mail EMail ICQ JID Jabber MSN YAHOO
syn match bbComment /;.*/ contains=bbTodo

syn match bbLabel "^\s*\.[a-zA-Z_][a-zA-Z0-9_]*"
syn match bbIdentifier "\<[a-zA-Z_][a-zA-Z0-9_]*[$%#]"
syn match bbIdentifier "\<[a-zA-Z_][a-zA-Z0-9_]*\.[a-zA-Z_][a-zA-Z0-9_]*"
syn match bbIdentifier "\<[a-zA-Z_][a-zA-Z0-9_]*\\[a-zA-Z_][a-zA-Z0-9_]*[$%#]"


if version >= 508 || !exists("did_bb_syntax_inits")
	if version < 508
		let did_bb_syntax_inits = 1
		command -nargs=+ HiLink hi def link <args>
	else
		command -nargs=+ HiLink hi link <args>
	endif

	HiLink bbFunction Function
	HiLink bbStatement Statement
	HiLink bbNumber Number
	HiLink bbComment Comment
	HiLink bbString String
	HiLink bbIdentifier Identifier
	HiLink bbLabel Label
	HiLink bbConst Constant
	HiLink bbOperator Operator
	HiLink bbPreProc PreProc
	HiLink bbTodo Todo

	delcommand HiLink
endif

let b:current_syntax = "bb"

" vim: ts=2
