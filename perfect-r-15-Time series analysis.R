# 15章 時系列解析

## 15-1 時系列データとは
# コードなし

## 15-2 Rの時系列データ表現・構造

# パッケージのインストール関数
inst_package <- function(packages){
    for (package in packages){
        if(!require(package, character.only = TRUE)){
            install.packages(package, quiet = TRUE)
        }
        library(package, character.only = TRUE)
    }
}

# パッケージのインストール
packages <- c(
    'dplyr',
    'lubridate',
    # 'Nippon',
    'forecast',
    'quantmod',
    'xts'
)

inst_package(packages = packages)

# Nipponパッケージの代わりに、祝日判定関数を読み込む
source("https://raw.githubusercontent.com/logics-of-blue/website/master/010_forecast/20190714_R%E8%A8%80%E8%AA%9E%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%E6%97%A5%E6%9C%AC%E3%81%AE%E7%A5%9D%E6%97%A5%E5%88%A4%E5%AE%9A/jholiday.R", encoding="utf-8")

### 15-2-1 時系列データ表現・構造の外観
# コードなし

### 15-2-2 日付の表現

# 文字列から日付型への変換
today <- as.Date('2015-07-31')
today

class(today)

# 内部では1970年1月1日からの経過日数を保持
as.numeric(today)

format(today, '%Y') %>% as.numeric() # 年
format(today, '%m') %>% as.numeric() # 月
format(today, '%d') %>% as.numeric() # 日
format(today, '%w') %>% as.numeric() # 曜日（0が日曜日）
format(today, '%j') %>% as.numeric() # 当該年の1月1日からの経過日数

# lubridateパッケージを利用
year(today) # 年
month(today) # 月
day(today) # 日
wday(today) # 曜日（1が日曜日）
yday(today) # 当該年の1月1日からの経過日数

today.ymd <- ymd('2015-03-31', tz = 'Asia/Tokyo')
today.ymd
class(today.ymd)

today.mdy <- mdy('07/31/2015', tz = 'Asia/Tokyo')
today.mdy
class(today.mdy)

today.dmy <- dmy('31-07-2015', tz = 'Asia/Tokyo')
today.dmy
class(today.dmy)

### 15-2-3 時刻の表現

# POSIXctクラスによる表現
now.pc <- as.POSIXct('2015-07-31 00:00:00', tz = 'Asia/Tokyo')
now.pc

as.numeric(now.pc) # 1970年1月1日 0時0分0秒からの経過秒数

# マイクロ秒精度での時刻の保持
options(digits.secs = 6)
micro_ymdhms <- as.POSIXct('2015-07-31 00:00:00.123456', format = '%Y-%m-%d %H:%M:%OS')
micro_ymdhms
class(micro_ymdhms)

# ISOdatetime関数を用いたマイクロ秒精度での時刻の保持
iso_micro_ymdhms <- ISOdatetime(2015, 7, 31, 0, 0, 0) + 123456 * 1e-6
iso_micro_ymdhms
class(iso_micro_ymdhms)

# 2015年7月31日0時0分0秒の1970年1月1日0時0分0秒からの経過秒
elapsed <- 1438268400
elapsed %>% as.POSIXct(origin = '1970-01-01')

# DATEオブジェクトへの変換
elapsed %>% as.POSIXct(origin = '1970-01-01') %>% as.Date()

format(now.pc, '%Y') %>% as.numeric() # 年
format(now.pc, '%m') %>% as.numeric() # 月
format(now.pc, '%d') %>% as.numeric() # 日
format(now.pc, '%H') %>% as.numeric() # 時
format(now.pc, '%M') %>% as.numeric() # 分
format(now.pc, '%S') %>% as.numeric() # 秒
format(now.pc, '%w') %>% as.numeric() # 曜日（0が日曜日）
format(now.pc, '%j') %>% as.numeric() # 当該年の1月1日からの経過日数

# lubridateパッケージを利用
year(now.pc)   # 年
month(now.pc)  # 月
day(now.pc)    # 日
hour(now.pc)   # 時
minute(now.pc) # 分
second(now.pc) # 秒
wday(now.pc) # 曜日（1が日曜日）
yday(now.pc) # 当該年の1月1日からの経過日数

now.pc %>% class()

# POSIXltクラスによる表現
now.pl <- as.POSIXlt('2015-07-31 00:00:00', tz = 'Asia/Tokyo')
now.pl

