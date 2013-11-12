#!/usr/bin/env julia

if length(ARGS) < 1
    println( "Usage: ./report_nightly.jl \"target\"" )
    exit( -1 )
end

using HTTPClient.HTTPC

target = ARGS[1]
json = "{\"target\": \"$target\"}"
ro = RequestOptions( content_type = "application/json" )

post("http://julia-codespeed.csail.mit.edu:8000/put/nightly", json ) 