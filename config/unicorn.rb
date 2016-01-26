rails_root = File.expand_path('../../', __FILE__)
working_directory rails_root

worker_processes 2

timeout 30

listen "/var/run/kaumo-books.sock"
pid "/var/run/kaumo-books.pid"

preload_app true

stdout_path File.expand_path('log/unicorn.stdout.log',rails_root)
stderr_path File.expadn_path('log/unicorn.stderr.log',rails_root)

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
  sleep 1
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
