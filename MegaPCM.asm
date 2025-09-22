
; ===============================================================
; Mega PCM Driver Include File
; (c) 2012, Vladikcomper
; ===============================================================

; ---------------------------------------------------------------
; Variables used in DAC table
; ---------------------------------------------------------------

; flags
panLR	= $C0
panL	= $80
panR	= $40
pcm	= 0
dpcm	= 4
loop	= 2
pri	= 1

; ---------------------------------------------------------------
; Macros
; ---------------------------------------------------------------

z80word macro Value
	dc.w	((\Value)&$FF)<<8|((\Value)&$FF00)>>8
	endm

DAC_Entry macro Pitch,Offset,Flags
	dc.b	\Flags			; 00h	- Flags
	dc.b	\Pitch			; 01h	- Pitch
	dc.b	(\Offset>>15)&$FF	; 02h	- Start Bank
	dc.b	(\Offset\_End>>15)&$FF	; 03h	- End Bank
	z80word	(\Offset)|$8000		; 04h	- Start Offset (in Start bank)
	z80word	(\Offset\_End-1)|$8000	; 06h	- End Offset (in End bank)
	endm

IncludeDAC macro Name,Extension
\Name:
	if strcmp('\extension','wav')
		incbin	'dac/\Name\.\Extension\',$3A
	else
		incbin	'dac/\Name\.\Extension\'
	endc
\Name\_End:
	endm

; ---------------------------------------------------------------
; Driver's code
; ---------------------------------------------------------------

MegaPCM:
	incbin	'MegaPCM.z80'


; ---------------------------------------------------------------
; DAC Samples Table
; ---------------------------------------------------------------

        DAC_Entry	$30, beat, dpcm          ; $81	- Kick
        DAC_Entry       $16, DAC_82, dpcm 	        ; $82	- Snare
	DAC_Entry	$0A, Timpani, dpcm		; $83	- Timpani
	DAC_Entry       $06, RRZ1Tom, dpcm              ; $8E   - Rusty Ruin High Tom
	DAC_Entry       $0A, RRZ1Tom, dpcm              ; $8F   - Rusty Ruin Mid-High Tom
	DAC_Entry       $0D, RRZ1Tom, dpcm              ; $90   - Rusty Ruin Mid-Low Tom
	DAC_Entry       $12, RRZ1Tom, dpcm              ; $91   - Rusty Ruin Low Tom
	DAC_Entry	$12, Timpani, dpcm		; $88	- Hi-Timpani
	DAC_Entry	$15, Timpani, dpcm		; $89	- Mid-Timpani
	DAC_Entry	$1B, Timpani, dpcm		; $8A	- Mid-Low-Timpani
	DAC_Entry	$1D, Timpani, dpcm		; $8B	- Low-Timpani
	DAC_Entry   $03+2, D9093,   dpcm ; 8c - Electric High-Tom
        DAC_Entry   $07+2, D9093,   dpcm ; 8d - Electric Mid-Tom
        DAC_Entry   $0A+2, D9093,   dpcm ; 8e - Electric Low-Tom
        DAC_Entry   $0E+2, D9093,   dpcm ; 8f - Electric Floor Tom

MegaPCM_End:

; ---------------------------------------------------------------
; DAC Samples Files
; ---------------------------------------------------------------

	IncludeDAC	Beat,	 dpcm
	IncludeDAC	SnareSC, dpcm
	IncludeDAC	AltSnare, wav
	IncludeDAC	Timpani, bin
	IncludeDAC      Cymbal, wav
	IncludeDAC      Clap, wav
	IncludeDAC      Splash, wav
	IncludeDAC      Hihat, wav
	IncludeDAC      Kick, wav
	IncludeDAC      RRZ1Tom, bin
	IncludeDAC      S3KKick, bin
        IncludeDAC      S3KSnare, bin
        IncludeDAC      S3KRide, bin
        IncludeDAC      S3KGo, bin
        IncludeDAC      DAC_84, bin
        IncludeDAC      S1Snare, bin
        IncludeDAC      S3KCrash, bin
        IncludeDAC      S3KMuffSnare, bin
        IncludeDAC      MiracleNineKick, bin
        IncludeDAC      MiracleNineSnare, bin
	IncludeDAC      S3KTom, bin
	IncludeDAC      DAC_82, bin
        IncludeDAC    DAC_81, bin
        IncludeDAC    dac2d, bin
        IncludeDAC    dac3d, bin
        IncludeDAC    dac4d, bin
        IncludeDAC    dac5d, bin
        IncludeDAC    dac6d, bin
        IncludeDAC    dac7d, bin
     IncludeDAC  D81, bin

    IncludeDAC  D8285, bin

    IncludeDAC  D86, bin

    IncludeDAC  D87, bin

    IncludeDAC  D88, bin

    IncludeDAC  D89, bin

    IncludeDAC  D8A8B, bin

    IncludeDAC  D8C, bin

    IncludeDAC  D8D8E, bin

    IncludeDAC  D8F, bin

    IncludeDAC  D9093, bin

    IncludeDAC  D9497, bin

    IncludeDAC  D989A, bin

    IncludeDAC  D9B, bin

    IncludeDAC  D9C, bin

    IncludeDAC  D9D, bin

    IncludeDAC  D9E, bin

    IncludeDAC  D9F, bin

    IncludeDAC  DA0, bin

    IncludeDAC  DA1, bin

    IncludeDAC  DA2, bin

    IncludeDAC  DA3, bin

    IncludeDAC  DA4, bin

    IncludeDAC  DA5, bin

    IncludeDAC  DA6, bin

    IncludeDAC  DA7, bin

    IncludeDAC  DA8, bin

    IncludeDAC  DA9, bin

    IncludeDAC  DAB, bin

    IncludeDAC  DAC, bin    

    IncludeDAC  DADAE, bin

    IncludeDAC  DAFB0, bin

    IncludeDAC  DB1, bin

    IncludeDAC  DB2B3, bin  

    IncludeDAC  DB4C1C4, bin    

    IncludeDAC  DB5, bin    

    IncludeDAC  DB6, bin    

    IncludeDAC  DB7, bin    
    IncludeDAC  DB8B9, bin
    IncludeDAC  DBA, bin
    IncludeDAC  DBB, bin
    IncludeDAC  DBC, bin
    IncludeDAC  DBD, bin
    IncludeDAC  DBE, bin
    IncludeDAC  DBF, bin
    IncludeDAC  DC0, bin
    IncludeDAC  Sonic3snare, raw
    IncludeDAC  TurricanSnare, bin
    IncludeDAC  TurricanKick, bin
    IncludeDAC  TurricanCrashCymbal, bin
        even

