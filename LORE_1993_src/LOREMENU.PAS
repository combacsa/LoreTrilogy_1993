Unit LoreMenu;

INTERFACE

Uses
   Crt, Dos, Graph, UHanX, LoreSub;

 Procedure AttackSpell;
 Procedure SPnotEnough;
 Procedure HealOne(whom : byte);
 Procedure CureOne(whom : byte);
 Procedure ConsciousOne(whom : byte);
 Procedure RevitalizeOne(whom : byte);
 Procedure HealAll;
 Procedure CureAll;
 Procedure ConscoisAll;
 Procedure RevitalizeAll;
 Procedure CureSpell;
 Procedure PhenominaSpell;
 Procedure ViewParty;
 Procedure ViewCharacter;
 Procedure QuickView;
 Procedure CastSpell;
 Function ReturnPredict : integer;
 Procedure Extrasense;
 Procedure Rest;
 Procedure GameOption;
 Procedure SelectMode;


IMPLEMENTATION

Procedure AttackSpell;
begin
   Talk('��ʁ ���a�a �a�����e ���b �a��i �a�w�i �� ���s���a.');
end;

Procedure SPnotEnough;
begin
   Talk('�a��a, �a�� �����a ���a�� �g�s���a.');
end;

Procedure HealOne(whom : byte);
begin
   with player[whom] do begin
      if (dead > 0) or (unconscious > 0) or (poison > 0) then begin
         if party.etc[6] = 0 then Print(7,name+'�e á�a�I �wȁ�a �a�����a.');
         exit;
      end;
      if hp >= endurance * level[1] then begin
         if party.etc[6] = 0 then Print(7,name+'�e á�a�i ϩ�a�a ���s���a.');
         exit;
      end;
   end;
   i := 2 * player[person].level[2];
   if player[person].sp < i then begin
      if party.etc[6] = 0 then SPnotEnough;
      exit;
   end;
   player[person].sp := player[person].sp - i;
   player[whom].hp := player[whom].hp + i * 3 div 2;
   with player[whom] do
   if hp > level[1] * endurance then hp := level[1] * endurance;
   Print(15,player[whom].name+'�e á�a�A�� �v�s���a.');
end;

Procedure CureOne(whom : byte);
begin
   with player[whom] do begin
      if (dead > 0) or (unconscious > 0) then begin
         if party.etc[6] = 0 then Print(7,name+'�e ���� á�a�I �wȁ�a �a�����a.');
         exit;
      end;
      if poison = 0 then begin
         if party.etc[6] = 0 then Print(7,player[whom].name+'�e ���A �韡�� �g�v�s���a.');
         exit;
      end;
   end;
   if player[person].sp < 15 then begin
      if party.etc[6] = 0 then SPnotEnough;
      exit;
   end;
   player[person].sp := player[person].sp - 15;
   player[whom].poison := 0;
   Print(15,player[whom].name+'�� ���e �A�� �A���s���a.');
end;

Procedure ConsciousOne(whom : byte);
begin
   with player[whom] do begin
      if dead > 0 then begin
         if party.etc[6] = 0 then Print(7,name+'�e ������ ���a�� �wȁ�a �a�����a.');
         exit;
      end;
      if unconscious = 0 then begin
         if party.etc[6] = 0 then Print(7,player[whom].name+'�e �������w�� �a�����a.');
         exit;
      end;
   end;
   i := 10 * player[whom].unconscious;
   if player[person].sp < i then begin
      if party.etc[6] = 0 then SPnotEnough;
      exit;
   end;
   player[person].sp := player[person].sp - i;
   player[whom].unconscious := 0;
   if player[whom].hp <= 0 then player[whom].hp := 1;
   Print(15,player[whom].name+'�e �����i �A�x�v�s���a.');
end;

Procedure RevitalizeOne(whom : byte);
begin
   if player[whom].dead = 0 then begin
      if party.etc[6] = 0 then Print(7,player[whom].name+'�e �a�� �i�a ���s���a.');
      exit;
   end;
   i := 30 * player[whom].dead;
   if player[person].sp < i then begin
      if party.etc[6] = 0 then SPnotEnough;
      exit;
   end;
   player[person].sp := player[person].sp - i;
   with player[whom] do begin
      dead := 0;
      if unconscious > endurance * level[1] then
         unconscious := endurance * level[1];
      if unconscious = 0 then unconscious := 1;
      Print(15,name+'�e �a�� ���w�i ����s���a.');
   end;
end;

Procedure HealAll;
var i : byte;
begin
   for i:= 1 to 6 do if player[i].name <> '' then HealOne(i);
