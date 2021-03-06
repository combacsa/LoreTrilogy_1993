Unit DarkEnd;

INTERFACE

Uses
   Crt, Graph, AdLib, UHanX, DarkSub;

 Procedure End_Demo;


IMPLEMENTATION

Procedure FadeSub(adder : integer);
var
   color, r, g, b : byte;
begin
   for color := 0 to 14 do begin
      case color of
         0 : begin
                r := adder div 5; g := adder div 5; b := adder div 5;
             end;
         1 : begin
                r := adder div 5; g := adder div 5; b := 42 + adder div 15;
             end;
         2 : begin
                r := adder div 5; g := 42 + adder div 15; b := adder div 5;
             end;
         3 : begin
                r := adder div 5; g := 42 + adder div 15; b := 42 + adder div 15;
             end;
         4 : begin
                r := 42 + adder div 15; g := adder div 5; b := adder div 5;
             end;
         5 : begin
                r := 42 + adder div 15; g := adder div 5; b := 42 + adder div 15;
             end;
         6 : begin
                r := 42 + adder div 15; g := 21 + adder * 2 div 15; b := adder div 5;
             end;
         7 : begin
                r := adder div 15 + 42; g := adder div 15 + 42; b := adder div 15 + 42;
             end;
         8 : begin
                r := 21 + adder * 2 div 15;
                g := 21 + adder * 2 div 15;
                b := 21 + adder * 2 div 15;
             end;
         9 : begin
                r := adder div 5; g := adder div 5; b := 62;
             end;
        10 : begin
                r := adder div 5; g := 62; b := adder div 5;
             end;
        11 : begin
                r := adder div 5; g := 62; b := 62;
             end;
        12 : begin
                r := 62; g := adder div 5; b := adder div 5;
             end;
        13 : begin
                r := 62; g := adder div 5; b := 62;
             end;
        14 : begin
                r := 62; g := 62; b := adder div 5;
             end;
      end;
      SetPalette(color,color);
      RGB(color,r,g,b);
   end;
end;

Procedure FadeIn;
var
   adder : byte;
begin
   for adder := 0 to 31 do FadeSub(adder*10);
end;

Procedure FadeOut;
var
   adder : byte;
begin
   for adder := 31 downto 0 do FadeSub(adder*10);
end;

Procedure EndMessage;
var
   x_pos, y_pos : integer;

 Procedure out(s : string);
 begin
    cHPrint(x_pos,y_pos,s);
    y_pos := y_pos + 20;
 end;

begin
   x_pos := 50; y_pos := 50;
   SetColor(14);
   out(' �a�e �a�妁�� ���� ���w�� �w���A�A �x�a �� ��a�e ���i �i�� ��');
   out('�����A. ��� ���� �{�e ���i �a�e �I �� ���� �c���a�A. �a�A�e ��');
   out('Ё�a�V�a ? �a�A�a �a�A�� �a���A�� �a�i ������ ��A, ���a ���a�e');
   out('�a �巁 �a���A�᷁ �a�A�a �a�A�A ���� ���a�� �a�� ����  �a�� ��');
   out('�A �����a�A. ���a �a�A�� �a���A�� ́Ё�� �i��ѩ�i ɷЁ�� �a����');
   out('�a���a�� ���e�ᕡ ́���q�e ���a �����a�A. �a�� �a�A�a �a�� ����');
   out('���s�a��  �� �|�A �a�a�e�a�e ���i �i�� ������ ��������.  �a�A�e');
   out('�i�� �i�A �I ��A.  �a�e �� ���e �a���i ɷ�a�a �e 1 �w�����e �a');
   out('�A�e �a�A�� �{�e ���w�i ������ �a �a���i �i�a�a�e �I �� ���� �g');
   out('�e �a�A�i���A �e�w���a�A. ���a ���q �a���� �w���i ������a�� ��');
   out('�a���A �i�� ���e �a�A�A ��Ё �a�� �a�e �a���a�� ���a �i �����A.');
   out('�a���e �a�� �� �a�A�A ���a�� �� �����a�e ���i �i�� ���V��.');
   out(' �a �A�a���e��e ��a �a���A�ᕡ ���b��a���e ́���i �i ���a ��');
   out('�a�A. �b, �a�i �����e �a�e �a���� ����.');
   y_pos := y_pos + 10;
   SetColor(15);
   out(' �� �e�a�a �a�a�a ..  �� �a�a �a�q ..');
   y_pos := y_pos + 10;
   SetColor(7);
   out(' �A�a���e��e �A�ỡ �w�b�a�� �w���i �a���� ���q ͢Η�a�� �� ��');
   out('�w ���w�a�� ���a�e �w���i ���b Ж�a. �w���e Ӂ���e �������A�ᕡ');
   out('���� ���a�a�a�e ���i �a�v�a. �����a���� ���᷁ �A���e �����e �a');
   out('����a�a �����w�� �����a�� �g�v�� �a���a�� �a����a.');
