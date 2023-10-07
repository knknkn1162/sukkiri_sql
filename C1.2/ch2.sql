-- 1
select
    商品コード,
    商品名,
    単価,
    商品区分,
    関連商品コード
from 商品

-- 2
select distinct(商品名)
from 商品

-- 3
select
    注文日,
    注文番号,
    注文枝番,
    商品コード,
    数量,
    クーポン割引料
from 注文

-- 4
select 注文番号, 注文枝番, 商品コード
from 注文

-- 5
insert into 商品
values ('W0461', '冬のあったかコート', 12800, '1');
insert into 商品
values ('S0331', '春のさわやかコート', 6800, '1');
insert into 商品
values ('A0582', '秋のシックなコート', 9600, '1');