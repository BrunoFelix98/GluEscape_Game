vector2 = {}

function vector2.new(px, py)
  return {x = px, y = py}
end

function vector2.add(vec, inc)
  local result = vector2.new(0, 0)
    result.x = vec.x + inc.x
    result.y = vec.y + inc.y
  return result
end

function vector2.sub(vec, dec)
  local result = vector2.new(0, 0)
    result.x = vec.x - dec.x
    result.y = vec.y - dec.y
  return result
end

function vector2.mult(vec, n)
  local result = vector2.new(0, 0)
    result.x = vec.x * n
    result.y = vec.y * n
  return result
end
function vector2.div(vec, n)
  local result = vector2.new(0, 0)
    result.x = vec.x / n
    result.y = vec.y / n
  return result
end

function vector2.mag(vec)
  result = math.sqrt(vec.x * vec.x + vec.y * vec.y)
return result
end

function vector2.normalize(vec)
  local mag = vector2.mag(vec)
  if mag == 0 then
    return vec
  else
    return vector2.div(vec, mag)
  end
end

function vector2.limit(vec, max)
  local result = vec
  if vector2.mag(vec) > max then
    result = vector2.normalize(vec)
    return vector2.mult(result, max)
  else
    return result
  end
 end

function vector2.addForce(force, mass, acceleration)
  local acc = vector2.div(force, mass)
  return vector2.add(acceleration, acc)
end
