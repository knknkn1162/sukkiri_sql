-- 46
select sum(数量)
from 注文

-- 47
select 注文日, sum(数量)
from 注文
group by 注文日
order by 注文日

-- 48
select 商品区分, min(単価), max(単価)
from 商品
group by 商品区分

-- 49
select 商品コード, sum(数量)
from 注文
group by 商品コード
order by 商品コード

-- 50
select 商品コード,
    sum(数量) as 合計
from 注文
group by 商品コード
order by 合計 desc, 商品コード limit 10

-- 51
select 商品コード, sum(数量)
from 注文
group by 商品コード
having sum(数量) < 5 

-- 52
select count(クーポン割引料), sum(クーポン割引料)
from 注文

-- 53
select
    to_char(注文日, 'YYYYMM') as 年月,
    count(*) as 注文件数
from 注文
group by 年月
order by 年月

-- 54
select 商品コード
from 注文
where 商品コード like 'Z%'
group by 商品コード
having sum(数量) >= 100