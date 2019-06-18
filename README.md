# 八股文（語法）

配方： ℞ **lotem/rime-octagram-data**

[Rime](https://rime.im) 預設詞彙表配套的語言模型。

須裝配Rime插件 [`librime-octagram`](https://github.com/lotem/librime-octagram)。

## 免責聲明

配方中的文件乃以開放的互聯網語料精煉而成，只供參考之用。
全程自動處理，絕無人工干預。內容如有不妥，製作者不承擔任何責任。

授權條款：見 [LICENSE](LICENSE)

## 用法

### 小狼毫數據包安裝程序

[下載](https://rime.im/download/#windows) 安裝「小狼毫」輸入法
及 [語言模型數據包](https://bintray.com/rime/weasel/data)。

### 修改配置文件

爲輸入方案（以「朙月拼音」爲例）加載語言模型：

```yaml
# luna_pinyin.custom.yaml

patch:
  __include: grammar:/hant
```

若詞典是簡化字的，採用補丁 `grammar:/hans` ；
若輸入方案以打單字爲主，即依通常習慣會將詞組分成單字輸入，
則使用補丁 `grammar:/hant_char` 或 `grammar:/hans_char` 。

### 通過配置管理器安裝

Unix/Linux 環境下可以使用命令行工具安裝、配置語言模型。

下載 [/plum/](https://github.com/rime/plum) 配置管理器；

傳承字：先取得配置文件及 `hant` 分支的數據文件，再裝配到方案；

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

`model` 量輸入法的簡繁、字詞偏向，取 `hant`, `hans`, `hant_char`, `hans_char` 之一。
