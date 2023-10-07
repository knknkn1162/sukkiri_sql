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
-- 取引の中には解約口座の番号も含まれている
-- right joinで、口座部分がnullであっても強制的に取引テーブルと結びつけるようにする
SELECT distinct(T. 口座番号),
    COALESCE(K. 名義 , '解約済み') AS 名義,
    COALESCE(K. 残高 , 0) AS 残高
FROM 口座 AS K
right JOIN 取引 AS T
ON T.口座番号 = K.口座番号
WHERE T.日付 = '2020-03-01'

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

-- 70
select
    distinct(
        coalesce(
            取引.取引事由id,
            取引事由.取引事由id
        )
    ) as id,
    取引事由名
from 取引事由
full join 取引
on 取引.取引事由id = 取引事由.取引事由id
order by id

-- 71
select
    口座.口座番号,
    名義,
    残高,
    日付,
    取引事由名,
    入金額,
    出金額
from 口座
join 取引
on 口座.口座番号 = 取引.口座番号
left join 取引事由
on 取引.取引事由id = 取引事由.取引事由id
where 口座.口座番号 = '0887132'
order by 日付

-- 72
select
    口座.口座番号,
    名義,
    残高,
    日付,
    取引事由id,
    入金額,
    出金額
from 口座
join 取引
on 口座.口座番号 = 取引.口座番号
where
    残高 >= 5000000 and
    greatest(入金額, 出金額) >= 1000000 and
    日付 >= '2022-01-01'

-- 73
select
    口座.口座番号,
    名義,
    残高,
    日付,
    取引事由id,
    入金額,
    出金額
from 口座
join (
    select *
    from 取引
    where greatest(入金額, 出金額) >= 1000000 and
        日付 >= '2022-01-01' 
) as 取引
on 口座.口座番号 = 取引.口座番号
where
    残高 >= 5000000

-- 74
select
    口座.口座番号,
    口座.名義,
    count(*) as 回数
from 取引
join 口座
on 口座.口座番号 = 取引.口座番号
group by 口座.口座番号, 口座.名義, 日付
having count(*) >= 3

-- 75
select *
from 口座
where 名義 in (
    select 名義
    from 口座
    group by 名義
    having count(*) > 1
)
order by 名義, 口座番号

-- 75.2
/* 自己結合を用いた場合 */
SELECT DISTINCT K1.名義, K1.口座番号,
       K1.種別, K1.残高, K1.更新日
  FROM 口座 AS K1
  JOIN 口座 AS K2
    ON K1.名義 = K2.名義
 WHERE K1.口座番号 <> K2.口座番号
 ORDER BY K1.名義, K1.口座番号
 
/* 集計関数と結合を用いた場合 */
SELECT K1.名義, K1.口座番号,
       K1.種別, K1.残高, K1.更新日
  FROM 口座 AS K1
  JOIN (SELECT 名義, COUNT(名義) AS 口座数
          FROM 口座
         GROUP BY 名義
        HAVING COUNT(名義) > 1) AS K2
    ON K1.名義 = K2.名義
 ORDER BY K1.名義, K1.口座番号