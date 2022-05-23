FROM w3villa/rvm:latest
RUN /bin/bash -l -c 'source /etc/profile.d/rvm.sh'
RUN /bin/bash -l -c "rvm install 2.7.3"
RUN /bin/bash -l -c "gem install bundler -v 1.17.3"
WORKDIR /remotive-jobs
COPY . /remotive-jobs/
RUN git config --global url."https://github.com/".insteadOf git://github.com/
RUN /bin/bash -l -c "bundle install"
RUN /bin/bash -l -c 'bundle exec rails webpacker:install'
COPY entrypoint.sh /usr/bin/ 
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["entrypoint.sh"]
