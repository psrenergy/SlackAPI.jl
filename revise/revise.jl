import Pkg
Pkg.instantiate()

using Revise

Pkg.activate(dirname(@__DIR__))
Pkg.instantiate()

using SlackAPI
@info("""
This session is using SlackAPI.jl with Revise.jl.
For more information visit https://timholy.github.io/Revise.jl/stable/.
""")
