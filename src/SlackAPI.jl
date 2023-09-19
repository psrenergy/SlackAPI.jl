module SlackAPI

using HTTP
using JSON

export SlackContext

include("context.jl")
include("api.jl")

end