end;

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

Procedure PutSprite(x,y,number : integer);
begin
   PutImage(x,y,Chara^[number+28],AndPut);
   PutImage(x,y,Chara^[number],OrPut);
end;

Procedure End_Demo;
var
   i, j : integer;
begin
   Delete_Scroll_Screen;
   Clear;
   Print(7,' ��З�e �a���i�� �a���� ���e ���e ӱ�i �aЁ');
   Print(7,'��  �w���i �A�a���e��a ���e ���e�a��  �a��');
   Print(7,'���i�i ���v�a. �a�� ���i�� �w���� �s���e �a');
   Print(7,'�A�A�� �A�b�e ���v�a.  �a���� �w���� ����');
   Print(7,'�� ���a �ַi��  ���� �A�a���e��e �w�� �|�A');
   Print(7,'�� �����a. �a�e �i�i ���bЖ�a.');
   c := readkey;
   SetFont(0);
   FadeIn;
   SetBkColor(0);
   ClearDevice;
   EndMessage;
   FadeOut;
   while KeyPressed do c := readkey;
   RGB(6,10,20,63);
   delay(40);
   RGB(6,40,20,0);
   delay(100);
   RGB(6,10,20,63);
   delay(100);
   RGB(6,40,20,0);
   SetFont(2);
   with party do begin
      map := 6; xaxis := 91; yaxis := 80;
   end;
   Load;
   ThunderEffect;
   FadeIn;
   SetFillStyle(SolidFill,8);
   Bar(0,0,640,480);
   SoundOn := FALSE;
   party.etc[1] := 255;
   Scroll(FALSE);
   FadeOut;
   PressAnyKey;
   PutImage(98,11*24,Font^[50],CopyPut);
   for i := 10 downto 6 do begin
      delay(1000);
      PutImage(98,(i+1)*24,Font^[47],CopyPut);
      PutImage(98,i*24,Font^[50],CopyPut);
   end;
   Print(7,' '+player[1].name+'���e ���a �A���� �e �� ������ ���a�� ?');
   Print(7,'�a�a ��a �i���A���� ����e �i�v�a���i �a��');
   Print(7,'�A.  �a�a �A�����e �i�� �a�a�a�� �g�v�g�a.');
   Print(7,'�a��e �A�弁, �A�弁, �a���弁 ����e ����');
   Print(7,'�i�v��.');
   Print(7,' �A�弁 ����e �A�a���e��a '+player[1].name+'���A�A ́�� Ж�a���a �i�v��.');
   Print(7,' �A�弁 ����e  �a�a �A�����a �a�a�a�� �g�v');
   Print(7,'�� �����A �i�v��.');
   Print(7,' �a���� �a���弁 ����e  �i�� ���巡 �e�a��');
   Print(7,'�a �a���a �A�a���a�� �i�v��.');
   Print(7,' �ᘁ ? �� �i�� �x�� ?');
   PressAnyKey;
   FadeIn;

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
   dispose(map); dispose(enemydata);
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
   Writeln('                              << The End >>');
   Writeln('    " Dark Mage Cyllian Cominus  vol. #2 " is made by Ahn Young-Kie.');
   TextColor(7);
   Writeln('                        You must be a genius !!!');
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

end.