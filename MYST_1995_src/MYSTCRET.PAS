Unit MystCret;
{$X+}
{$O+,F+}
INTERFACE

Uses
   Crt, Dos, Graph, UHanX, MystSub;

 Function CreateCharacter : boolean;


IMPLEMENTATION

Procedure P(x,y : integer; s : string);
begin
   OutHPrintXY(x,y,s,FALSE);
end;

Procedure Screen_Set;
begin
   SetFillStyle(SolidFill,Blue);
   RGB(Blue,15,10,20);
   Bar(0,0,639,479);
end;

Procedure Display(x1,y1,x_gap,y_gap : integer; writing : boolean);
var
   co : integer;
begin
   co := GetColor;
   if writing then SetColor(LightRed) else SetColor(Blue);
   RectAngle(x1,y1,x1+x_gap,y1+y_gap);
   SetColor(co);
end;

Function Choose(x_pos,y_pos,x_gap,y_gap,x_max,y_max : integer;
                var x,y : integer; enable_esc : boolean) : boolean;
begin
   if not (x in [1..x_max]) then x := 1;
   if not (y in [1..y_max]) then y := 1;
   Display(x_pos+(x-1)*x_gap,y_pos+(y-1)*y_gap,x_gap,y_gap,TRUE);
   ok := FALSE;
   repeat
      c := readkey;
      if c = #0 then c := readkey;
      if c in [#77,#75,#80,#72,#13,#27] then begin
         Display(x_pos+(x-1)*x_gap,y_pos+(y-1)*y_gap,x_gap,y_gap,FALSE);
         case c of
            #77 : begin
                     if x in [1..x_max-1] then
                        inc(x)
                     else begin
                        if y in [1..y_max-1] then inc(y);
                        x := 1;
                     end;
                  end;
            #75 : begin
                     if x in [2..x_max] then
                        dec(x)
                     else begin
                        if y in [2..y_max] then dec(y);
                        x := x_max;
                     end;
                  end;
            #80 : begin
                     if y in [1..y_max-1] then
                        inc(y)
                     else begin
                        if x in [1..x_max-1] then inc(x);
                        y := 1;
                     end;
                  end;
            #72 : begin
                     if y in [2..y_max] then
                        dec(y)
                     else begin
                        if x in [2..x_max] then dec(x);
                        y := y_max;
                     end;
                  end;
            #13 : ok := TRUE;
            #27 : if enable_esc then ok := TRUE;
         end;
         Display(x_pos+(x-1)*x_gap,y_pos+(y-1)*y_gap,x_gap,y_gap,TRUE);
      end;
   until ok;
   if c <> #27 then
      Choose := TRUE
   else
      Choose := FALSE;
   Display(x_pos+(x-1)*x_gap,y_pos+(y-1)*y_gap,x_gap,y_gap,FALSE);
end;

Procedure Put_Name;

const
   x_pos = 10;
   y_pos = 15;
   gap = 20;
var
   main_menu : 1..4;
   name : string[20];
   ok, quit : boolean;
   point : array [1..5] of integer;

 Procedure Menu_Display(writing : boolean);
 begin
    Display(x_pos+192+(main_menu-1)*48,y_pos+352,48,32,writing);
 end;

 Procedure Output_Name;
 begin
    SetFillStyle(SolidFill,Blue);
    Bar(x_pos+110,y_pos+415,x_pos+300,y_pos+415+16);
    SetColor(LightGreen);
    P(x_pos+110,y_pos+415,name);
 end;

 Procedure Hangul;
 var
    Han_Data : array[1..3] of integer;
    temp : array[1..2] of byte;
    i : byte;
    fix : integer;
 label
    Hangul_First_Point;
 begin
    if ord(name[0]) > 6 then exit;
 Hangul_First_Point:
    Menu_Display(FALSE);
    if not Choose(x_pos+16,y_pos+80,20,20,19,1,point[1],fix,TRUE) then begin
       Menu_Display(TRUE);
       exit;
    end;
    Han_Data[1] := point[1];
    if not Choose(x_pos+16,y_pos+140,20,20,27,1,point[2],fix,TRUE) then begin
       Menu_Display(TRUE);
       exit;
    end;
    Han_Data[2] := point[2];
    if not Choose(x_pos+16,y_pos+200,20,20,29,1,point[3],fix,TRUE) then
       Han_Data[3] := 0
    else begin
       if point[3] = 1 then Han_Data[3] := 0
       else Han_Data[3] := point[3] - 1;
    end;
    for i := 1 to 3 do
       if Han_Data[i] > 0 then point[i] := Han_Data[i];
    inc(Han_Data[1]);
    inc(Han_Data[2]); inc(Han_Data[2]);
    inc(Han_Data[3]);
    temp[1] := ($FF and $80) or (Han_Data[1] shl 2);
    temp[1] := temp[1] or (Han_Data[2] shr 3);
    temp[2] := $FF and (Han_Data[2] shl 5);
    temp[2] := temp[2] or Han_Data[3];
    i := ord(name[0]);
    name[0] := chr(i+2);
    name[i+1] := chr(temp[1]);
    name[i+2] := chr(temp[2]);
    Output_Name;
    inc(point[3]);
    if ord(name[0]) <= 6 then goto Hangul_First_Point;
    Menu_Display(TRUE);
 end;

 Procedure English;
 label
    English_First_point;
 begin
    if ord(name[0]) > 7 then exit;
 English_First_point:
    Menu_Display(FALSE);
    if not Choose(x_pos+15,y_pos+258,20,20,26,3,point[4],point[5],TRUE) then begin
       Menu_Display(TRUE);
       exit;
    end;
    i := ord(name[0]);
    name[0] := chr(i+1);
    case point[5] of
       1 : name[ord(name[0])] := chr(31+point[4]);
       2 : name[ord(name[0])] := chr(64+point[4]);
       3 : name[ord(name[0])] := chr(96+point[4]);
    end;
    Output_Name;
    if ord(name[0]) <= 7 then goto English_First_point;
    Menu_Display(TRUE);
 end;

 Procedure Delete_Name;
 var
    strptr : byte;
    hangul : boolean;
 begin
    strptr := 1;
    while length(name) >= strptr do begin
       if ord(name[strptr]) > 127 then begin
          hangul := TRUE;
          strptr := strptr + 2;
       end else begin
          hangul := FALSE;
          strptr := strptr + 1;
       end;
    end;
    if hangul then begin
       if length(name) > 1 then name[0] := chr(strptr-3)
    end
    else begin
       if length(name) > 0 then name[0] := chr(strptr-2);
    end;
    Output_Name;
 end;

begin
   main_menu := 1;
   name := '';
   for i := 1 to 5 do point[i] := 1;
   SetFillStyle(SolidFill,Black);
   Bar(0,0,639,479);
   Restore_Palette;

   Screen_Set;
   SetColor(White);
   P(x_pos,y_pos,'�w���� ���q�i ���� �a������.');
   P(x_pos,y_pos+60,'����');
   for i := 1 to 19 do PutHan(x_pos+i*gap,y_pos+80,(i-1)*6);
   P(x_pos,y_pos+120,'����');
   for i := 1 to 27 do PutHan(x_pos+i*gap,y_pos+140,(i+56)*2);
   P(x_pos,y_pos+180,'����');
   AsciiXY(x_pos+gap+3,y_pos+203,ord('X'));
   for i := 2 to 29 do PutHan(x_pos+i*gap,y_pos+200,(i+82)*2);
   P(x_pos,y_pos+240,'�w�� & ��ѡ');
   for i := 1 to 26 do AsciiXY(x_pos+i*gap,y_pos+260,i+31);
   for i := 1 to 26 do AsciiXY(x_pos+i*gap,y_pos+280,i+64);
   for i := 1 to 26 do AsciiXY(x_pos+i*gap,y_pos+300,i+96);
   P(x_pos+200,y_pos+360,'�e�i  �w��  ����  �Şa');
   SetColor(LightCyan);
   P(x_pos,y_pos+415,'�w���� ���q :');

   Menu_Display(TRUE);
   ok := FALSE;
   repeat
      c := readkey;
      if c = #0 then c := readkey;
      case c of
         #77 : begin
                  Menu_Display(FALSE);
                  if main_menu in [1..3] then
                     inc(main_menu)
                  else
                     main_menu := 1;
                  Menu_Display(TRUE);
               end;
         #75 : begin
                  Menu_Display(FALSE);
                  if main_menu in [2..4] then
                     dec(main_menu)
                  else
                     main_menu := 4;
                  Menu_Display(TRUE);
               end;
         #13 : case main_menu of
                  1 : Hangul;
                  2 : English;
                  3 : Delete_Name;
                  4 : if name <> '' then ok := TRUE;
               end;
      end;
   until ok;
   player[1].name := name;

end;

Procedure Put_Sex;
var
   x_pos, y_pos, x_choose, y_choose : integer;
begin
   Screen_Set;
   x_pos := 200; y_pos := 40;
   SetColor(White);
   P(x_pos,y_pos,'�w���� ���i�i �i���a������.');
   P(x_pos+65,y_pos+25,'�q��  �a��');
   Choose(x_pos+58,y_pos+20,47,26,2,1,x_choose,y_choose,FALSE);
   if x_choose = 1 then player[1].sex := male
   else player[1].sex := female;
end;

Procedure Select_Ability1;
const
   title_x_pos : word = 80;
   title_y_pos : word = 320;
   title_y_gap : word = 20;
   x_pos : word = 180;
   y_pos : word = 350;
   y_gap : word = 20;
var
   transdata : array[1..5] of byte;
   order : array[1..3] of byte;
   st : array[1..3] of string;

 Procedure Which;
 begin
    repeat c := readkey;
    until c in ['1'..'3'];
 end;

 Procedure erase;
 begin
    Bar(title_x_pos,title_y_pos,630,450);
 end;

begin
   SetFillStyle(SolidFill,1);
   SetFont(1);
   for i := 1 to 5 do transdata[i] := 0;
   SetColor(10);
   OutHPrintXY(title_x_pos+40,y_pos-100,'���q ����e ���e �i�A ���s�i Ё ��������.',FALSE);
   OutHPrintXY(title_x_pos+80,y_pos-100+y_gap,'�a����, �a���A�A �x�e �s�i �������A ���� ��������.',FALSE);
   SetColor(11);
   Randomize;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���� �e �q���A �����a�� ���i�� �c�A�� ���e �����a �i�v�a',FALSE);
      OutHPrintXY(x_pos,y_pos+0*y_gap,'1] �c�a�� �a�a�� �i�a���a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'2] �a �����a �������a ���b�i �e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'3] �����A�e �i���e�a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���� �e �����A�� ��a�i �a���a�� ��  �� �|�i �b�� �a��a',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'���e �a�� �����A ��a�a ���a�i �� ��A �A���a.',FALSE);
      OutHPrintXY(x_pos,y_pos+0*y_gap,'1] ��a�A�� ���a �a���i á���a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'2] �q�� á����a ���b�a�a ���a���a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'3] ��a �e�A�� �a���i á�� �w��i �����e�a',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[2]);
   if c = '3' then inc(transdata[3]);
   Erase;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���e �A�b�w �����i�����A�� ͡���i �� ���e �e �a��i �q�a ����',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'�᷁ �i�� �wȁ�a �A���a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] ӱ�a�� ���� �a�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �����b�a�� ��ˡ�a �i���a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] �a���� �aȁ�a���� �a�e�a���� �i���a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���e �i���� �a���A �a�e �a�q�A�A ���e ���b�i �wЖ�a. ����',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'�w���� З���e ?',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] �w�w �a �a�q�� �a���a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �a�� �a ���i ���� �៥�a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] ���A��e �p�� ���a���e �q�� ���e�a',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[2]);
   if c = '3' then inc(transdata[4]);
   Erase;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���e �� �A�� ���A�� ��i�A�A �Ÿ�ӡ ͡��A�� �w�e ���� �a����',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'���a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] ӱ�� �q�a ���e�e ���i���a�� �a���a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �e�a���a�� �i�i �a�w���i �x�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] ���e �a���e�� �a�� �w��i ���b�e�a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���e �e �A�i ���e �i���� ���q �a�w��З�i �w�a�A �A���a',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'�a�� �w���� З���e ?',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] �i�i �����e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �e���i �h�a�i���a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] ���� �g�� ��Ё �w�e ���w�i �e�a',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[2]);
   if c = '3' then inc(transdata[5]);
   Erase;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���e ���� ���s�e ���s�i Ή�ᴡ�a�e ���� ���v�a',FALSE);
      OutHPrintXY(x_pos,y_pos+0*y_gap,'1] �i�� ���s�i �i�a �៥�a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'2] ���s�� �{���� ���� �a�e�a�e Ґ�ᥥ�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'3] �἖�e ���� Ή�a�� ���i �����a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���� �� �A�����A�� �鷡�e �ɴ��w�e ?',FALSE);
      OutHPrintXY(x_pos,y_pos+0*y_gap,'1] �ᔁ�e ��i �ᖁ�a�a ��i �����a�e �w��',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'2] �w�q�� ӱ�e�a�� ��i ���b�� ��ǡ�e �w��',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'3] �a�ỡ�� �� �a��a�� �{�a�� �a�� �w���a�e �w��',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[4]);
   Erase;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'���� ���e�i ���a�� �w���e �s�b�a�� ���b�i �e�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+0*y_gap,'1] �w�w�e �a�ỡ ϡ�i���i �x�a ��a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'2] ñ�b�a�A ����i �i�a �e���e���i �x�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'3] ���b �����e �a�� �e���a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���e Ё�i 5000m �a ��e �����A�� ���aȁ �����A �����A���a. ',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'�������a ���a�e 12���e. �a���e �w���e ����A �a�V�e�a ?',FALSE);
      OutHPrintXY(x_pos,y_pos+0*y_gap,'1] ӱ�i �aЁ �������� ���A �i ���e ���a�� �����e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'2] �e���� �aȁ�i ����Ё�� ӱ�i �A���e �a�a���a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'3] ��i �a�s�A �e�a���a �a���A�� ���a���a',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[5]);
   Erase;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'���e�A �����a�� �i�a�a�e�A �a���� �e�e ���� ����� �i����',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'�g�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] �a�e �i���i �x�a�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] 1] ��� �{�e ���¯��e ����i �a�e�� ���a�e �¯��e ',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'   �i���� �� ���i �{�a�� �i�a�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+4*y_gap,'3] �a������ �a�� ������ �������a�� ���a�a �i�e�a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���e �a�b�i �aЗ�����a. ���a���a�a���e �|�a�� 1 km, �w����',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'З���e ?',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] �A�b�i ����Ё��a�� �� �� �i�� ��q�i �����e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �aȁ�� ���֔����� �����a�A �e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] �w���e ���� ���i �a�� �g�a�� �i���i ϩ�a�a ���a',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[4]);
   if c = '3' then inc(transdata[5]);
   Erase;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'�����A ȁ��e �w���e, �e�i �w���� ���|�A�� ���A�a �a�a���e',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'�a���i ���v�i�� �w���� Ё��e ?',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] �����e �a�󷡔a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �����e �a�q�� ������ �w�b���a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] �e���e �a�q�� ���������a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'�� �A�� ���A��e �w���� ���������a ��wЁ�� �����a. �a���a�e',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'���q �w�� �|�A���e ���g�e �A���i�i ����A �១�a�V�e�a ?',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] ���q�� ͢Η�a�� �妁 ȁ���៥�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �ⷁ �a�q�i ���b�a�a �∁���i ���A �៥�a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] Љ��a�� ��i ���W���� �a��a���a',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[2]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[4]);
   Erase;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'���� ���e�A �w���� ����ŵA�� �����i �a�a�e�A ����a �ᢁ',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'���a��a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] �w�Ŵ��� �q�a�a �����e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �ᢁ �����i �i��ӡЁ�� �a�� �����a �e �i���a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] ���a�ᶑ�A ���w�a�e �a�q�a�� �����e�a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���e �A�a �a�����A ��Ё �����A �����A �A���a. �A�a �a�����e',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'�a���b ���b�a�� ���q�i �����a. �w���� ���w�e ?',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] �q�b�� �a���a�a�i ������� ���q�i ���b�� ��ǥ�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �w�� �|�� �w�� ���a ���a�A �a�a ���q�i �a�e ��ǥ�a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] �w���� ���A�i ���A �e�� �� ���e �wȁ�� �a���� �៥�a',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[2]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[5]);
   Erase;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'���w ���ɷi �a�� �w���e �a�� ���A���� �w�ŵA�A ���e �b�i �i���a',FALSE);
      OutHPrintXY(x_pos,y_pos+0*y_gap,'1] ���a���e �����a�e�� ���a���e �q���i �}�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'2] �Še�a�e �q�� �񋥔a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'3] �w�ŷ��� �����a�� ���A�i �i�a�a ���e�a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���e �A�����A�� �ᔁ�e �b�a�i �e�v�a. �w���e ѥ�a������ ����',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'�w�e�e Ӂ�bЖ�a. ����A �i �����a ?',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] ���e �a���a�a �����a�a�� �e�e�A�e ���w�e�a.',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] �{�a�� �b�a�� �a���a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] ���i�� ���i �����a',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[2]);
   if c = '2' then inc(transdata[4]);
   if c = '3' then inc(transdata[5]);
   Erase;
   if random(2) = 0 then begin
      OutHPrintXY(title_x_pos,title_y_pos,'�w���� ������ �a���a���i �a�店 �i�����e ���A�a ���v�a',FALSE);
      OutHPrintXY(x_pos,y_pos+0*y_gap,'1] �a�e�a�e ���ᕡ�i ���b�a�a ���A�i �x�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'2] �a��� ��З ��ǡ�a ���A�i �x�e�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'3] ���A�a �b�a�e �a�� �a�w�e�a',FALSE);
   end else begin
      OutHPrintXY(title_x_pos,title_y_pos,'���q�e �w���� �����b�a 1 �b�e ����. �e�� ���� ���A���i �h������',FALSE);
      OutHPrintXY(title_x_pos,title_y_pos+title_y_gap,'�|�� �q�qЖ�a. �w���e ����A �a�V�e�a?',FALSE);
      OutHPrintXY(x_pos,y_pos+1*y_gap,'1] �������� �a�e�a�e Ή�ᥥ�a',FALSE);
      OutHPrintXY(x_pos,y_pos+2*y_gap,'2] ���e �w�b(?)�i �����a�a �s�i �i�a���a',FALSE);
      OutHPrintXY(x_pos,y_pos+3*y_gap,'3] �a�� �y�� �x�i �Qá�� �����i ���a',FALSE);
   end;
   Which;
   if c = '1' then inc(transdata[3]);
   if c = '2' then inc(transdata[4]);
   if c = '3' then inc(transdata[5]);
   Bar(title_x_pos,y_pos-100,630,450);
   for i:= 1 to 5 do begin
      j := transdata[i];
      case j of
         0 : transdata[i] := 5;
         1 : transdata[i] := 7;
         2 : transdata[i] := 11;
         3 : transdata[i] := 14;
         4 : transdata[i] := 17;
         5 : transdata[i] := 19;
         6 : transdata[i] := 20
         else transdata[i] := 10;
      end;
   end;
   with player[1] do begin
      strength := transdata[1];
      mentality := transdata[2];
      concentration := transdata[3];
      endurance := transdata[4];
      resistance := transdata[5];
      if strength > mentality then classtype := sword
      else if mentality > strength then classtype := magic
      else if endurance > concentration then classtype := sword
      else if concentration > endurance then classtype := magic
      else classtype := magic;
   end;
   j := 4;
   with player[1] do
   if sex = male then begin
      strength := strength + j;
      if strength <= 20 then j := 0
      else begin
         j := strength - 20;
         strength := 20;
      end;
      endurance := endurance + j;
      if endurance <= 20 then j := 0
      else begin
         j := endurance - 20;
         endurance := 20;
      end;
      resistance := resistance + j;
      if resistance > 20 then resistance := 20;
   end
   else begin
      mentality := mentality + j;
      if mentality <= 20 then j := 0
      else begin
         j := mentality - 20;
         mentality := 20;
      end;
      concentration := concentration + j;
      if concentration <= 20 then j := 0
      else begin
         j := concentration - 20;
         concentration := 20;
      end;
      resistance := resistance + j;
      if resistance > 20 then resistance := 20;
   end;
   SetColor(11);
   with player[1] do begin
      SetColor(11);
      str(strength,s);
      OutHPrintXY(115,225,chr(4)+' �A  �b : '+s,FALSE);
      str(mentality,s);
      OutHPrintXY(115,245,chr(4)+' �����b : '+s,FALSE);
      str(concentration,s);
      OutHPrintXY(115,265,chr(4)+' �����b : '+s,FALSE);
      str(endurance,s);
      OutHPrintXY(115,285,chr(4)+' �����b : '+s,FALSE);
      str(resistance,s);
      OutHPrintXY(115,305,chr(4)+' ���w�b : '+s,FALSE);
      SetColor(3);
      hp := endurance * 10;
      str(hp,s);
      OutHPrintXY(123,340,'�A�b   ���� : '+s,FALSE);
      sp := mentality * 10;
      if classtype = magic then str(sp,s) else str(0,s);
      OutHPrintXY(123,360,'�a��   ���� : '+s,FALSE);
      OutHPrintXY(123,380,'�A       �I : 1',FALSE);
   end;
   SetColor(11);
