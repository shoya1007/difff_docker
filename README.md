# difff_docker
[difff](https://github.com/meso-cacase/difff)をDockerコンテナで動作させる。

以下でイメージをビルド。
```
$ docker build -t difff .
```
ビルドしたら以下で起動。
```
docker run --name difff -p 80:80 -d difff
```
## 参考情報
https://senyoltw.hatenablog.jp/entry/2015/10/21/175847
