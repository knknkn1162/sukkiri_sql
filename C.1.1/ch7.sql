-- 59
update 口座
set 残高 = 残高 + (
    select sum(入金額) - sum(出金額)
    from 取引
    where 口座番号 = '0351333' and
    日付 = '2022-01-11'
),
    更新日 = '2022-01-11'
where 口座番号 = '0351333'

-- 60
select
    (
        select 残高
        from 口座
        where 口座番号 = '1115600'
    ),
    sum(入金額) as sum1,
    sum(出金額) as sum2
from 取引
where 口座番号 = '1115600' and
    日付 = '2021-12-28'

-- 61
select 口座番号, 名義, 残高
from 口座
where 口座番号 in (
    select distinct(口座番号)
    from 取引
    where 入金額 >= 1000000
)

-- 62
select *
from 口座
where 更新日 > all(
    select 日付
    from 取引
)


-- 63
select t.日付, t.min, t.mout
from (
    select
        日付,
        count(入金額) as cin,
        count(出金額) as cout,
        max(入金額) as min,
        max(出金額) as mout
    from 取引
    where 口座番号 = '3104451'
    group by 日付
    having count(入金額) >= 1 and count(出金額) >= 1
) as t

-- 64
insert into 廃止口座
select *
from 口座
where 口座番号 = '2761055';
delete from 口座
where 口座番号 = '2761055';