end;

Procedure CureAll;
var i : byte;
begin
   for i:= 1 to 6 do if player[i].name <> '' then CureOne(i);
end;

Procedure ConscoisAll;
var i : byte;
begin
   for i:= 1 to 6 do if player[i].name <> '' then ConsciousOne(i);
end;

Procedure RevitalizeAll;
var i : byte;
begin
   for i:= 1 to 6 do if player[i].name <> '' then RevitalizeOne(i);
end;

Procedure CureSpell;
var
   i,j,whom : integer;
begin
   m[0] := '�����A�A';
   for i:= 1 to 6 do m[i] := player[i].name;
   j := 6;
   if player[6].name <> '' then j := 7;
   m[j] := '���e �a�q�i�A�A';
   whom := Select(60,j,j,TRUE,TRUE);
   if whom = 0 then exit;
   m[0] := '��Ȃ';
   if whom <> j then begin
      for i := 19 to 25 do m[i-18] := ReturnMagic(i);
      i := player[person].level[2] div 2 + 1;
      if i > 7 then i := 7;
      j := Select(60,i,7,FALSE,TRUE);
      if j = 0 then exit;
      case j of
         1 : HealOne(whom);
         2 : CureOne(whom);
         3 : begin
                CureOne(whom);
                HealOne(whom);
             end;
         4 : ConsciousOne(whom);
         5 : RevitalizeOne(whom);
         6 : begin
                ConsciousOne(whom);
                CureOne(whom);
                HealOne(whom);
             end;
         7 : begin
                RevitalizeOne(whom);
                ConsciousOne(whom);
                CureOne(whom);
                HealOne(whom);
             end;
      end;
   end
   else begin
      for i := 26 to 32 do m[i-25] := ReturnMagic(i);
      i := player[person].level[2] div 2 - 3;
      if i < 0 then begin
         print(7,player[person].name+'�e �w�e á�a �a��e �a�� ���a�w �s���a.');
         PressAnyKey;
         exit;
      end;
      j := Select(60,i,7,TRUE,TRUE);
      case j of
         1 : HealAll;
         2 : CureAll;
         3 : begin
                CureAll;
                HealAll;
             end;
         4 : ConscoisAll;
         6 : RevitalizeAll;
         5 : begin
                ConscoisAll;
                CureAll;
                HealAll;
             end;
         7 : begin
                RevitalizeAll;
                ConscoisAll;
                CureAll;
                HealAll;
             end;
      end;
   end;
   Print(7,''); Print(7,'');
   SimpleDisCond;
   PressAnyKey;
end;

Procedure PhenominaSpell;

 Procedure SPnotEnough;
 begin
    Message(7,'�a�� �����a ���a�� �g�s���a.');
 end;

var
   ok : boolean;
