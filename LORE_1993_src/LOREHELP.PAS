Unit LoreHelp;

INTERFACE

Uses
   Crt, Graph, UHanX, LoreSub, LoreCret;

Const
   Title_Str_Total = 25;
   Title_Str : array[1..Title_Str_Total] of string =
        ('         ������ ���� �e�i ���w������ �w���A�A �a���e �i',
         '',
         '��� ��������. LORE�� �A���A �w���i �����s���a.',
         '�����e �w���� ���q ���e �������e �{�e ���e���i ������ �����e ��',
         '�e��a���e �a�a�A ����Ё �� ���a�e �����a�� �i �� ���s���a.  ��',
         '���e �a���� ��� �a�� �����a�a ���b �����e ������ ���A �����a',
         '�� Ё���e �� ���� ��Ё�a �A�V�s���a ?',
         '���q �� ���e �a�e ���e�A�� �a���� ���i ���wЁ �i�ᵥ  ��� �a�A',
         '��Ё ��ɷ�i �c�� ���s���a. �� ���e �a�妁�� �� �A���A ������ ��',
         '�w�a�� ���� �A������  �a ���a�e�e ���w�A�� ����a�� ��Ё �w���i',
         '�� �A���� �����a�A �A���s���a. ���A���� �w���e �� �A���� �a�q��',
         '���a.  ���q���� �w���� ��З�� �q�A �w���� ���w ���e �����A ����',
         'Ё ��������.  �w���� �e�w�e �e�e�A ��Ё �w�� �|�A �i�a�� �A���A',
         '���� �a������.',
         '��A�a ���w�� �a���e �w�� �|�A ��sЁ���� ���a�� ...',
         '',
         '                                          �A�b�a  �e �w��  �a��',
         '','','','','','','','');
Var
   temp : integer;

 Procedure Title_Menu;


IMPLEMENTATION

procedure box(x1,y1,x2,y2 : integer;color : word;shadow,bold : boolean);
const
   tab = 4;
begin
   setfillstyle(SOLIDFILL,color);
   bar(x1,y1,x2,y2);
   moveto(x1,y2);
   setcolor(15);
   lineto(x1,y1); lineto(x2,y1);
   setcolor(8);
   lineto(x2,y2); lineto(x1,y2);
   if bold then begin
      moveto(x1+1,y2-1);
      setcolor(15);
      lineto(x1+1,y1+1); lineto(x2-1,y1+1);
      setcolor(8);
      lineto(x2-1,y2-1); lineto(x1+1,y2-1);
   end;

   if shadow then begin
      moveto(x1+pred(tab),y2-pred(tab));
      setcolor(8);
      lineto(x1+pred(tab),y1+pred(tab));
      lineto(x2-pred(tab),y1+pred(tab));
      setcolor(15);
      lineto(x2-pred(tab),y2-pred(tab));
      lineto(x1+pred(tab),y2-pred(tab));
      if bold then begin
	 moveto(x1+tab,y2-tab);
	 setcolor(8);
	 lineto(x1+tab,y1+tab); lineto(x2-tab,y1+tab);
	 setcolor(15);
	 lineto(x2-tab,y2-tab); lineto(x1+tab,y2-tab);
      end;
   end;
end;

procedure MessageBox(x1,y1,x2,y2 : integer;color : word;shadow : boolean);
const
   tab = 1;
begin
   if shadow then begin
      box(x1,y1,x2,y2,8,shadow,FALSE);
      box(x1+succ(tab),y1+succ(tab),x2-succ(tab),y2-succ(tab),color,FALSE,FALSE);
   end
   else box(x1,y1,x2,y2,color,shadow,FALSE);
   setfillstyle(SOLIDFILL,BLACK);
   bar(x1+pred(tab),y2+1,x2,y2+pred(tab));
   bar(x2+1,y1+pred(tab),x2+pred(tab),y2+pred(tab));

end;

procedure Text_Fading(s : string);
const
   co = Blue;
begin
   RGB(co,0,0,0);
   textcolor(co);
   write(s);
   for i := 0 to 42 do begin
      RGB(co,i,i,i);
      if not KeyPressed then delay(50);
   end;
   textcolor(7);
   gotoxy(1,WhereY); writeln(s);
   RGB(co,0,0,42);
end;

procedure Scroll_Sub(mode : byte);
var
   i,k : word;
   _start, _end : integer;
begin
   if not (mode in [0,1]) then exit;
   asm
      mov dx, $3ce
      mov al, 5
      mov ah, 1
      out dx, ax
   end;
   case mode of
      0 : begin
             _start := 40; _end := 180;
          end;
      1 : begin
             _start := 126; _end := 290;
          end;
   end;
   for i := _start to _end do begin
      case mode of
         0 : k := 80 * i + 9 + page * $8000;
         1 : k := 80 * i + 9 + page * $8000;
      end;
      asm
         push ds
         push si
         push di
         mov si, k
         mov di, k
         sub di, 80*1
         mov cx, 63
         mov ax, $0a000
         mov es, ax
         mov ds, ax
         rep movsb
         pop di
         pop si
         pop ds
      end;
   end;
end;

Procedure Title_Menu;
Label
   Return_to_Menu, Jump_to_Create_Character;
