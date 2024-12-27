FROM httpd:2.4

RUN apt-get update && apt-get install -y \
    wget \
    unzip
# github上からzipファイルで取得
RUN wget https://github.com/meso-cacase/difff/archive/refs/heads/master.zip
# zipファイルを解凍
RUN unzip master
# 解凍したファイルをhtdocsに移動
RUN mv difff-master/* /usr/local/apache2/htdocs/

RUN sed -ri 's/#LoadModule cgid_module/LoadModule cgid_module/g; \ 
             s/DirectoryIndex index.html/DirectoryIndex index.cgi/g; \ 
             s/Options Indexes FollowSymLinks/Options Indexes FollowSymLinks ExecCGI/g; \
             s/#AddHandler cgi-script .cgi/AddHandler cgi-script .pl .cgi/g' /usr/local/apache2/conf/httpd.conf
RUN sed -ri "s|'http://difff.jp/'|'./'|g" /usr/local/apache2/htdocs/difff.pl
