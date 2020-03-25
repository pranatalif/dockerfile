listen {
  port = 4040
  address = "192.168.122.170"
}

namespace "hls" {
  source = {
    files = /var/log/nginx/access.log
  }

  format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\""

  labels {
    app = "hls-server"
    environment = "production"
  }

  histogram_buckets = [.005, .01, .025, .05, .1, .25, .5, 1, 2.5, 5, 10]

}

