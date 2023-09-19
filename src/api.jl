function mention(user::AbstractString)
    return "<@$(user)>"
end

function channel_message(
    context::SlackContext,
    channel::AbstractString,
    text::AbstractString,
)
    body = JSON.json(Dict("text" => text, "channel" => channel))

    return HTTP.post("https://slack.com/api/chat.postMessage", header(context), body)
end

function is_active(context::SlackContext, user::AbstractString)
    query = Dict("user" => user)

    response = HTTP.get("https://slack.com/api/users.info", header(context), query = query)

    @assert response.status == 200

    data = JSON.parse(String(response.body))

    if haskey(data, "user") && haskey(data["user"], "deleted")
        return !(data["user"]["deleted"]::Bool)
    else
        return false
    end
end
