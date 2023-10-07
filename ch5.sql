-- 33
select *, 'o' as active
from 口座
union
select *, 'x' as active
from 廃止口座
order by 名義

-- 34
select 口座番号,
    残高/1000 as 千円単位の残高
from 口座
where 残高 >= 1000000

-- 35
insert into 口座
values ('0652281', 'タカギ　ノブオ', '1', 100000+3000, '2022-04-01');
insert into 口座
values ('1026413', 'マツモト　サワコ', '1', 300000+3000, '2022-04-02');
insert into 口座
values ('2239710', 'ササキ　シゲノリ', '1', 1000000+3000, '2022-04-03');

-- 36
update 口座
set 残高 = (残高-3000)*1.003
where 口座番号 in ('0652281', '1026413', '2239710')

-- 37
select 口座番号, 更新日,
    更新日+180 as 通帳期限日
from 口座
where 更新日 < '2021-1-1'


-- 38
select 口座番号,
    'カ）' || 名義 as 名義
from 口座
where 種別 = '3'

-- 39
select distinct(種別) as 種別コード,
    case 種別
        when '1' then '普通'
        when '2' then '当座'
        when '3' then '別段'
    end as 種別
from 口座

-- 40
select 口座番号, 名義,
    case
        when 残高 < 100000 then 'C'
        when 残高 < 1000000 then 'B'
        else 'A'
    end as 残高ランク
from 口座

-- 41
select 口座番号,
    replace(名義, '　', '') as 名義,
    残高
from 口座

-- 42
select *
from 口座
where substring(名義, 1,5) like '%カワ%'

-- 43
select *
from 口座
where cast(残高 as varchar(19)) like '%000'

-- 44
select 口座番号, 残高,
    trunc(残高*0.0002)
    as 利息
from 口座

-- 45
select 口座番号, 残高,
    case 
        when 残高<500000 then trunc(残高*0.0001)
        when 残高<2000000 then trunc(残高*0.0002)
        else trunc(残高*0.0003)
    end as 残高別利息
from 口座
order by 残高別利息 desc, 口座番号

-- 46
insert into 口座
values ('0351262', 'イトカワ　ダイ', '2', 635110, current_date);
insert into 口座
values ('1015513', 'アキツ　ジュンジ', '1', 88463, current_date);
insert into 口座
values ('1739298', 'ホシノ　サトミ', '1', 704610, current_date);

-- 47
select to_char(更新日, 'YYYY年MM月DD日')
    as 更新日,
    *
from 口座
where 更新日 >= '2022-1-1'

-- 48
select coalesce(cast(更新日 as varchar), '設定なし')
from 口座