-- 61
select
    注文番号,
    注文枝番,
    注文.商品コード,
    商品名,
    数量
from 注文
join 商品
on 商品.商品コード = 注文.商品コード
where 注文番号 = '202201130115'

-- 62
select 注文日, 注文番号, 注文枝番, 数量,
    a.数量*b.単価 as 注文金額
from 注文 as a
join 廃番商品 as b
on a.商品コード = b.商品コード
where a.商品コード = 'A0009' and
    注文日 > 廃番日

-- 63
select
    a.商品コード,
    商品名,
    単価,
    注文日, 注文番号, 数量,
    単価 * 数量 as 売上金額
from 注文 as a
join 商品 as b
on a.商品コード = b.商品コード
where a.商品コード = 'S0604'
order by 注文日

-- 64
select distinct(a.商品コード), 商品名
from 注文 as a
join 商品 as b
on b.商品コード = a.商品コード
where to_char(注文日, 'YYYYMM') = '202008'

-- 65
select distinct(a.商品コード),
    coalesce(商品名, '廃番') as 商品名
from 注文 as a
left join 商品 as b
on b.商品コード = a.商品コード
where to_char(注文日, 'YYYYMM') = '202008'

-- 66
select 注文日, 
    a.商品コード || ':' || 商品名 as 商品,
    coalesce(数量,0) as 数量
from 商品 as a
left join 注文 as b
on a.商品コード = b.商品コード
where a.商品区分 = '3'

-- 67
select
    注文日,
    a.商品コード,
    a.商品コード || ':' || case
        when 注文日 < 廃番日 then 商品名
        else '(廃番済み)' end
    as 商品,
    coalesce(数量,0)
from (
    select 商品コード, 商品名, 単価,商品区分,
        '2030-12-31' as 廃番日
    from 商品
    union all
    select 商品コード, 商品名, 単価,商品区分,廃番日
    from 廃番商品
) as a
left join 注文 as b
on a.商品コード = b.商品コード

-- 67.2
SELECT
    T.注文日,
    COALESCE(
        S.商品コード ||':'||S.商品名,
        T.商品コード ||'(:廃番済み)'
    ) AS 商品,
    COALESCE(T. 数量 , 0) AS 数量
FROM 注文 AS T
FULL JOIN 商品 AS S
ON T.商品コード = S. 商品コード 
WHERE S. 商品区分 = '3'

-- 68
select 注文日, 注文番号, 注文枝番,
    a.商品コード,
    商品名,
    単価,
    数量,
    単価*数量-coalesce(クーポン割引料,0) as 注文金額
from 注文 as a
left join (
    select 商品コード,商品名,単価
    from 商品
    union
    select 商品コード,商品名,単価
    from 廃番商品
) as b
on a.商品コード = b.商品コード
where 注文番号 = '202104030010'

-- 69
select 
    a.商品コード,
    商品名,
    coalesce(単価,0) as 単価,
    b.数量,
    単価 * b.数量 as 総売上
from 商品 as a
-- a.商品コード like 'B%'に該当するものすべて関連づける
left join (
    select 商品コード,
        sum(数量) as 数量
    from 注文
    group by 商品コード
) as b
on a.商品コード = b.商品コード
where a.商品コード like 'B%'
order by a.商品コード

-- 70
select a.商品名, a.商品コード,a.関連商品コード,
    b.商品名 as 関連商品名
from 商品 as a
join 商品 as b
on b.商品コード = a.関連商品コード