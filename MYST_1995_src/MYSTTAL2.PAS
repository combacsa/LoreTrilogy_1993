Unit MystTal2;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, MystBatt, MystEnd;

 Procedure TalkMode_Sub0;


IMPLEMENTATION

Function sgn(eq : integer) : integer;
begin
   if eq > 0 then sgn := 1
   else if eq < 0 then sgn := -1
   else sgn := 0;
end;

Procedure TalkMode_Sub0;
begin

   Clear;

   if mapname = 'Lore' then begin

      if at(91,65) or at(94,68) or at(87,73) then Grocery;
      if at( 8,71) or at(14,69) or at(14,73) then Weapon_Shop;
      if at(86,12) or at(87,14) then Hospital;
      if at(16,64) then Sell_Item;
      if at(21,12) or at(25,13) then About_Class;
      if at(12,13) then Sell_EXP;

      { Inn }
      if at(12,49) then
         Print(14,' �� �A���� �w���a�e �e�w���������a �a�e �ᔁ�e �a���a���ᷳ���a.');
      if at(15,55) then begin
         if not getbit(35) then begin
            Print(7,' �w���� Ѣ��  �� �a�i �a��΁�a�� �{�e �q�w');
            Print(7,'�i �a�wЖ�� '+player[1].name+ReturnBJosa(player[1].name)+' �a���a�a?');
            Print(7,' �b�� �a�����a. �w���� �A�a����a�� �����i');
            Print(7,'�e�a�e �i�i �i���s���a. �e�� �a�A�a ���a��');
            Print(7,'�a�e  �� �a�i�i �w���� ��З�A �q�a ���a ��');
            Print(7,'�� �� ���V�s���a? ���q�e ���� �镡 �A�� �s');
            Print(7,'�a ���e �������e  ���� �� �a�i�� ���e ����');
            Print(7,'�� �A�� ��a�a �A�e �������s���a.  �a�a ��');
            Print(7,'�e �A�� �g�i �������a. �A�i ���b�s���a.');
         end
         else begin
            Print(7,' '+player[1].name+'��. �A �a�i�i �i ���b�s���a.');
         end;
      end;
      if at(22,50) then begin
         cPrint(7,11,' �a�� ���q�e ','�iš�a','�a�� �a��.  �a�e ������');
         Print(7,'��a���� �a�� ���i �����a�a�a��. �bӡ �w��');
         Print(7,'�� �q�A �A�a����� �����i �a�� ���e�A �w��');
         Print(7,'���b�e �����?');
         m[0] := '';
         m[1] := '�a�� ���e ���b�����a';
         m[2] := '���e�a���e �a�� �� ��s���a';
         if Select(150,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '�iš�a';
                  sex := male;
                  class := 3;
                  classtype := sword;
                  level := 2;
                  strength := 15;
                  mentality := 5;
                  concentration := 6;
                  endurance := 12;
                  resistance := 15;
                  agility := 14;
                  accuracy := 16;
                  luck := 12;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := endurance * level * 10;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 3;
                  shield := 0;
                  armor := 1;
                  potential_ac := 2;
                  sword_skill := 40;
                  axe_skill := 0;
                  spear_skill := 0;
                  bow_skill := 0;
                  shield_skill := 0;
                  fist_skill := 10;
                  Modify_Item(k);
                  PutMap(22,50,44);
                  setbit(36);
                  Silent_Scroll;
                  Display_Condition;
                  Clear;
               end;
            end
            else begin
               Print(7,' ��� �a�q�� ���� �����a �����a.  �a�q ���A');
               Print(7,'�i ���a�����a.');
               exit;
            end;
         end
         else asyouwish;
      end;
      if at(22,54) then begin
         cPrint(7,11,' �a�e ������ ���a�� ���e ','���a�a','�a���a��.');
         Print(7,'�w���� �����A ���q�e�a�e  �e �w�׷a�� �a��');
         Print(7,'�V��.');
         m[0] := '';
         m[1] := '�a�� �a���A �a����';
         m[2] := '�a���e �a�� �� ���e�a��';
         if Select(140,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '���a�a';
                  sex := male;
                  class := 2;
                  classtype := sword;
                  level := 2;
                  strength := 13;
                  mentality := 6;
                  concentration := 8;
                  endurance := 15;
                  resistance := 16;
                  agility := 16;
                  accuracy := 15;
                  luck := 14;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := endurance * level * 10;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 2;
                  shield := 1;
                  armor := 2;
                  potential_ac := 2;
                  sword_skill := 20;
                  axe_skill := 10;
                  spear_skill := 5;
                  bow_skill := 0;
                  shield_skill := 10;
                  fist_skill := 10;
                  Modify_Item(k);
                  PutMap(22,54,44);
                  setbit(37);
                  Silent_Scroll;
                  Display_Condition;
                  Clear;
               end;
            end
            else begin
               Print(7,' ��� �a�q�� ���� �����a �����a.  �a�q ���A');
               Print(7,'�i ���a�����a.');
               exit;
            end;
         end
         else asyouwish;
      end;

      { Pub }
      if at(13,27) then begin
         if player[1].sex = female then s := '�a��' else s := '�q��';
         Print(7,' �ዡ '+s+'��, ��� �f�a�����a.');
      end;
      if at(18,27) then
         Print(7,' ���� ���� �w���� š���a ��aǡ �u �� �����V�s���a?');
      if at(21,33) then
         Print(7,' ���q�e �q�a�a�����a.');
      if at(18,38) then begin
         Print(7,' �a�A�i �� ���� �i�v�e�A �a�� ���A �A����.');
         Print(7,'�a! �a ���q�a�� �e �e �h�A�a. ��~~~�� !!');
         if party.etc[5] > 0 then begin
            Print(7,'');
            Print(7,' �w���� ���s�i ����  ���a �a���a �A�a�� ��');
            Print(7,'�� ���a�� ���i ���a  ���b�a�e��.  �a�A�i');
            Print(7,'���������e �a�q�� ���e�A �a�A�e ���a?');
            m[0] := '';
            m[1] := '�b�� �e�a�A�a�s���a';
            m[2] := '�e�����e �a���a�V�s���a';
            if Select(170,2,2,FALSE,TRUE) = 1 then begin
               k := 0;
               repeat
               inc(k);
               until (player[k].name = '') or (k = 6);
               if k < 6 then begin
                  with player[k] do begin
                     name := '�e�a�A�a Jr.';
                     sex := male;
                     class := 4;
                     classtype := magic;
                     level := 15;
                     strength := 10;
                     mentality := 20;
                     concentration := 20;
                     endurance := 15;
                     resistance := 17;
                     agility := 19;
                     accuracy := 17;
                     luck := 18;
                     poison := 0;
                     unconscious := 0;
                     dead := 0;
                     hp := endurance * level * 10;
                     sp := 0;
                     experience := 0;
                     potential_experience := ReturnEXP(level);
                     weapon := 0;
                     shield := 0;
                     armor := 2;
                     potential_ac := 0;
                     sword_skill := 60;
                     axe_skill := 30;
                     spear_skill := 30;
                     bow_skill := 0;
                     shield_skill := 0;
                     fist_skill := 0;
                     Modify_Item(k);
                     PutMap(18,38,47);
                     setbit(38);
                     Silent_Scroll;
                     Display_Condition;
                     Clear;
                  end;
               end
               else begin
                  Print(7,' ��� �a�q�� ���� �����a ����.  �a�q ���A�i');
                  Print(7,'���a������ �a��.');
                  exit;
               end;
            end
            else asyouwish;
         end;
      end;
      if at(13,32) then
         Print(7,' �b�� ���e š���a ��aǡ(����)�a �A����.');
      if at(15,35) then
         Print(7,' �q��, �q��, ƉƉƉ...');
      if at(18,33) then begin
         Print(7,' �� �A���e �a������ ���B�� ���a�� �a�ኅ�a.');
         Print(7,' ���� ���B, �a���a �A�a,  �a�a�����A �A�a,');
         Print(7,'���ᕡ �A�a, ���a���a �A�a�a ���a�� �i���s');
         Print(7,'���a.');
      end;
      if at(10,30) then begin
         Print(7,' �e�� �w���� �A�a����a�� �a�a �e�a�e,  �a');
         Print(7,'���a �A�a�i ���a  �a ���� ���e  �a�a�����A');
         Print(7,'�A�a�� �a�� �s���a.');
      end;

      { Prison }
      if at(50,11) then begin
         Print(7,' �w���e ���i З�������a.  ���a�e���e �e ��');
         Print(7,'�剡���� ϡ�����A ��Ё��e  �锁�� �a�e ��');
         Print(7,'�a ���e ���� �����e�A �i�����a.');
      end;
      if at(53,11) then begin
         Print(7,' �w���e ���a�e���A ��Ё�� ��Ȃ �A�ụ ���e');
         Print(7,'�����a.');
      end;
      if at(41,10) then begin
         if party.etc[20] = 0 then
            Print(7,' �b�i�e ���� ���e�e ���� ���e �w�� �a���� ������a.')
         else
            Print(7,' �a�� �a�A��� ����i �a�� ����.');
      end;
      if at(63,9) then begin
         Print(7,' �a�e �a�e �������� ���s�A ���e ���i  �i�e');
         Print(7,'�a�a�a�a �a�w �剡�i �h�v�s���a. �a�e ���i');
         Print(7,'�ⶉ�s���a.  ���a�e���� �i���b �b�i З�a�e');
         Print(7,'�a�e �������� ���s�e  �b���� ���s�i �i�a�e');
         Print(7,'�����a�e �󓡔a. ���a �a�e �y�y�� �����i�e');
         Print(7,'Ё�i ��á���� �a���e �a���e �a�� �a�i�� ��');
         Print(7,'���� ������ �iš ������ �b�e ���e �a�����a.');
         Print(7,'���a�e���i �ᯡ�e ������ �a�B�A���e �ᢁ�a');
         Print(7,'��i �w���a�a �b�i �����a�a �s���a. �a���e');
         Print(7,'��a ������ ϩ�a�b�� ���ᴡ �a�a ���� �a�B');
         Print(7,'�w���A ���e �w���e �q��������  �añ���e �a');
         Print(7,'�A��a�� ���AЁ �៩�󓡔a.');
      end;
      if at(40,15) then begin
         Print(7,' �� �| �w�A ������ '+player[1].name+' �a��.');
         Print(7,' ���A �A�� ���a�e�� ���e ���a �A����. �a');
         Print(7,'�a ���e �iű�e �a�w�A �����i �e�a�e �b���a');
         Print(7,'...');
      end;
      if at(61,15) then begin
         Print(7,' �a�e ����a �g�a�� �a�w�剡�i �h�v�s���a.');
         Print(7,'���a�e���� �ᢁ�a�����a.  ��A���e  �A�w�i');
         Print(7,'�e�a�e ���� �����e �a �{�e �������A�A�� �a');
         Print(7,'�w�i �剡�a���a��...');
      end;

      { Grave }
      if at(72,78) then begin
         Print(7,' �a���e ������� �a�������a. �q���� �i��a');
         Print(7,'�� �a�����a.');
      end;
      if at(64,76) then begin
         Print(7,' ����A ��� �i�� ���a �����a.');
         Print(7,'');
         Print(7,'');
         Print(15,'   �a���e �ᔁ�e ����a �A�A�a�� �a');
         Print(15,'     620�e 8�� 30�� �a���A �q�i�a');
         Print(7,'');
         Print(7,'');
         Print(7,' �w���� �a�Aӡ ���� �a���� �a�����A Ӂ���a');
         cPrint(7,11,'�A ','27,6',' ���a�� ���a�a ���q�i �i�v�a.');
      end;

      { Citizen }
      if at(56,64) then begin
         Print(7,' �� �A�w�A �����a�e ���e �巁 ���a�a�e  ��');
         Print(7,'�a�e�����a �b�� ���a�a�e �A���e�a ���i����');
         Print(7,'�a.');
      end;
      if at(59,82) then begin
         Print(7,' �A�w�� �b�e ���� �w���A�ᴡ �s���a.  �a�a');
         Print(7,'�a�� ���a�e���e�� �i �� ���i �󓡔a.');
      end;
      if at(10,73) then begin
         Print(7,' ���� ���B�A�e ���� ������� ���B�� �q����');
         Print(7,'�A ���e �a�a�a ��á���� ���s���a. ������e');
         Print(7,'������ ���巡�e �u���a  �a�a�a ��á���e �A');
         Print(7,'ҁ�a�� ��ˡ�e �a�i�� �����e �u�����a.');
      end;
      if at(80,23) then begin
         Print(7,' �a�e ���B�� �q�����A ���e �A��a �q�׵A��');
         Print(7,'���a�� ���s���a.');
      end;
      if at(24,37) then begin
         Print(7,' ���a���� �a�����e ���� �������a  �������e');
         Print(7,'�a���� �i�����a.');
      end;
      if at(90,42) then begin
         Print(7,' �a�����e ���� �������A �i�a ѡ��ⷥ ��Α');
         Print(7,'�i ���v��a.');
      end;
      if at(31,64) then begin
         Print(7,' �A���e�a ���i�e  �� �A�w�A �b�i ������ �a');
         Print(7,'���e �a�� �a�e �a�����a.');
      end;
      if at(90,82) then begin
         Print(7,' �寥�� ���B��  �������� ���B�e  �e �e���i');
         Print(7,'�w���� �a����a ���a��A�a.');
      end;
      if at(62,38) then begin
         Print(7,' �a�����A ���e �A�a��� ñ���e �A���e�a ��');
         Print(7,'�i�� ��ҁ �����e �����a��  ���a�e���� �a��');
         Print(7,'���ኅ�a.');
      end;
      if at(42,31) then begin
         Print(7,' �a���a�i�� ���� ��ǥ �y�y�� �����i�e �锁');
         Print(7,'�����i ���e�a�� �g�e�a�� �a�ኅ�a.');
      end;

      { Soldier in Palace }
      if at(50,51) or at(52,51) then Print(7,' �w���� �����i �����a�� �����s���a.');
      if (x in [48..54]) and (y in [31..37]) then begin
         if party.etc[20] < 3 then
            Print(7,' ��� ���� �������i �e�a �������a.')
         else
            Print(7,' �e�A, �e�A, �e�e�A, ���a�e �e�A');
      end;

      { Lord Ahn }
      if at(51,28) then
      case party.etc[20] of
         2 : begin
                Print(7,' �a�e �A�a��� �����A �a�e  �����a�i  �x��');
                Print(7,'������. �a�� �w�e�a�� �������e �{�A �w���i');
                Print(7,'��Ȃ�a�A �E��a. �e�� �w���� �A�a��� ����');
                Print(7,'�i �������A �{���a�e  �w���� ����e �i�q��');
                Print(7,'���A ���V��.  �a���� �w���� ���a�e �k�i �A');
                Print(7,'��Ё �� ������ ����. �w���� ���� �A�� �a');
                Print(7,'�� �w�a�i�i �s�A ��ǩ ���� ����. �w���� ��');
                Print(7,'����a�� �����i �Ů��a�� ���e  �a�q�� ���V');
                Print(7,'��.  �A�a�����  ��á�i  �i ���a�V�a�e  �a');
                Print(7,'�i �a�q�i�A�A ���� ���e �I��a.  �a�e ���A');
                Print(7,'�� �� ��������  �i���� З��Ё��  �w�Ŵ���.');
                Print(7,'�a����  ���a �a�e ���� �����i�A�A�� �w���A');
                Print(7,'�A ѡ���i �AΉ�� ������ ���bЖ�a��  �a�a��');
                Print(7,'���A �A�a�a�� �a�e�A �i ��a���e ���i��a.');
                Print(7,'�w���i ���V��.');
                Print(7,'');
                Print(11,' [ �׋q + 5000 ]');
                Print(7,'');
                PressAnyKey;
                party.gold := party.gold + 5000;
                inc(party.etc[20]);
             end;
         3 : begin
                Print(7,' �w���e �a�a�����A �A�a�� �A�a����a��  ��');
                Print(7,'�q �b�� ��a�� �a��.');
             end;
         4 : begin
                Print(7,' '+player[1].name+', ���i �w�e ���i Ё������.');
                Print(7,' ���A �w���e �Ÿ��e �a�A�� ������. ���� �a');
                Print(7,'�� �����a��.');
                Print(11,' [ �׋q + 40000 ] [ �w��á + 200000 ]');
                party.gold := party.gold + 40000;
                for i := 1 to 6 do
                if player[i].name <> '' then
                   player[i].experience := player[i].experience + 200000;
                inc(party.etc[20]);
             end;
         5 : begin
                Print(7,' �w���A�A  �e �a�� ���b�i  �� Ё�� �A�V��?');
                Print(7,'�� ���e �w���� �{�e �w���i�e��  �i �� ����');
                Print(7,'�����A  �w���A�A ���b�a�e ������.  �a�� ��');
                Print(7,'�A���A�e ���e ���A�A š���a���� �a�aš���e');
                Print(7,'���� ����.  �a �����i�e ���a�a �a���{�e �a');
                Print(7,'�s �����A ��Ё��e  ���w�e ��ʁ�b�i �a����');
                Print(7,'���e�A�a�a �a�aš���e�� �{�e �w���A �����');
                Print(7,'�e �������a �� ���e ���w�� �����i �a����');
                Print(7,'����.  �a�i�e 2���� ���B�i �a���a�� ���a�e');
                Print(7,'�� �w�w ���e�i�i �����a�� ���� �����A ���e');
                Print(7,'�i�� ���i �wЁ�a�e �a���a��  �i �� ����.');
                Print(7,'�e�� �a�i�� �����i�� ���e ���B�i  ñ���e�a');
                Print(7,'�e ����A �I�廡�e ��ӡ ���w�I��a. �bӡ');
                Print(7,'�a�aš���e���� ��a�e�a�e ���� ���B�i �A�A');
                Print(7,'�a���e ���� ��i �I���� ���e �����A�a�a ��');
                Print(7,'�� �b���� �a�� �����e ���w�a�� ӱ�i������.');
                Print(7,'�a�i�� �����a�� ���e �b�� ���� �A���e�a ��');
                Print(7,'�i�� �a�i�i �啷�a�a �����a�� �a�i��ַi��');
                Print(7,'�i �w�wЁ �֭�?  �a�a  ����e�i �A��Ё����');
                Print(7,'������ �w���e �e�eӡ ����a �៩ ������.');
                Print(7,'');
                inc(party.etc[20]);
                PressAnyKey;
             end;
         6 : begin
                Print(7,' �w���A�A ���b�a�V��.  š���a���� �a�aš��');
                Print(7,'�e���i ��A ���b�a�a  ������ �w���i ���w�a');
                Print(7,'��  �����B ����i �|�w���A Ё������.  �e��');
                Print(7,'�w���� �a �� �����i �iЁ���a�e �a�e ���a��');
                Print(7,'�a�A�a�i �w���A�A ��a�� ������ ����. �A�i');
                Print(7,'���b�a��.');
             end;
         7 : begin
                Print(7,' ���a�֊��a. '+player[1].name+'.');
                Print(7,' �b�� ���a ���e ���e ����Ж��.  �w�����a�e');
                Print(7,'���wӡ  �����A�A  �w���i �e�a����e�� �i�v');
                Print(7,'��. �w���A�A ������ �����e ���a���a �A�a��');
                Print(7,'�� �w���� ���A �i��i ��a. �a���� �a�� �w');
                Print(7,'���e �a���� �����a �A�e ������.');
                Print(11,' [ �׋q + 100000 ] [ �w��á + 2500000]');
                party.gold := party.gold + 100000;
                for i := 1 to 6 do
                if player[i].name <> '' then
                player[i].experience := player[i].experience + 2500000;
                PressAnyKey;
                Print(7,' �a���e  �a��A ��� �i ���� ���v��.  ���q');
                Print(7,'�������a ϡ�i�a�A�� �����ⷥ �e�e�� �i��Ж');
                Print(7,'�e�A �i�� ���s�a�� �g�a�e  �a�e ���a���a��');
                Print(7,'�廩���� ���a��.  ���巁 �e�e�e  �a�A ���e');
                Print(7,'�e�b���� �����A  ��A ���e ���巡�a�� �h�a');
                Print(7,'�i���� ����.  �a�i�� ���� З��e �a���� ��');
                Print(7,'�a�� �w���i ���� �១�a�e  �A���e�a ���i��');
                Print(7,'�a���b �i�b���� �{��.');
                setbit(50);
                inc(party.etc[20]);
             end;
         8 : begin
                Print(7,' �b�� �������a ϡ�i�a�� �a�� ͢���i ���sЁ');
                Print(7,'������.  �w���� �a ���i �{���� ���a���e �a');
                Print(7,'�e �w���A�A ���b�� �b��� �q�A ���a���a �A');
                Print(7,'�a�A  �w���� �����i ����a���� ��bЁ ���V');
                Print(7,'��.');
             end;
         9 : begin
                Print(7,' �w�� ��Ȃ�A  �A�w�e �Ÿ��e �w���i ��A �A');
                Print(7,'����.  �a���� �����e���� �w���A�A ���a���a');
                Print(7,'�A�a�� ɷá���� ���b�� ÷ѡ�i ���a���V��.');
                Print(7,' �a�a��, '+player[1].name+' ���b...');
                Print(7,' �a��A  ���e�a���e �e�a�� ���b�e  �� �i��');
                Print(7,'���V��? �w���� �i�w��ǥ �A������ �a���e ��');
                Print(7,'��ӡ �a�a���A �a����. �a�i�e ���q �e��, ��');
                Print(7,'��e �a ������ �����a  �a�a�� ���a  �a����');
                Print(7,'���� ���B�A  ��ѥ�� �A�� �q�a����.  �a���i');
                Print(7,'���A��e  �a�a���� ������ �����i зЁ ���e');
                Print(7,'��ѥ�� ����.  �a ��ѥ�i�� �� ���B�A �i���');
                Print(7,'�� �����A�A �����a�� ��A �����a ��� �a�i');
                Print(7,'�i �i�e�a�a �w�e ӱ���A ���� ���a ��a���a');
                Print(7,'��. �a���� ���b�a��A, �� �a���a�i ���i �h');
                Print(7,'�a����. �� �a���a�i �� ���i �i�a�a ���e ��');
                Print(7,'�a, �a��, š���a, �a�aš���e ������ ��ѥ��');
                Print(7,'���e �w���a �a��i��a. �a���� �a �w���A��');
                Print(7,'�a�i�� ��ѥ�i �i�e�a�a �a���a�i �� ���A ��');
                Print(7,'�� ���a �១����. �A �����i ���� ���� ���v');
                Print(7,'�i��  �a �a���a�i ���i �a�A�A �a�a���e  �a');
                Print(7,'��ҁ�e ���a �i�a�� �a�V��.  �a����  �w����');
                Print(7,'�wɡ�� ���a���a �A�a�� ���� ���a ���V��.');
                Print(11,' [ �a���a�i �� + 1 ]');
                Print(7,'');
                PressAnyKey;
                inc(party.crystal[9]);
                inc(party.etc[20]);
             end;
        10 : begin
                Print(7,' ���a �� �a���a�i ���i ���w�a�a  �A ������');
                Print(7,'��ѥ�i ���� �a �e�A �������a�� �a�A�A �a�a');
                Print(7,'������. �� ���b�a��.');
             end;
        11 : begin
                x := 51; y := 31;
                face := 1;
                if player[1].classtype = magic then inc(face,8);
                Delete_Scroll_Screen;
                delay(1000);
                Silent_Scroll;
                Print(10,' ��, '+player[1].name+' ���b!');
                Print(10,' �w���e �a�� �a���b ���b�a�� ҉�W�a�A �i��');
                Print(10,'������.  ���A�e �w���A�A �� ���w ���� ���i');
                Print(10,'��ǡ�� �g�V�a�� �����a��.  ���, �A ������');
                Print(10,'��ѥ�i �����e �a���a�i ���i ���� ������.');
                PressAnyKey;
                for i := 5 downto 4 do begin
                   PutTile(5,i+1,42);
                   PutSprite(5,i,face);
                   delay(500);
                end;
                delay(1000);
                for i := 4 to 5 do begin
                   PutTile(5,i,42);
                   PutSprite(5,i+1,face);
                   delay(500);
                end;
                Print(10,' ���A�e �� �������i�i �Ÿ�ӡ ����Ё�� �a��');
                Print(10,'�e �a�i�� ��ѥ�� �����i ���s�a�� ���a�A Ё');
                Print(10,'���V��.');
                delay(1000);
                Print(7,'');
                Print(7,' ���a�e��  ���A �i�� �a���a�i ����  �a�s�A');
                Print(7,'�ᵡ�a�� ���bЖ�a. ���a�e�e �a�q ������ ��');
                Print(7,'�b�i �w�w ���v�� �a���a�i ���e ���A �i�a��');
                Print(7,'�a�� ���bЖ�a. ������ �a���a�i ���e ���i��');
                Print(7,'���e �A�ỡ ���a�� �e�a�v�a.');
                Print(7,'');
                PutSprite(5,4,20);
                PressAnyKey;
                Print(10,' �a, ���A �����i �a���� ���A �i �� ���e ��');
                Print(10,'�a�� ���� ��a���V��.  �a���e �a�� ���� ��');
                Print(10,'�B�� ���a�A ���e �a�A�a �A�a�a���i �a�e ��');
                Print(10,'����.');
                delay(1000);
                Print(7,'');
                Print(7,' ���a�e�� �����i �����a �A�ỡ ���e ���ӡ');
                Print(7,'���a�� ��ỡ�� ���bЖ�a.  �a�����e �a�b�A');
                Print(7,'�a�a�a�e ����� �w���a�� �a�a�a ��v�a.');
                Silent_Scroll;
                PressAnyKey;
                Print(10,' �a��, ���A �w���i ���a���a �A�a�� ���� ��');
                Print(10,'�V��.');
                PressAnyKey;
                PutTile(5,3,42);
                PutTile(5,4,54);
                Print(10,' �a��A �w���e ������ ���s�a�� ȁ��i��a.');
                Print(10,'�a�ዡ ��Ё��e  �w���� ��З�i�� �a�� ���a');
                Print(10,'�i�� �a���i ϡЁ�����e �a��.  �a ���A�e �a');
                Print(10,'�a �i�a �a�����a.');
                PressAnyKey;
                for i := 2 to 6 do player[i].name := '';
                Display_Condition;
                for j := 3 to 5 do begin
                   PutTile(2,j*2,44);
                   PutTile(8,j*2,44);
                end;
                Print(7,' �q���e�� ñ���� �i���a.');
                delay(3000);
                Print(7,'');
                Print(7,' ���q  ����A�e �a���� ���a�e ���i  �·��e');
                Print(7,'���a�e�e  �s�a�� �w���i зЁ �����i �a�w�a');
                Print(7,'�� ���bЖ�a.  �w���e ���w�i �Ÿ�ӡ Ή�� ��');
                Print(7,'����A�a�a ���a�e�� �s�b�a�� �A�e�A �i�a�i');
                Print(7,'��  �w��i �i ���A�� ����  �a�A�A �������i');
                Print(7,'�w�a�v�a. �w���e �� �w���� �a�A���a�i ����');
                Print(7,'��v�� ������ �a�bЁ���� ���b�a�v�a.');
                PressAnyKey;
                Print(10,' ���i ���e�a�A ���A, '+player[1].name+'.');
                Print(10,' �w���e  �a���� �a�i ��Ё ��Ё �����e�A �a');
                Print(10,'�e �w���A�A �����A �i �� �c�A�e ���a�A. �a');
                Print(10,'�e  ��q���� ���� �w���i  �����a�� ������.');
                Print(10,'�a���� �ŉ��i �e�i�� ��Ё��  �w���i �i���A');
                Print(10,'�� ���v�� ���� �a�v��,  �w�w �埡�e�� ʁ��');
                Print(10,'��  �w���i �q���a�� �a�q��  �a�� �a�v�a�A.');
                Print(10,'���q�� �w���e  �a ���a�e�i �A�A�a���e �w��');
                Print(10,'��ӡ �� �A�� �A�w�� �w�a����. ���a ���q �a');
                Print(10,'�a�e �������i �i �i�ᥡ�A.');
                PressAnyKey;
                Print(10,' �����e �e�� �ᢁ �w���a �����A��� �a�q�i');
                Print(10,'�� �e���� �w���i ���a ���a�� �i���i ���e�a');
                Print(10,'�A.  �a���� ���a ������ ���i ���q �����a�a');
                Print(10,'��. �a �����e ��� �b�� ���a�a �� �A���A');
                Print(10,'�a�a�a  �a�q�i�i ���s�a�� �b�i ��a�a�� ��');
                Print(10,'�A���� �w���i �i�i�a�a�� �i�� �a�� ���a ��');
                Print(10,'Ȃ�e ������ �ɴ��a�� �A���e �a�� �w���i �x');
                Print(10,'�A�A��  �����i�e �ᶂ �a�A�A �q�a�a�a ��i');
                Print(10,'��ǡ�a ���b�e�a�e ���w���A. ���� ���i ���a');
                Print(10,'���v�a�e ���i  �a���� �i�����e�a�e �a�e ��');
                Print(10,'�wӡ  �w���� ���A�����᷁ �a���i  �¥��a�A');
                Print(10,'�E�a�A.  �a���� ϩ�a�e �a�q�e  �a�� ��A��');
                Print(10,'�i�e ''�b�� ���a''�a �I  �a�q���A.  �a���e');
                Print(10,'�a���� �����a�� �g�i��e��  ���e �a������.');
                Print(10,'�a���� �A���i ���s �i �e�e �w�b�i �a��  �w');
                Print(10,'���i ���寢�a�� �i�� �i����a�A. �w���e �w');
                Print(10,'�w �b�i ��a���a  �� �A���A  �i�i �������e');
                Print(10,'���ӡ �a�� ���a ��Ȃ�e �w�a�A ��Ё ́���a');
                Print(10,'�A �A��. �a���� �a�� �w���� ���A ���A�I ��');
                Print(10,'�w���a�A.  �w���e ���A �a�a���� �a�A���a�A');
                Print(10,'�ŉ����� ���w�A ���a�� З���a�A �I��A. �a');
                Print(10,'���e ́���i �ᢁ �����i ϩ�a�e ���A.  �A��');
                Print(10,'�ⷥ �w���e �w���� �a�A �e�i�� ���A���a...');
                Print(10,'');
                PressAnyKey;
                Print(7,' ���a�e�e �i�i �aá�a  �w���i зЁ  ������');
                Print(7,'�a���i �����a �����i �A���� ���bЖ�a.');
                delay(2000);
                PutTile(5,6,42);
                PutSprite(5,6,26);
                PutSprite(5,5,25);
                PressAnyKey;
                Print(10,' �w���e ���A �b�� ���a���᷁ �w�A�i �x');
                Print(10,'���a�A. 4 m �a���� ǡ�� �w�b�e �a�b�i �q��');
                cPrint(10,11,'�e �b�� �A�� ��ʁ�a����...  �w���e ���A ','�A','');
                cPrint(10,11,'','�a���e��','�e ���q�a��  �� �A�w�� �w���a ����');
                Print(10,'���� �I ��  �� �A�w�i ���s�a�a ���a�� ���w');
                Print(10,'�i �a���A �A���a�A.  �w���e �a��  ���a���a');
                Print(10,'�A�a�i ����a�� �A�b�i ��á�A �I��A. �a��');
                Print(10,'�e �w���� ���a���a �A�a�� ������ �I��a�A.');
                Print(10,'�a�a �a���ᴡ  ���a �w���A�A ���a���a �A�a');
                Print(10,'�i ���V�a�e ������ ���a�� ��A.');
                Print(10,'');
                Print(10,' �a��... �e�w, �A�a���e��.');
                Print(10,'');
                PressAnyKey;
                PutTile(5,6,42);
                PutTile(5,5,42);
                Print(7,' �A�a���e�ᝡ �e�e �w���e ���e�� �q�i ɷЁ');
                Print(7,'�a�e ���e�a�� �a�a ��v�a.  �a���� ���� �A');
                Print(7,'���� �w���a �ᢁ ���� �A���I ��  �w���e ��');
                Print(7,'�w�A ��Ё �� �A���� ���a �� �����a.');
                PressAnyKey;
                Clear;
                Screen_Fade_Out(500);
                SoundOn := FALSE;
                mapname := 'UnderGrd';
                Load;
                x := 31; y := 21;
                PutMap(46,48,54);
                OverLap(400,FALSE);
                PutSprite(5,6,20);
                while (x <> 46) or (y <> 48) do begin
                   x := x + sgn(46-x);
                   y := y + sgn(48-y);
                   Scroll(FALSE);
                   PutSprite(5,6,20);
                   delay(300);
                end;
                mapname := 'Dome';
                Load;
                x := 26; y := 6;
                PutMap(28,21,53);
                OverLap(400,FALSE);
                PutSprite(5,6,20);
                while (x <> 26) or (y <> 14) do begin
                   x := x + sgn(26-x);
                   y := y + sgn(48-y);
                   Scroll(FALSE);
                   PutSprite(5,6,20);
                   delay(500);
                end;
                Scroll(FALSE);
                delay(5000);
                for y := 15 to 18 do begin
                   Scroll(FALSE);
                   delay(1000);
                end;
                delay(3000);
                for j := 11 downto 9 do begin
                   if j < 11 then PutTile(8,j+1,44);
                   PutTile(8,j,52);
                   delay(500);
                end;
                Print(13,' �a�a���A���a�a,  �w�q �A�ỡ ���� �� �w�a');
                Print(13,'�� �i��a�e ���i ���v�e�A ����A �E�����a?');
                PressAnyKey;
                Print(12,' ��, �Aϡ�aɡ�I�A�a��.  �a���e ��ѥ�� ����');
                Print(12,'�E �A�ỡ �����A  ���a�e�� ���a�A���� �៥');
                Print(12,'�������a. �a��A �a���� �a����a���� �� ��');
                Print(12,'�a�� �i��v�s���a.');
                PressAnyKey;
                Print(13,' �a��? �a���a�e ���w �a����a���� �a�����A');
                Print(13,'�� ��ѥ�i �����e�� ȁ�� �a�e �a���a �i����');
                Print(13,'�� ���i �����a. �a �a���a ȁ��v�i��, ����');
                Print(13,'�� ӱ�a�� �����E ��ѥ�i Ή�� �៥�a�e ����');
                Print(13,'�e �a ӱ�i ���wЁ �A���i �����i �� ���i ��');
                Print(13,'���a. ҁҁҁ, ���a�e�e ���i �����e ���i Ж');
                Print(13,'��.');
                Print(13,' �����A�A ������ ���� ���A�i �� �១�a��..');
                PressAnyKey;
                End_Demo(1);
             end;
      end;
   end;

   if mapname = 'Dark' then begin

      if at(87,73) or at(94,68) or at(91,65) then Grocery;
      if at( 8,71) or at(14,69) or at(14,73) then Weapon_Shop;
      if at(86,12) or at(87,14) then Hospital;
      if at( 9,64) then Sell_Item;
      if at(82,16) then Medicine;
      if at(21,12) or at(25,13) then About_Class;
      if at(28,12) then Sell_EXP;

      if at(19,53) then
         Print(14,' �� �A���� �w���a�e �e�w���������a �a�e �ᔁ�e �a���a���ᷳ���a.');
      if at(13,55) then begin
         Print(7,' ���� �y�e ��A  �����e  �A�a���e��e �a�A');
         Print(7,'��Ё �e ѥ�e�� �����s���a.');
      end;
      if at(24,50) then begin
         Print(7,' �e�w�a����.');
      end;
      if at(13,27) or at(18,27) then begin
         Print(7,' �a���e š���a ��aǡ�a �A�� �i �i�����a.');
      end;
      if at(21,33) then begin
         Print(7,' �a�a�q�e �ᢁ �i ���� ����� �a���s���a.');
      end;
      if at(18,33) then begin
         Print(7,' �w��  ���i ���w�e �a�������a.  �᷁ 100�e');
         Print(7,'��A�a ���� �����A...');
      end;
      if at(13,32) then begin
         Print(7,' ǢǢ.. ���i ���a�� ���w�i �a�� �����a.');
      end;
      if at(18,38) then begin
         Print(7,' �a���e �ᢁ �a���e �A�w�� �e�����A�a.');
      end;
      if at(50,11) or at(53,11) then begin
         Print(7,' �aȁ�� �e 20�e�e  �a���� �����A �hӡ�� �g');
         Print(7,'�v�a. �a���� ��e �ᢁ �i ���� ���s���a.');
      end;
      if at(72,78) then begin
         Print(7,' �a���e ������� �a�������a. �q���� �i��a');
         Print(7,'�� �a�����a.');
      end;
      if at(77,46) then begin
         Print(7,' �A��a�e ́�׷� �E�� 50�e�� ����a.');
      end;
      if at(83,59) then begin
         Print(7,' �a�a�a��á�e ���� �w���i �aå �a�e�� �i��');
         Print(7,'�i �����a.');
      end;
      if at(83,25) then begin
         Print(7,' 20�e ��A �i���A���a�e �a�q�� ���w�e ����');
         Print(7,'��i �q�v�a. �ዡ�� �a�a �A�����a�e �a�q��');
         Print(7,'�a�a�e�a�� Ж���e�A ���A���e �a�a�a�� �g�v');
         Print(7,'��a.');
      end;
      if at(68,61) then begin
         Print(7,' �w���i�� ���e ���i �b���a���a. 100�e�� �a');
         Print(7,'�q �{�a�a.');
      end;

      if at(50,51) or at(52,51) then begin
         Print(7,' �e�w�a����.');
      end;
      if (x in [48..54]) and (y in [31..37]) then begin
         Print(7,' ...');
      end;

      if at(51,28) then begin
         Print(6,' ���a�e!! �w���e �a�i �����a�V��?  100�e��');
         Print(6,'�q�A  �a�i ���w�a�a  �����e �A �����i �i�w');
         Print(6,'��ǡ�A �e�i������� �i����.');
         Print(7,'');
         Print(7,' �w���� �i�� �� �{�a���� ��A  ���a�e�e �a');
         Print(7,'�s�a�A �A�v�a.');
         Print(7,'');
         Print(9,' �wѡ��, �wѡ�� !!');
         Print(7,'');
         Print(7,' ���e �y�w�� �w�a�a ����A�� �a�� ���a�e�i');
         Print(7,'�q�v�a.');
         PressAnyKey;
         enemynumber := 7;
         for i := 1 to 3 do joinenemy(i,69);
         for i := 5 to 3 do joinenemy(i,68);
         joinenemy(7,70);
         repeat
            DisplayEnemies(TRUE);
            BattleMode(FALSE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then Clear;
         until party.etc[6] = 0;
         Clear;
         enemynumber := 5;
         for i := 1 to 3 do joinenemy(i,71);
         joinenemy(4,72);
         joinenemy(5,74);
         repeat
            DisplayEnemies(TRUE);
            BattleMode(FALSE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then Clear;
         until party.etc[6] = 0;
         Clear;
         Print(15,' �w���e �a���� ���� ���a�e�i �����v�a.');
         PressAnyKey;
         End_Demo(3);
      end;
   end;
end;

end.
