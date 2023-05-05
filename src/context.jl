struct SlackContext
    token::String

    function SlackContext(token::String)
        @assert !isempty(token)
        return new(token)
    end
end