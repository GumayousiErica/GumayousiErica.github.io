# 使用官方 Ruby 镜像作为基础镜像
FROM ruby:3.1

# 设置工作目录
WORKDIR /app

# 复制 Gemfile、Gemfile.lock 和 gemspec 文件到工作目录
COPY Gemfile Gemfile.lock *.gemspec ./

# 更换gem源为国内镜像并安装依赖
RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ && \
    gem install bundler && \
    bundle config mirror.https://rubygems.org https://gems.ruby-china.com && \
    bundle install

# 复制项目文件到工作目录
COPY . .

# 暴露端口 4000（Jekyll 默认端口）
EXPOSE 4000

# 启动 Jekyll 服务
CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]
