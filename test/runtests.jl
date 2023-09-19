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

    @assert !isempty(token)
    @assert !isempty(channel)

    context = SlackContext(token)

    response = SlackAPI.channel_message(context, channel, "testing...")
    @assert response.status == 200

    @assert SlackAPI.mention("XXXX") == "<@XXXX>"

    # @assert SlackAPI.is_active(context, user)
end

testall()
