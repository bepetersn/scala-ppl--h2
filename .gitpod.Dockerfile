FROM gitpod/workspace-full

# Install ammonite REPL
RUN sudo sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/lihaoyi/Ammonite/releases/download/2.0.4/2.13-2.0.4) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm'

# Install scala, scalaenv and sbt
RUN brew install scala sbt scalaenv 
RUN curl -fLo coursier https://git.io/coursier-cli \
    && chmod +x coursier \ 
    && sudo env "PATH=$PATH" ./coursier bootstrap \
    	org.scalameta:scalafmt-cli_2.12:2.4.2   -r sonatype:snapshots \ 
    	-o /usr/local/bin/scalafmt --standalone --main org.scalafmt.cli.Cli \
    && ./coursier launch --fork almond -M almond.ScalaKernel -- --install --force

# Get Scala version 2.12.11
RUN scalaenv install scala-2.12.11 && scalaenv global scala-2.12.11

CMD jupyter notebook --ip 0.0.0.0 --NotebookApp.allow_origin=https://8888-$GITPOD_WORKSPACE_ID.ws-us08.gitpod.io
