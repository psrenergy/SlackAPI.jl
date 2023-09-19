function mention(username::AbstractString)
    return "<@$(username)>"
end

function channel_message(
    context::SlackContext,
    channel::AbstractString,
    text::AbstractString,
)
    header = [
        "Content-Type" => "application/json;charset=utf-8",
        "Authorization" => "Bearer $(context.token)",
    ]

    body = JSON.json(Dict("text" => text, "channel" => channel))

    return HTTP.post("https://slack.com/api/chat.postMessage", header, body)
end

function is_active(context::SlackContext, id::AbstractString)
    header = [
        "Content-Type" => "application/json;charset=utf-8",
        "Authorization" => "Bearer $(context.token)",
    ]

    query = ["user" => id]

    response = HTTP.get("https://slack.com/api/users.info", header, query)

    @assert response.status == 200

    data = JSON.parse(String(response.body))

    if haskey(data, "user") && haskey(data["user"], "deleted")
        return !(data["user"]["deleted"]::Bool)
    else
        return false
    end
end
