Unit LoreEnt;

INTERFACE

Uses
   Crt, Graph, UHanX, LoreSub, Voice, LoreBatt, LoreEnd;

 Procedure entermode;
 Procedure sign;


IMPLEMENTATION

Procedure entermode;
begin
   case party.map of
      1 : begin
             if at(20,11) then
             if wantenter('CASTLE LORE') then begin
                with party do begin
                   map := 6; xaxis := 51; yaxis := 95;
                end;
                load;
                map[49,52]:=47; map[50,52]:=44; map[51,52]:=44;
                map[52,52]:=44; map[53,52]:=47; map[49,53]:=47;
                map[50,53]:=44; map[51,53]:=44; map[52,53]:=44; map[53,53]:=45;
                for i := 49 to 53 do map[i,88] := 44;
             end;
             if at(76,57) then
             if wantenter('LASTDITCH') then begin
                with party do begin
                   map := 7; xaxis := 37; yaxis := 70;
                end;
                load;
                for i := 1 to 6 do if player[i].name = 'Polaris' then map[37,41] := 44;
             end;
             if at(17,89) then
             if wantenter('MENACE') then begin
                with party do begin
                   map := 14; xaxis := 25; yaxis := 45;
                end;
                load;
             end;
             if at(20,6) then
             if wantenter('ANOTHER LORE') then begin
                with party do begin
                   map := 27; xaxis := 15; yaxis := 45;
                end;
                load;
             end;
          end;
      2 : begin
             if at(19,26) then
             if wantenter('VALIANT PEOPLES') then begin
                with party do begin
                   map := 8; xaxis := 38; yaxis := 70;
                end;
                load;
             end;
             if at(31,82) then
             if wantenter('GAIA TERRA') then begin
                with party do begin
                   map := 9; xaxis := 26; yaxis := 45;
                end;
                load;
             end;
             if at(82,47) then
             if wantenter('QUAKE') then begin
                with party do begin
                   map := 15; xaxis := 25; yaxis := 70;
                end;
                load;
             end;
             if at(44,7) then
             if wantenter('WIVERN') then begin
                with party do begin
                   map := 16; xaxis := 20; yaxis := 35;
                end;
                load;
             end;
          end;
      3 : begin
             if at(74,19) then
             if wantenter('WATER FIELD') then begin
                with party do begin
                   map := 10; xaxis := 25; yaxis := 70;
                end;
                load;
                if party.etc[38] and bit4 > 0 then map[40,56] := 44;
             end;
             if at(23,62) then
             if wantenter('NOTICE') then begin
                with party do begin
                   map := 17; xaxis := 56; yaxis := 94;
                end;
                load;
             end;
             if at(96,42) then
             if wantenter('LOCKUP') then begin
                with party do begin
                   map := 18; xaxis := 25; yaxis := 94;
                end;
                load;
             end;
          end;
      4 : begin
             if at(48,35) then
             if wantenter('SWAMP KEEP') then begin
                with party do begin
                   map := 21; xaxis := 25; yaxis := 45;
                end;
                load;
             end;
             if at(48,57) then
             if wantenter('EVIL GOD') then begin
                with party do begin
                   map := 19; xaxis := 25; yaxis := 45;
                end;
                load;
             end;
             if at(82,16) then
             if wantenter('MUDDY') then begin
                with party do begin
                   map := 20; xaxis := 25; yaxis := 95;
                end;
                load;
             end;
          end;
      5 : begin
             if at(15,31) then
             if wantenter('IMPERIUM MINOR') then begin
                with party do begin
                   map := 22; xaxis := 25; yaxis := 45;
                end;
                load;
             end;
             if at(34,14) then
             if wantenter('EVIL CONCENTRATION') then begin
                if party.etc[44] and bit1 = 0 then begin
                   enemynumber := 7;
                   for i := 1 to enemynumber do joinenemy(i,54);
                   joinenemy(random(5)+2,69);
                   displayenemies(TRUE);
                   Print(13,' �a�e EVIL CONCENTRATION ���� �����i ��ǡ�e');
                   Print(13,'�����i �{�� ���e Frost Dragon���a.  ���a ��');
                   Print(13,'ǡ�� ���e�e  ��Ӂ�i�e �e �i�a����  �i�a����');
                   Print(13,'�g�i�����a.');
                   PressAnyKey;
                   battlemode(FALSE);
                   if party.etc[6] > 0 then exit;
                   party.etc[44] := party.etc[44] or bit1;
                end;
                with party do begin
                   map := 23; xaxis := 25; yaxis := 45;
                end;
                load;
             end;
          end;
      7 : if wantenter('PYRAMID') then begin
             with party do begin
                map := 11; xaxis := 25; yaxis := 45;
             end;
             load;
             if party.etc[13] > 1 then begin
                map[25,44] := 50; map[26,44] := 50;
             end;
          end;
      8 : if wantenter('EVIL SEAL') then begin
             with party do begin
                map := 12; xaxis := 25; yaxis := 70;
             end;
             load;
             if party.etc[14] > 1 then map[18,9] := 0;
          end;
      10 : if wantenter('WIVERN') then begin
              with party do begin
                 map := 16; xaxis := 20; yaxis := 9;
              end;
              load;
           end;
      13 : if wantenter('SWAMP KEEP') then begin
              with party do begin
                 map := 21; xaxis := 25; yaxis := 6;
              end;
              load;
           end;
      16 : if wantenter('WATER FIELD') then begin
              with party do begin
                 map := 10; xaxis := 26; yaxis := 8;
              end;
              load;
              if party.etc[38] and bit4 > 0 then map[40,56] := 44;
           end;
      21 : begin
              if y <= 6 then begin
                 if wantenter('SWAMP GATE') then begin
                    with party do begin
                       map := 13; xaxis := 81; yaxis := 68;
                    end;
                    load;
                 end;
              end
              else if wantenter('IMPERIUM MINOR') then begin
                 if not (odd(party.etc[40]) and odd(party.etc[41])) then begin
                    message(7,' �a�a �A���a�e �b���A�� �g�v�a.');
                    exit;
                 end;
                 if party.etc[42] and bit2 = 0 then begin
                    j := 1;
                    if party.etc[42] and bit5 = 0 then begin
                       joinenemy(j,65);
                       inc(j);
                    end;
                    if party.etc[42] and bit6 = 0 then begin
                       joinenemy(j,64);
                       inc(j);
                    end;
                    if j = 1 then begin
                       party.etc[42] := party.etc[42] or bit2;
                    end
                    else begin
                       enemynumber := j-1;
                       DisplayEnemies(TRUE);
                       BattleMode(FALSE);
                       if enemy[1].dead then party.etc[42] := party.etc[42] or bit5;
                       if enemy[2].dead then party.etc[42] := party.etc[42] or bit6;
                       if enemy[1].dead and enemy[2].dead then
                          party.etc[42] := party.etc[42] or bit2;
                    end;
                 end;
                 with party do begin
                    map := 22; xaxis := 25; yaxis := 6;
                 end;
                 Clear;
                 if party.etc[42] and bit7 = 0 then begin
                    enemynumber := 1;
                    joinenemy(1,68);
                    displayenemies(TRUE);
                    Print(7,' �b�� �w���i�e �a�� ���w���� �a���b  ���B�a');
                    Print(7,'�� ���e�a�A �֊��a. ����A �a�A�I LAVA ���B');
                    Print(7,'�e �� �A���A ���e ���e ���B���A�� �a�w �b�e');
                    Print(7,'���B����. �ⷁ �a���� ���e 2�� �c�A ���e ��');
                    Print(7,'����. �a���e ����A ���b�i IMPERIUM MINOR�a');
                    Print(7,'�a���b�a�� ��é EVIL CONCENTRATION �e �i �a');
                    Print(7,'���� �b�� ���i���� ������.  �ዡ�A�e �A�w��');
                    Print(7,'�A���i�� Necromancer �� �����i�� �a�b�a���e');
                    Print(7,'�������e IMPERIUM MINOR�� ���a�A�e �a���b�a');
                    Print(7,'�� �i�a�q�e �a�q�i�� �����a ����. ���� �ዡ');
                    Print(7,'�e Ancient Evil�� ��A �A�� �b�� ����������');
                    Print(7,'�e Necromancer�� ñ���a�� ���w�� �����a  �q');
                    Print(7,'�b�A�a �a ���� �a�q�i�e ���� �ዡ�� ϡ�e Ж');
                    Print(7,'�� ������ �ዡ�e Ancient Evil�� �w�ⷥ ӱ�a');
                    Print(7,'�� ��ѡ�A�� ����� ��i�� ñ���i�a�� ���a�e');
                    Print(7,'���A�a �A���a.  �a��a�� ���e ������ ���a�e');
                    Print(7,'�ዡ�� �h�����a����.');
                    Print(7,' �a��e, �a�e �w���� Necromancer�� �w���a�A');
                    Print(7,'�I �� �a�� Ancient Evil�� �{�� �a�a�a�V��.');
                    talk('');
                    party.etc[42] := party.etc[42] or bit7;
                 end;
                 load;
              end;
           end;
      22 : begin
              if y <= 6 then begin
                 if wantenter('SWAMP KEEP') then begin
                    with party do begin
                       map := 21; xaxis := 25; yaxis := 20;
                    end;
                    load;
                 end;
              end
              else begin
                 if wantenter('LAST SHELTER') then begin
                    with party do begin
                       map := 24; xaxis := 25; yaxis := 45;
                    end;
                    load;
                    if party.etc[43] and bit4 > 0 then map[33,10] := 47;
                 end;
              end;
           end;
      23 : if wantenter('DUNGEON OF EVIL') then begin
              if party.etc[44] and bit2 = 0 then begin
                 enemynumber := 7;
                 for i := 1 to 7 do joinenemy(i,62);
                 joinenemy(3,70);
                 displayenemies(TRUE);
                 Print(13,' �� �����A �i�� �a�V�a��?');
                 Print(13,' �a!, ���s��. ��Ӂ�i�A�A�e �a���� Draconian');
                 Print(13,'���i�� ���s�� ������ �g�e ��������.');
                 PressAnyKey;
                 if player[6].name = 'Draconian' then begin
                    Print(7,' ArchiDraconian�e �a���b�A ���e Draconian');
                    Print(7,'�i �i�eЖ�a.');
                    Print(13,' �a�� ��e ������! �qӡ Draconian �����e');
                    Print(13,'�� Necromancer���A�A �e���i �i�a��... �a');
                    Print(13,'���e �a�� ���q���a. �h�a�u!!');
                    with player[6] do begin
                       hp := 0;
                       unconscious := 1;
                       dead := 30000;
                    end;
                    if soundon then begin
                       hit; hit;
                       delay(500); hit;
                    end;
                    SimpleDisCond;
                    PressAnyKey;
                 end;
                 battlemode(FALSE);
                 if not enemy[3].dead then begin
                    scroll(TRUE);
                    exit;
                 end;
                 party.etc[44] := party.etc[44] or bit2;
              end;
              with party do begin
                 map := 25; xaxis := 25; yaxis := 45;
              end;
              load;
           end;
      25 : if wantenter('CHAMBER OF NECROMANCER') then begin
              party.etc[1] := 1;
              Silent_Scroll;
              i := 0; j := 0;
              for k := 1 to 10 do begin
                 if k > 1 then
                    putimage(100+i*20,100+j*20,font^[map[x+i,y+j]],copyput);
                 i := random(9)-4; j := random(9)-4;
                 if (i=0) and (j=0) then j := -1;
                 putimage(100+i*20,100+j*20,chara^[50],andput);
                 putimage(100+i*20,100+j*20,chara^[22],orput);
                 delay(1000);
              end;
              Print(13,' ���i�� ϩ�a���a. ��a�a !!');
              PressAnyKey;
              enemynumber := 6;
              for i := 1 to 5 do joinenemy(i,63);
              joinenemy(6,72);
              displayenemies(TRUE);
              battlemode(TRUE);
              if party.etc[6] = 255 then exit;
              if party.etc[6] > 0 then begin
                 x := 25; y := 45;
                 scroll(TRUE);
                 exit;
              end;
              with party do begin
                 map := 26; xaxis := 25; yaxis := 15;
              end;
              load;
              scroll(FALSE);
              face := 5;
              for j := 4 downto 0 do begin
                 if j < 4 then
                    putimage(100,120+j*20,font^[map[x,y+j+1]],copyput);
                 putimage(100,100+j*20,chara^[33],andput);
                 putimage(100,100+j*20,chara^[5],orput);
                 delay(1000);
              end;
              for j := 16 to 19 do
              for i := 24 to 26 do map[i,j] := 16;
              scroll(TRUE);
           end;
   end;
   scroll(TRUE);
