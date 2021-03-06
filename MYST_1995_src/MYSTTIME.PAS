Unit MystTime;
{$X+}
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, Voice, MystBatt, MystEnd;

 Procedure Time_Event(event_no : byte);

IMPLEMENTATION

Procedure ViewMap(Map_no : string; _x, _y : integer);
var
   i,j : integer;
   seek_point : word;
   X_len, Y_len : byte;
   _FILE : file;
   Dark : boolean;
   Aux_Map_Header : ^Map_Header_Type;
   map_buf : array[1..11,1..9] of byte;
begin
   assign(_FILE,Map_no+'.m');
   reset(_FILE,1);
   new(Aux_Map_Header);
   BlockRead(_FILE,Aux_Map_Header^,sizeof(Aux_Map_Header^));
   X_len := Aux_Map_Header^.xmax;
   Y_len := Aux_Map_Header^.ymax;
   dispose(Aux_Map_Header);
   _x := _x - 4; _y := _y - 5;
   seek_point := sizeof(Aux_Map_Header^) + (_y - 1) * X_len + (_x - 1);
   seek(_FILE,seek_point);
   for j := 1 to 11 do begin
      BlockRead(_File,map_buf[j],9);
      seek_point := seek_point + X_len;
      seek(_FILE,seek_point);
   end;
   close(_FILE);
   if party.hour in [7..17] then Dark := FALSE
   else begin
      Dark := TRUE;
      if not((party.day mod 30 + 1) in [10..20]) then fillchar(map_buf,sizeof(map_buf),chr(55));
   end;
   _IMAGE_DIRECTION := _STORE;
   for j := 1 to 11 do for i := 1 to 9 do Image(i,j,Font^[map_buf[j,i] and $7F],Dark);
   Screen_Fade_In(600);
   _IMAGE_DIRECTION := _DIRECT;
   for j := 1 to 11 do for i := 1 to 9 do Image(i,j,Font^[map_buf[j,i] and $7F],Dark);
   Clear;
   Print(7,' �w���e �������i�i ɷЁ �y�� Η�w�i ���v�a.');
   PressAnyKey;
   OverLap(600,TRUE);
   Silent_Scroll;
end;

Procedure Time_Event(event_no : byte);
label
   JUMP_TO_THE_FUTURE;
var
   battle_number : byte;
