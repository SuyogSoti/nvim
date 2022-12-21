#!/usr/local/bin/python3

import os
import libtmux
import sys

def attach_client(server: libtmux.Server, session_name: str):
    if os.getenv("TMUX") is None:
        server.attach_session(session_name)
    else:
        server.switch_client(session_name)


def main():
    if len(sys.argv) < 2:
        raise(RuntimeError("need a path"))
    path = sys.argv[1]
    if not os.path.exists(path):
        raise(RuntimeError("path not exist"))
    path = os.path.abspath(path)
    name = "_".join(path.split("/")[-2:])
    session_name = name.replace(".git", "")
    server = libtmux.Server()
    if not server.has_session(session_name, exact=True):
        server.new_session(session_name=session_name,
                           start_directory=path,
                           window_name="vim")
    attach_client(server, session_name)

if __name__ == "__main__":
    main()
