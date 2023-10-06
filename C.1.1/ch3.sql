-- 9
select *
from 口座
where 口座番号 = '0037651'


-- 10
select *
from 口座
where 残高 > 0


-- 11
select *
from 口座
where 口座番号 < '1000000'


-- 12
select *
from 口座
where 更新日 < '2021/1/1'

-- 13
select *
from 口座
where 残高 >= 1000000


-- 14
select *
from 口座
where 種別 != '1'

-- 15
select *
from 口座
where 更新日 is null

-- 16
select *
from 口座
where 名義 like '%ハシ%'

-- 17
select *
from 口座
where 更新日 between '2022-1-1' and '2022-1-31'


-- 18
select *
from 口座
where 種別 in ('2', '3')

-- 19
select *
from 口座
where 名義 in ('サカタ　リョウヘイ', 'マツモト　ミワコ', 'ハマダ　サトシ')

-- 20
select *
from 口座
where 更新日 between '2021-12-30' and '2022-1-4'

-- 21
select *
from 口座
where 残高 < 10000 and
    更新日 is not null


-- 22
select *
from 口座
where 口座番号 like '2%' or
名義 like 'エ__　%コ'

-- 23
-- 口座: 口座番号
-- 取引: 取引番号
-- 取引事由: 取引事由ID