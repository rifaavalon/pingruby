FROM ubuntu:18.04

WORKDIR /usr/local/bin

RUN apt-get update

RUN apt-get install -y openssl

#installs RVM, Ruby, and Bundler
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.4"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

RUN rvm install ruby-2.4

COPY . /usr/local/bin
RUN bundle install
