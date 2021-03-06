Unit LoreCret;

INTERFACE

Uses
   Crt, Dos, Graph, AdLib, UHanX, LoreSub;
Const
   CharacterName : array[1..10] of string[17] = ('Hercules','Titan','Merlin','Betelgeuse',
         'Genius Kie','Bellatrix','Regulus','Procyon','Arcturus','Algol');
   Character : array[1..10,1..10] of byte = (
              {   S C St Me Co En Re Ag Ac Lu   }
                ( 0,1,17,05,05,17,11,15,15,10 )
               ,( 0,1,14,05,07,14,14,16,17,07 )
               ,( 0,2,11,19,14,05,05,07,18,15 )
               ,( 1,2,14,17,05,07,07,11,15,14 )
               ,( 0,4,14,11,07,11,11,11,20,09 )
               ,( 1,4,14,11,05,11,14,14,15,11 )
               ,( 0,5,19,05,05,17,07,15,13,11 )
               ,( 0,5,17,05,05,17,11,17,14,09 )
               ,( 0,6,07,05,11,11,19,18,07,15 )
               ,( 1,6,11,05,07,14,17,17,09,16 ));
var
   transdata : array[1..10] of byte;

 Function CreateCharacter : boolean;


IMPLEMENTATION

Procedure WhatClass(i : integer;var s : string);
begin
   case i of
      1 : s := '���a';
      2 : s := '�a��a';
      3 : s := '�A�a��';
      4 : s := '��a';
      5 : s := '��ʁ�w';
      6 : s := '���a';
      7 : s := '�a����';
      8 : s := '�ᕩ��';
      9 : s := 'ѥ�w';
      10 : s := '�e��'
      else s := '���¯��q';
   end;
end; { WhatClass }

Procedure Display;
begin
   RGB(1,0,0,31);
   SetPalette(1,1);
   SetBkColor(1);
   ClearDevice;
   RGB(9,0,0,31);
   SetPalette(9,9);
   SetColor(9);
   Rectangle(1,1,639,479);
   Rectangle(3,3,637,477);
   Rectangle(4,4,636,476);
   Rectangle(6,6,634,474);
   Rectangle(9,150,631,153);
   for i:=0 to 63 do begin
      RGB(9,i,0,32- i div 2);
      Delay(20);
   end;
   for i:=0 to 63 do begin
      RGB(9,63-i,0,i);
      Delay(20);
   end;
   RGB(5,0,0,31);
   RGB(13,0,0,31);
   RGB(11,0,0,31);
   SetPalette(13,13);
   SetPalette(11,11);
   s := '���a�e ������ ����  �A 1 ��';
   SetColor(5);
   eHPrint(110,45,s);
   SetColor(13);
   eHPrint(108,35,s);

   SetColor(11);
   bHPrint(169,100,'ā���� �e�i�� �a���a��   �A 1.5 �e');
   for i:=0 to 31 do begin
      RGB(5,i,0,31);
      RGB(13,i*2,0,31+i);
      RGB(11,0,i*2,31+i);
      RGB(1,0,i div 3,31 - i div 3);
      Delay(80);
   end;
end; { Display }