begin
   m[0] := '��Ȃ';
   for i := 1 to 8 do m[i] := ReturnMagic(i+32);
   if player[person].level[2] > 1 then j := player[person].level[2] div 2 + 1
   else j := 1;
   if j > 8 then j := 8;
   k := Select(60,j,8,TRUE,TRUE);
   if k = 0 then exit;
   case k of
      1 : begin
             if player[person].sp < 1 then begin
                SPnotEnough;
                exit;
             end;
             if party.etc[1] < 255 then inc(party.etc[1]);
             Message(15,'��З�e �a�� �����i �j�v�s���a.');
             dec(player[person].sp);
             Scroll(TRUE);
          end;
      2 : begin
             if player[person].sp < 5 then begin
                SPnotEnough;
                exit;
             end;
             Message(15,'��З�e �������w�� �����a.');
             party.etc[4] := 255;
             player[person].sp := player[person].sp - 5;
          end;
      3 : begin
             if player[person].sp < 10 then begin
                SPnotEnough;
                exit;
             end;
             Message(15,'��З�e ����i ��i�� ���s���a.');
             party.etc[2] := 255;
             player[person].sp := player[person].sp - 10;
          end;
      4 : begin
             if player[person].sp < 20 then begin
                SPnotEnough;
                exit;
             end;
             Message(15,'��З�e �|��i ��i�� ���s���a.');
             party.etc[3] := 255;
             player[person].sp := player[person].sp - 20;
          end;
      5 : begin
             if player[person].sp < 25 then begin
                SPnotEnough;
                exit;
             end;
             m[0] := '';
             Print(15,'<<<  �wз�i ��Ȃ�a����  >>>');
             m[1] := '����';
             m[2] := '�q��';
             m[3] := '����';
             m[4] := '�ὢ';
             for i := 1 to 4 do m[i] := m[i]+'�a�� ���� ����';
             k := Select(80,4,4,FALSE,TRUE);
             x1 := 0; y1 := 0;
             if k = 0 then exit;
             case k of
                1 : y1 := -1;
                2 : y1 := 1;
                3 : x1 := 1;
                4 : x1 := -1;
             end;
             x := x + 2*x1; y := y + 2*y1;
             if (x<5) or (x>=xmax-3) or (y<5) or (y>=ymax-3) then begin
                x := x - 2*x1; y := y - 2*y1;
                exit;
             end;
             ok := FALSE;
             case position of
                town : if map[x,y] in [0,27..47] then ok := TRUE;
                ground : if map[x,y] in[0,24..47] then ok := TRUE;
                den : if map[x,y] in[0,41..47] then ok := TRUE;
                keep : if map[x,y] in[0,40..47] then ok := TRUE;
             end;
             if not ok then begin
                x := x - 2*x1; y := y - 2*y1;
                Message(7,'���� ������ ɷ�a�� �g�s���a.');
                exit;
             end;
             player[person].sp := player[person].sp - 25;
             if (map[x-x1,y-y1] = 0) or
             ((position in [den,keep]) and (map[x+x1,y+y1] = 52)) then begin
                x := x - 2*x1; y := y - 2*y1;
                Message(13,'�i�����e ӱ�� �w���� �a��i �����s���a.');
             end
             else begin
                Message(15,'���� �����i �a�v�s���a.');
                Scroll(TRUE);
             end;
          end;
      6 : begin
             if party.map in [20,25,26] then begin
                Message(13,' �� ������ �b�� ӱ�� �� �a��i �wЁ�s���a.');
                exit;
             end;
             if player[person].sp < 30 then begin
                SPnotEnough;
                exit;
             end;
             m[0] := '';
             Print(15,'<<<  �wз�i ��Ȃ�a����  >>>');
             m[1] := '����';
             m[2] := '�q��';
             m[3] := '����';
             m[4] := '�ὢ';
             for i := 1 to 4 do m[i] := m[i]+'�A ���w �e��';
             x1 := 0; y1 := 0;
             k := Select(80,4,4,FALSE,TRUE);
             if k = 0 then exit;
             case k of
                1 : y1 := -1;
                2 : y1 := 1;
                3 : x1 := 1;
                4 : x1 := -1;
             end;
             case position of
                town : k := 47;
                ground : k := 41;
                den : k := 43;
                keep : k := 43;
             end;
             player[person].sp := player[person].sp - 30;
             if (map[x+x1,y+y1] = 0) or
             ((position in [den,keep]) and (map[x+x1,y+y1] = 52)) then begin
                x1 := 0; y1 := 0;
                Message(13,'�i�����e ӱ�� �w���� �a��i �����s���a.');
             end
             else begin
                map[x+x1,y+y1] := k;
                Message(15,'���w �e���A ����Ж�s���a.');
                Scroll(TRUE);
             end;
          end;
      7 : begin
             if party.map in [20,25,26] then begin
                Message(13,' �� ������ �b�� ӱ�� �� �a��i �wЁ�s���a.');
                exit;
             end;
             if player[person].sp < 50 then begin
                SPnotEnough;
                exit;
             end;
             m[0] := '';
             Print(15,'<<<  �wз�i ��Ȃ�a����  >>>');
             m[1] := '����';
             m[2] := '�q��';
             m[3] := '����';
             m[4] := '�ὢ';
             for i := 1 to 4 do m[i] := m[i]+'�a�� ���e����';
             x1 := 0; y1 := 0;
             k := Select(80,4,4,FALSE,TRUE);
             if k = 0 then exit;
             case k of
                1 : y1 := -1;
                2 : y1 := 1;
                3 : x1 := 1;
                4 : x1 := -1;
             end;
             Print(11,'�w���� ���e �����b�i ����');
             setcolor(15);
             HGotoXY(266,70);
             HPrint('## ');
             setcolor(10);
             HPrint('5000');
             setcolor(15);
             HPrint(' ���e �����b');
             setcolor(10);
             k := 5;
             ok := FALSE;
             repeat begin
                j := 0;
                c := readkey;
                if c in [#13,#27] then ok := TRUE;
                if c = #0 then begin
                   c := readkey;
                   case c of
                      #75,#80 : j := -1;
                      #72,#77 : j := 1;
                   end;
                   if j <> 0 then begin
                      k := k + j;
                      if (k<1) or (k>9) then k := k - j
                      else begin
                         str(k,s);
                         setfillstyle(1,8);
                         bar(290,70,297,86);
                         HPrintXY(290,70,s);
                      end;
                   end;
                end;
             end;
             until ok;
             if c = #27 then begin
                Clear;
                exit;
             end;
             x := x + k*x1; y := y + k*y1;
             if (x<5) or (x>=xmax-3) or (y<5) or (y>=ymax-3) then begin
                x := x - k*x1; y := y - k*y1;
                Message(7,'���e ������ ɷ�a�� �g�s���a.');
                exit;
             end;
             ok := FALSE;
             case position of
                town : if map[x,y] in [27..47] then ok := TRUE;
                ground : if map[x,y] in [24..47] then ok := TRUE;
                den : if map[x,y] in [41..47] then ok := TRUE;
                keep : if map[x,y] in [27..47] then ok := TRUE;
             end;
             if not ok then begin
                x := x - k*x1; y := y - k*y1;
                Message(7,'���e ���� �w���� �����s �s���a.');
                exit;
             end;
             player[person].sp := player[person].sp - 50;
             if (map[x,y] = 0) or
             ((position in [den,keep]) and (map[x+x1,y+y1] = 52)) then begin
                x := x - k*x1; y := y - k*y1;
                Message(13,'�i�����e ӱ�� �w���i �����s���a.');
             end
             else begin
                Message(15,'���e ���� �a�� ����Ж�s���a.');
                Scroll(TRUE);
             end;
          end;
      8 : begin
             if player[person].sp < 30 then begin
                SPnotEnough;
                exit;
             end;
             j := 0;
             for i := 1 to 6 do if player[i].name <> '' then inc(j);
             if party.food + j > 255 then party.food := 255
             else party.food := party.food + j;
             player[person].sp := player[person].sp - 30;
             str(j,s);
             for i := 0 to 1 do begin
                page := 1 - page;
                setactivepage(page);
                hany := 30;
                Print(15,' ���� �A�� �a��e ������a�� ��З�A���s���a');
                hany := hany + 20;
                str(j,s);
                Print(15,'            '+s+' ���� ������ �w�a�Q');
                hany := hany + 30;
                str(party.food,s);
                Print(11,'      ��З�� �e�� �����e '+s+' �� �����a');
             end;
          end;
   end;
   displaySP;
end;

Procedure ViewParty;

 Procedure ViewPartySub(i:integer);
 begin
    s := ' �a�w'; if party.etc[i] = 0 then s := ' ���a';
 end;

begin
   setcolor(7);
   with party do
   for i := 0 to 1 do begin
      SetActivePage(i);
      str(x,s); HPrintXY(250,45,'X  = '+s);
      str(y,s); HPrintXY(250,60,'Y  = '+s);
      str(food,s); HPrintXY(250,80,'�q�e ���� = '+s);
      str(gold,s); HPrintXY(250,95,'�q�e �׋q = '+s);
      ViewPartySub(1);
      HPrintXY4Select(250,115,'�a�� ���� :'+s);
      ViewPartySub(4);
      HPrintXY4Select(250,130,'���� ���w   :'+s);
      ViewPartySub(2);
      HPrintXY4Select(250,145,'����i ��q :'+s);
      ViewPartySub(3);
      HPrintXY4Select(250,160,'�|��i ��q :'+s);
   end;
end;

Procedure ViewCharacter;
begin
   Clear;
   hany := 30;
   print(15,'�w�b�i �������e �����i ��Ȃ�a����');
   i := ChooseWhom(FALSE);
   Clear;
   if i = 0 then Exit;
   with player[i] do begin
      setcolor(11);
      HPrintXY4Select(240,30,'# ���q : '+name);
      HPrintXY4Select(240,46,'# ���i : '+ReturnSex(i));
      HPrintXY4Select(240,62,'# ���s : '+ReturnClass(i));
      setcolor(3);
      str(strength,s);
      HPrintXY4Select(244,88,'�A�b   : '+s);
      str(mentality,s);
      HPrintXY4Select(434,88,'�����b : '+s);
      str(concentration,s);
      HPrintXY4Select(244,104,'�����b : '+s);
      str(endurance,s);
      HPrintXY4Select(434,104,'�����b : '+s);
      str(resistance,s);
      HPrintXY4Select(244,120,'���w�b : '+s);
      str(agility,s);
      HPrintXY4Select(434,120,'����� : '+s);
      str(luck,s);
      HPrintXY4Select(244,136,'З��   : '+s);
      setcolor(14);
      HPrintXY4Select(250,180,'�a��ǡ�a ���a������ ...');
      c := readkey;
      if c = #0 then c := readkey;
      SetfillStyle(1,8);
      bar(244,88,610,196);
      for j := 0 to 1 do begin
         SetActivePage(page);
         page := 1 - page;
         setcolor(11);
         HPrintXY4Select(240,30,'# ���q : '+name);
         HPrintXY4Select(240,46,'# ���i : '+ReturnSex(i));
         HPrintXY4Select(240,62,'# ���s : '+ReturnClass(i));
         setcolor(3);
         str(accuracy[1],s);
         HPrintXY4Select(244,88,'������ ���¬�   : '+s);
         str(accuracy[2],s);
         HPrintXY4Select(244,104,'�����b�� ���¬� : '+s);
         str(accuracy[3],s);
         HPrintXY4Select(244,120,'���q�b�� ���¬� : '+s);
         str(level[1],s);
         HPrintXY4Select(434,88, '��ʁ �A�I   : '+s);
         str(level[2],s);
         HPrintXY4Select(434,104,'�a�� �A�I   : '+s);
         str(level[3],s);
         HPrintXY4Select(434,120,'���q�b �A�I : '+s);
         str(experience,s);
         HPrintXY4Select(244,136,'## �w��á   : '+s);
         setcolor(2);
         HPrintXY4Select(244,160,'�a�w ���� - '+ReturnWeapon(player[i].weapon));
         if player[i].shield <> 0 then
            HPrintXY4Select(244,176,'�ẃ - '+ReturnShield(i)+' �ẃ');
         if player[i].armor <> 0 then
            HPrintXY4Select(434,176,'�s�� - '+ReturnArmor(i)+' �s��');
      end;
   end;
end;

Procedure QuickView;
var
   color : integer;
begin
   color := GetColor;
   for i:= 0 to 1 do begin
      SetActivePage(i);
      setcolor(15);
      HPrintXY(280,40,'���q');
      setcolor(12);
      HPrintXY(400,40,' ���� �������w ���q');
   end;
   setcolor(7);
   for i := 0 to 1 do begin
      SetActivePage(i);
      for j:= 1 to 6 do
      with player[j] do
      if name <> '' then begin
         HPrintXY4Select(250,60+j*15,name);
         str(poison,s);
         HPrintXY4Select(424,60+j*15,s);
         str(unconscious : 3,s);
         HPrintXY4Select(464,60+j*15,s);
         str(dead : 5,s);
         HPrintXY4Select(500,60+j*15,s);
      end;
   end;
   SetActivePage(1-page);
end;

Procedure CastSpell;
begin
   person := ChooseWhom(FALSE);
   if person = 0 then exit;
   if not exist(person) then begin
      ReturnSexData;
      Message(7,SexData+'�e �a��i �a�w�i�����e �wȁ�a �a�����a');
      exit;
   end;
   m[0] := '�a�w�i �a�� ���A ===>';
   m[1] := '���b �a��';
   m[2] := 'á�a �a��';
   m[3] := '�e�� �a��';
   k := Select(80,3,3,TRUE,TRUE);
   case k of
      1 : AttackSpell;
      2 : CureSpell;
      3 : PhenominaSpell;
   end;
end;

Function ReturnPredict : integer;
var
   Return : integer;
begin
   Return := 0;
   with party do begin
      case etc[10] of
         0..2 : Return := 1;
         3 : Return := 2;
         4,5 : Return := 3;
         6 : Return := 4;
      end;
      if Return = 4 then if map = 7 then Return := 5;
      case etc[13] of
         1 : Return := 6;
         2 : Return := 7;
         3 : Return := 8;
      end;
      if etc[13] = 3 then
      case etc[14] of
         0 : Return := 9;
         1 : Return := 10;
         2 : Return := 11;
         3 : Return := 9;
         4 : Return := 12;
         5 : Return := 11;
         6 : Return := 13;
      end;
      if etc[14] = 6 then if map = 16 then Return := 14;
      if (etc[14]=6) and (map=2) then Return := 13
      else if Return = 13 then
      case etc[15] of
         0 : Return := 15;
         1 : Return := 16;
         2 : Return := 15;
         3 : Return := 17;
         4 : Return := 15;
         5 : Return := 18;
      end;
      if (map = 13) and not (odd(party.etc[40]) or odd(party.etc[40])) then
         Return := 19;
      if etc[15] = 5 then begin
         if map in [4,19..21] then Return := 20;
         if odd(party.etc[40]) and odd(party.etc[41]) then Return := 21
      end;
      if map = 5 then Return := 22;
      if (etc[15] = 5) and (map > 21) then
      case map of
         22,24 : Return := 22;
         23 : Return := 23;
         25 : Return := 24;
         26 : Return := 25;
      end;
   end;
   ReturnPredict := Return;
end;

Procedure Extrasense;

 Procedure ESPnotEnough;
 begin
    Message(7,'ESP �����a ���a�� �g�s���a.');
 end;

const
   Predict_Data : array [1..25] of string =
                  ('Lord Ahn �i �e�i',
                   'MENACE�i �q���i',
                   'Lord Ahn�A�A �a�� ���a�i',
                   'LASTDITCH�� �i',
                   'LASTDITCH�� �����i �e�i',
                   'PYRAMID ���� Major Mummy�i ����é',
                   'LASTDITCH�� �����A�A�� ���a�i',
                   'LASTDITCH�� GROUND GATE�� �i',
                   'GAIA TERRA�� �����i �e�i',
                   'EVIL SEAL�A�� �׋q�� �����i �i�e�i',
                   'GAIA TERRA�� �����A�A ���a�i',
                   'QUAKE�A�� ArchiGagoyle�i ����é',
                   '�������� WIVERN �����A �i',
                   'WATER FIELD�� �i',
                   'WATER FIELD�� �����i �e�i',
                   'NOTICE ���� Hidra�i ����é',
                   'LOCKUP ���� Dragon�i ����é',
                   'GAIA TERRA �� SWAMP GATE�� �i',
                   '�ὢ�� �A���a�i ɷЁ SWAMP KEEP�a�� �i',
                   'SWAMP ���B�A �����a�e ������ �����i Ή',
                   'SWAMP KEEP�� �a�a �A���a�i �b�� ��ǩ',
                   '�ⷁ ���i���� EVIL CONCENTRATION�a�� �i',
                   '���a�� �ⷁ �a���b �a���� �i��i',
                   '�ὢ�� �����A�� Necromancer�i �e�i',
                   'Necromancer�� �a���b �i��i �鷩');

var
   i,j,k : integer;
label
   Exit_For;
begin
   Clear;
   person := ChooseWhom(FALSE);
   if person = 0 then exit;
   if not exist(person) then begin
      ReturnSexData;
      Message(7,SexData+'�e ���q�b�i �a�w�i�����e �wȁ�a �a�����a');
      exit;
   end;
   if not ((player[person].class in [2,3,6]) or (party.etc[38] and bit1 > 0)) then begin
      Talk('�w���A�A�e �a�� �w�b�� ���s���a.');
      exit;
   end;
   m[0] := '�a�w�i ���q�b�� ���A ===>';
   for j := 1 to 5 do m[j] := ReturnMagic(j+40);
   k := Select(74,5,5,TRUE,TRUE);
   if k = 5 then begin
      Message(7,ReturnMagic(k+40)+'�e ��ʁ ���a�A��e �a�w�S���a.');
      exit;
   end;
   case k of
      1 : begin
             if party.map > 24 then begin
                Message(13,' �� ������ �b�� ӱ�� �� �a��i �wЁ�s���a.');
                exit;
             end;
             if player[person].esp < 10 then begin
                ESPnotEnough;
                exit;
             end;
             Aux := SoundOn;
             SoundOn := FALSE;
             move(font^[0],font^[55],246);
             for i := 5 to 246 do font^[0,i] := 0;
             if position in [den,keep] then begin
                move(font^[52],chara^[55],246);
                for i := 5 to 246 do font^[52,i] := 0;
             end;
             Scroll(TRUE);
             Print(15,'��З�e ����i ʁ���a�� ���a.');
             PressAnyKey;
             move(font^[55],font^[0],246);
             if position in [den,keep] then move(chara^[55],font^[52],246);
             Scroll(TRUE);
             SoundOn := Aux;
             player[person].esp := player[person].esp - 10;
          end;
      2 : begin
             if player[person].esp < 5 then begin
                ESPnotEnough;
                exit;
             end;
             Print(7,' �w���e �w���� �����i �����e�a ...');
             Print(7,'');
             k := ReturnPredict;
             if k in [1..25] then
                s := '�w���e ' + Predict_Data[k] + ' �����a'
             else
                s := '�w���e ��� ӱ�A ��Ё ����i �wЁ �h�� ���a';
             cPrint(10,15,' # ',s,'');
             player[person].esp := player[person].esp - 5;
             PressAnyKey;
          end;
      3 : begin
             if player[person].esp < 20 then begin
                ESPnotEnough;
                exit;
             end;
             Message(15,'�w���e �q�����e �a�e �a�q�� �a�q�i ���i�� ���a.');
             party.etc[5] := 3;
          end;
      4 : begin
             if party.map > 24 then begin
                Message(13,' �� ������ �b�� ӱ�� �� �a��i �wЁ�s���a.');
                exit;
             end;
             if player[person].esp < player[person].level[3] * 5 then begin
                ESPnotEnough;
                exit;
             end;
             m[0] := '';
             Print(15,'<<<  �wз�i ��Ȃ�a����  >>>');
             m[1] := '����';
             m[2] := '�q��';
             m[3] := '����';
             m[4] := '�ὢ';
             for i := 1 to 4 do m[i] := m[i]+'�a�� �埡�e�i �a�w';
             k := Select(80,4,4,FALSE,TRUE);
             x1 := 0; y1 := 0;
             if k = 0 then exit;
             player[person].esp := player[person].esp - player[person].level[3] * 5;
             case k of
                1 : y1 := -1;
                2 : y1 := 1;
                3 : x1 := 1;
                4 : x1 := -1;
             end;
             party.xaxis := x; party.yaxis := y;
             Aux := SoundOn;
             SoundOn := FALSE;
             for i := 0 to 1 do begin
                page := 1 - page;
                setactivepage(page);
                hany := 30;
                print(15,'�埡�e�� �a�w�� ...');
                setcolor(14);
                HPrintXY4Select(250,184,'�a��ǡ�a ���a���� ...');
             end;
             for i := 1 to player[person].level[3] do begin
                x := x + x1; y := y + y1;
                if (x<5) or (x>=xmax-3) or (y<5) or (y>=ymax-3) then begin
                   x := x - x1; y := y - y1;
                end
                else begin
                   Scroll(FALSE);
                   c := readkey;
                   if c = #0 then c := readkey;
                   if c = #27 then goto Exit_For;
                end;
             end;
Exit_For:
             Clear;
             x := party.xaxis; y := party.yaxis;
             SoundOn := Aux;
             Scroll(TRUE);
          end;
   end;
   DisplayESP;
end;

Procedure Rest;
begin
   Clear;
   for person := 1 to 6 do
   with player[person] do
   if name <> '' then begin
      if sex = male then s := '�a��' else s := '�a�a��';
      if party.food <= 0 then Print(4,'��З�e ������ �a�b�v�a')
      else if dead > 0 then Print(7,name+'�e �����a')
      else if (unconscious>0) and (poison=0) then begin
         unconscious := unconscious - level[1] - level[2] - level[3];
         if unconscious <= 0 then begin
            Print(15,name+'�e ������ �A���A���a');
            unconscious := 0;
            if hp <= 0 then hp := 1;
            dec(party.food);
         end
         else Print(15,name+'�e �a��ӡ ���� ���w���a');
      end
      else if (unconscious>0) and (poison>0) then
         Print(7,'�������A, '+name+' '+s+' �����e �A���A�� �g�v�a')
      else if poison > 0 then
         Print(7,'�������A, '+name+' '+s+' ��w�e �A���A�� �g�v�a')
      else begin
         i := (level[1]+level[2]+level[3]) * 2;
         if hp >= endurance * level[1] then if party.food < 255 then inc(party.food);
         hp := hp + i;
         if hp >= endurance * level[1] then begin
            hp := endurance * level[1];
            Print(15,name+'�e ���e ��w�� �A���A���a');
         end
         else Print(15,name+'�e á�a�A���a');
         dec(party.food);
      end;
   end;
   if party.etc[1] > 0 then dec(party.etc[1]);
   for i := 2 to 4 do party.etc[i] := 0;
   for i := 1 to 6 do with player[i] do if name <> '' then begin
      sp := mentality * level[2];
      esp := concentration * level[3];
   end;
   SimpleDisCond;
   PressAnyKey;
end;

Procedure GameOption;
begin
   m[0] := '�A�� ��Ȃ �w��';
   m[1] := '�e���� ����';
   m[2] := '���� ��З�� ���� ���i';
   m[3] := '��З�A�� �A�A ��Ǳ';
   m[4] := '���巁 �A���i ����';
   m[5] := '�e���� �A���i ��w';
   m[6] := '�A���i �añ';
   k := Select(60,6,6,TRUE,TRUE);
   case k of
      1 : begin
             setcolor(12);
             HPrintXY(255,40,'�e��A �e�a�e ��i��');
             HPrintXY(287,56,'�A��á�i �����a������');
             m[0] := '';
             for i:= 1 to 5 do begin
               str(i+2,s); m[i] := s+' �w�� ��i';
             end;
             maxenemy^ := Select(90,5,5,FALSE,TRUE)+2;
             if maxenemy^ = 2 then maxenemy^ := 5;
             setcolor(12);
             m[0] := '��З�i�� ���q ���b�e ����s���a ?';
             m[1] := '������ ��ʁ�i ϡ�a�� ���a';
             m[2] := '�ᢁ �x�e ��ʁ�e ���a�� �g�e�a';
             m[3] := '�a��å ����e ��ʁ�i �a�V�a';
             m[4] := '�����e ��i���e ���� ��ʁ�a�V�a';
             m[5] := '�a�i�e ϡ�A �����a ���a';
             encounter^ := Select(71,5,5,FALSE,TRUE);
             if encounter^ = 0 then encounter^ := 3;
             encounter^ := 6 - encounter^;
          end;
      2 : begin
             setcolor(12);
             HPrintXY(240,30,'�e���� ������ ��ʁ ����i ���i �a������.');
             setcolor(11);
             HPrintXY(255,70,'����i �a�� ����');
             m[0] := '';
             for i := 2 to 5 do
                if player[i].name <> '' then m[i-1] := player[i].name
                else m[i-1] := 'Reserved';
             j := select(95,4,4,FALSE,FALSE) + 1;
             if j = 1 then begin
                clear; exit;
             end;
             setcolor(11);
             HPrintXY(445,70,'����i �a�� ����');
             for i := 2 to 5 do m[i-1] := '                        '+m[i-1];
             k := select(95,4,4,FALSE,FALSE) + 1;
             if k = 1 then begin
                clear; exit;
             end;
             move(player[j],player[7],55);
             move(player[k],player[j],55);
             move(player[7],player[k],55);
             Display_Condition;
             clear;
          end;
      3 : begin
             setcolor(12);
             HPrintXY(245,35,'��З�A�� �A�A ��ǡ�� ���e �a�q�i ���a������.');
             m[0] := '';
             for i := 2 to 6 do
                if player[i].name <> '' then m[i-1] := player[i].name
                else m[i-1] := 'Reserved';
             k := select(75,5,5,FALSE,TRUE) + 1;
             if k = 1 then begin
                clear; exit;
             end;
             player[k].name := '';
             Display_Condition;
          end;
      4 : begin
             m[0] := '���� ���� ���e �A���i ��Ȃ�a������.';
             m[1] := '���s���a';
             m[2] := '�� �A�� �A���a';
             m[3] := '�A�� �A���a 1 (��)';
             m[4] := '�A�� �A���a 2 (��)';
             m[5] := '�A�� �A���a 3 (��)';
             k := select(65,5,5,FALSE,TRUE);
             if k < 2 then exit;
             LoadNo := chr(k+47);
             setcolor(11);
             HPrintXY(280,80,'��wЖ�� �A���i �a�� ���ᵳ���a');
             LoadFont := FALSE; Load; Scroll(TRUE); Display_Condition;
             LoadNo := '1';
             Clear;
          end;
      5 : begin
             m[0] := '�A���� ��w �w���i ��Ȃ�a������.';
             m[1] := '���s���a';
             m[2] := '�� �A�� �A���a';
             m[3] := '�A�� �A���a 1 (��)';
             m[4] := '�A�� �A���a 2 (��)';
             m[5] := '�A�� �A���a 3 (��)';
             k := select(65,5,5,FALSE,TRUE);
             if k < 2 then exit;
             LoadNo := chr(k+47);
             setcolor(12);
             HPrintXY(312,80,'�e���� �A���i ��w�s���a');
             Save;
             setcolor(7);
             HPrintXY(360,102,'����Ж�s���a');
             LoadNo := '1';
             PressAnyKey;
          end;
      6 : GameOver;
   end;
end;

Procedure SelectMode;
begin
   m[0] := '�w���� �w�w�i ���a���� ===>';
   m[1] := '��З�� �w�׷i ���a';
   m[2] := '������ �w�׷i ���a';
   m[3] := '��З�� ��w �wȁ�i ���a';
   m[4] := '�a��i �a�w�e�a';
   m[5] := '���w�b�i �a�w�e�a';
   m[6] := '�a���� ��a';
   m[7] := '�A�� ��Ȃ �w��';
   k := Select(60,7,7,TRUE,TRUE);
   case k of
      0 : exit;
      1 : ViewParty;
      2 : ViewCharacter;
      3 : QuickView;
      4 : CastSpell;
      5 : Extrasense;
      6 : Rest;
      7 : GameOption;
   end;
end;

begin
end.