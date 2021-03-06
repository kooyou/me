-module(sd_tcp_client_sup).
-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).
start_link() ->
  supervisor:start_link({local,?MODULE}, ?MODULE, []).

init([]) ->
  {ok, {{simple_one_for_one, 10, 10},
    [{sd_reader, {sd_reader,start_link,[]},
      temporary, brutal_kill, worker, [sd_reader]}]}}.
