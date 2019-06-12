# 八股文（語法）

配方： ℞ **lotem/rime-octagram-data**

[Rime](https://rime.im) 預設詞彙表配套的語言模型。

須裝配Rime插件 [`librime-octagram`](https://github.com/lotem/librime-octagram)。

## 免責聲明

配方中的文件乃以開放的互聯網語料精煉而成，只供參考之用。
全程自動處理，絕無人工干預。內容如有不妥，製作者不承擔任何責任。

授權條款：見 [LICENSE](LICENSE)

## 用法

安裝 [`git-lfs`](https://git-lfs.github.com/)；

傳統漢字：先取得配置文件及 `hant` 分支的數據文件，再裝配到方案；

``` shell
bash rime-install lotem/rime-octagram-data lotem/rime-octagram-data@hant
```

简化字：先取得配置文件及 `hans` 分支的數據文件，再裝配到方案；

``` shell
bash rime-install lotem/rime-octagram-data lotem/rime-octagram-data@hans
```

裝配到方案，以「朙月拼音」为例：

``` shell
bash rime-install lotem/rime-octagram-data:customize:schema=luna_pinyin,model=hant
```

`model` 量輸入法的簡繁、字詞偏向，取爲 `hant`, `hans`, `hant_char`, `hans_char` 之一。
