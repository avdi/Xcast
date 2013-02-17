require 'open3'

module Xutils
  # Return the output of xwininfo(1) as a hash
  def xwininfo(win_id)
    info_results, info_status =
      Open3.capture2e("xwininfo", *%W[-id #{win_id}])
    win_stats = info_results.each_line.each_with_object({}) do
      |line, stats|
      fields = line.strip.split(/:\s*/)
      stats[fields[0]] = fields[1]
    end
  end
end
