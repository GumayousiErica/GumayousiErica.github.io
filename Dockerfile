FROM jekyll/jekyll:4.2.0

# 设置工作目录
WORKDIR /srv/jekyll

# 复制项目文件
COPY . .

# 设置正确的权限
RUN chown -R jekyll:jekyll /srv/jekyll

# 配置bundle路径
RUN bundle config set --local path 'vendor/bundle'

# 安装依赖
RUN bundle install

EXPOSE 4000

# 切换到jekyll用户
USER jekyll

CMD ["jekyll", "serve", "--host", "0.0.0.0", "--watch", "--incremental", "--livereload"]
