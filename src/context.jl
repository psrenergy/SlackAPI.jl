struct SlackContext
    token::String

    function SlackContext(token::AbstractString)
        @assert !isempty(token)
        return new(token)
    end
end
