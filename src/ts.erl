%% Copyright
-module(ts).
-author("kooyou").

%% API
-compile(export_all).

%%tcp_server监听参数
-define(TCP_OPTIONS, [binary, {packet, 0}, {active, false}, {reuseaddr, true}, {nodelay, false}, {delay_send, true}, {send_timeout, 5000}, {keepalive, true}, {exit_on_close, true}]).

start() ->
  case gen_tcp:connect("127.0.0.1",9010, [binary, {packet, 0},{active,false}]) of
    {ok,Socket} -> io:format("hello~n");
    Error -> io:format("error connect ~p~n",[Error])
  end.