now.pl$year + 1900  # 年
now.pl$mon  + 1     # 月
now.pl$mday         # 日
now.pl$hour         # 時
now.pl$min          # 分
now.pl$sec          # 秒
now.pl$wday         # 曜日（0が日曜日）

# libridateパッケージの利用
year(now.pl)        # 年
month(now.pl)       # 月
day(now.pl)         # 日
hour(now.pl)        # 時
minute(now.pl)      # 分
second(now.pl)      # 秒
wday(now.pl)        # 曜日（1が日曜日）
yday(now.pl)        # 当該年の1月1日からの経過日数

# 和暦変換

inst_package(c('stringi', 'lubridate'))

stri_datetime_parse(
    "平成02年12月3日", 
    format = "Gy年M月d日", 
    locale = "ja-JP-u-ca-japanese"
    ) %>% 
    as_date()

# 休日チェック
is.jholiday('2024-5-1')

### 15-2-4 周期性を持つ時系列データの表現
AirPassengers
class(AirPassengers)

# データの抽出(位置次元のベクトル化)
ap <- AirPassengers %>% as.integer()
ap

class(ap)

# データを年と月の表形式に変換
ap.ts <- ts(ap, start = 1949, frequency = 12)
ap.ts

class(ap.ts)

# 系列が複数の時系列データ
# 1947年から1979年までに英国で肺疾患でなくなった男性の人口
mdeaths

# 女性の人口
fdeaths

# 男女を合計した人口
ldeaths

# データの抽出
md <- mdeaths %>% as.integer()
fd <- fdeaths %>% as.integer()

deaths <- cbind(mdeaths = md, fdeaths = fd)

# tsクラスのオブジェクトの作成
deaths.ts <- ts(deaths, frequency = 12, start = 1974)
deaths.ts

class(deaths.ts)

# 1974年から1979年までの英国における肺疾患による死亡者数（男女別）
ts.plot(
    deaths.ts,
    col = c('red', 'blue'),
    lty = 1:2,
    sub = '1974年から1979年までの英国における肺疾患による死亡者数（男女別）'
    )
legend(
    'topleft',
    legend = c('mdeaths', 'fdeaths'),
    col = c('red', 'blue'),
    lty = 1:2
    )

# 複数周期の時系列データ
class(taylor)

head(taylor)
tail(taylor)
attr(taylor, 'msts')

plot.ts(ap.ts)
attr(ap.ts, 'ts')

# 日経平均株価の取得
nikkei <- getSymbols(
    '^N225', 
    src = 'yahoo', 
    from = '2014-01-01', 
    to = '2014-12-31', 
    auto.assign = FALSE
    )

class(nikkei)

# 2014年1月のデータ
nikkei['2014-01']

# 2014年1月20日までのデータ
nikkei['/2014-01-20']

# 最初の1週間のデータ
first(nikkei, '1 week')

# 月末日を表す行番号
ids.month.end <- endpoints(nikkei, on = 'months')
# 月末日のデータ
nikkei[ids.month.end]

# 四半期毎の統計量を算出
# 週ごとの平均
apply.weekly(nikkei[, 'N225.Close'], FUN = mean)

# 月ごとの平均
apply.monthly(nikkei[, 'N225.Close'], FUN = mean)

# 四半期毎の平均
apply.quarterly(nikkei[, 'N225.Close'], FUN = mean)

## 15-3 時系列データの可視化
packages <- c(
    'openair',
    'quantmod'
)

inst_package(packages = packages)

### 15-3-1 月次データのプロット
seasonplot(
    AirPassengers, 
    col = rainbow(12), 
    season.labels = TRUE, 
    year.labels = TRUE, 
    year.labels.left = TRUE, 
    cex = 0.8
    )

### 15-3-2 カレンダープロット
nikkei <- getSymbols(
    '^N225',
    src = 'yahoo',
    from = '2014-01-01',
    to = '2014-12-31',
    auto.assign = FALSE
)

class(nikkei)

head(nikkei)

# データの加工（日付と終値の2列）
nikkei.close <- 
    nikkei %>%
    as.data.frame() %>% 
    mutate(date = as.Date(rownames(.))) %>% 
    select(date, N225.Close)

# カレンダープロット
calendarPlot(nikkei.close, pollutant = 'N225.Close', year = 2014)

# 日経平均株価の取得
nikkei <- getSymbols(
    '^N225',
    src = 'yahoo',
    from = '2011-01-01',
    to = '2014-12-31',
    auto.assign = FALSE
)

