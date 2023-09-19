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
    user = ENV["SLACK_USER"]

    @assert !isempty(token)
    @assert !isempty(channel)
    @assert !isempty(user)

    context = SlackContext(token)

    response = SlackAPI.channel_message(context, channel, "testing...")
    @test response.status == 200

    @test SlackAPI.mention("XXXX") == "<@XXXX>"

    @test SlackAPI.is_active(context, user) == true

    @test SlackAPI.is_active(context, "U1234") == false
end

testall()
