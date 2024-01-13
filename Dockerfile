FROM ghcr.io/cirruslabs/flutter:3.16.7
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \ 
    && unzip awscliv2.zip \
    && ./aws/install