# データの加工（日付と終値の2列）
nikkei.close <- 
    nikkei %>%
    as.data.frame() %>% 
    mutate(date = as.Date(rownames(.))) %>% 
    select(date, N225.Close)

# カレンダープロット
calendarPlot(nikkei.close, pollutant = 'N225.Close', year = 2011)

## 15-4 時系列データの記述
packages <- c(
    'fpp',
    'tseries'
)

inst_package(packages = packages)

# 標本自己相関係数の算出
acf(AirPassengers)

# 偏自己相関係数の算出
pacf(AirPassengers)

# tsdisplay関数による自己相関係数のプロット
 tsdisplay(AirPassengers)

# Ljung-Box検定による自己相関性の確認
Box.test(AirPassengers, type = 'Ljung-Box', lag = 1)

# ホワイトノイズの自己相関係数
set.seed(71)
x <- runif(1000)
Box.test(x, type = 'Ljung-Box')

### 15-4-2 成分分解

# decompose関数による因数分解
plot(decompose(AirPassengers))

# stl関数による要因分解
plot(stl(AirPassengers, 'periodic'))

### 15-4-3 定常性の確認

# AirPassengers データセットの自己相関係数
tsdisplay(AirPassengers, main = 'AirPassengersデータセット')

# sunspotデータセットの自己相関係数
tsdisplay(sunspot.year, main = 'sunspotデータセット')

# lhデータセットの自己相関係数
tsdisplay(lh, main = 'lhデータセット')

# ランダムウォークの自己相関係数
set.seed(71)
x <- cumsum(rnorm(100))
tsdisplay(x, main = 'ランダムウォーク')

# lhデータセットに対する拡張ディッキー・フラー検定
adf.test(lh)

# ランダムウォークに対する拡張ディッキー・フラー検定
set.seed(71)
x <- cumsum(rnorm(100))
adf.test(x)

# sunspotデータセットに対する拡張ディッキー・フラー検定
adf.test(sunspot.year) # 帰無仮説は棄却されるが明らかな周期性をもつため周期性を除去後、再検証

# 黒点数の差分の自己相関係数（ラグ = 10）
tsdisplay(diff(sunspot.year, 10))

# sunspotデータセットに対する拡張ディッキー・フラー検定（ラグ = 10）
adf.test(diff(sunspot.year, 10))

# AirPassengersデータセットに対する拡張ディッキー・フラー検定
adf.test(AirPassengers)

# 定数の差分の自己相関係数（ラグ = 12）
diff(AirPassengers, 12) %>% tsdisplay()

# AirPassengersデータセットに対する拡張ディッキー・フラー検定（ラグ = 12）
AirPassengers %>% diff(12) %>% adf.test()

# 乗客数の差分の自己相関係数（ラグ = 12）
AirPassengers %>% diff(12) %>% adf.test()

# 乗客数の差分の自己相関係数（ラグ = 12 の後にラグ1で差分化）
AirPassengers %>% diff(12) %>% diff() %>% tsdisplay()

# AirPassengers データセットに対する拡張ディッキー・フラー検定
AirPassengers %>% diff(12) %>% diff() %>% adf.test()

# 適切な階差の算出
AirPassengers %>% ndiffs()

# 適切な季節階差の算出
AirPassengers %>% nsdiffs()

## 15-5 時系列データのモデリング

### 15-5-1 ARモデル

# ARモデルに従う時系列データの生成
set.seed(71)
len <- 500

ar.0.9 <- arima.sim(list(order = c(1, 0, 0), ar = 0.9), n = len) %>% as.vector()
ar.0.5 <- arima.sim(list(order = c(1, 0, 0), ar = 0.5), n = len) %>% as.vector()
ar.m0.5 <- arima.sim(list(order = c(1, 0, 0), ar = -0.5), n = len) %>% as.vector()
ar.m0.9 <- arima.sim(list(order = c(1, 0, 0), ar = -0.9), n = len) %>% as.vector()

dat <- data.frame(
    time = rep(1:len, 4), 
    x = c(ar.0.9, ar.0.5, ar.m0.5, ar.m0.9),
    a1 = rep(c(0.9, 0.5, -0.5, -0.9), each = len)
    )

inst_package(packages = 'ggplot2')
library(ggplot2)

p <- ggplot(data = dat, aes(x = time, y = x)) +
    geom_line() +
    facet_grid(a1 ~ .) +
    ggtitle('AR(1)') +
    theme_bw()

print(p)

