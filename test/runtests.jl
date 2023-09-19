using SlackAPI

using Aqua
using Test

function testall()
    @testset "Aqua.jl" begin
        @testset "Ambiguities" begin
            Aqua.test_ambiguities(SlackAPI, recursive = false)
        end
        Aqua.test_all(SlackAPI, ambiguities = false)
    end

    token = ENV["SLACK_TOKEN"]
    channel = ENV["SLACK_CHANNEL"]

    context = SlackContext(token)

    response = channel_message(context, channel, "Hello, World!")

    @assert response.status == 200
end

testall()