begin
   case event_no of
      0 : begin
             Clear;
             Print(7,' �s�a�� �ቷ ���A��  �A���e�a ���i�� �q����');
             Print(7,'�i�a�֔a.');
             delay(1000);
             PressAnyKey;
             Print(9,' '+player[1].name+', ���i �s�e ���� ���v�s���a.');
             Print(9,' �w�q �w���� ���a�e�A ��Ё �e�e�i �i���e ��');
             Print(9,'�i ���a�e�� �i�a���s���a.  �a�a �a�e �埡�e');
             Print(9,'�� �����a��  �w���i ����  ���iЖ��� �{�s��');
             Print(9,'�a.  ���q ������A��e �w���� �������a ϡ�i');
             Print(9,'�a�� �a�q�i�i �A���i �w�a�i�i ���a�� ���bЖ');
             Print(9,'�s���a.  �a���� ��ᕡ �y��ҁ�e �����a�� ��');
             Print(9,'�b�e�a�� �s���a.  �w���� �w�b���a�e  ��ӡ');
             Print(9,'�a���i �w���i �� ���V���e  ���e �������a ϡ');
             Print(9,'�i�a�� �a�q�i�i ��ѡЁ �����e �b���� ������');
             Print(9,'���a.  �a���� �e���a�� ���� �a�q�i�i �e���e');
             Print(9,'���a�� ���� ���a �����a�e �s���a. �w���e �a');
             Print(9,'�i�� �i�� ���i�e�a�� �锁�� ���a�e�� ʁ���w');
             Print(9,'�b�� ��á�� �g�i ���i �x�a �������a. �a����');
             Print(9,'�a ��á�i �i�a�����e �a�ỡ�e �A�a �q�w�a�V');
             Print(9,'�s���a.');
             Print(9,'');
             PressAnyKey;
             mapname := 'HdsGate';
             Load;
             Silent_Scroll;
             Print(9,' ���q �w���� �᷶�e ���e  ''�a�A�a �A���a''�a');
             Print(9,'�e �������a. �����e ����A���� 6�弁 �A�a��');
             Print(9,'�a�A�a �A�a��  �����a�e ����  ���e ��������');
             Print(9,'�s���a. �a�A�a �A�a�e ���� ���B�� ���a�A ��');
             Print(9,'�a�a  ���a�e�� �a�� ʁ���w�b��  ���a ɷ�a��');
             Print(9,'���a�e �������a.  �w���e �����i ɷЁ �a�A�a');
             Print(9,'�A�a�� �eҁ �������a ϡ�i�a�� �����i�� �e��');
             Print(9,'�a�A  �i �� ���e ���i  �x�a���e �A�e ������');
             Print(9,'�a. �a�a �w���� ʁ���w�b�� �e �����i ������');
             Print(9,'���a.  �A�a �w���A�A �a����ˢ �a���a�i�i �a');
             Print(9,'���V�s���a.  �w���� �a�w ���e �w���i �x�v�i');
             Print(9,'�� �� �a���a�i�i �a�w�a�����a.  �a���e �᷁');
             Print(9,'ʁ���b��  �a �a���a�i�� �ᝡ �a�q�a�a  �a��');
             Print(9,'ʁ���b�� �a���a�� �b�w�i �������a.');
             Print(9,' �w���� �����i ���V�s���a.');
             Print(9,'');
             inc(party.crystal[8]);
             PressAnyKey;
          end;
      1 : begin
             mapname := 'Dome';
             Load;
             for j := 1 to Map_Header.ymax do
             for i := 1 to Map_Header.xmax do
             if Real_Map(i,j) = 0 then PutMap(i,j,47);
             PutMap(26,14,35);
             PutMap(13,27,44);
             PutMap(22,35,47);
             PutMap(39,29,31);
             PutMap(19,54,44);
             PutMap(30,63,47);
             PutMap(19,73,47);
             PutMap(38,41,31);
             x := 25;
             y := 50;
             Silent_Scroll;
             Clear;
             Print(9,' �A...  �᷁ �q�b�i �������a�a ��a ���� �a');
             Print(9,'�q�� �i �� ���e �����i  ���Ё  ���v�s���a.');
             Print(9,'���A�e �������a ϡ�i�a�� �a�q�i�i �a���� ��');
             Print(9,'�e���� ���a ���V�s���a.  ����A�� ���q ���a');
             Print(9,'�a�� �i �������a');
             with party do begin
                watch_year := year;
                watch_day := day;
                watch_hour := hour;
                watch_min := min;
                watch_sec := sec;
             end;
             Time_Watch := TRUE;
             Time_Event_No := 2;
             watch_min := watch_min + 30;
             if watch_min > 59 then begin
                watch_min := watch_min - 60;
                watch_hour := watch_hour + 1;
                if watch_hour > 23 then begin
                   watch_hour := watch_hour - 24;
                   watch_day := watch_day + 1;
                   if watch_day > 359 then begin
                      watch_day := watch_day - 360;
                      watch_year := watch_year + 1;
                   end;
                end;
             end;
          end;
      2 : begin
             mapname := 'Dome';
             i := x; j := y;
             Load;
             x := i; y := j;
             while not (Real_Map(x,y) in [27..47]) do inc(x);
             Silent_Scroll;
             Clear;
             Print(9,' �����a�� ���� ���a�e  ���e �������a ϡ�i�a');
             Print(9,'�� �a�q�i�i �����a�� �����s���a.  �a���� �a');
             Print(9,'�q�i�� �������i �a��ҁ ���c�a�� �a���� �w��');
             Print(9,'�i ���w�A���� ���� ���a ���V�s���a. ���e ��');
             Print(9,'���� �g�� �a������ �a�s���a.');
             setbit(32);
          end;
      3 : begin
             Clear;
             Print(7,' �w���� ���i �a�店 �w���� ���a�v�� �a �a�q');
             Print(7,'�i�i �e�a�A �A���a.');
             delay(1000);
             PressAnyKey;
             Print(6,' �a���� �e�v��, '+player[1].name+'.');
             Print(6,' ���a�e�i �����a�V�a�e �a�A�� ���b�� ���v�a');
             Print(6,'�A.  �����a �a�A�� �A�ụҁ ���a�e�A�A �v�i');
             Print(6,'��  ���a�e�e �����A�A �i�w�w�e �A ������ ��');
             Print(6,'ѥ�i �����a�e ���i ���v�a�A. �����e ��ӡ �w');
             Print(6,'�b�a�a �a ���i Ё������. �a���e ������ ����');
             Print(6,'�� �� ���w ϩ�a��A �A�a ���a�e�e �a �a���i');
             Print(6,'��Ё  ������ ���a�v�� �a��΁�a�i  �b�� ��a');
             Print(6,'�A�a���e�ᝡ �����a�a �a�e �a���a�� ���� ��');
             Print(6,'�v�a�A.  �����e �a �a���i �i�a���a ������i');
             Print(6,'�i�a�a �a�A�i �x�a �a���a�� �֔a�A.  �a�A');
             Print(6,'�� �a�� �s�A�a�a ���a�e�� �a���� ���A.');
             for i := 1 to 5 do Print(6,'');
             m[0] := '';
             m[1] := '��ӡ �w�b�a�V�A';
             m[2] := '�a���e ���� �x���A';
             if Select(230,2,2,FALSE,TRUE) <> 2 then begin
                for i := 2 to 5 do begin
                   for j := 0 to 8 do player[i].name[j] := player[i].name[j+9];
                end;
                Display_Condition;
                setbit(49);
             end;
             with party do begin
                watch_year := year;
                watch_day := day;
                watch_hour := hour;
                watch_min := min;
                watch_sec := sec;
             end;
             Time_Watch := TRUE;
             Time_Event_No := 4;
             watch_min := watch_min + 30;
             if watch_min > 59 then begin
                watch_min := watch_min - 60;
                watch_hour := watch_hour + 1;
                if watch_hour > 23 then begin
                   watch_hour := watch_hour - 24;
                   watch_day := watch_day + 1;
                   if watch_day > 359 then begin
                      watch_day := watch_day - 360;
                      watch_year := watch_year + 1;
                   end;
                end;
             end;
          end;
      4 : begin
             Clear;
             Print(7,' �w���� ���i �a�店 �s�a�� �w�e ������ ����');
             Print(7,'�a�� ���q�i �i�a���a.  ����i ���A�� ʁ����');
             Print(7,'����i ���v�i�� �a�w�i ͡���a�� ���e �����');
             Print(7,'�� �w�a�i�i �� �� �����a. ���a�e�� �埡�e�a');
             Print(7,'��  �����i�i �x�a����  �����a�� �����i ����');
             Print(7,'�����A �i�������a.  �����i�e �� ��ứ ��ʁ');
             Print(7,'�i ��Ё ȁ�A�i �x���a. �w���� ʁ���� ����');
             Print(7,'�i �w���a�店 ���s�A�� �����i ���� �����a�e');
             Print(7,'���a�e�i ���v�a.  �a�a ���� �a���a�e �a�e�q');
             Print(7,'�a�� �w�e�� ����e�a�e��  �i�������a.  ���A');
             Print(7,'�i���e �e �e�a���v�a.  �a�� ���a�e�� ���e��');
             Print(7,'�a�� ���� �i��a �a�� �w���a�e �������a. �a');
             Print(7,'���� ���a �a�i ���៥�a�e �������� �w�a�i');
             Print(7,'�e �a���i ����  ���w�a�៩ ������ �������a.');
             Print(7,'��З�e  �ᝡ�A�A ��ѡ�i �����a  �a�� ���b�A');
             Print(7,'�����i �aЖ�a. ���A�e ���A�i ���e�� �����a.');
             Print(7,'�����i�e  ���a�� ���a�e�� ���e ���i зЁ ��');
             Print(7,'�� �i��a�� ���bЖ�a.');
             Print(7,'');
             PressAnyKey;
             for battle_number := 1 to 5 do begin
                Clear;
                enemynumber := 8;
                for i := 1 to 8 do joinenemy(i,67);
                repeat
                   DisplayEnemies(TRUE);
                   BattleMode(TRUE,FALSE);
                   if party.etc[6] = 254 then exit;
                   if party.etc[6] = 2 then begin
                      Clear;
                      Print(7,' ��З�e �ᢁ �g�e ��i�A�A ͡��A��� ���w');
                      Print(7,'�i ���a �����a.');
                      PressAnyKey;
                   end;
                until party.etc[6] = 0;
                EndBattle(i);
                if i = 1 then goto JUMP_TO_THE_FUTURE;
             end;
             for battle_number := 1 to 4 do begin
                Clear;
                enemynumber := 8;
                for i := 1 to 6 do joinenemy(i,67);
                joinenemy(7,68);
                joinenemy(8,69);
                repeat
                   DisplayEnemies(TRUE);
                   BattleMode(TRUE,FALSE);
                   if party.etc[6] = 254 then exit;
                   if party.etc[6] = 2 then begin
                      Clear;
                      Print(7,' ��З�e �ᢁ �g�e ��i�A�A ͡��A��� ���w');
                      Print(7,'�i ���a �����a.');
                      PressAnyKey;
                   end;
                until party.etc[6] = 0;
                EndBattle(i);
                if i = 1 then goto JUMP_TO_THE_FUTURE;
             end;
             for battle_number := 1 to 2 do begin
                Clear;
                enemynumber := 8;
                for i := 1 to 4 do joinenemy(i,69);
                for i := 5 to 8 do joinenemy(i,68);
                repeat
                   DisplayEnemies(TRUE);
                   BattleMode(TRUE,FALSE);
                   if party.etc[6] = 254 then exit;
                   if party.etc[6] = 2 then begin
                      Clear;
                      Print(7,' ��З�e �ᢁ �g�e ��i�A�A ͡��A��� ���w');
                      Print(7,'�i ���a �����a.');
                      PressAnyKey;
                   end;
                until party.etc[6] = 0;
                EndBattle(i);
                if i = 1 then goto JUMP_TO_THE_FUTURE;
             end;
             Clear;
             enemynumber := 8;
             for i := 1 to 4 do joinenemy(i,68);
             for i := 5 to 7 do joinenemy(i,69);
             joinenemy(8,70);
             repeat
                DisplayEnemies(TRUE);
                BattleMode(FALSE,FALSE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   Clear;
                   Print(7,' ��З�e �ᢁ �g�e ��i�A�A ͡��A��� ���w');
                   Print(7,'�i ���a �����a.');
                   PressAnyKey;
                end;
             until party.etc[6] = 0;
             EndBattle(i);
             if i = 1 then goto JUMP_TO_THE_FUTURE;
             enemynumber := 8;
             for i := 1 to 6 do joinenemy(i,71);
             joinenemy(7,72);
             joinenemy(8,73);
             repeat
                DisplayEnemies(TRUE);
                BattleMode(TRUE,FALSE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   Clear;
                   Print(7,' ��З�e �ᢁ �g�e ��i�A�A ͡��A��� ���w');
                   Print(7,'�i ���a �����a.');
                   PressAnyKey;
                end;
             until party.etc[6] = 0;
             EndBattle(i);
             if i = 1 then goto JUMP_TO_THE_FUTURE;
             Clear;
             Print(7,' �w���e  ӱ�s�A ���a�e�i �����v�a.  �a����');
             Print(7,'���w����  ������� �w�a�i�e  �a���� �����a');
             Print(7,'́�a�a ������ �{��a ��v�a. ���e�A�e �w��');
             Print(7,'�� ���� �� �g�e ���A�a ��a�����a.');
             mapname := 'Lore';
             Load;
             x := 51; y := 31;
             PutMap(51,28,42);
             PressAnyKey;
             OverLap(1000,FALSE);
             Print(7,'��aҁ ������A�e �����e ������ ЗЁ�v�a.');
             face := 1;
             if player[1].classtype = magic then inc(face,8);
             for j := 11 downto 3 do begin
                if j < 11 then PutTile(5,j+1,42);
                PutSprite(5,j,face);
                delay(800);
             end;
             face := 0;
             if player[1].classtype = magic then inc(face,8);
             PutTile(5,3,42);
             PutSprite(5,3,face);
             Print(7,' �a���e  �a�� ������ �����i �e�� ��ǡ�e �a');
             Print(7,'���v�a. �����e ��i З�i �� ���e �a�e�� ��');
             Print(7,'�� ���e �a��.');
             delay(1500);
             for i := 1 to 4 do begin
                if i > 1 then PutTile(i-1,3,Real_Map(x-5+i-1,y-3));
                PutSprite(i,3,21);
                delay(800);
             end;
             delay(1500);
             PutTile(5,3,54);
             for i := 4 downto 1 do begin
                PutTile(i,3,Real_Map(x-5+i,y-3));
                if i > 1 then begin
                   PutSprite(i-1,3,22);
                end;
                delay(800);
             end;
             Print(7,' �a ������ �������e �a�� �w�������a.  ����');
             Print(7,'��  ���� �A���� �b�a�i �w���a�e  �a ���e�i');
             Print(7,'���e �a�q�i�e ���� ���a �e���a�v�a.');
             PressAnyKey;
             End_Demo(2);

JUMP_TO_THE_FUTURE:
             Scroll(TRUE);
             Clear;
             Print(7,' ���A�e ���a�e�A�A ́�a�e���a�a�a ���e���i');
             Print(7,'�e�q�a�a�e ���e  ���a�e �����a �w���i ����');
             Print(7,'�a�� ���bЖ�a. �a�����e �i�a �i��a�u �w��');
             Print(7,'�i �q�a�� �����e �a���� �q���a�� �w���i ��');
             Print(7,'�a�����a.');
             delay(1000);
             PressAnyKey;
             Delete_Scroll_Screen;
             mapname := 'Ground1';
             Load;
             x := 58; y := 79;
             with party do begin
                year := 795;
                day := 18;
                hour := 9;
                min := 0;
                sec := 0;
             end;
             for i := 1 to 6 do
             with player[i] do
             if name <> '' then begin
                hp := 1;
                poison := 0;
                unconscious := 0;
                dead := 0;
             end;
             Display_Condition;
             Print(7,' ��a�a �a�b�e ���e�� ���v�i�a...');
             Print(7,' �w���e ���b �����i �a�v�a.  �a���� �w����');
             Print(7,'�� ���e ���a �y��u�e ���� ���B�� ���s����');
             Print(7,'�a.');
             OverLap(500,TRUE);
             PressAnyKey;
             Print(7,' �w���� ���a�A�� ��A ���e �������a ���a��');
             Print(7,'�v�a.');
             Print(7,'');
             Print(10,' �a�e �w���i ���� ���w�a�� �i��i�v�� �i��');
             Print(10,'�A���a�e ����a����. ���� �w���e �a�i �i�V');
             Print(10,'���a.  �a�e ������ �����a �a���a��  ������');
             Print(10,'�b�a�A �ŵa�i �a�b�e ����.  �a���e  �w����');
             Print(10,'��s�e �w�׷i �����e �q�i ���a ����� �a��');
             Print(10,'���i �a��a�� �w���i 795�e�a�� ���AЖ��.');
             Print(10,'');
             Print(10,' ���� ���� �A���e  �w���i ���a�� ������ �w');
             Print(10,'�a�i ������ �A���� ���v��.  �iš �w���i �i');
             Print(10,'�a�� �a�q�e �����A ���i��a. �A�w�� �A�w�a');
             Print(10,'�v�� ���a�e�e ���A ���b�� �g�� ��Ё�a�� ��');
             Print(10,'�q �w���� �x������ ���a���a ���b�a��. ��');
             Print(10,'�A �w���e �i �A������ ������a�� �i��i ��');
             Print(10,'���i��a.');
             Print(10,' �ዡ��  �Aҁ�� �i��i ��a  �����e �����i');
             Print(10,'���e�a����. З���i ���V��.');
             Print(10,'');
             PressAnyKey;
          end;
      5 : case party.etc[26] of
            0 : if (mapname = 'Ground2') and on(92,12) then begin
                   enemynumber := 1;
                   joinenemy(1,60);
                   repeat
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then Clear;
                   until party.etc[6] = 0;
                   Clear;
                   Print(15,' �w���e ���a�� ��ѥ�i �a���a�i �� ���A ����');
                   Print(15,'���v�a.');
                   inc(party.etc[26]);
                end else ViewMap('Ground2',92,12);
            1 : if (mapname = 'Ground3') and on(35,34) then begin
                   enemynumber := 1;
                   joinenemy(1,61);
                   repeat
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then Clear;
                   until party.etc[6] = 0;
                   Clear;
                   Print(15,' �w���e �a���� ��ѥ�i �a���a�i �� ���A ����');
                   Print(15,'���v�a.');
                   inc(party.etc[26]);
                end else ViewMap('Ground3',35,34);
            2 : if (mapname = 'Ground4') and on(11,91) then begin
                   enemynumber := 1;
                   joinenemy(1,62);
                   repeat
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then Clear;
                   until party.etc[6] = 0;
                   Clear;
                   Print(15,' �w���e š���a�� ��ѥ�i �a���a�i �� ���A ��');
                   Print(15,'�� ���v�a.');
                   inc(party.etc[26]);
                end else ViewMap('Ground4',11,91);
            3 : if (mapname = 'Ground1') and on(44,50) then begin
                   enemynumber := 1;
                   joinenemy(1,63);
                   repeat
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then Clear;
                   until party.etc[6] = 0;
                   Clear;
                   Print(15,' �w���e �a�ať�� ��ѥ�i �a���a�i �� ���A ��');
                   Print(15,'�� ���v�a.');
                   inc(party.etc[26]);
                   party.etc[20] := 11;
                end else ViewMap('Ground1',44,50);
            4 : begin
                   Clear;
                   Print(7,' �a���a�i �� ���A�e  �a������ �ᵡ�a�� �g�v');
                   Print(7,'�a.');
                end;
          end;
   end;
end;

end.
