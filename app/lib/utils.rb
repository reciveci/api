module Utils

	def serverUrl(request)
		request.protocol + request.host + ":" + request.port.to_s + "/"
	end

	def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Max-Age'] = "1728000"
  end

	def convex_hull(points)
	  points.sort!.uniq!
	  return points if points.length <= 3
	  def cross(o, a, b)
	    (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
	  end
	  lower = Array.new
	  points.each{|p|
	    while lower.length > 1 and cross(lower[-2], lower[-1], p) <= 0 do lower.pop end
	    lower.push(p)
	  }
	  upper = Array.new
	  points.reverse_each{|p|
	    while upper.length > 1 and cross(upper[-2], upper[-1], p) <= 0 do upper.pop end
	    upper.push(p)
	  }
	  return lower[0...-1] + upper[0...-1]
	end

end