Procedure Name;
begin
   DirectVideo := FALSE;
   TextColor(14);
   SetBkColor(1);
   SetColor(14);
   cHPrint(15,177,'�w���� ���q�e :');
   gotoxy(19,12); write('[]');
   s := '';
   i := 0;
   repeat begin
      inc(i);
      c := ReadKey;
      if c=#0 then begin
         c := ReadKey;
         c := #0;
         dec(i);
      end;
      if c=#8 then begin
         c := #0;
         dec(i);
      end;
      if (c<>#13) and (c<>#27) and (c<>#0) then begin
         s := s + c;
         GotoXY(19+i,12); write(c,']');
      end;
      if (c=#27) or (i>16) then begin
         i := 0; s := '';
         SetFillStyle(1,1);
         Bar(138,176,350,191);
         GotoXY(19,12); write('[]');
      end;
      if (c=#13) and (s='') then begin
         c := #0; i := 0;
      end;
   end;
   until c=#13;
   SetFillStyle(1,1);
   Bar(30,176,350,196);
   SetColor(10);
   cHPrint(15,177,'�w���e '+s+' �����a.');
   player[1].name := s;
   SetColor(14);
   cHPrint(15,197,'�w���� ���i�e : [ �q�� (M), �a�� (F) ] ');
   repeat c := UpCase(ReadKey) until (c='M') or (c='F');
   player[1].sex := male; s := '�q��';
   if c='F' then begin
      player[1].sex := female;
      s := '�a��';
   end;
   SetColor(10);
   Bar(118,196,350,216);
   cHPrint(15,197,'�w���� ���i�e '+s+' �����a.');
end; { Name }

Procedure Profile(number : integer);
var
   c : char;
begin
   SetFillStyle(0,1);
   Bar(310,160,630,400);
   SetColor(15);
   bHPrint(320,165,'�a �a�q�� �w�b ��á ---');
   SetColor(14);
   cHPrint(344,200,'# ���q : ' + charactername[number]);
   s := '�q��';
   if character[number,1] = 1 then s := '�a��';
   cHPrint(344,216,'# ���i : ' + s);
   WhatClass(character[number,2],s);
   cHPrint(344,232,'# ���s : ' + s);
   SetColor(11);
   str(character[number,3],s);
   OutHPrintXY(330,270,'�A  �b : '+s,FALSE);
   str(character[number,4],s);
   OutHPrintXY(330,286,'�����b : '+s,FALSE);
   str(character[number,5],s);
   OutHPrintXY(330,302,'�����b : '+s,FALSE);
   str(character[number,6],s);
   OutHPrintXY(330,318,'�����b : '+s,FALSE);
   str(character[number,7],s);
   OutHPrintXY(330,334,'���w�b : '+s,FALSE);
   str(character[number,8],s);
   OutHPrintXY(500,286,'����� : '+s,FALSE);
   str(character[number,9],s);
   OutHPrintXY(500,302,'���¬� : '+s,FALSE);
   str(character[number,10],s);
   OutHPrintXY(500,318,'З  �� : '+s,FALSE);
   str(character[number,6],s);
   OutHPrintXY(330,360,'�A�b   ���� : '+s,FALSE);
   str(character[number,4],s);
   OutHPrintXY(330,376,'�a��   ���� : '+s,FALSE);
   str(character[number,5],s);
   OutHPrintXY(330,392,'���q�b ���� : '+s,FALSE);
   OutHPrintXY(330,408,'�w �� �� �� : 0',FALSE);
   OutHPrintXY(330,424,'�� ʁ �A �I : 1',FALSE);
   repeat until KeyPressed;
   c := ReadKey;
end; { Profile }

Procedure First;

 Procedure Which;
 begin
    repeat c := readkey;
    until c in ['1'..'3'];
 end;

 Procedure erase;
 begin
    Bar(80,320,630,450);
 end;

begin
   SetColor(15);
   SetFillStyle(0,1);
   for i := 1 to 5 do transdata[i] := 0;
   OutHPrintXY(160,250,'���q ����e ���e �i�A ���s�i Ё ��������.',FALSE);
   OutHPrintXY(120,270,'�a����, �a���A�A �x�e �s�i �������A ���� ��������.',FALSE);
   SetColor(11);
   OutHPrintXY(80,320,'�w���� �e �q���A �����a�� ���i�� �c�A�� ���e �����a �i�v�a',FALSE);
   OutHPrintXY(160,350,'1] �c�a�� �a�a�� �i�a���a',FALSE);
   OutHPrintXY(160,370,'2] �a �����a �������a ���b�i �e�a',FALSE);
   OutHPrintXY(160,390,'3] �����A�e �i���e�a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[2]);
   if c = '3' then inc(transdata[3]);
   Erase;
   OutHPrintXY(80,320,'�w���e �A�b�w �����i�����A�� ͡���i �� ���e �e �a��i �q�a ����',FALSE);
   OutHPrintXY(80,340,'�᷁ �i�� �wȁ�a �A���a',FALSE);
   OutHPrintXY(160,370,'1] ӱ�a�� ���� �a�e�a',FALSE);
   OutHPrintXY(160,390,'2] �����b�a�� ��ˡ�a �i���a',FALSE);
   OutHPrintXY(160,410,'3] �a���� �aȁ�a���� �a�e�a���� �i���a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[2]);
   if c = '3' then inc(transdata[4]);
   Erase;
   OutHPrintXY(80,320,'�w���e �� �A�� ���A�� ��i�A�A �Ÿ�ӡ ͡��A�� �w�e ���� �a����',FALSE);
   OutHPrintXY(80,340,'���a',FALSE);
   OutHPrintXY(160,370,'1] ӱ�� �q�a ���e�e ���i���a�� �a���a',FALSE);
   OutHPrintXY(160,390,'2] �e�a���a�� �i�i �a�w���i �x�e�a',FALSE);
   OutHPrintXY(160,410,'3] ���e �a���e�� �a�� �w��i ���b�e�a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[2]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'�w���e ���� ���s�e ���s�i Ή�ᴡ�a�e ���� ���v�a',FALSE);
   OutHPrintXY(160,350,'1] �i�� ���s�i �i�a �៥�a',FALSE);
   OutHPrintXY(160,370,'2] ���s�� �{���� ���� �a�e�a�e Ґ�ᥥ�a',FALSE);
   OutHPrintXY(160,390,'3] �἖�e ���� Ή�a�� ���i �����a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[4]);
   Erase;
   OutHPrintXY(80,320,'���� ���e�i ���a�� �w���e �s�b�a�� ���b�i �e�e�a',FALSE);
   OutHPrintXY(160,350,'1] �w�w�e �a�ỡ ϡ�i���i �x�a ��a',FALSE);
   OutHPrintXY(160,370,'2] ñ�b�a�A ����i �i�a �e���e���i �x�e�a',FALSE);
   OutHPrintXY(160,390,'3] ���b �����e �a�� �e���a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'���e�A �����a�� �i�a�a�e�A �a���� �e�e ���� ����� �i����',FALSE);
   OutHPrintXY(80,340,'�g�e�a',FALSE);
   OutHPrintXY(160,370,'1] �a�e �i���i �x�a�e�a',FALSE);
   OutHPrintXY(160,390,'2] 1] ��� �{�e ���¯��e ����i �a�e�� ���a�e �¯��e ',FALSE);
   OutHPrintXY(160,410,'   �i���� �� ���i �{�a�� �i�a�e�a',FALSE);
   OutHPrintXY(160,430,'3] �a������ �a�� ������ �������a�� ���a�a �i�e�a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[4]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'�����A ȁ��e �w���e, �e�i �w���� ���|�A�� ���A�a �a�a���e',FALSE);
   OutHPrintXY(80,340,'�a���i ���v�i�� �w���� Ё��e ?',FALSE);
   SetColor(11);
   OutHPrintXY(160,370,'1] �����e �a�󷡔a',FALSE);
   OutHPrintXY(160,390,'2] �����e �a�q�� ������ �w�b���a',FALSE);
   OutHPrintXY(160,410,'3] �e���e �a�q�� ���������a',FALSE);
   Which;
   if c = '1' then inc(transdata[2]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[4]);
   Erase;
   OutHPrintXY(80,320,'���� ���e�A �w���� ����ŵA�� �����i �a�a�e�A ����a �ᢁ',FALSE);
   OutHPrintXY(80,340,'���a��a',FALSE);
   OutHPrintXY(160,370,'1] �w�Ŵ��� �q�a�a �����e�a',FALSE);
   OutHPrintXY(160,390,'2] �ᢁ �����i �i��ӡЁ�� �a�� �����a �e �i���a',FALSE);
   OutHPrintXY(160,410,'3] ���a�ᶑ�A ���w�a�e �a�q�a�� �����e�a',FALSE);
   Which;
   if c = '1' then inc(transdata[2]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'���w ���ɷi �a�� �w���e �a�� ���A���� �w�ŵA�A ���e �b�i �i���a',FALSE);
   OutHPrintXY(160,350,'1] ���a���e �����a�e�� ���a���e �q���i �}�e�a',FALSE);
   OutHPrintXY(160,370,'2] �Še�a�e �q�� �񋥔a',FALSE);
   OutHPrintXY(160,390,'3] �w�ŷ��� �����a�� ���A�i �i�a�a ���e�a',FALSE);
   Which;
   if c = '1' then inc(transdata[2]);
   if c = '2' then inc(transdata[4]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'�w���� ������ �a���a���i �a�店 �i�����e ���A�a ���v�a',FALSE);
   OutHPrintXY(160,350,'1] �a�e�a�e ���ᕡ�i ���b�a�a ���A�i �x�e�a',FALSE);
   OutHPrintXY(160,370,'2] �a��� ��З ��ǡ�a ���A�i �x�e�a',FALSE);
   OutHPrintXY(160,390,'3] ���A�a �b�a�e �a�� �a�w�e�a',FALSE);
   Which;
   if c = '1' then inc(transdata[3]);
   if c = '2' then inc(transdata[4]);
   if c = '3' then inc(transdata[5]);
   Bar(80,250,630,450);
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
      OutHPrintXY(15,260,chr(4)+' �A  �b : '+s,FALSE);
      str(mentality,s);
      OutHPrintXY(15,280,chr(4)+' �����b : '+s,FALSE);
      str(concentration,s);
      OutHPrintXY(15,300,chr(4)+' �����b : '+s,FALSE);
      str(endurance,s);
      OutHPrintXY(15,320,chr(4)+' �����b : '+s,FALSE);
      str(resistance,s);
      OutHPrintXY(15,340,chr(4)+' ���w�b : '+s,FALSE);
      SetColor(3);
      hp := endurance;
      str(hp,s);
      OutHPrintXY(23,380,'�A�b   ���� : '+s,FALSE);
      sp := mentality;
      str(sp,s);
      OutHPrintXY(23,400,'�a��   ���� : '+s,FALSE);
      esp := concentration;
      str(esp,s);
      OutHPrintXY(23,420,'���q�b ���� : '+s,FALSE);
      OutHPrintXY(23,440,'�A       �I : 1',FALSE);
   end;
   RGB(8,0,10,21);
   SetPalette(8,8);
   SetColor(8);
   Rectangle(305,156,308,472);
   for i:= 23 to 63 do begin
      RGB(8,40,10-((i-23) div 4),i);
      delay(20);
   end;
   for i:= 23 to 63 do begin
      RGB(8,63-i,0,63);
      delay(20);
   end;
   SetColor(9);
   Rectangle(305,156,308,472);
end; { First }

Procedure Second;
begin
   SetColor(15);
   OutHPrintXY(320,170,'��Ȃ �a���� ...',FALSE);
   SetColor(10);
   OutHPrintXY(320,225,'�q�a���e ���� : ',FALSE);
   TextColor(15);
   gotoxy(57,15); write('40');
   SetColor(14);
   OutHPrintXY(350,256,'�����  ==>',FALSE);
   OutHPrintXY(350,272,'���¬�  ==>',FALSE);
   OutHPrintXY(350,288,'З  ��  ==>',FALSE);
   SetColor(15);
   GotoXY(42,17); write(^Z);
   for i := 17 to 19 do begin
      GotoXY(57,i); write('0');
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
         GotoXY(42,j-y1); write(' ');
         GotoXY(42,j); write(^Z);
      end;
      if (x1<>0) then begin
         transdata[j-16] := transdata[j-16] + x1;
         k := k - x1;
         if (transdata[j-16]<0) or (transdata[j-16]>20) or (k<0) or (k>40) then
         begin
            transdata[j-16] := transdata[j-16] - x1;
            k := k + x1;
         end;
         GotoXY(57,15); write('  ');
         GotoXY(57,15); write(k);
         GotoXY(57,j); write('  ');
         GotoXY(57,j); write(transdata[j-16]);
      end;
   end;
   until (c=#13) and (k=0);
   player[1].agility := transdata[1];
   player[1].accuracy[1] := transdata[2];
   player[1].luck := transdata[3];
   SetColor(3);
   with player[1] do begin
      str(agility,s);
      OutHPrintXY(150,260,chr(4)+' ����� : '+s,FALSE);
      str(accuracy[1],s);
      OutHPrintXY(150,280,chr(4)+' ���¬� : '+s,FALSE);
      str(luck,s);
      OutHPrintXY(150,300,chr(4)+' З  �� : '+s,FALSE);
   end;
   Bar(310,160,630,400);
end; { Second }

Procedure Third;
begin
   SetColor(15);
   OutHPrintXY(320,170,'�w���� ���a�e ���s�i ���a����',FALSE);
   RGB(8,15,15,15);
   for i:= 1 to 8 do transdata[i] := 0;
   with player[1] do begin
      SetColor(8);
      if (strength>13)and(endurance>13)and(agility>11)and(accuracy[1]>11) then begin
         SetColor(7);
         transdata[1] := 1;
      end;
      OutHPrintXY(400,235,'1] ��  �a',FALSE);
      SetColor(8);
      if (mentality>13)and(accuracy[1]>14) then begin
         SetColor(7);
         transdata[2] := 1;
      end;
      OutHPrintXY(400,255,'2] �a��a',FALSE);
      SetColor(8);
      if (mentality>10)and(concentration>13)and(accuracy[1]>12) then begin
         SetColor(7);
         transdata[3] := 1;
      end;
      OutHPrintXY(400,275,'3] �A�a��',FALSE);
      SetColor(8);
      if (strength>13)and(mentality>10)and(endurance>10)and(resistance>10)
         and(accuracy[1]>13) then begin
         SetColor(7);
         transdata[4] := 1;
      end;
      OutHPrintXY(400,295,'4] ��  �a',FALSE);
      SetColor(8);
      if (strength>16)and(agility>13)and(accuracy[1]>11) then begin
         SetColor(7);
         transdata[5] := 1;
      end;
      OutHPrintXY(400,315,'5] ��ʁ�w',FALSE);
      SetColor(8);
      if (resistance>16)and(agility>16)and(luck>9) then begin
         SetColor(7);
         transdata[6] := 1;
      end;
      OutHPrintXY(400,335,'6] ��  �a',FALSE);
      SetColor(8);
      if accuracy[1] > 18 then begin
         SetColor(7);
         transdata[7] := 1;
      end;
      OutHPrintXY(400,355,'7] �a����',FALSE);
      SetColor(7);
      transdata[8] := 1;
      OutHPrintXY(400,375,'8] �ᕩ��',FALSE);
   end;
   ok := FALSE;
   repeat
      i := 31; j := 1;
      repeat begin
         if i = 40 then j := -1;
         if i = 20 then j := 1;
         i := i + j;
         RGB(7,i,i,i);
         delay(10);
      end;
      until KeyPressed;
      while KeyPressed do c := ReadKey;
      i := ord(c)-48;
      if (i>0) and (i<9) then begin
         if transdata[i] = 1 then begin
            player[1].class := i;
            ok := TRUE;
         end
         else begin
            Sound(100);
            Delay(100);
            NoSound;
         end;
      end;
   until ok;
   WhatClass(player[1].class,s);
   SetColor(10);
   cHPrint(15,217,'�w���� ���s�e '+s+' �����a.');
   Bar(310,160,630,400);
   SetColor(8);
   bHPrint(370,250,'�a��ǡ�a ���a������ ....');
   i := 15;
   repeat begin
      inc(i);
      if i > 63 then i := 15;
      RGB(8,i,i,i);
      Delay(50);
   end;
   until KeyPressed;
   c := ReadKey;
   Bar (10,160,304,460); Bar(310,160,630,460);
   RGB(8,15,15,15);
end; { Third }

Procedure Fourth;
begin
   RGB(8,20,20,20);
   SetColor(10);
   bHPrint(30,165,'�w���� ��З�a�A�I 4 �w�� �w�a�i');
   bHPrint(40,190,'�a���A�� ���a��������.');
   TextColor(15);
   for i := 1 to 10 do begin
      GotoXY(10,i + 15); write(charactername[i]);
   end;
   for i:= 1 to 10 do transdata[i] := 0;
   ok := FALSE;
   k := 16;
   GotoXY(8,k); write(^Z);
   repeat begin
      repeat until KeyPressed;
      c := ReadKey;
      y1 := 0;
      if c = #0 then begin
         c := ReadKey;
         case c of
            #72 : y1 := -1;
            #80 : y1 := 1;
         end;
      end;
      if y1 <> 0 then begin
         k := k + y1;
         if (k<16) or (k>25) then k := k - y1;
         GotoXY(8,k-y1); write(' ');
         GotoXY(8,k); write(^Z);
      end;
      if (c = #13) and (transdata[k-15] = 0) then begin
         SetColor(13);
         bHPrint(360,200,'1] ��З�A �q�� ��ǥ�a');
         bHPrint(360,230,'2] �a �a�q�� �w�b�i ���a');
         repeat begin
            repeat until KeyPressed;
            c := ReadKey;
            if c = '1' then begin
               transdata[k-15] := 1;
               TextColor(8);
               GotoXY(10,k); write(charactername[k-15]);
               TextColor(15);
               Sound(800); Delay(100);
               Sound(500); Delay(70);
               NoSound;
            end;
            if c = '2' then begin
               Profile(k-15);
               SetColor(10);
               SetColor(15);
            end;
         end;
         until (c='1') or (c='2') or (c=#27);
         SetFillStyle(0,1);
         Bar(310,160,630,450);
      end;
      j := 0;
      for i := 1 to 10 do j := j + transdata[i];
      if j = 4 then ok := TRUE;
   end;
   until ok;
   j := 1;
   for i := 1 to 10 do
      if transdata[i] = 1 then begin
         transdata[j] := i;
         j := j + 1;
      end;
   for i:= 1 to 4 do
      with player[i+1] do begin
         j := transdata[i];
         name := charactername[j];
         if character[j,1] = 0 then sex := male else sex := female;
         class := character[j,2];
         strength := character[j,3];
         mentality := character[j,4];
         concentration := character[j,5];
         endurance := character[j,6];
         resistance := character[j,7];
         agility := character[j,8];
         accuracy[1] := character[j,9];
         luck := character[j,10];
         hp := endurance;
         sp := mentality;
         esp := concentration;
      end;
   for i:= 1 to 5 do
      with player[i] do begin
         poison := 0;
         unconscious := 0;
         dead := 0;
         for j := 1 to 3 do level[j] := 1;
         ac := 0;
         if class = 1 then ac := 1;
         experience := 0;
         weapon := 0;
         shield := 0;
         armor := 0;
         wea_power := 2;
         if class = 1 then wea_power := 3;
         if class = 5 then wea_power := 12;
         shi_power := 0;
         arm_power := 0;
         k := class;
         j := accuracy[1];
         case k of
            1,5,7,8 : begin
                         accuracy[2] := 5;
                         accuracy[3] := 5;
                      end;
            2 : begin
                   accuracy[1] := 5;
                   accuracy[2] := j;
                   accuracy[3] := 5;
                end;
            3 : begin
                   accuracy[1] := 5;
                   accuracy[2] := 5;
                   accuracy[3] := j;
                end;
            4 : begin
                   accuracy[2] := j;
                   accuracy[3] := 8;
                end;
            6 : begin
                   accuracy[2] := 5;
                   accuracy[3] := j;
                end
            else begin
                    accuracy[2] := 5;
                    accuracy[3] := 5;
                 end;
         end;
      end;
   player[6].name := '';
   SetColor(15);
   bHPrint(320,180,'�w�� ��З�� �������i');
   TextColor(14);
   for i:= 1 to 5 do begin
      GotoXY(46,14+i); write(player[i].name);
   end;
   SetColor(12);
   bHPrint(320,380,'�e�� �� ��З�� �a�q�A �i�� �g�e�a�e');
   bHPrint(320,396,'���b �w�e�� Esc] �i ���a����.');
   c := ReadKey;
end; { Fourth }

Procedure Last;
begin
   with party do begin
      map := 6;
      xaxis := 51;
      yaxis := 31;
      food := 20;
      gold := 2000;
      for i:= 1 to 100 do etc[i] := 0;
   end;
   for LoadNo := '1' to '4' do begin
      Assign(partyfile,'party'+LoadNo+'.dat');
      ReWrite(partyfile);
      write(partyfile,party);
      Close(partyfile);
      Assign(playerfile,'player'+LoadNo+'.dat');
      ReWrite(playerfile);
      for i:= 1 to 6 do write(playerfile,player[i]);
      Close(playerfile);
      ExistFile := FSearch('Save'+LoadNo+'.map','');
      if ExistFile <> '' then begin
         Assign(filename,'Save'+LoadNo+'.map');
         {$I-}
         Erase(filename);
         {$I+}
         if IOResult <> 0 then begin
            Closegraph;
            TextColor(7);
            TextBackGround(0);
            ClrScr;
            TextColor(12);
            Writeln('Can''t delete " Save?.map ".');
            Halt;
         end;
      end;
   end;
   TextColor(7);
   TextBackGround(0);
end; { Last }

Function CreateCharacter : boolean;
begin
   Display;
   Name;
   First;
   Second;
   Third;
   Fourth;
   if c<>#27 then begin
      Last;
      CreateCharacter := TRUE;
   end
   else CreateCharacter := FALSE;
end;

begin
end.