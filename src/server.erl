-module(server).
-behaviour(gen_server).
-compile(export_all).
-include("common.hrl").
-include("record.hrl").

start_link() ->
  gen_server:start_link(?MODULE,[],[]).

init([]) ->
  start(),
  {ok,ok}.

start() ->
  init_ets(),
  {ok, _SupPid} =sd_sup:start_link(),
  start_client(),
  start_tcp(9010).

%%开启客户端监控树
start_client() ->
  {ok,_} = supervisor:start_child(
    sd_sup,
      {sd_tcp_client_sup,
        {sd_tcp_client_sup, start_link,[]},
        transient, infinity, supervisor, [sd_tcp_client_sup]}),
  ok.

%%开启tcp listener监控树
start_tcp(Port) ->
  {ok,_} = supervisor:start_child(
    sd_sup,
    {sd_tcp_listener_sup,
      {sd_tcp_listener_sup, start_link, [Port]},
      transient, infinity, supervisor, [sd_tcp_listener_sup]}),
  ok.

init_ets() ->
  %% 节点
  T = ets:new(?ETS_NODE, [{keypos, #node.id}|?ETS_OPTIONS]),
  io:format("Ets ~p~n",[T]).