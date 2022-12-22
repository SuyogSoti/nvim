#!/usr/bin/python3

import os
import libtmux
import sys
import subprocess

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
        if path.find("/") >= 0:
            raise(RuntimeError("path not exist"))
        is_in_worktree_cmd = "git rev-parse --is-inside-work-tree".split()
        is_in_worktree = subprocess.run(is_in_worktree_cmd, capture_output=True, encoding="utf-8")
        while is_in_worktree.stdout.strip() == "true":
            os.chdir("./..")
            is_in_worktree = subprocess.run(is_in_worktree_cmd, capture_output=True, encoding="utf-8")
        worktree_path = os.path.join(os.curdir, path)
        if not os.path.exists(worktree_path):
            subprocess.call(["git", "worktree", "add", path])
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
