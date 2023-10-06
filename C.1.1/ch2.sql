-- 1
select 口座番号, 名義, 種別, 残高, 更新日
from 口座


-- 2
select 口座番号
from 口座


-- 3
select 口座番号, 残高
from 口座


-- 4
select *
from 口座


-- 5
update 口座
set 名義 = 'XXXXX'

-- 6
update 口座
set 残高 = 99999999,
    更新日 = '2022-03-31'

-- 7
insert into 口座
values ('0642191', 'アオキ　ハルカ', '1', 3640551, '2022-03-13');

insert into 口座
values ('1039410', 'キノシタ　リュウジ', '1', 259017, '2021-11-30');

insert into 口座
values ('1239855', 'タカシナ　ミツル', '2', 6509773, NULL);

-- 8
delete from 口座