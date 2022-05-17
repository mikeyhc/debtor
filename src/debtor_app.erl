%%%-------------------------------------------------------------------
%% @doc debtor public API
%% @end
%%%-------------------------------------------------------------------

-module(debtor_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    debtor_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