end;

Procedure sign;
begin
   while keypressed do c := readkey;
   Clear;
   for i := 0 to 1 do begin
      yline := 30; hany := 16;
      page := 1 - page;
      setactivepage(page);
      Print(7,'�u�i�A �a�a������ ...');
      Print(7,''); Print(7,'');
      case party.map of
         2 : begin
                if at(31,44) then Print(15,'          WIVERN �a�e��');
                if at(29,50) or at(35,72) then begin
                   Print(15,'  ���� :');
                   Print(15,'       VALIANT PEOPLES �a�e��');
                   Print(15,'  �q�� :');
                   Print(15,'       GAIA TERRA �a�e��');
                end;
                if at(44,77) then begin
                   Print(15,'  ������ :');
                   Print(15,'       QUAKE �a�e��');
                   Print(15,'  �q�ὢ :');
                   Print(15,'       GAIA TERRA �a�e��');
                end;
             end;
         6 : begin
                if at(51,84) then begin
                   cPrint(15,11,'       �a���e `','CASTLE LORE','''��');
                   Print(15,'         �a�ᦅ�i �ŵw�s���a');
                   setcolor(13);
                   outtextxy(360,140,'Lord Ahn');
                end;
                if at(24,31) then begin
                   Print(7,'');
                   Print(15,'             �a���e LORE ����');
                   Print(15,'       �a�ᦅ �����i �ŵw�s���a !!');
                end;
                if at(51,18) or at(52,18) then begin
                   Print(7,'');
                   Print(15,'          LORE �ן�  �A�� ���w��');
                end;
             end;
         7 : begin
                if at(39,68) then begin
                   cPrint(15,11,'        �a���e `','LASTDITCH','''��');
                   Print(15,'         �a�ᦅ�i �ŵw�s���a');
                end;
                if at(39,8) then Print(12,'       �a���e PYRAMID �� ����');
                if at(54,9) then Print(10,'     �a���e GROUND GATE �� ����');
             end;
         8 : begin
                if at(39,67) then begin
                   cPrint(15,11,'      �a���e`','VALIANT PEOPLES','''��');
                   Print(15,'    ������ ����e ��ӡ�� �g�e �w��');
                   Print(15,'   �����e ��� �b�A�� ��ӡ�� �g�e�a');
                end
                else Print(12,'     �a���e EVIL SEAL �� ����');
             end;
         9 : begin
                if at(24,26) then Print(15,'       �a���e ���׷� ���� �w��')
                else begin
                   cPrint(15,11,'         �a���e `','GAIA TERRA','''��');
                   Print(15,'          �a�ᦅ�i �ŵw�s���a');
                end;
             end;
         12 : begin
                 if at(24,68) then Print(15,'               X �e 7');
                 if at(27,68) then Print(15,'               Y �e 9');
                 if at(25,63) then Print(15,'       �a�e ���� ��ѡ�e X + Y');
                 if y+y1 = 56 then begin
                    j := (x+x1-6) div 7 + 12;
                    str(j,s);
                    cPrint(15,11,'           ���� ��ѡ�e ''',s,'''');
                 end;
                 if at(26,42) then Print(15,'            Z �e 2 * Y + X');
                 if at(26,33) then begin
                    Print(15,'        ́�aš�a x ́�aš�a �e Z �a�e');
                    Print(7,'');
                    Print(15,'            ́�aš�a�e �������a ?');
                 end;
                 if y+y1 = 29 then begin
                    j := (x+x1-3) div 5 + 2;
                    str(j,s);
                    cPrint(15,11,'           ́�aš�a�e ''',s,'''');
                 end;
              end;
         15 : begin
                 Print(7,'');
                 if at(26,63) then Print(15,'            ���� �a���b');
                 if at(22,15) then Print(15,'     (12,15) �� ���e���� �a����');
                 if at(11,14) then Print(15,'     (13,7) �� ���e���� �a����');
                 if at(27,14) then Print(15,'   �׋q�� �s���e (45,19) �A ���a�a���q');
              end;
         17 : begin
                 Print(7,'');
                 if at(68,47) then Print(15,'    �a! �a! �a!  ��e �����A�A ���v�a');
                 if at(58,53) then begin
                    Print(10,'      �� �A���i �e�e �a�q');
                    Print(15,'  : ���a ���b�a �勡 ���b��');
                    Print(15,'        92 �b��  �e �w��');
                 end;
                 if at(51,30) then begin
                    Print(15,'       ���e�� : Hidra �� �����w��');
                    Print(15,'       �E  �� : Hidra �a ���e �w');
                 end;
                 if at(66,13) then Print(15,'     �����qá �� �� �q��i ͡��Ё�a');
                 if at(9,28) then Print(15,'         �ὢ�� ���a �����w����');
              end;
         19 : begin
                 Print(15,'       �� ���i ɷ���a���a�a�e �a�q�e');
                 Print(15,'     ���b�� �|���A ���e �A��i �w������');
              end;
         23 : begin
                 Print(15,'      (25,27)�A ���e �A��i �������e');
                 Print(15,'          ���i ���� ���i ������.');
                 Print(7,'');
                 Print(10,'             �A�b�a �e �w�� �q');
                 map[25,27] := 52;
              end;
      end;
   end;
end;

begin
end.