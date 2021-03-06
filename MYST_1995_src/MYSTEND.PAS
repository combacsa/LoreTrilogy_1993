Unit MystEnd;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, AdLib, UHanX, MystSub;
Const
   Back_Ground_Color = DarkGray;
   Fade_Top_Color = Cyan;
   Fade_Bottom_Color = Green;
   Main_Scroll_Color = LightCyan;
   Str_X_Pos = 71;
   Str_Y_Pos = 370;
   Max_Line = 8;
   Word_Y_Size = 16;
   Title_Str_Total = 29;
   Title_Str : array[1..Title_Str_Total] of string =
        (' ������ ���a�e�� �E �w���A�A.',
         '',
         ' �b�� �w���e �a�� �����i ��១�� �g�v��. �a �i���A���e �a�� ��',
         '��A���� �b�a�A ��Ё  �w�Ÿa�ⷥ ���w�����������e  ������a�a�e',
         '����A���� �����i �a�� �����e ���i ���e �����  �w���i ��Ȃ�a�A',
         '�A���� �w���i ���� ����A �i�a �i�A Ж�� ������.  ���A ���a�e',
         '�a�a�v��  ���a�e�� ÷ѡ�� �w���A�A ���a�v��.  �a���e �w���A�A�e',
         '�a�� 2�a���� ���A�a �� �q�a����.  �����e �A�a���e��a �E �a��΁',
         '�a�a ���w�A ���a���� ��ỡ�A �A��  �����e �i�w�w�e �A������ ��',
         'ѥ�� �����i �� �i���a�A �I��a.  �� ���i�e �� 100�e ҁ�A �i���i',
         '������. �a���e �w�����a�e ��ӡ ���a�� �� ���i��a ����.',
         '',
         ' �a�e  ���A �� �A���i ��i ���a �A����.  �a���� ���a �a���a���i',
         '�a���� ������ �g������ ��������.  ���� �A���a ���e ������  �a��',
         '���a �a�a�v�� �� �g�e �a���i ���� �a�a��  ����I���� ���a�V���e',
         '��A ���� �១���A�e �ᢁ �a�a�� ���ⷡ �g������. �a���� �a�a�e',
         '�w���� ���� ��������a��.  ���A �a�e ���� �b�a�A �� ���w ���w�i',
         '�a�� �g�a�a�� �a��. �|�a�� �a�� �� ���B�� �a���e ����.  �a�� �w',
         '���� �a���a�� �a�� �aЗ�i ���� �i �����a��.',
         '',
         '                                      �a������ �i���A���� ����.',
         '','','','','','','','');



 Procedure End_Demo(no : byte);


IMPLEMENTATION

Procedure ThunderEffect;
begin
   SetPalette(6,6);
   RGB(6,40,20,0);
   repeat
      if random(1000) = 0 then
      if random(100) = 0 then begin
         RGB(6,10,20,63);
         delay(random(100)+20);
         RGB(6,40,20,0);
      end;
   until keypressed;
   c := readkey;
end;

Procedure All_Fade_Out(plane : byte); assembler;
const
   dest_seg : word = $A000;
   dest_off : word = 0;
asm
   push es

   mov ax, dest_seg
   mov es, ax
   mov di, dest_off
   mov dx, $3C4
   mov al, 2
   mov ah, plane
   out dx, ax
   mov ax, $000
   mov cx, 40 * 480
   rep stosw

   pop es
end;

procedure Scroll_Sub(X_First,X_Length : word; Y_Start,Y_End : integer);
var
   i,j,k : word;
begin
   i := Y_End - Y_Start + 1;
   k := 80 * Y_Start + X_First;
   j := 80 - X_Length;
   asm
      push ds
      push si
      push di

      mov dx, $3CE
      mov al, 5
      mov ah, 1
      out dx, ax
      mov dx, $3C4
      mov ax, $0F02
      out dx, ax

      mov ax, $0a000
      mov es, ax
      mov ds, ax
      mov si, k
      mov di, k
      sub di, 80
      mov cx, i

@JUMP1:
      push cx
      mov cx, X_Length;
      rep movsb
      add si,j;
      add di,j;
      pop cx
      loop @JUMP1;

      pop di
      pop si
      pop ds
   end;
end;

Procedure Print(x,y,str_number : integer);
begin
   if str_number in [1..Title_Str_Total] then
      OutHPrintXY(x,y,Title_Str[str_number],FALSE);
end;

Procedure End_Demo_Sub1;
begin
   for i := 0 to 3 do begin
      All_Fade_Out(1 shl i);
      delay(500);
   end;
end;

Procedure End_Demo_Sub2;
var
   add : integer;
