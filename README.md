# SlackAPI.jl

[![CI](https://github.com/psrenergy/SlackAPI.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/psrenergy/SlackAPI.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/psrenergy/SlackAPI.jl/graph/badge.svg?token=VCTHLKP4I4)](https://codecov.io/gh/psrenergy/SlackAPI.jl)

A minimal and lightweight Julia wrapper for the Slack API

## Usage

```julia
julia> ] add SlackAPI
```

### Context

```julia
using SlackAPI

token = "xoxb-xxxxxxxxxx-xxxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxx"
context = SlackContext(token)
```

### Channel Message

```julia
channel = "Cxxxxxxxxxx"
message = "Hello, World!"

SlackAPI.channel_message(context, channel, message)
```

### Is the User Active?

```julia
user = "Uxxxxxxxxxx"

is_active = SlackAPI.is_active(context, user)
```
