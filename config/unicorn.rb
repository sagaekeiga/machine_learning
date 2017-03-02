worker_processes 2
working_directory "/home/anime/machine_learning/current"

listen "/var/run/unicorn/unicorn_machine_learning.sock"
pid "/var/run/unicorn/unicorn_machine_learning.pid"


stderr_path "/home/anime/machine_learning/current/log/unicorn.log"
stdout_path "/home/anime/machine_learning/current/log/unicorn.log"


preload_app true