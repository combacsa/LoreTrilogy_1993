Unit MystTal1;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, MystBatt, MystEnd;

 Procedure TalkMode_Sub2;


IMPLEMENTATION

Procedure TalkMode_Sub2;
begin

   Clear;

   if mapname = 'Menace' then begin
      if at(27,32) then begin
         Print(7,' ��, '+player[1].name+'.');
         Print(7,' ���i ���� �a �{�����a. �a, �a�� ���w �h�a');
         Print(7,'����.');
         Print(7,'');
         Print(11,' [ �׋q + 4 ]');
         inc(party.gold,4);
         j := 43;
         for i := 33 to 38 do begin
            PutMap(27,i-1,j);
            j := map^[27,i];
            PutMap(27,i,21);
            delay(1000);
            Silent_Scroll;
         end;
         PutMap(27,38,j);
      end;
      if at(24,34) then begin
         Print(7,' �w���� �a�� �a�a�a�a�� ���i ���a��.');
         Print(7,'�a�q�i ���a ������ ȁ�e�e�� �a�a��...');
      end;
      if at(35,41) then begin
         Print(7,' �y ���� �巁 �a��e ����១�A. �����A ��');
         Print(7,'�e �������� �צ��i�e  �a�A�a �i���i Ж�a��');
         Print(7,'�e ���� �g�A. �e�� �a�A�a ���e ���� �a�v��');
         Print(7,'�ỡ');
      end;
      if at(15,36) then begin
         Print(7,' ���a ��Ё�i�e ���A ���a�e  ���� ���B ��');
         Print(7,'�a�A �a�A�a �A�a�a�e ���a ���B�� ���a�� �i');
         Print(7,'���a�A. �a���e ��鷥�A ��.');
      end;
      if at(27,26) then begin
         Print(7,' �a�A ���� �� ��. ���� ���a ���� ��A �׬e');
         Print(7,'���i �a�e�� �i�e�e ��A ���w�e �� ����.');
         Print(7,'���� ��� �w���� �a�q ���a�a ��ӥ ���e���A');
         Print(7,'���a���A�� 30�e�e �� ���w�A�� �a�֔a�A. �a');
         Print(7,'����  ���� �� �����E ���w�A�� �a��  ���w��');
         Print(7,'�១�a���A  �a��a�� ��ɷ �w�e ������ ��w');
         Print(7,'�a�A �a�a�a ���a�A.  ���w�� ���A�e �ᝡ �a');
         Print(7,'�e �����i �i�v�e�A ���� ���i ���w�a�� �g�e');
         Print(7,'�a ?');
      end;
   end;

   if mapname = 'OrcTown' then begin
      h := 0;
      if at(10,39) then begin
         h := 1;
         if getbit(7) then begin
            Print(7,' �A�i �i�a �������a.  ��e �aȁ�� �q�A�A Ё');
            Print(7,'�e �� �e��ӡ�� �i�a�֯s���a.');
         end else begin
            Print(7,' �w�� �|�� ���a ������ ����a �w���A�A ����');
            Print(7,'�a�e�u Ж���e �i�a�i�i ���e �����a.');
         end;
         PressAnyKey;
     end;
      if at(9,19) then begin
         h := 2;
         if getbit(7) then begin
            Print(7,' �����e  �w���A ���e�i�A�A  �a���� �a�e����');
            Print(7,'�eЖ�e�A �� �w���i�e �����i �� �i�A ���e ��');
            Print(7,'���a ?');
            PressAnyKey;
         end;
      end;
      if at(13,12) then begin
         h := 3;
         if getbit(7) then begin
            Print(7,' �a�e �����A�� 50�e �a�a�� ���a�e ���a�a �i');
            Print(7,'�a�֭�.  ���� �c�a�� �a�a�� �╡ �᷁ ��,');
            Print(7,'�ᶁ�� ���e�A�A ������ ���� �a�� �g�v��. �a');
            Print(7,'��A �� �w���i�e ���� �a�i�i ���l�� ���� ��');
            Print(7,'���i �����a�a��?');
         end else begin
            Print(7,' �w�� �|�A ���e �j�e ���a�a �w���A�A ����a');
            Print(7,'�����a�e�u �a�v�a�a ������ �i�i �i�a�i�i ��');
            Print(7,'�a �����a.');
         end;
         PressAnyKey;
      end;
      if at(21,9) then begin
         h := 4;
         if getbit(7) then begin
            Print(7,' ���w ���a�� ���A�ᕡ �a�e�a�a �����  ���a');
            Print(7,'�a�e �aЗ�a�i�i ���s�a���� Ж��A �a������.');
            Print(7,'�a���e  �������e �圷�e ���a�i���e�� �i�a��');
            Print(7,'����.');
            PressAnyKey;
         end;
      end;
      if at(43,12) then begin
         h := 5;
         if getbit(7) then begin
            Print(7,' �w���A�i��  �����A �����i�i  ���i�A ���a�e');
            Print(7,'���aǷ���� �a�e ���� �g�i �������a.');
            PressAnyKey;
         end;
      end;
      if at(44,30) then begin
         h := 6;
         if getbit(7) then begin
            Print(7,' �����i�e �A���e�a ���i���i �����ⷥ �����a');
            Print(7,'�� ���b�a�� ���s���a.');
            PressAnyKey;
         end;
      end;
      if at(35,29) then begin
         h := 7;
         if getbit(7) then begin
            Print(7,' ���a�e�e �� �A���� �ⷳ���a.  �a����  �a�i');
            Print(7,'�a�a�e �w���� �ⷳ���a.');
         end else begin
            Print(7,' �w���|�A ���e ���a ���e�e  �w�w���a�� �i�a');
            Print(7,'�i�u�� �w���A�A ����a �����a���a.');
         end;
         PressAnyKey;
      end;
      if at(41,39) then begin
         h := 8;
         if getbit(7) then begin
            Print(7,' ���� ������ �aǡ�A�����e š���a���� �׵A�A');
            Print(7,'�� �a��i �����s���a.  �a�a�e ��ӡ �w���i');
            Print(7,'�� ���i �󓡔a.');
            PressAnyKey;
         end;
      end;
      if h > 0 then begin
         Print(7,' �w�� �|�A ���e ���a���i  �w���e  ����A �i');
         Print(7,'�����a�i ��Ȃ�a����.');
         m[0] := '';
         m[1] := '���a �៥�a';
         m[2] := '�a�� �i�a ���a';
         k := Select(110,2,2,FALSE,TRUE);
         if k = 1 then begin
            enemynumber := 1;
            joinenemy(1,18);
            DisplayEnemies(TRUE);
            BattleMode(TRUE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then begin
               Silent_Scroll;
               exit;
            end;
            PutMap(x+x1,y+y1,34);
            Scroll(TRUE);
            setbit(57+(h-1));
         end;
         exit;
      end;
      if at(25,42) or at(25,43) then begin
         Print(7,' �a�i�� �� �|�i ��ǡ�� ���e ���a�a �w���A�A');
         Print(7,'���e�� �i�� �����A �iЖ�a.');
         Print(7,'');
         Print(7,'');
         Print(13,' ���e�e ���a �a�i�A �i�� �� �� ����.');
         Print(13,' �� ����a���� !!');
         m[0] := '';
         m[1] := '�i�v��, �a�a�e �I�� �a����';
         m[2] := '�w���i�i �a��a���� ���a�a���V��';
         k := Select(180,2,2,FALSE,TRUE);
         if k = 2 then begin
            enemynumber := 7;
            for i := 1 to 7 do joinenemy(i,19);
            DisplayEnemies(TRUE);
            BattleMode(TRUE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then begin
               Silent_Scroll;
               exit;
            end;
            PutMap(25,42,43); PutMap(25,43,43);
            setbit(53);
         end;
      end;
      if at(24,20) or at(26,20) then begin
         enemynumber := 6;
         for i := 1 to 3 do joinenemy(i,19);
         joinenemy(4,20);
         for i := 5 to 6 do joinenemy(i,21);
         DisplayEnemies(TRUE);
         if getbit(7) then begin
            Print(13,' ���e�e �锁 �����a�� �i�a ������ �g�V�a.');
            Print(13,'�a! ��a�a.');
         end else begin
            Print(7,' ���w�i �A�� �x 2�w�� ���a ��a�� �a�e ��');
            Print(7,'ʁ�a�i�� �w���i ���b�a�� ���bЖ�a.');
         end;
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         PutMap(24,20,43); PutMap(26,20,43);
         setbit(54);
      end;
      Scroll(TRUE);
      exit;
   end;

   if mapname = 'Vesper' then
   if Real_Map(x+x1,y+y1) = 53 then begin
      if getbit(9) then begin
         Print(13,' �a���� �q�e ���e�� �����a��... �ᕡ �a�A�A');
         Print(13,'���ạ���V�a.');
      end else begin
         Print(7,' �w�� �|�� �a���� ����a �iЖ���e �i�a �i�i');
         Print(7,'���a �����a.');
      end;
      PressAnyKey;
      if at(30,19) then begin
         enemynumber := 7;
         joinenemy(1,28);
         for i := 2 to 7 do joinenemy(i,27);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(7,' �w���� ��i�i ����á�a �������A�� �i�s�a�A');
         Print(7,'���� �a���� ��� �a�֔a.');
         Print(7,'');
         if getbit(9) then begin
            Print(13,' �q... �a�� ���a�i�i ����á�a�� �A�� ���b��');
            Print(13,'���e ���{��.  �a���e  �A�a �� �����A �i�ᵥ');
            Print(13,'���e ���i �e �������e�� �w��Ё�a. �a�� �A�a');
            Print(13,'�� ��w���� ���w�� �a�� �q�i�a����  �a�� �a');
            Print(13,'�����a.');
         end else begin
            Print(7,' �a�����e ����ӡ �i�a�i�i�� ���e �i�i �y �a');
            Print(7,'�� ���鷡�ᓡ �w���A�A �i�a �i���a.');
         end;
         PressAnyKey;
         enemynumber := 8;
         for i := 1 to 2 do joinenemy(i,28);
         for i := 3 to 6 do joinenemy(i,27);
         joinenemy(7,30);
         joinenemy(8,29);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(14,' �w���e �a�� �q�i�a�i ��áЖ�a.');
         Print(11,'[ �a�a �a���a�i + 1]');
         inc(party.crystal[3]);
         PutMap(30,19,43);
         setbit(65);
         setbit(1);
      end;
      if at(50,19) then begin
         enemynumber := 7;
         for i := 1 to 3 do joinenemy(i,28);
         for i := 4 to 6 do joinenemy(i,27);
         joinenemy(7,29);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ ����� + 1 ]');
         for i := 1 to 6 do
         with player[i] do
         if name <> '' then begin
            if agility < 20 then inc(agility);
         end;
         PutMap(50,19,43);
         setbit(66);
      end;
      if at(64,26) then begin
         enemynumber := 7;
         joinenemy(1,26);
         for i := 2 to 6 do joinenemy(i,27);
         joinenemy(7,28);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ �q�� + 20000 ]');
         party.gold := party.gold + 20000;
         PutMap(64,26,43);
         setbit(67);
      end;
      if at(61,38) then begin
         enemynumber := 6;
         for i := 1 to 4 do joinenemy(i,27);
         for i := 5 to 6 do joinenemy(i,26);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ ���� + 50 ]');
         if party.food + 50 < 256 then inc(party.food,50)
         else party.food := 255;
         PutMap(61,38,43);
         setbit(68);
      end;
      if at(40,40) then begin
         enemynumber := 7;
         for i := 1 to 5 do joinenemy(i,26);
         for i := 6 to 7 do joinenemy(i,28);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ ���� + 5 ]');
         if party.BackPack[2,1] + 5 < 256 then inc(party.BackPack[2,1],5)
         else party.BackPack[2,1] := 255;
         PutMap(40,40,43);
         setbit(69);
      end;
      if at(22,40) then begin
         enemynumber := 7;
         for i := 1 to 6 do joinenemy(i,27);
         joinenemy(7,28);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ ���i + 30 ]');
         if party.arrow + 30 < 65536 then inc(party.arrow,30)
         else party.arrow := 65535;
         PutMap(22,40,43);
         setbit(70);
      end;
      if at(20,26) then begin
         enemynumber := 5;
         for i := 1 to 5 do joinenemy(i,27);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ �q�� + 1000 ]');
         party.gold := party.gold + 1000;
         PutMap(20,26,43);
         setbit(71);
      end;
      Silent_Scroll;
      exit;
   end else begin
      if not at(47,55) then begin
         Print(7,' �w�� �|�A�e �w�A�� �i�a���� ӱ�i ������ ��');
         Print(7,'�qӡ �iЁ�E ���e�� ���A�a �����a.');
      end else begin
         Print(7,' �w�� �|�� ���A�e �a�e ���A�i���a �x�A �iЁ');
         Print(7,'�wЖ�e�� ��́�� �����a ��Ж�a.  ���a�� �wȁ');
         Print(7,'�i �i�a �� �� �������A  �w���e �a�� ���i ��');
         Print(7,'�a�a�� ���bЖ�a.');
         Print(7,'');
         if getbit(15) then begin
            Print(7,' �a���e �� ���w �i�e�A�� �g�v�a.');
            exit;
         end;
         delay(1000);
         Print(7,' ������ �w���e �a ���A�� ���e ���A ����a�a');
         Print(7,'�� ���a ���q�i �i�a�a�v�� �a���� �A�A���i');
         Print(7,'���a�� ���e �A�� �����a�e ���i �i�A �A���a.');
         Print(7,'�w���e �a�� ���i �a���a Ж���e �a�� ���e �u');
         Print(7,'�u�a�A ���� ������ ����� �i ���a �����a.');
         if party.item[5] = 0 then exit;
         dec(party.item[5]);
         delay(1500);
         Print(7,'');
         Print(7,' ���b �w���e ���q �a���� ���e ���ɷ� �����a');
         Print(7,'���b�� �v�a.  ���� ���q�� �a ���A�e �i�� ��');
         Print(7,'���i ������ ��́Ж�� �����A �i�a�����e ���a');
         Print(7,'�wЖ���e  �A���e ���e�� ��a�e�E �wȁ�a���e');
         Print(7,'�e�i �� ���i��a ���bЖ�a. �w���e �a ���A�A');
         Print(7,'�A ���ɷ� �����i �a�wЖ��  ���w���� �a�� ��');
         Print(7,'�e ���e�� ϵ���a ���A �A����  ��s���g�A �a');
         Print(7,'�� ���A ��a��  ���� �����i  ���� ���a ����');
         Print(7,'�a. ���w�e ����Ж�a.');
         Print(7,'');
         PressAnyKey;
         Print(15,' Ѣ���a �� �i�i ���a �����i �a�a�a ...');
         Print(7,'');
         Print(15,' �a�����A ���e �A�a����� �A�i�e ���e�A����');
         Print(15,'��a �a�q�����a.  �����e ���e�����A  ���e��');
         Print(15,'�e�i �i���c�A ������  ���e ������ �eЁ�� ��');
         Print(15,'�w�a���� �� �a���i �a�e ���B�a�� �i�v�a. �a');
         Print(15,'���e �a���e �i���A���a�e ���i  ���� �i�v�a.');
         Print(15,'�a�a ���a ���� �e �w�׵A�᷁ �����e  ���A��');
         Print(15,'�a�� �����a �a���i�� �����A �a�a  �ᝡ�i ��');
         Print(15,'���a�a �����a�� ���i �����a. ����A ���e ��');
         Print(15,'���� �����i �x����Ё  �w���i �A����  ñ���i');
         Print(15,'���w�� ��ǥ�a�� �i �� ���a. �����e ���e����');
         Print(15,'�A �������� �i���e �q�a���e�a.  �w�w �a�e');
         Print(15,'������ �i���i �i�ᐁ�a �����i �ᶂ �t���A');
         Print(15,'Ё�֔�A �a�����a. ���巁 �w���� �a���a. ��');
         Print(15,'���� ���a�e  �a���w ���巩�e  ���e�� ������');
         Print(15,'�� �a�a.  �a�������i �i�a�a�e  �a�q�� �{�a.');
         Print(15,'����  �a�a�����A �A�a�e  �a������ �w�����a.');
         Print(15,'�a���e ���e�� �w�b�i �ᶂ �¥��a�a�e �����A');
         Print(15,'�� �w���i �A����  �a�i�� �w�i ñ���a�a ���i');
         Print(15,'���e ���� �a�� ���� �A�a��������a.  �a��');
         Print(15,'�� �a ���i �������e �a�e �a�� .............');
         Print(7,'');
         PressAnyKey;
         Print(7,' �w���� �a���a�� ���ᐁ�a �v�i�� �a ���� ��');
         Print(7,'���e �e���a�a �����a�� �{��a ��v�a.  �w��');
         Print(7,'�e  ���q �� �����A�� �i�a�a�� Ж�� �a������');
         Print(7,'�埡�e�a�� �q���i �w�a�� ���a�e �a���i ���e');
         Print(7,'���j�v�a.  �w���� �i�� ���a�e �A 3�� ������');
         Print(7,'���a�e �¯��� �wЁ���A �a�a �ᶂ �� ���w �i');
         Print(7,'�� �c�A �����a.  �a���e �� ���w�� �e���e ��');
         Print(7,'��a�� �g�v�a.');
         PressAnyKey;
         setbit(15);
      end;
   end;

   if mapname = 'TrolTown' then
   if Real_Map(x+x1,y+y1) = 54 then begin
      if at(25,8) or at(26,8) then begin
         if (not getbit(16)) and getbit(9) then begin
            Print(13,' �a��! �����a�� ���w���� �a�i�� ���a��.... ');
            Print(13,'�a�e ������ �׷�  �a��Ƿ���a�� �a�e�A  ����');
            Print(13,'�s�w�a�� Ё�i�a�e�A ����V�e�a?');
            m[0] := '';
            m[1] := '�a�� ���妁�� �i�ᥡ�V��';
            m[2] := '�s�w�e ϩ�a����';
            k := Select(140,2,2,FALSE,TRUE);
            if k = 1 then begin
               Print(13,' �w���� ���e ����a��  �a�� �w�a�� �a�i���');
               Print(13,'�� �a�i �����a �a�e�� ���a�V���e  �἖�e �w');
               Print(13,'���� �a���� ����a ���a�e ���q �� �w�a �e�A');
               Print(13,'���e �q�� ��e�i �w���A�A ���V�a. �� �����e');
               Print(13,'���e�a?');
               m[0] := '';
               m[1] := '����, ���� �h�� ���� �a���a';
               m[2] := '�a �w�a �e�� �q�i ���� ������';
               k := Select(150,2,2,FALSE,TRUE);
               if k = 1 then begin
                  Print(7,' �w���e �a��Ƿ�A�A �q�i �h���e  ���� �c�a��');
                  Print(7,'�a�֔a.');
                  setbit(16);
                  DefaultExit;
                  exit;
               end;
            end;
         end;
         Print(7,' ���e �a�s�A ���� �� �w�� �a�� ��a��  �a��');
         Print(7,'�a ���w�� �e �w�� �a�a�v�a.');
         if getbit(9) then begin
            Print(7,'');
            Print(13,' �����e �a��Ƿ���� ���e ��ѡ�i �{�� ���e �a');
            Print(13,'���� �׸�a�i�� ���a���a. �����i�e �����i');
            Print(13,'�鉡 �w���i������ ������ �׷i ��ǩ �����a.');
         end;
         enemynumber := 7;
         for i := 1 to 4 do joinenemy(i,32);
         for i := 5 to 6 do joinenemy(i,33);
         joinenemy(7,34);
         DisplayEnemies(TRUE);
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(7,' �w���e �wѡ�����i�i ����á���e ��A�� ���');
         Print(7,'�鉡 ���e �a��Ƿ�A�A ��i �a�����a. �a�e ��');
         Print(7,'�A ������ ���� �g�v�� �w���e �a�i �e���A �A');
         Print(7,'���v�a.');
         Print(7,'');
         Print(14,' ���A �w���e ����a �������a�����a�e �w���a');
         Print(14,'���� ������A ���� �i �� ���A �A���a.');
         party.etc[20] := 4;
         setbit(4);
         setbit(72);
         PutMap(25,8,44); PutMap(26,8,44);
         Scroll(TRUE);
         exit;
      end;
      if at(17,19) then begin
         enemynumber := 7;
         for i := 1 to 3 do begin
            joinenemy(i,20);
            enemy[i].name := '�a�������A��';
            enemy[i].level := 6;
         end;
         for i := 4 to 6 do joinenemy(i,28);
         joinenemy(7,34);
         DisplayEnemies(TRUE);
         if getbit(9) then begin
            Print(13,' �qӡ �a���� �����i �i���a�a��  �����A ���a');
            Print(13,'��! �a�e �� �����w���� �w�����w�a����  ����');
            Print(13,'�i �鉡 �����i ��ǩ�A�a.');
            PressAnyKey;
         end;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(73);
         PutMap(17,19,44);
         Scroll(TRUE);
         exit;
      end;
      if at(34,19) then begin
         enemynumber := 7;
         for i := 1 to 4 do joinenemy(i,31);
         for i := 5 to 6 do joinenemy(i,32);
         joinenemy(7,33);
         DisplayEnemies(TRUE);
         if getbit(9) then begin
            Print(13,' �a�� ��Ӂ�i�� ���� �����A �s�a ���e ���e�i');
            Print(13,'�i ���a�ᵥ �a�i���a? �a���e �a�� �a�A �a��');
            Print(13,'�|�A��e ��Ӂ�i�� ���w�� �e�eӡ ���a�a �៩');
            Print(13,'�����a.');
            PressAnyKey;
         end;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(74);
         PutMap(34,19,44);
         Scroll(TRUE);
         exit;
      end;
      if at(13,32) or at(13,33) then begin
         enemynumber := 8;
         for i := 1 to 4 do joinenemy(i,31);
         for i := 5 to 8 do joinenemy(i,28);
         DisplayEnemies(TRUE);
         BattleMode(TRUE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(75);
         PutMap(13,32,44); PutMap(13,33,44);
         Scroll(TRUE);
         exit;
      end;
      if at(38,32) or at(38,33) then begin
         enemynumber := 8;
         for i := 1 to 2 do joinenemy(i,26);
         for i := 3 to 5 do joinenemy(i,31);
         for i := 6 to 8 do joinenemy(i,28);
         DisplayEnemies(TRUE);
         BattleMode(TRUE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(76);
         PutMap(38,32,44); PutMap(38,33,44);
         Scroll(TRUE);
         exit;
      end;
      if at(24,67) or at(25,67) or at(26,67) then begin
         enemynumber := 8;
         for i := 1 to 8 do begin
            joinenemy(i,20);
            enemy[i].name := '�a�������A��';
            enemy[i].level := 5;
         end;
         DisplayEnemies(TRUE);
         if getbit(9) then begin
            Print(13,' ��Ӂ�i�i �锁 �� �e�a�� �i�a ������ ���a!!');
            PressAnyKey;
         end;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(77);
         PutMap(24,67,44); PutMap(25,67,44); PutMap(26,67,44);
         Scroll(TRUE);
         exit;
      end;
      h := 0;
      if at(6,31) then begin
         h := 1;
         if getbit(9) then begin
            Print(7,' �i �A�i �i�a ������.  �a�e ������ �����b�a');
            Print(7,'���A  �w���A�A ���a�e �i�e�a�a�i �i�a���A��');
            Print(7,'�A�i �����e�e �i�a������.');
            m[0] := '';
            m[1] := '����, �e�� �i�ᥳ���a';
            m[2] := '�i �����a�� �a�e��, �a ����u!';
            k := Select(120,2,2,FALSE,TRUE);
            if k = 1 then begin
               Print(7,' ��, ���i �q�a�a��. �a�e �a�aš���e���A�A��');
               Print(7,'�����b�i ������ �����A �֔� �q���a��.  �a�e');
               Print(7,'�a���A ���e �a��a�� �e���i Ж����.  �a���');
               Print(7,'���A  �a�e ���� �A���A�ᕡ �a�e �a���a�� �a');
               Print(7,'�e ���� ���a�e�� �i�a����. �a���� ���b�e ��');
               Print(7,'�e ���A�A�ᷥ�� �w�wӡ �����a ���A �s�A��');
               Print(7,'������ ȁ���� ���b�� �e���� �b�w�a�e �a����');
               Print(7,'�s�A�e �a ���b�� ���e�� ���a��a  �a�e �A��');
               Print(7,'���� ���� �i���e ���i  ���bЖ��.  �a ���e��');
               Print(7,'�w�i ɷЁ ���a �����e  ���� ���e���a ����a');
               Print(7,'�e З����  �Aҁ�� ���s�{�e ���i��  �������e');
               Print(7,'������  ���w�A�a �a�e �i�i�� �e�i �A�e ����');
               Print(7,'�·�Ж��.  �ᔁ�e �a�A�a  �a�e ���� ����,');
               Print(7,'�A���� �������i �a���� �����i �a���a �����a');
               Print(7,'�e ������ ���v��. �a���A�ᕡ ���a �a�w �ů�');
               Print(7,'���A �� ���e, ������ �{�� C,H,O,N �a�� ����');
               Print(7,'�E ϡ���i �a����  �e���b�w�a�� ATP�i �s���a');
               Print(7,'�e ������ �a�e ��������. �a�i�e �a�� �a�w');
               Print(7,'�i �� ���a�� �����a�� �����e  ���e�e �i�w��');
               Print(7,'���i �g�� ���A�a�� ������.  ���e ''�A�b''���e');
               Print(7,'�����i ���v�i�� ���i �a�i�� ���b�b�� ����');
               Print(7,'���A �e���a�� �i�v��. �w���� �� �i�i ���i��');
               Print(7,'���V��?');
               Print(7,'');
               PressAnyKey;
               k := 0;
               for i := 5 downto 2 do
               if exist(i) then k := i;
               if k > 0 then begin
                  s := player[k].name + ReturnBJosa(player[k].name);
                  Print(7,' �a�� �w�� �|�A ���� '+s+' ��i �i�� �a�i �����v�a.');
                  Print(7,' ���e��a�� ����e �����a �a���� ���i �i ��');
                  Print(7,'�a �����a. �a���� ��З�i�A�A �iЖ�a.');
                  Print(7,'');
                  Print(10,' �U, ���� ��w���a ���ᐁ�e �i�i  ���� ���a');
                  Print(10,'��... �a�A�i ���a�A. ����A�� ���e�i �w��');
                  Print(10,'Ё �១�e �����e ����Ё���a�A.');
                  PutMap(6,31,44);
                  Silent_Scroll;
                  setbit(78);
                  PressAnyKey;
                  Print(7,' �w���e �a���� �a�ᶅ �a�q�A �e �a���i ��v');
                  Print(7,'�a.');
                  Print(7,'');
                  Print(9,' ���� �a�A�a �� ��Ж�A.  �a�� �i�� �הw�a��');
                  Print(9,'�e Ж���e  �ỵ���� �{���e �g�v�a��  ���b�a');
                  Print(9,'�A. ���� �i�e��A �a �w���a�� �i�v�a�e ���v');
                  Print(9,'�i��...');
                  exit;
               end;
            end;
         end;
      end;
      if at(9,30) then begin
         h := 2;
         if getbit(9) then begin
            Print(7,' �a�b! ���e���a ���� ���w�a�a!  ���e�� ����');
            Print(7,'�����A ñ��Ж�a.');
            PressAnyKey;
         end;
      end;
      if at(7,33) then begin
         h := 3;
         if getbit(9) then begin
            Print(7,' ���i �w���i�e ���a�a���a. �� �����A�A Ё�i');
            Print(7,'��ӡ�a �a�i�ᵡ�a��...');
            PressAnyKey;
         end;
      end;
      if at(11,35) then begin
         h := 4;
         if getbit(9) then begin
            Print(7,' �w���i�� �a�i ������a�� �a�� ����  �A���e');
            Print(7,'�a ���i���� �����i Ё ���� �󓡔a.');
            PressAnyKey;
         end;
      end;
      if at(40,30) then begin
         h := 5;
         if getbit(9) then begin
           Print(7,' ñ���a !!');
            PressAnyKey;
         end;
      end;
      if at(41,35) then begin
         h := 6;
         if getbit(9) then begin
            Print(7,' �a����, �ᔁ�a�� �w�a���i.  �A�i ��A�A �A');
            Print(7,'���� ���a�i �� �� �������a. ���b�s���a.  ��');
            Print(7,'�q �A�����i �x�� �g�a�e ���i �� �{�s���a.');
            PressAnyKey;
         end;
      end;
      if at(43,32) then begin
         h := 7;
         if getbit(9) then begin
            Print(7,' �w���A ���e�i�e  ���� �a�����A�A�� �q�i ��');
            Print(7,'����Ё,  ��ɷ�� ��a�A ���a�e �w���a�� �A��');
            Print(7,'���i ���a�a�� ���bЖ��.  �a �����A �w�w����');
            Print(7,'�a�� �����i�� �A���� �����A �����a�a,  ���e');
            Print(7,'�A�����i ���a�� ��Ё  ���e�i�A�A  �g�e �q�i');
            Print(7,'�����a�� ����.');
            PressAnyKey;
         end;
      end;
      if at(45,34) then begin
         h := 8;
         if getbit(9) then begin
            Print(7,' �a�b, �A�i �A���� �� �� ��������. �q �� �e');
            Print(7,'���i �a�����a.');
            PressAnyKey;
         end;
      end;
      if h > 0 then begin
         if not getbit(9) then begin
            Print(7,' �w�� �|�� �a������ �w���A�A ����a �i�i Ж');
            Print(7,'���e �i�a �i�i ���a �����a.');
            PressAnyKey;
         end;
         Print(7,' �w�� �|�A ���e �a�����i  �w���e  ����A �i');
         Print(7,'�����a�i ��Ȃ�a����.');
         m[0] := '';
         m[1] := '���a �៥�a';
         m[2] := '�a�� �i�a ���a';
         k := Select(110,2,2,FALSE,TRUE);
         if k = 1 then begin
            enemynumber := 1;
            joinenemy(1,25);
            DisplayEnemies(TRUE);
            BattleMode(TRUE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then begin
               Silent_Scroll;
               exit;
            end;
            PutMap(x+x1,y+y1,44);
            Scroll(TRUE);
            setbit(78+(h-1));
         end;
         exit;
      end;
   end else begin
      if at(37,17) then begin
         Print(7,' �w���i�� �����i ���a�� �� �a�q�i����? ���i');
         Print(7,'�q�a�a��.  �����A ���a�e �A�a�����  �Ÿ�ӡ');
         Print(7,'��i �wЖ�a�e�A �a �i�� �a������?  �a���a�e');
         Print(7,'���i �A�q�����a.');
         PressAnyKey;
         Print(7,' �a�e �A�a����A�� �A�a���a�a�� ������ �a�q');
         Print(7,'����.  �a�e �e���a�� �a��Ƿ�i �s����Ё �a��');
         Print(7,'�� �q��Ж�a�a  �ⷁ ���a�A ���a�� ͡���� �s');
         Print(7,'�a��v��. �������� ���i���a�e �a���� �����e');
         Print(7,'�A �ⷁ ���a ���b �g�a�� ���� ���a�� �s�a��');
         Print(7,'�A �A�����a.  �a�e �� ����  �ᶂ �a�����A');
         Print(7,'���e ������ ��a ��v��. �a�e �w���i�A�A ��');
         Print(7,'���a�� ���b�a�a �a�V��.  �a�i �w���� ��З�A');
         Print(7,'���� ������.');
         m[0] := '';
         m[1] := '�w���� ���b�i �i�ẁ�V��';
         m[2] := '���e�a���e �a�� ��s�V��';
         if Select(220,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '�A�a���a';
                  sex := male;
                  class := 1;
                  classtype := magic;
                  level := 9;
                  strength := 10;
                  mentality := 17;
                  concentration := 18;
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
                  weapon := 0;
                  shield := 0;
                  armor := 1;
                  potential_ac := 1;
                  sword_skill := 40;
                  axe_skill := 40;
                  spear_skill := 40;
                  bow_skill := 0;
                  shield_skill := 30;
                  fist_skill := 20;
                  Modify_Item(k);
                  PutMap(37,17,44);
                  setbit(46);
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
      if at(42,16) then begin
            Print(7,' �A�����i �e�a�e�� �ᶡ�a. �鷢�e ���᧡ �i');
            Print(7,'�� ��ʁ���A �q���i���e �a���e ���A�{�e ����');
            Print(7,'�i  �i�� �������� �幡 ��ǡ�e �A�e�ᓡ�a�a.');
            Print(7,'�a�� ������ �� ���w �����A�� �b�i�i �a�a.');
            Print(7,'�a�� �a���A�A �i�a�� �� ���i ����e�A  �e�i');
            Print(7,'�a�����i�� �i�� ����a�e �a�q�A ���b���� �s');
            Print(7,'�a�� �a���A ���e��a.');
      end;
      if at(42,21) then begin
            Print(7,' �A�a����� �a�q�i�e  �� ���B�i �¯��e ���e');
            Print(7,'�� �wɡ�� ��ӡ�� ��Ё  ���ӡ �a������ ����');
            Print(7,'�i ���bЖ��.  �����e �s�b�i�a�� �����e �A�A');
            Print(7,'���i �a�e��  �a�i�i ���B�� ����a�� ���a ��');
            Print(7,'���a Ж���e �b����������.  �a���� �A�a�� ��');
            Print(7,'���i �����a�� �a���� �����A �����ⷥ ���b�i');
            Print(7,'�qЗЖ����.  �a�� ����a �sӥ �a���i�e ����');
            Print(7,'�a���a ��e�E��  �A �������A ���� ���i�a ��');
            Print(7,'����. �a�i�A�A ��i ���� �a���e ���e�A�A ��');
            Print(7,'�w�a�� ���a�A �a�a�e ���Q������ ��a.  �a��');
            Print(7,'�e ���w�e ���a�v����. �a �׉w�i�i �� �a���i');
            Print(7,'�e á���� ���a�e �����A ���e��a�� �A�a���');
            Print(7,'�A ���e ���s�i ����Ж�� ��a. �a���� �w�a��');
            Print(7,'�e �i�a�֔� �e�i  ���� ���� ͢�i���v�� ��a');
            Print(7,'��. �a���� ���w�a���� ��Ж�� ���s�i �h�e �A');
            Print(7,'�a����e �����e�A ��i�A���� ��������. ����');
            Print(7,'�a �a  �����a �a���e �����a �a�q������ �ỡ');
            Print(7,'�a.');
            Print(7,'');
            PressAnyKey;
      end;
   end;

   if mapname = 'Tomb' then begin
      if at(89,20) or at(88,21) then begin
         Clear;
         Print(7,' �w���e �a���� �a�e �q�e ���e�� Ё���i ���v');
         Print(7,'�a.  �a�a�� ������A �a���i �����a�a�a�a �h');
         Print(7,'�v�� ���{�a.');
      end;
   end;

end;

end.

