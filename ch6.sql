-- 49
select sum(残高),
    max(残高),
    min(残高),
    avg(残高),
    count(*)
from 口座

-- 50
select count(*)
from 口座
where 種別 != '1' and
残高 >= 1000000 and
更新日 < '2022-1-1'

-- 51
select count(更新日) - count(更新日) as count
from 口座

-- 52
select max(名義), min(名義)
from 口座

-- 53
select max(更新日), min(更新日)
from 口座

-- 54
select sum(残高),
    max(残高),
    min(残高),
    avg(残高),
    count(*)
from 口座
group by 種別

-- 55
select right(口座番号, 1) as val,
    count(*) as cnt
from 口座
group by val
order by cnt desc

-- 56
select coalesce(
        cast(extract('year' from 更新日) as char(4)), 'XXXX'
    ) as year,
    sum(残高),
    max(残高),
    min(残高),
    avg(残高),
    count(*)
from 口座
group by year

-- 57
select sum(残高),
    count(*)
from 口座
group by 種別
having sum(残高) > 3000000
*/

-- 58
select
    substring(名義,1,1) as label,
    count(*) as cnt,
    avg(length(replace(名義, '　', ''))) as avg
from 口座
group by label
having
    count(*) >= 10 or
    avg(length(replace(名義, '　', ''))) >= 5