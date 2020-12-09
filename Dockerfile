FROM amazon/aws-cli

RUN amazon-linux-extras install docker -y
RUN yum install make unzip jq amazon-ecr-credential-helper -y
# We need terraform to test ours terraform script
RUN curl -O https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
RUN unzip terraform_0.13.5_linux_amd64.zip -d /usr/bin/
RUN terraform -v

RUN mkdir -p ~/.docker && chmod 0700 ~/.docker
RUN echo '{"credsStore": "ecr-login"}' > ~/.docker/config.json