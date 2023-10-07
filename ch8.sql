-- 65
select
    口座番号,
    日付,
    b.取引事由名,
    coalesce(入金額, -出金額) as 取引金額
from 取引
join 取引事由 as b
on 取引.取引事由id = b.取引事由id
where 口座番号 in (
    '0311240', '1234161', '2750902'
)

-- 66
select
    口座.口座番号,
    名義,
    残高,
    日付,
    入金額,
    出金額
from 口座
join 取引
on 口座.口座番号 = 取引.口座番号
where 口座.口座番号 = '0887132'
order by 日付

-- 67
select distinct(口座.口座番号), 名義, 残高
from 取引
join 口座
on 口座.口座番号 = 取引.口座番号
where 日付 = '2020-03-01'

-- 68
select distinct(口座.口座番号),
    case m
        when 0 then '解約済み'
        else 名義
    end as 名義,
    case m
        when 0 then 0
        else 残高
    end as 残高
from (
    select *, 1 as m from 口座
    union
    select *, 0 as m from 廃止口座
) as 口座
join 取引
on 取引.口座番号 = 口座.口座番号
where 日付 = '2020-03-01'

-- 69
select
    取引番号,
    日付,
    口座番号,
    入金額,
    出金額,
    (
        取引.取引事由id || ':' || coalesce(取引事由名, '不明')
    ) as 理由
from 取引
left join 取引事由
on 取引.取引事由id = 取引事由.取引事由id
order by 取引番号