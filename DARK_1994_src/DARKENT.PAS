Unit DarkEnt;

INTERFACE

Uses
   Crt, Graph, UHanX, DarkSub, DarkBatt, DarkEnd;

 Procedure EnterMode;
 Procedure Sign;


IMPLEMENTATION

Procedure EnterMode;
begin
   case party.map of
      1 : begin
             if at(20,11) then
             if wantenter('���� ��') then begin
                with party do begin
                   map := 6; xaxis := 51; yaxis := 94;
                end;
                Load;
                for i := 49 to 53 do Putmap(i,88,44);
                if party.etc[50] and bit1 > 0 then Putmap(89,23,44);
                if party.etc[50] and bit2 > 0 then Putmap(9,64,44);
                if party.etc[50] and bit3 > 0 then Putmap(21,33,44);
                if party.etc[50] and bit4 > 0 then Putmap(88,38,44);
                if party.etc[10] = 4 then begin
                   Pause(TRUE);
                   Clear;
                   Print(7,' �w���� ���� ���A �i�ᵡ�a  �����i�� �i�i�e');
                   Print(7,'�ŵw�i �h�v�a.  �a���e �����i�e �w���� �A��');
                   Print(7,'�a�A�� �A�a �e�a�A�a�a �b�a �a�����A�A �᷁');
                   Print(7,'́��Ж�� �w���i ������ �a���i  �i �ⷡ ����');
                   Print(7,'�a. �A��a�� �i�� �����i �A�� �a�e�A �w����');
                   Print(7,'�e ���e �a�� �a������ ���a�e ��A �w���e �s');
                   Print(7,'�i�e ���q�i ���i �� �c�A �����a.');
                end;
                if party.etc[10] = 16 then begin
                   Clear;
                   Print(7,' �w���� �ᖉ�� ���� ���A �a�a�v���e ���� ��');
                   Print(7,'�� ���e ́��a �A�� ��v�a.');
                   Print(7,' �w���e �a���e �q�i �a���a  �i���A���� ����');
                   Print(7,'�A �����q�i �a�v�a. ���A�e �a�� ����ǩ ���a');
                   cPrint(7,11,'���e ���� ����a ��v�a. ','�����e �a�a �A����','');
                   Print(11,'�����e �a����a�A�A ��́�e �������a.');
                   with party do begin
                      map := 1; xaxis := 20; yaxis := 11;
                   end;
                   Load;
                   PressAnyKey;
                   Scroll(FALSE);
                   Print(7,' �a�a �A�����e �a���i ӱ�a�� �� ���B�A �i��');
                   Print(7,'�i �w���a�� ���bЖ�� �i������ ���A�i�e ���');
                   Print(7,'ӡ �w�A�i ����a�� ���bЖ�a.  ���A�e �����e');
                   Print(7,'�a����a�i �A���i �����e �Aϡ�aɡ�I�A�a�a��');
                   Print(7,'�a�a�a ��a��  �a�a�e ������ �����i ���� �e');
                   Print(7,'���� �a�a�� ӱ�i �w�a�� ���bЖ�a.');
                   Print(7,' ���A�e ������ �a�a�� ���a �s���ⷥ ӱ�� ͢');
                   Print(7,'���i �b�i ���a ������ ���� �w���� ������ �a');
                   Print(7,'�a�a �v�a.');
                   PressAnyKey;
                   Print(7,' �a���e ����, �����e �a����a�� �a�� �i���i');
                   Print(7,'���a���a Ӂ���e �����a �a�a�i��֔a. �a���e');
                   Print(7,'�A�a �e�a�A�a�� �a���b �����v�� �a�e �a�a��');
                   Print(7,'�i���i ��ˡ�a �a���b �i�i �e�a.');
                   Print(7,'');
                   Print(13,' �a�a �A������ ӱ�e �wѥ�� �a���a�� ���i ��');
                   Print(13,'ǩ ӱ�� ���a�e �� �i�v�A.  ���q�e �a�� �a��');
                   Print(13,'�b�a�� �a ѥ�a �����i ��ѡ�i �� ���e �i���i');
                   Print(13,'����Ж���e �� �a�� ӱ�� �a�a�A �I ��A.  �a');
                   Print(13,'�e �a���b�a�� �e�a���� �a�e�i ���bЁ �����A');
                   Print(13,'. �a�A�e �i���A���� ����i ���� �a�V��.  �a');
                   Print(13,'�� �a���b ����i �A�����A.  �ዡ�A�e ���e�e');
                   Print(13,'������ ���A. ���q�e �a�� �A�弁 ���工 " �A');
                   Print(13,'�a���e��A�A �����a�e �a���� �����a. " �a�e');
                   Print(13,'���鷡 ��З�A�� �g�e ���巡�a�� ���b�A�� ��');
                   Print(13,'��.  �a���e �e���� ���bЁ���A.  �a�A�a �e��');
                   Print(13,'���q���a�� �A�a���e��A�A ́�e�a�e �A�弁��');
                   Print(13,'���巡 ���e �A�� �g�e ���巡 �E�a�A. �a���A');
                   Print(13,'�e �E�a�e  �a�a �A�����e ��q���� ������ ��');
                   Print(13,'���a �A�� �១��  ���� ���B�e ������ ���s��');
                   Print(13,'�� ���e�i ��ЗЁ �a�a�A �E�a�A. �a�� �i���a');
                   Print(13,'��� ��Ё�a �a�e��. �a�� ���i�i ���A�A �a��');
                   Print(13,'�e�i�A.  �a���� �a�����a ���᷁ ���w�i ���');
                   Print(13,'���b�a���� �a�A.... �a..�a��... �a..�a�q �A');
                   Print(13,'�w�A��......');
                   Print(7,'');
                   PressAnyKey;
                   Print(7,' �a�� �����e ��� Ӂ��Ё ���ᓡ �i�� �q�b�a');
                   Print(7,'�� �a�a���� �i�v�a.');
                   Print(7,' �w���e ����A �a�V�e�a ?');
                   m[0] := '';
                   m[1] := '�A�a �e�a�A�a�� �i���� �e�a';
                   m[2] := '�a�a �A������ �a���� ���a';
                   k := Select(140,2,2,FALSE,TRUE);
                   if k < 2 then End_Demo;
                   Print(7,' ��З�e �a�a���� �w�b�i ������ �a��  �����e');
                   Print(7,'�a����a�i ���b�a�aЖ�a.');
                   PressAnyKey;
                   enemynumber := 1;
                   joinenemy(enemynumber,75);
                   enemy[enemynumber].name := '�����e �a����a';
                   DisplayEnemies(TRUE);
                   Print(13,' �a�b~~ �A�a �� ���� �a���b �����a�� ? �a��');
                   Print(13,'�a�e �ᕡ ���a����.');
                   PressAnyKey;
                   Print(7,' �����e �a����a�e �a�� 8 ���b�a�� �a���i ��');
                   Print(7,'ЁЁ�� �a���i 8 �w�a�� �e�i���a.');
                   PressAnyKey;
                   repeat
                      enemynumber := 8;
                      for i := 1 to enemynumber do begin
                         joinenemy(i,75);
                         with enemy[i] do begin
                            name := '�����e �a����a';
                            resistance := 255;
                         end;
                      end;
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then begin
                         Clear;
                         Print(13,' �a�a�a.. ��Ӂ�i�e �e�a�� �a�� ���A ���� ��');
                         Print(13,'�� �V�a. �a�a�a..');
                         PressAnyKey;
                      end;
                   until FALSE;
                end;
             end;
             if at(76,57) then
             if wantenter('�a�a�a��á ��') then begin
                if party.etc[10] >= 16 then begin
                   Print(7,' �a�a�a ��á���e �w�q�� ������ �eЖ�a.');
                   exit;
                end;
                with party do begin
                   map := 7; xaxis := 38; yaxis := 69;
                end;
                Load;
                if party.etc[50] and bit8 > 0 then PutMap(41,18,44);
                if (party.etc[51] and bit1 = 0) and (party.etc[32] and bit6 > 0)
                   and (party.etc[35] and bit5 = 0)  then PutMap(54,56,53);
             end;
             if at(17,89) then
             if wantenter('�A��a') then begin
                if party.etc[10] >= 16 then begin
                   Print(7,' �A��a�e  �w�A�� �i�a �� �� ���i ������ ��');
                   Print(7,'��a ��v�a.');
                   exit;
                end;
                with party do begin
                   map := 10; xaxis := 26; yaxis := 44;
                end;
                Load;
                case party.etc[10] of
                   1 : for i := 25 to 26 do putmap(i,43,52);
                   3 : for i := 25 to 26 do putmap(i,43,52);
                   9 : begin
                          for i := 24 to 27 do PutMap(i,9,0);
                          for i := 23 to 28 do PutMap(i,10,0);
                          for i := 23 to 28 do PutMap(i,11,0);
                          for i := 24 to 27 do PutMap(i,12,0);
                       end;
                   12: begin
                          for i := 12 to 14 do PutMap(i,10,0);
                          for i := 11 to 15 do putMap(i,11,0);
                          for i := 12 to 14 do PutMap(i,12,0);
                       end;
                   15: begin
                          with party do begin
                             map := 4; xaxis := 10; yaxis := 92;
                          end;
                          Load;
                          Clear;
                          Print(7,'�w���� �A��a�A �����A �i���a �a�a ���w�i');
                          Print(7,'�� ���e �w�e ӱ�� ��З�i �i�a�i���� ���b Ж');
                          Print(7,'�a. ���e �w���e �A��a�� ���� �a�A�a ��a�e');
                          Print(7,'ɷ���� �eЁ ���q�i �i�a ���a.');
                          party.etc[9] := party.etc[9] or bit1;
                          Scroll(FALSE);
                          PressAnyKey;
                          Delete_Scroll_Screen;
                          face := 4;
                          Print(7,' �e�q ҁ�A �w���e ������ �i���� �a���a ���a');
                          Print(7,'�A�����i �i�a �a�v�a.');
                       end;
                end;
             end;
             if at(84,86) then
             if wantenter('�i�����e ϡ�a���a') then begin
                if party.etc[10] >= 16 then begin
                   Print(7,' �a��a, ϡ�a���a�e �a�A �A���a.');
                   exit;
                end;
                with party do begin
                   map := 2; xaxis := 99; yaxis := 100;
                end;
                Load;
                move(Font^[48],Font^[52],294);
             end;
          end;
      2 : begin
             if at(100,100) then
             if wantexit then begin
                with party do begin
                   map := 1; xaxis := 83; yaxis := 86;
                end;
                Load;
             end;
             if at(16,16) then
             if wantenter('�W���� �w��') then begin
                with party do begin
                   map := 11; xaxis := 25; yaxis := 44;
                end;
                Load;
             end;
             if at(149,65) then
             if wantenter('�W���� �e��') then begin
                with party do begin
                   map := 12; xaxis := 25; yaxis := 44;
                end;
                Load;
             end;
          end;
      3 : begin
             if at(66,78) then
             if wantenter('���� ����') then begin
                with party do begin
                   map := 8; xaxis := 25; yaxis := 93;
                end;
                Load;
                if party.etc[40] and bit1 > 0 then PutMap(25,61,48);
             end;
             if at(89,94) then
             if wantenter('���� �a��') then begin
                with party do begin
                   map := 13; xaxis := 25; yaxis := 7;
                end;
                Load;
             end;
             if at(33,49) then
             if wantenter('ϩ�i�� ����') then begin
                with party do begin
                   map := 14; xaxis := 25; yaxis := 44;
                end;
                Load;
                if party.etc[40] and bit8 = 0 then begin
                   for j := 6 to 17 do
                   for i := 17 to 36 do PutMap(i,j,31);
                end
                else begin
                   PutMap(25,41,0); PutMap(26,41,0);
                end;
             end;
             if at(36,16) then
             if wantenter('�A���i�� ����') then begin
                if party.etc[9] and bit6 = 0 then begin
                   enemynumber := 8;
                   for i := 1 to enemynumber do joinenemy(i,32);
                   Print(7,' ��З�� ���� �����A �a�a��a  ����a �e�b��');
                   Print(7,'�e �� �{�e ���� ���v�a.');
                   PressAnyKey;
                   DisplayEnemies(TRUE);
                   BattleMode(FALSE,TRUE);
                   if party.etc[6] = 0 then begin
                      with party do begin
                         map := 15; xaxis := 25; yaxis := 44;
                      end;
                      Load;
                   end;
                end
                else begin
                   Print(7,' �a���e ������ �����e �b�a ����� �i��i ��');
                   Print(7,'�a ���s���a.');
                end;
             end;
             if at(93,6) then
             if wantenter('������ ����') then begin
                with party do begin
                   map := 16; xaxis := 10; yaxis := 44;
                end;
                Load;
             end;
          end;
      4 : begin
             if at(42,76) then
             if wantenter('���e ���� �A���a') then begin
                x := 13; y := 72;
                Silent_Scroll;
                Clear;
                Print(7,' ��З�e �a�e ���a�� ���� �A���a.');
                exit;
             end;
             if at(13,71) then
             if wantenter('���e ���� �A���a') then begin
                x := 42; y := 77;
                Silent_Scroll;
                Clear;
                Print(7,' ��З�e �a�e ���a�� ���� �A���a.');
                exit;
             end;
             if at(41,54) then
             if wantenter('���e ���� �A���a') then begin
                x := 13; y := 72;
                Silent_Scroll;
                Clear;
                Print(7,' ��З�e �a�e ���a�� ���� �A���a.');
                exit;
             end;
             if at(14,43) then
             if wantenter('�a�a���A���a�� ����') then begin
                if (y = 44) and (party.etc[41] and bit7 = 0) then begin
                   enemynumber := 2;
                   joinenemy(1,64); joinenemy(2,65);
                   DisplayEnemies(TRUE);
                   Print(13,' ��Ӂ�i�� �� �����A �i�� �a�V�a�� ?');
                   Print(13,' �����i�e  �a�a���A������ �wѡ�i  �{�� ���e');
                   Print(13,'�a���e �a���a�� �a���e �A�a�a�a�� �e�a.  ��');
                   Print(13,'���e ���q�A�� �{�������a�� �a�� ���i�i �a��');
                   Print(13,'���a��.');
                   PressAnyKey;
                   enemynumber := 8;
                   for i := 1 to 8 do joinenemy(i,55);
                   joinenemy(4,64); joinenemy(8,65);
                   DisplayEnemies(TRUE);
                   BattleMode(FALSE,TRUE);
                   if party.etc[6] = 0 then begin
                      Clear;
                      Print(13,' ����... �a���e �a�e ����a�� �e�a�q�e ����');
                      Print(13,'�a�� ���� ���V�a.');
                      Print(7,'');
                      Print(7,' �a���e �A�a�a�e  ���� ����A ��З�� ��A��');
                      Print(7,'�ᔁ�e �a�� �����i�i ���v�a.');
                      Print(7,'');
                      j := 1;
                      i := player[1].agility;
                      for k := 2 to 6 do begin
                         if player[i].hp > 0 then
                         if player[i].agility <= i then begin
                            j := k;
                            i := player[j].agility;
                         end;
                      end;
                      Print(12,' �a���e �A�a�a�� �a�� �����i�e ��З �� �a�w');
                      Print(12,'������� �x�e '+player[j].name+'�A�A �w�� Ж�a.');
                      Print(12,' �a����, '+player[j].name+ReturnSJosa(player[j].name)+' �b�a Ж�a.');
                      with player[j] do begin
                         hp := 0;
                         poison := 1;
                         unconscious := endurance * level * 10 - 2;
                         if unconscious < 1 then unconscious := 1;
                         dead := 1;
                      end;
                      Display_Condition;
                      with party do begin
                         map := 17; xaxis := 25; yaxis := 44;
                      end;
                      Load;
                      party.etc[43] := 0;
                      Silent_Scroll;
                      party.etc[41] := party.etc[41] or bit7;
                   end;
                end
                else begin
                   with party do begin
                      map := 17; xaxis := 25; yaxis := 44;
                   end;
                   Load;
                   party.etc[43] := 0;
                end;
             end;
             if at(9,21) then
             if wantenter('�a�a���A���a�� ����') then begin
                with party do begin
                   map := 17; xaxis := 25; yaxis := 7;
                end;
                Load;
                party.etc[43] := 0;
             end;
             if at(27,9) then
             if wantenter('�Aϡ�aɡ�I�A�a�� �a��') then begin
                with party do begin
                   map := 18; xaxis := 25; yaxis := 44;
                end;
                Load;
                face := 5;
                move(Font^[46],Font^[55],294);
                for i := 5 to 294 do
                Font^[55][i] := (Font^[55][i] and chara^[face+28][i]) or (chara^[face][i]);
                if party.etc[1] < 10 then party.etc[1] := 10;
                Scroll(FALSE);
                PutImage(120,11*24,Font^[55],CopyPut);
                for i := 10 downto 6 do begin
                   delay(1000);
                   PutImage(120,i*24,Font^[55],CopyPut);
                   PutImage(120,(i+1)*24,Font^[46],CopyPut);
                end;
                for i := 1 to 2 do begin
                   delay(800);
                   dec(y);
                   Silent_Scroll;
                end;
                for i := 24 to 27 do PutMap(i,44,24);
                for j := 45 to 50 do
                for i := 23 to 28 do PutMap(i,j,29);
             end;
          end;
      7 : begin
             Clear;
             Print(7,' �w���� ���� �����A �i��a�a �i�� ��� �i�i');
             Print(7,'���v�a.');
             for i := 1 to 3 do Print(7,'');
             Print(15,'   �a���e �e�� ϡ�a���a�a�� �������e �b   ');
             Print(15,'   �a�� �����������e ���q�e ́��A�� �a   ');
             Print(15,'   ���� �i��i ���a ���s���a.');
          end;
      11: begin
             if at(25,7) or at(26,7) then begin
                Clear;
                Print(7,' �w���� �����A �i��a�a Ж���e  ���� �����e');
                Print(7,'�q�� �A�� �i�� �i ���a �����a.');
                if not exist(2) then exit;
                if party.etc[31] and bit8 > 0 then exit;
                PressanyKey;
                with player[2] do begin
                   Print(7,' '+name+ReturnSJosa(name)+' ������ �����i ���a�a�ᓡ �w���A�A �iЖ�a');
                   Print(7,'');
                   Print(3,' �q�e �a���i ���A. �� �����A ���a ���e �j');
                   Print(3,'�e �a�e ���� �j���e �a�a�a�A. �� �� ���A�a.');
                   Print(3,'�����a �᷁ �A����� �eЁ���� �g�e�a. �� ��');
                   Print(3,'���wӡ Ђ ͢�i��  �a���A�� ���� �v���a�e �w');
                   Print(3,'�� ���A.  �� ������ �����a �q���E ���A�e �a');
                   Print(3,'�� Ђ �����a �a���e �ዡ�A ϩ���a�e �� �a�e');
                   Print(3,'�ⷥ  �a��A ��Ё�� ���� �{�A.  �a���a�e ��');
                   Print(3,'���� �e�� �A���A �����a�e ���� ���A�� �� ��');
                   Print(3,'���� ������ �a��i  �a�w�a�e �a�q��  ���a�e');
                   Print(3,'�Q���a�A.');
                end;
                party.etc[31] := party.etc[31] or bit8;
             end;
          end;
      12: begin
             if at(25,28) or at(26,28) then begin
                Clear;
                Print(7,' �w���e �� �����A �i�� �a�a�� Ж���e ������');
                Print(7,'�����e  ����e �w�e ӱ�A ��Ё ����a ������');
                Print(7,'��З�i�� ӱ�a���e ����ӡ �i��i �w���a ����');
                Print(7,'�a. �i���A ��З�e �i��a���i ͡��Ж�a.');
                PutMap(25,25,52); PutMap(26,25,52);
             end;
          end;
   end;
   Silent_Scroll;
