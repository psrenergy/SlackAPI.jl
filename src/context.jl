struct SlackContext
    token::String

    function SlackContext(token::AbstractString)
        @assert !isempty(token)
        return new(token)
    end
end

function header(context::SlackContext)
    return [
        "Content-Type" => "application/json;charset=utf-8",
        "Authorization" => "Bearer $(context.token)",
    ]
end
