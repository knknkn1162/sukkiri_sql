-- 24
select * 
from 口座
order by 口座番号

-- 25
select distinct(名義)
from 口座
order by 名義


-- 26
select *
from 口座
order by 残高 desc, 口座番号

-- 27
select *
from 口座
where 更新日 is not null
order by 更新日
limit 10

-- 28
select 更新日, 残高
from 口座
where 残高 > 0 or
更新日 is not null
order by 残高, 更新日 desc
limit 10 offset 10

-- 29
select *
from 口座
union
select *
from 廃止口座
order by 口座番号

-- 30
select 名義
from 口座
except
select 名義
from 廃止口座
order by 名義 desc

-- 31
select 名義
from 口座
intersect
select 名義
from 廃止口座
order by 名義

-- 32
select 口座番号, 残高
from 口座
where 残高 = 0
union
select 口座番号, 解約時残高 as 残高
from 廃止口座
where 解約時残高 > 0
order by 口座番号