end;

Procedure Sign;
begin
   while keypressed do c := readkey;
   Clear;
   yline := 30; hany := 16;
   Print(7,'�u�i�A �a�a������ ...');
   Print(7,''); Print(7,'');
   case party.map of
      2 : begin
             if at(82,101) then begin
                Print(15,'     ϡ�a���a�� �q�b�� ѡ�� ��i ��');
                Print(15,'     ��,  ���� Ё�֔� ���a�� �A��');
                Print(15,'     �e �w�� �|�A��  �a ���a�i �i�a');
                Print(15,'     �a ���i�� ���w�i �e�a �������a');
             end;
             if at(143,116) then begin
                Print(15,'     ��ᵡ�A, å���a.  �a�A�a �a��');
                Print(15,'     �A ���e 6 �a���� ����i ɷ���e');
                Print(15,'     �a�e �w�� ���i�� ���w�i �w���a');
                Print(15,'     �A �I ��A.');
             end;
             if at(30,100) then begin
                Print(15,'     ��!! �e�w�e�a�a. �w���e �w���e');
                Print(15,'     ���w�i ��i �a�b�� ����.  ���A');
                Print(15,'     ���a�� �A��e �w���� �����A ��');
                Print(15,'     �w�i ������.');
                party.etc[44] := party.etc[44] or bit1;
             end;
          end;
      6 : begin
             if at(51,84) then begin
                cPrint(15,11,'         �a���e ','�����','�����a');
                Print(15,'         �a�ᦅ�i �ŵw�s���a');
                for i := 1 to 3 do Print(7,'');
                Print(13,'               ���a �e');
             end;
             if at(24,31) then begin
                Print(7,'');
                Print(15,'             �a���e ���� ����');
                Print(15,'       �a�ᦅ �����i �ŵw�s���a !!');
             end;
             if at(51,18) or at(52,18) then begin
                Print(7,'');
                Print(15,'          ���� �ן�  �A�� ���w��');
             end;
             if at(77,48) then
                Print(15,'          �a���e ���� �eЗ�����a');
             if at(77,42) then
                Print(15,'       ��b ���� �i��a�� �a���� !!');
             if at(77,36) then
                Print(15,'           �a��a �A�I�A�a�� ��');
             if at(77,30) then begin
                Print(15,'   ���q �� ������ �� �A�����a�e �aЗ�i');
                Print(15,'   ��a�� ���s���a. ��A�A �w�巡 ���a');
                Print(15,'   �����e ���� Ё�e�a�� ��������.');
             end;
             if at(77,24) then
                Print(15,'         �a���e �A�a�i�A�a�� ��');
          end;
      7 : begin
             if at(39,68) then begin
                cPrint(15,11,'       �a���e ','�a�a�a��á��','�����a');
                Print(15,    '          �a�ᦅ�i �ŵw�s���a');
             end;
             if at(39,8) then Print(12,'        �a���e �� ϡ�a���a �� ����');
             if at(54,9) then Print(10,'       �a���e �a�a���a �A���a�� ����');
          end;
      12: begin
             if at(25,41) then begin
                Print(15,'   �w���� ���a �A���� ɷ�a�e �����i');
                Print(15,'   �i�� ���a�e ���� ���� 4���� �A��');
                Print(15,'   �i ���� �w�a ��������.');
             end;
          end;
      18: begin
             if at(24,40) then begin
                Print(10,'   �e�a�� �Aϡ�aɡ�I�A�a�i ������ ��');
                Print(10,'   ����. ��ʁ�i ���V��.');
                for i := 1 to 7 do Print(7,'');
                Print(14,'      ���a �e�� �A���e�a ���i�� ����');
             end;
             if at(27,40) then begin
                Print(10,'   �b�� �a�� �A���e ҉�W�a�� �g�� ?');
                Print(10,'   ���A �a�� 16 �弁 �a�b �A���� �i');
                Print(10,'   �i�� �a�a���� ����. �᷁ �e�i �a');
                Print(10,'   �a�� �e�i�����e�A...');
                Print(7,'');
                Print(7, '   �A�b ���e :  93/12/08 - 94/01/04');
                Print(7,'');
                Print(15,'    ���a ���b�a �勡 ���b�� 92 �b��');
                Print(15,'        �a÷ �a�w �A���� �a���a����');
                Print(14,'                      �e �w��������');
             end;
          end;
   end;
end;

end.