end;

Procedure Select_Ability2;
var
   transdata : array[1..5] of byte;

 Procedure writing(s : string);
 const
    xx = 8;
    yy = 16;
 begin
    gotoxy(wherex-1,wherey-1);
    bar(wherex*xx,wherey*yy,(wherex+length(s))*xx-1,(wherey+1)*yy-1);
    OutHPrintXY(wherex*xx,wherey*yy,s,FALSE);
 end;

begin
   SetColor(10);
   OutHPrintXY(320,225,'�q�a���e ���� : ',FALSE);
   TextColor(15);
   TextBackGround(1);
   gotoxy(57,15); writing('40');
   SetColor(14);
   OutHPrintXY(350,256,'�����  ==>',FALSE);
   OutHPrintXY(350,272,'���¬�  ==>',FALSE);
   OutHPrintXY(350,288,'З  ��  ==>',FALSE);
   SetColor(15);
   GotoXY(42,17); writing(^Z);
   for i := 17 to 19 do begin
      GotoXY(57,i); writing('0');
   end;
   j := 17; k := 40;
   for i:= 1 to 3 do transdata[i] := 0;
   repeat begin
      repeat until KeyPressed;
      c := ReadKey;
      x1 := 0; y1 := 0;
      if c=#0 then begin
         c := ReadKey;
         case c of
            #72 : y1 := -1;
            #80 : y1 := 1;
            #75 : x1 := -1;
            #77 : x1 := 1;
         end;
      end;
      if (y1<>0) then begin
         j := j + y1;
         if (j<17) or (j>19) then j := j - y1;
         GotoXY(42,j-y1); writing(' ');
         GotoXY(42,j); writing(^Z);
      end;
      if (x1<>0) then begin
         transdata[j-16] := transdata[j-16] + x1;
         k := k - x1;
         if (transdata[j-16]<0) or (transdata[j-16]>20) or (k<0) or (k>40) then
         begin
            transdata[j-16] := transdata[j-16] - x1;
            k := k + x1;
         end;
         GotoXY(57,15); writing('  ');
         str(k,s);
         GotoXY(57,15); writing(s);
         GotoXY(57,j); writing('  ');
         str(transdata[j-16],s);
         GotoXY(57,j); writing(s);
      end;
   end;
   until (c=#13) and (k=0);
   player[1].agility := transdata[1];
   player[1].accuracy := transdata[2];
   player[1].luck := transdata[3];
   SetColor(3);
   Bar(310,160,630,400);
   DirectVideo := TRUE;
   TextBackGround(0);
   SetFont(0);
end;

Procedure Put_Class;
const
   skill : array[sword..magic,1..6] of string[30] = (
           ('�A�e  �����A  ����á','���e  �����A  ����á','���a�e �����A ����á',
            '���e  �����A  ����á','�ẃ  �a�w    ����á','����  ��ʁ    ����á'),
           ('���b �a�� �w�b','�e�� �a�� �w�b','á�a �a�� �w�b',
            '�b�� �a�� �w�b','�� �a�e�b �w�b','���� �a�� �w�b'));
var
   x_pos, y_pos, x_choose, y_choose : integer;
   data : array[1..6] of byte;
   exist_point : byte;
   class_enable,aux_class_enable : array[1..7] of boolean;

 Procedure Skill_Line(x_pos,y_pos : integer; MainLine : boolean);
 var
    co : word;
 begin
    co := GetColor;
    if MainLine then SetColor(Yellow) else SetColor(LightGray);
    P(60,150+(y_pos-1)*20,skill[player[1].classtype,y_pos]);
    P(230,150+(y_pos-1)*20,':');
    Line(250,157+(y_pos-1)*20,250+x_pos*5,157+(y_pos-1)*20);
    SetColor(Blue);
    Line(250+x_pos*5,157+(y_pos-1)*20,640,157+(y_pos-1)*20);
    SetColor(co);
 end;

 Function Skill_Choose(var y_pos : integer) : integer;
 var
    i : integer;
    co : word;
    ok, change_class : boolean;
 begin
    if y_pos in [1..6] then y_pos := 1;
    for i := 1 to 6 do
    if i = y_pos then Skill_Line(data[i],i,TRUE)
    else Skill_Line(data[i],i,FALSE);
    ok := FALSE;
    repeat
       c := readkey;
       if c = #0 then c := readkey;
       case c of
          #77 : if exist_point > 0 then begin
                   inc(data[y_pos]);
                   dec(exist_point);
                end;
          #75 : if data[y_pos] > 0 then begin
                   dec(data[y_pos]);
                   inc(exist_point);
                end;
          #80 : begin
                   Skill_Line(data[y_pos],y_pos,FALSE);
                   if y_pos in [1..5] then inc(y_pos)
                   else y_pos := 1;
                end;
          #72 : begin
                   Skill_Line(data[y_pos],y_pos,FALSE);
                   if y_pos in [2..6] then dec(y_pos)
                   else y_pos := 6;
                end;
          '1'..'7' : ok := TRUE;
       end;
       Skill_Line(data[y_pos],y_pos,TRUE);
       with player[1] do begin
          sword_skill := data[1];
          axe_skill := data[2];
          spear_skill := data[3];
          bow_skill := data[4];
          shield_skill := data[5];
          fist_skill := data[6];
       end;
       for i := 1 to 7 do class_enable[i] := ReturnClassEnable(1,i);
       change_class := FALSE;
       for i := 1 to 7 do
          if class_enable[i] <> aux_class_enable[i] then change_class := TRUE;
       if change_class then begin
          co := GetColor;
          for i := 1 to 7 do begin
             if class_enable[i] then SetColor(White) else SetColor(DarkGray);
             player[1].class := i;
             P(60,300+(i-1)*20,chr(i+48)+'.'+ReturnClass(1));
          end;
          SetColor(co);
          move(class_enable,aux_class_enable,7);
       end;
       if ok then
          if not class_enable[ord(c)-48] then ok := FALSE;
       while keypressed do c := readkey;
    until ok;
    Skill_Choose := ord(c)-48;
 end;

begin
   Screen_Set;
   SetColor(LightCyan);
   x_pos := 200; y_pos := 20;
   P(x_pos,y_pos,   '�w���� ���q : '+player[1].name);
   P(x_pos,y_pos+20,'�w���� ���i : '+ ReturnSex(1));
   P(x_pos,y_pos+40,'�w���� ���i : '+ ReturnClassType(1));
   SetColor(LightGray);
   x_pos := 60; y_pos := 150;
   for i := 1 to 6 do P(x_pos,y_pos+(i-1)*20,skill[player[1].classtype,i]);
   x_pos := 60; y_pos := 300;
   if player[1].classtype = sword then j := 1 else j := 3;
   for i := 1 to 7 do begin
      if i <= j then SetColor(White) else SetColor(DarkGray);
      player[1].class := i;
      P(x_pos,y_pos+(i-1)*20,chr(i+48)+'.'+ReturnClass(1));
   end;
   for i := 1 to 6 do data[i] := 10;
   for i := 1 to 7 do
      if i <= j then aux_class_enable[i] := TRUE
      else aux_class_enable[i] := FALSE;
   y_pos := 1;
   exist_point := 0;
   player[1].class := Skill_Choose(y_pos);
end;

Function Save_Character : boolean;
var
   x_pos, y_pos, gap, x, y : integer;
begin
   Randomize;
   Screen_Set;
   SetColor(White);
   x_pos := 200; y_pos := 20; gap := 20;
   P(x_pos,y_pos+gap*0,'�w���� ���q : '+player[1].name);
   P(x_pos,y_pos+gap*1,'�w���� ���i : '+ ReturnSex(1));
   P(x_pos,y_pos+gap*2,'�w���� ���i : '+ ReturnClassType(1));
   P(x_pos,y_pos+gap*3,'�w���� ���s : '+ ReturnClass(1));

   SetColor(LightGreen);
   x_pos := 150; y_pos := 350;
   P(x_pos,y_pos,'�w���� �e�e ā����A �e�� �s���a ?');
   SetColor(LightGray);
   P(x_pos+50,y_pos+25,'�a���s���a   �a�����a');
   x := 1; y := 1;
   Choose(x_pos+42,y_pos+21,100,26,2,1,x,y,FALSE);
   if x = 1 then Save_Character := TRUE
   else Save_Character := FALSE;
   for i := 2 to 7 do fillchar(player[i],sizeof(player[i]),#0);
   for i := 2 to 7 do player[i].name := '';
   with player[1] do begin
      if classtype = sword then potential_ac := 2
      else potential_ac := 0;
      level := 1;
      poison := 0;
      unconscious := 0;
      dead := 0;
      hp := endurance * level * 10;
      if classtype = magic then sp := mentality * level * 10 else sp := 0;
      ac := 0;
      experience := 0;
      potential_experience := 0;
      weapon := 0;
      shield := 0;
      armor := 0;
      wea_power := 2;
      shi_power := 0;
      arm_power := 0;

   end;
   with party do begin
      year := 673;
      day := 326;
      hour := 16;
      min := 0;
      food := 0;
      gold := 0;
      arrow := 0;
      for i := 1 to 2 do checksum[i] := 0;
      for i := 1 to 10 do item[i] := 0;
      for i := 1 to 10 do crystal[i] := 0;
      for i := 1 to 6 do for j := 1 to 10 do BackPack[i,j] := 0;
      for i:= 1 to 100 do etc[i] := 0;
   end;
   mapname := 'Menace';
   Screen_Set;
end;

Function CreateCharacter : boolean;
begin
   Put_Name;
   Put_Sex;
   Select_Ability1;
   Select_Ability2;
   Put_Class;
   CreateCharacter := Save_Character;
end;
{
begin
   i := VGA;
   j := VGAHi;
   initgraph(i,j,'');
   CreateCharacter;
   closegraph;}
end.