# ARモデルに従う時系列データの自己相関プロット
layout(matrix(1:4, 2, 2, byrow = TRUE))
acf(ar.0.9)
acf(ar.0.5)
acf(ar.m0.5)
acf(ar.m0.9)

# ARモデルによるフィッティング
ts.ar.0.9 <- ts(ar.0.9)
model.ar <- ar(ts.ar.0.9)

# 残差の自己相関係数、偏自己相関係数のプロット
tsdisplay(model.ar$resid)

# 残差の2乗の自己相関係数、偏自己相関係数の算出
tsdisplay(model.ar$resid ^ 2)

# lhデータセットの時系列、自己相関係数、偏自己相関係数のプロット
tsdisplay(lh)

# lhデータセットに対するARモデルのフィッティング
ar.lh <- ar(lh)
ar.lh

# 残差の時系列、自己相関係数、偏自己相関係数のプロット
tsdisplay(ar.lh$resid)

# 残差の2乗の自己相関係数、偏自己相関係数のプロット
tsdisplay(ar.lh$resid ^ 2)

### 15-5-2 ARモデルによるモデリングがうまくいかないケース

# AirPassengersデータセットに対するARモデルのフィッティング
ar.ap <- ar(AirPassengers)
ar.ap

# 残差の時系列、自己相関係数、偏自己相関係数のプロット
tsdisplay(ar.ap$resid)

# 残差の独立性の検定
Box.test(window(ar.ap$resid, start = 14), type = 'Ljung')

### 15-5-3 ARMA/ARIMAモデル
set.seed(71)

# MAモデルに従う時系列データの生成
len <- 500

ma.0.9 <- 
    arima.sim(list(order = c(0, 0, 1), ma = 0.9), n = len) %>% 
    as.vector()

ma.0.5 <- 
    arima.sim(list(order = c(0, 0, 1), ma = 0.5), n = len) %>% 
    as.vector()

ma.m0.5 <- 
    arima.sim(list(order = c(0, 0, 1), ma = -0.5), n = len) %>% 
    as.vector()

ma.m0.9 <- 
    arima.sim(list(order = c(0, 0, 1), ma = -0.9), n = len) %>% 
    as.vector()

dat <- data.frame(
    time = rep(1:len, 4),
    x = c(ma.0.9, ma.0.5, ma.m0.5, ma.m0.9),
    b1 = rep(c(0.9, 0.5, -0.5, -0.9), each = len)
)

p <- 
    ggplot(data = dat, aes(x = time, y = x)) +
    geom_line() +
    facet_grid(b1 ~ .) +
    ggtitle('MA(1)') +
    theme_bw()

print(p)

# MAモデルに従う時系列データの自己相関係数、偏自己相関係数のプロット
tsdisplay(ma.0.9)
tsdisplay(ma.0.5)
tsdisplay(ma.m0.5)
tsdisplay(ma.m0.9)

# lhデータセットに対するARMAモデルのフィッティング
arma.lh <- arima(lh, order = c(3, 0, 3))
arma.lh

# 残債の自己相関係数、偏自己相関係数のプロット
tsdisplay(arma.lh$resid)

# AirPassengersデータセットに対するARMAモデルのフィッティング
arma.ap <- arima(AirPassengers, order = c(3, 0, 3))

# 残差の自己相関係数、偏自己相関係数のプロット
tsdisplay(arma.ap$resid)

### ARIMAモデル

# 定常な時系列とするための階差の算出
nd <- ndiffs(AirPassengers, max.d = 12)
nd

# 定常な時系列とするための季節成分の階差の算出
nsd <- nsdiffs(AirPassengers, max.D = 2)
nsd

# 階差の自己相関のプロット
acf(diff(AirPassengers, nd))

# AirPassengersデータセットに対するARIMAモデルのフィッティング
ap.train <- window(AirPassengers, start = c(1949, 1), end = c(1960, 12))
arima.ap <- arima(
    ap.train,
    order = c(1, nd, 1),
    seasonal = list(order = c(0, 1, 1), period = 12)
)

arima.ap

# 回帰診断
tsdiag(arima.ap)

# 残差に対するLjung-Box検定
Box.test(arima.ap$residuals, type = 'Ljung-Box')

# ARIMAモデルによる予測

# 1960年1月～12月の乗客数の予測
plot(forecast(arima.ap, h = 12))

# auto.arima関数によるパラメータの推定
aarima.ap <- auto.arima(ap.train)
aarima.ap

# 1960年1月～12月の乗客数の予測
plot(forecast(aarima.ap, h = 12))
