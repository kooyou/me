%%%------------------------------------------------
%%% File    : record.hrl
%%% Author  : xyao
%%% Created : 2011-06-13
%%% Description: 这里只存在公共常用的record
%%%------------------------------------------------

%% 所有线路记录
-record(node, {
  id,
  ip,
  port,
  node,
  cookie,
  num = 0,
  state = 0  %是否开放 0开放 1关闭
}
).

%% 二级密码
-record(secondary_password, {
  id = 0,             %% 角色Id
  is_pass = false,    %% 是否通过验证
  error_times = 0,    %% 输错次数
  question1 = 0,      %% 问题1 Id
  question2 = 0,      %% 问题2 Id
  answer1 = <<>>,     %% 答案1 BinString
  answer2 = <<>>,     %% 答案2 BinString
  password = <<>>     %% 二级密码 BinString
}).

%% 服务器信息
-record(server_status, {
  name,
  value
}
).

%%节点状态记录
-record(node_state,{
  id = 0,							%%节点id
  node = undefined ,				%%节点
  load = 0,						%%负载值
  ip = 0,							%%ip地址
  port = 0,						%%端口
  ts = 0							%%当前时间
}).