begin

   if (s = '/?') or (s = '-?') or (s = '?') then begin
      asm
         mov ah,1
         mov ch,$20
         int $10
      end;
      writeln;
      Text_Fading('The Codex of Another Lore  Volume #1');
      Text_Fading('               made by Ahn Young-Kie');
      writeln;
      Text_Fading('USAGE : LORE [option]');
      writeln;
      writeln(' options - ''/g'' ==> start Game immediately');
      writeln('           ''/c'' ==> Create characters immediately');
      writeln('           ''/m'' ==> no Music required');
      writeln;
      asm
         mov ah,1
         mov ch,$13
         mov cl,$14
         int $10
      end;
      UnSound;
      Halt;
   end;

   i := VGA;
   j := VGAHi;
   InitGraph(i,j,'');
   Page := 0;

   if (s = '/c') or (s = '/C') then begin
      c := '1';
      goto Jump_to_Create_Character;
   end;

Return_to_Menu:
   SetFont(0);
   RGB(Blue,15,5,25);
   SetFillStyle(SolidFill,Blue);
   Bar(0,0,639,479);
   for i := 0 to 10 do
      Box(200-i*20,200-i*20,438+i*20,278+i*20,1,TRUE,TRUE);

   RGB(Black,0,0,0);
   SetPalette(Red,Red);
   RGB(Red,15,15,15);
   SetPalette(Magenta,Magenta);
   RGB(Magenta,0,0,0);
   SetPalette(LightMagenta,LightMagenta);
   RGB(LightMagenta,0,0,0);

   s := '���a�e ������ ����  �A 1 ��';
   SetColor(Magenta);
   eHPrint(120,100,s);
   SetColor(LightMagenta);
   eHPrint(118,98,s);
   for i := 100 downto 40 do begin
      Scroll_Sub(0);
      SetPalette(Magenta,Magenta);
      RGB(Magenta,(100-i) div 2,(100-i) div 4,(100-i) div 2);
      SetPalette(LightMagenta,LightMagenta);
      RGB(LightMagenta,100-i,(100-i) div 2,100-i);
      delay(10);
   end;

   SetColor(14);
   cHPrint(80,330,'��å �״��� ���B�� ���e �e�a�� ���� �a�� ���B�� �����A �q����');
   cHPrint(80,350,'�|�a�� ��ӡ�� �w�q�� �a�a�e ���B��  �w���� ��鮁 ���� ���a��');
   cHPrint(80,370,'�I ���w�� �������a. ���w�i ϡ�a�a �a�� �a������.  �w�� �|�A�e');
   cHPrint(80,390,'��A�a �w���i ���a���a �������e ���a ���� �w���� ���� ���� �w');
   cHPrint(80,410,'���� ���a�i�� ���s���a. �w���� �� �A���A �i�� ���e �a �i�� �a');
   cHPrint(80,430,'�� �a ���e ���w�i ���A �A�e ���b���i ���� �i���i �����a.');

   for i := 0 to 10 do
      MessageBox(140-i*10,160-i*5,500+i*10,250+i*5,Red,TRUE);
   j := 0;
   repeat
      inc(j);
      RGB(2,15,15,15);
      RGB(3,0,63,63);
      temp := 0;
      repeat
         inc(temp);
         Scroll_Sub(1);
         if temp = 1 then begin
            SetColor(2);
            OutHPrintXY(71,270-temp,Title_Str[j],FALSE);
            if j > 7 then begin
               SetColor(3);
               OutHPrintXY(71,128+(16-temp),Title_Str[j-7],FALSE);
            end;
         end;
         RGB(2,16 - temp,15+temp*3,15+temp*3);
         RGB(3,temp,63-temp*3,63-temp*3);
         if temp in [2..15] then
            if j > 7 then delay(110) else delay(150);
      until (temp >= 16) or KeyPressed;
      if not KeyPressed then begin
         SetColor(11);
         OutHPrintXY(71,270-temp,Title_Str[j],FALSE);
         if j > 7 then begin
            SetColor(8);
            OutHPrintXY(71,128+(16-temp),Title_Str[j-7],FALSE);
         end;
         for temp := 1 to 2 do begin
            Scroll_Sub(1);
            delay(200);
         end;
      end;
   until (j >= Title_Str_Total) or KeyPressed;
   MessageBox(40,110,600,300,Red,TRUE);
   RGB(2,0,42,0);
   RGB(3,0,42,42);

   SetColor(Black);
   OutHPrintXY(205,175,'1] ������ �������i ���� ��Ǳ',FALSE);
   OutHPrintXY(205,205,'2] ���巁 �A���i ���� ��Ǳ',FALSE);
   OutHPrintXY(205,235,'3] ���a�� ���a�q',FALSE);
   SetColor(LightBlue);
   cHPrint(200,170,'1] ������ �������i ���� ��Ǳ');
   cHPrint(200,200,'2] ���巁 �A���i ���� ��Ǳ');
   cHPrint(200,230,'3] ���a�� ���a�q');

   ok := false;
   repeat
      c := readkey;
      if c in ['1'..'3'] then ok := true;
   until ok;
   RGB(Blue,0,0,42);
   RGB(Green,0,42,0);
   RGB(Cyan,0,42,42);
   SetPalette(Magenta,Magenta);
   RGB(Magenta,42,0,42);
   SetPalette(LightMagenta,LightMagenta);
   RGB(LightMagenta,63,0,63);
   if c = '3' then begin
      CloseGraph;
      Unsound;
      Halt;
   end;

   RGB(Red,42,0,0);
Jump_to_Create_Character:
   if c = '1' then begin
      SetFont(1);
      if not CreateCharacter then goto Return_to_Menu;
   end;
   CloseGraph;
end;

begin
end.