function mention(username::AbstractString) 
    return "<@$(username)>"
end

function channel_message(token::String, channel::AbstractString, text::AbstractString)
    header = [
        "Content-Type"  => "application/json;charset=utf-8",
        "Authorization" => "Bearer $token",
    ]

    body = JSON.json(
        Dict(
            "text" => text, 
            "channel" => channel,
        )
    )

    return HTTP.post(
        "https://slack.com/api/chat.postMessage",
        header,
        body,
    )
end
