# scala-ppl--h2

Spin up a Scala environment in a Jupyter Notebook (this one being setup for my Principles of Programming Languages class).

If this is useful to you, you should know that the best way I have yet found to work with this is
to run `jupyter notebook` yourself and pass the `--NotepadApp.AllowOrigin=https://example.com` option, 
but with the URL equal to where GitPod sets up the Jupyter Notebook server URL to be. Seems like that's
generally your GitPod workspace url, prefixed by the port number as part of the url, e.g. 
https://8888-example-gitpod-workspace.gitpod.io.
