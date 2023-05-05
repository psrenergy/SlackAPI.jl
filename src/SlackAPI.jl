module SlackAPI

using HTTP
using JSON

export SlackContext, mention, channel_message

include("context.jl")
include("api.jl")

end
