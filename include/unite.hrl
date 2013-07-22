%%%------------------------------------------------
%%% File    : unite.hrl
%%% Author  : xyao
%%% Created : 2011-06-13
%%% Description: 公共线record
%%%------------------------------------------------

%-define(ETS_UNITE, ets_unite).                                  %% 公共线列表

%%师徒
-record(status_master,{
        master_quit_lasttime= 0,        % 师门上次退出时间                
        master_score = 0,               % 师道值
        master_join_lasttime = 0        % 最后拜师时间
    }).


%% 公共线状态
-record(unite_status, {
	id,
    platform = "",                      %% 平台标示
    server_num = 0,                     %% 所在的服标示
	pid = none,							%% 公共线服务进程
	name,								%% 用户名
	vip = 0,							%% Vip等级
	scene = 0,							%% 场景
	copy_id = 0,						%% 房间标示
	team_id,							%% 队伍
	sex,								%% 性别
	realm,								%% 阵营
	career,								%% 职业
	guild_id = 0,						%% 军团id
	guild_name = [],					%% 军团名
	guild_position = 0,					%% 军团职位
	arena_info,							%% 竞技场信息（[DungeonId, Group]）
	show_name=[],						%% 在聊天窗口显示的称号列表
	lv,									%% 等级
	image = 0,							%% 角色头像
	gm = 0,								%% GM  1是 0否
	sid = {},
	appointment = 0,					%% 是否处于仙侣奇缘状态
	accept_greeting_num,				%% 接受祝福次数
	last_login_time = 0,
	master = #status_master{},			%% 拜师
	talk_lim = 0,						%% 禁言
	talk_lim_time = 0,					%% 禁言截止时间
	talk_lim_right = 0,					%% 禁言权限 0无权限,1有权限
	war_end_time = 0,					%% 帮战、竞技场进入时间戳
	dailypid = none ,					%% 玩家日常进程
	prev_record_time = 0,				%% 上次开始记录聊天内容时间
	record_content = [],				%% 聊天内容
	loverun_data = [],					%% 爱情长跑记录的数据(开始小时，开始分钟，结束小时，结束分钟，报名时长)
	all_multiple_data = [],				%所有双倍经验配置数据
	world_level = {0, 0},				% 经验加成{世界等级, 更新时间}
    group = 0,                          % 战斗分组
	mergetime = 0
}).

%% 聊天信息
-record(ets_unite, {
        id,
        name,				%% 用户名
        gm = 0,				%% GM号
        talk_lim = 0,       %% 禁言
        talk_lim_time = 0,  %% 禁言截止时间
		talk_lim_right = 0, %% 禁言权限 0无权限,1有权限
        vip = 0,			%% Vip等级
        scene = 0,			%% 场景
        copy_id = 0,		%% 房间标示
        team_id,			%% 队伍
        sex,				%% 性别
        realm,				%% 阵营
        career,				%% 职业
        guild_id = 0,		%% 军团id
        guild_name = [],	%% 军团名
        guild_position = 0, %% 军团职位
        group,				%% 分组信息（[DungeonId, Group]）
        show_name=[],		%% 在聊天窗口显示的称号列表
        lv,					%% 等级
        image = 0,			%% 角色头像
        sid = {},
        appointment = 0,  	%% 是否处于仙侣奇缘状态
        last_login_time = 0,
        pid = none			%% 公共线服务进		
    }
).
