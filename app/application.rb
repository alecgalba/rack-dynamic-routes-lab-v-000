class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      name_of_item = req.path.split("/items/").last
      item = @@items.detect {|item| item.name == name_of_item}

      if item.nil? == false
        resp.write item.price.to_s
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
    end
  else
    resp.write "Route not found"
    resp.status = 404
  end
  resp.finish
  end

end