begin
   End_Demo_Sub1;
   j := 0;
   SetPalette(Back_Ground_Color,Back_Ground_Color);
   RGB(Back_Ground_Color,0,0,0);
   SetPalette(Main_Scroll_Color,Main_Scroll_Color);
   RGB(Main_Scroll_Color,63,0,0);
   repeat
      inc(j);
      RGB(Fade_Bottom_Color,0,0,0);
      RGB(Fade_Top_Color,63,0,0);
      for add := 1 to Word_Y_Size do begin
         Scroll_Sub(Str_X_Pos div 8,64,Str_Y_Pos - Word_Y_Size*(Max_Line+1),Str_Y_Pos+20);
         if add = 1 then begin
            SetColor(Fade_Bottom_Color);
            Print(Str_X_Pos,Str_Y_Pos-add,j);
            SetColor(Fade_Top_Color);
            Print(Str_X_Pos,Str_Y_Pos-Word_Y_Size*(Max_Line+1)+(Word_Y_Size-add),j-Max_Line);
         end;
         RGB(Fade_Bottom_Color,round(add*3.9),0,0);
         RGB(Fade_Top_Color,64-round(add*3.9),0,0);
         if KeyPressed then begin
            add := Word_Y_Size;
            j := Title_Str_Total;
         end
         else delay(150);
      end;
      SetColor(Main_Scroll_Color);
      Print(Str_X_Pos,Str_Y_Pos-add,j);
      SetColor(Back_Ground_Color);
      Print(Str_X_Pos,Str_Y_Pos-Word_Y_Size*(Max_Line+1)+(Word_Y_Size-add),j-Max_Line);
   until j >= Title_Str_Total;
end;

Procedure End_Demo_Sub3;
var
   x_pos, y_pos : integer;
begin
   End_Demo_Sub1;
   x_pos := 40;
   y_pos := 60;
   setcolor(14);
   cHPrint(x_pos,y_pos,' �a�e ���a�e�A�A �a���b ���b�i �a�a�a ��i �a �i���a. �a���e ��A'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'����é �� ���i�� �{�v���e  �a�q ���A��e ���e ���a�a ���� �����a.'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'���a�e �a�e  �a�A�A ����ǩ �� ���e �����i �ỡ�a�A Ж���e  ���A�e'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'�a �{�e �������a.  �A�a���e��a �a�a �A������ ���A�e �a ���a�e ��'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'�� ���a�� �a�a�a �a�� ���a���a ... ...'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,' �a�e ��i �ᖁ���e �ᕩ�a���a. ���a�e�e �ᢁ�a ���e�i �a�wЖ���A'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'���e�i �����A �a���a�e �A �c�A�e ���a.  �a �b�� ���i�����e �e�w��'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'���e���� ���e �a�i ���e�i �a�b�� ���i�a?'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,''); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,''); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,' �a�e ������i �ᝡ�e�� ѥ�a�e�� �aЗ�i ��a�����a.'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,' �aȁ�� ���� ������ �a���e�� ���e�i �a���� ������ �������a.  ���a'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'�៩��A �a�a�� ���� �����a.  �a���e �� �a�i�� ����� �a�A���A ��'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'���a�� �aЗ�i ��a�e �������a.'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,' �� ���q�� ��i�A�A ���a���� �q���e  �a�e �a���� ������ �e�ⷡ ��'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'�e �A�w�� �{�A ���iЁ ���i�����a. �a���� �ዡ�� �a�e ������ �a �a'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'���i �x�� �� �a�e �k�i �i�a�a�e �a�i �i�e�i �����a.'); y_pos := y_pos + 20;
   ThunderEffect;
end;

Procedure End_Message;
var
   i, j : integer;
begin

   if AdLibOn then PlayOff;
   UnSound;
   asm
      mov ah,0
      mov al,3
      int $10
      mov ah,1
      mov ch,$20
      int $10
   end;
   dispose(font); dispose(chara);
   dispose(map);
   TextColor(7);
   TextBackGround(0);
   ClrScr;
   TextColor(7);
   Writeln(#13);
   RGB(7,0,0,0);
   SetPalette(15,15);
   RGB(15,0,0,0);
   TextColor(15);
   Writeln(#13);
   Writeln('                             << The End >>');
   Writeln('            " Into the MYSTIC  vol. #3 " is made by O� O���');
   Writeln('                                                    �   O |');
   TextColor(7);
   Writeln('                       You must be a genius !!!');
   for i := 1 to 63 do begin
      RGB(7,i,i,i);
      SetPalette(15,15);
      RGB(15,i,i,i);
      delay(10);
   end;
   delay(500);
   for i := 62 downto 42 do begin
      RGB(7,i,i,i);
      delay(15);
   end;
   asm
      mov ah,1
      mov ch,$13
      mov cl,$14
      int $10
   end;
   Halt;
end;

Procedure End_Demo(no : byte);
begin
   case no of
      1 : End_Demo_Sub1;
      2 : End_Demo_Sub2;
      3 : End_Demo_Sub3;
   end;
   End_Message;
end;
{
begin
   i := DETECT;
   initgraph(i,j,'');
   end_demo(3);
   closegraph;}
end.