%%%------------------------------------------------
%%% File    : server.hrl
%%% Author  : xyao
%%% Created : 2011-06-13
%%% Description: 游戏系统record_
%%%------------------------------------------------

-define(ETS_ONLINE, ets_online).            % 在线列表

%%记录用户初始数据
-record(player, {
    socket = none,      % socket
    pid = none,         % 玩家进程
    upid = none,        % 玩家公共线进程
    login = 0,         % 是否登录
    accid = 0,         % 账户id
    accname = none,     % 账户名
    timeout = 0,        % 超时次数
    req_count = 0,      % 请求次数
    req_list = [],      % 请求列表
    req_time = 0        % 请求时间
}).

%% 玩家属性记录
-record(attribute, {
%%一级属性
    forza = 0,            %力量
    wit = 0,            %灵力
    agile = 0,            %身法/敏捷
    thew = 0,            %体质
%%二级属性
    hp = 0,                %气血
    mp = 0,                %内力
    att = 0,            %攻击
    def = 0,            %防御
    hit = 0,            %命中
    dodge = 0,            %闪躲
    crit = 0,            %暴击
    ten = 0,            %坚韧
    broken = 0,            %破击
    unbroken = 0,        %抗破
%%二级属性百分比
    hp_ratio = 0,
    mp_ratio = 0,
    att_ratio = 0,
    def_ratio = 0,
    hit_ratio = 0,
    dodge_ratio = 0,
    crit_ratio = 0,
    ten_ratio = 0,
    broken_ratio = 0,
    unbroken_ratio = 0,
%%其他属性
    hurt_add = 0,        %增加伤害
    hurt_del = 0        %减少伤害
}).

%% 只为玩家统计用的，不要加别的字段进来了
-record(ets_online, {
    id = 0,                                % 角色ID
    pid = 0,                            % 玩家进程
    sid = {},                           % 发送进程
    tid = none                          % 任务进程
}).

-record(status_goods, {
    equip_attribute = #attribute{},       % 加成属性
    equip_attrit = 0,                   % 装备磨损数，下线则清零
    equip_current = [0, 0, 0, 0, 0, 0],      % 当前装备类型ID - [武器, 衣服, _坐骑, 武器强化数, 衣服强化数, _时装]
    fashion_weapon = [0, 0],             % 穿戴的武器时装 - [武器时装类型ID，武器时装强化数]
    fashion_armor = [0, 0],              % 穿戴的衣服时装 - [衣服时装类型ID，衣服时装强化数]
    fashion_accessory = [0, 0],          % 穿戴的饰品时装 - [饰品时装类型ID，饰品时装强化数]
    fashion_head = [0, 0],              % 穿戴的头饰品
    fashion_tail = [0, 0],               % 尾饰
    fashion_ring = [0, 0],               % 戒指饰品
    hide_fashion_weapon = 0,            % 是否隐藏武器时装，1为隐藏
    hide_fashion_armor = 0,             % 是否隐藏衣服时装，1为隐藏
    hide_fashion_accessory = 0,         % 是否隐藏饰品时装，1为隐藏
    hide_head = 0,                      % 是否隐藏头时装，1为隐藏
    hide_tail = 0,                      % 是否隐藏尾时装，1为隐藏
    hide_ring = 0,                      % 是否隐藏戒指时装，1为隐藏
    suit_id = 0,                        % 当前装备全套的套装ID
    stren7_num = 0,                     % 当前身上装备加7以上的装备数量
    goods_pid,                          % 物品模块进程Pid
    body_effect = 0,                    % 身上光效
    feet_effect = 0,                    % 脚上光效
    online_gift = 0,                        %	[待删] 	当前在线礼包
    online_gift_time = 0                %	[待删] 	当前在线礼包生成时间
}).


-record(status_guild,
{
    guild_id = 0,                       % 军团ID
    guild_name = [],                    % 军团名称
    guild_lv = 0,                       % 军团等级
    guild_position = 0,                 % 军团职位
    donate_total = 0,                    % 军团贡献度
    guild_quit_lasttime = 0,            % 军团上次退出时间
    guild_quit_num = 0                 % 军团退出次数
}).


-record(status_vip, {
    vip_type = 0,                       % VIP类型：0非vip、1黄金vip、2白金vip、3砖石vip
    vip_end_time = 0,                   % VIP到期时间
    vip_bag_flag = [],                  % vip回馈礼包标志位
    growth_exp = 0,                     % vip成长经验
    growth_lv = 0,                      % vip成长等级
    login_num = 0,                      % 本周连续登录天数
    get_award = 0                       % 是否已领取周礼包 0.未领取 1.已领取
}).

-record(status_sell, {
    sell_status = 0,                    % 点对点交易状态，1 交易中、3 锁定、4 确认、5 完成
    sell_id = 0,                        % 交易者ID
    sell_list = []                      % 玩家出售列表 - [{物品ID，价格类型，单价}，...],
}).

-record(status_pk, {
    pk_status = 0,                      % pk状态：和平模式 0，全体模式 1， 国家模式 2， 军团模式 3，队伍模式 4， 善恶模式 5，阵营模式 6
    pk_status_change_time = 0,          % 上次PK状态切换时间
    pk_value = 0,                       % 玩家pk值(白名:[0,100]，黄名:(100-200]，红名:200+)
    pk_value_reflesh_time = 0,
    old_pk_status = 0                    % 上次切换的PK状态
}).

-record(status_chengjiu, {                    % 待删除，旧代码有使用，暂留，后面再删
    chengjiu_attribute = [],              % 成就加成属性列表
    genius = 0,                         % 文采值
    honour = 0,                         % 荣誉
    king_honour = 0,                    % 帝王谷荣誉
    achieved_name_list = [],            % 称号
    fix_chengjiu = 0                    % 修复成就，1为已修复，0为未修复
}).

-record(status_achieve, {
    id = 0                            % 玩家id
}).

-record(status_pet_refresh_skill, {
    lucky = 0,                %幸运值
    bless = 0,                %祝福值
    refresh_list = [],            %[{物品类型ID,绑定状态}...]
    bgold = 0,                %使用绑定元宝数
    gold = 0                %使用非绑元宝数
}).

%% 玩家宠物
-record(status_pet,{
        pet_id = 0,                         % 宠物ID
        pet_figure = 0,                     % 宠物形象(1、成长阶段1，2、成长阶段2,3、成长阶段3)
        pet_name = [],                      % 宠物名称
        pet_level = 0,                      % 宠物级别
		    pet_nimbus = 0,						% 光环，暂时没用
        pet_aptitude = 0,                   % 宠物资质
        pet_attribute=[],                   % 宠物基础属性[forze,dexterous,endurance,thew]
		    pet_num = 0,						% 拥有的宠物个数
        pet_capacity = 0,                   % 宠物栏个数
        pet_rename_num = 0,                 % 宠物改名次数
        pet_rename_lasttime = 0             % 宠物改名最后时间            
    }).


%% 玩家坐骑
-record(status_mount, {
    mount = 0,                          % 坐骑ID
    mount_figure = 0,                   % 坐骑形像
    mount_speed = 0,                    % 坐骑速度
    mount_lim = 0,                      % 坐骑栏数量
    mount_attribute = [],               % 坐骑加成属性列表
    fly_mount = 0,
    fly_mount_speed = 0,
    fly = 0,                            % 飞行形象
    flyer = 0,                          % 飞行器
    mount_dict,                         % 坐骑字典
    change_dict                         % 幻化

}).
%% 飞行器属性
-record(status_flyer, {
    base_attr = [],            %基础属性
    train_attr = [],            %训练属性
    star_attr = [],            %星星属性
    speed = 0,            %飞行器速度
    figure = 0,            %飞行器形象
    sky_figure = 0,        %九重天形象
    convergence_attr = []        %九星连珠属性加成
}).

-record(status_skill, {
    skill_attribute = #attribute{},                %
    ext_skill_flag = 0,                  % 扩展技能标志
    skill_list = [],                     % 技能列表     = [{id1, lv1}, {id2, lv2}...]
    medal_skill = [],                    % 勋章技能列表 = [{id1, lv1}, {id2, lv2}...]
    pa_skill_buff = [],                  % 被动加成技能
    buff_attribute = [0, 0, 0, 0],       % Buff属性[hp_lim, mp_lim, hp_lim(百分比), mp_lim(百分比)]
    skill_cd = []
}).

-record(status_fcm, {
    fcm_online_time = 0,                % 防沉迷累计在线时间
    fcm_offline_time = 0,               % 防沉迷累计离线时间
    fcm_last_notify_time = 0,           % 防沉迷通知的上次发送时间
    fcm_state = 0,                      % 防沉迷状态：0健康（正常），1疲劳（收益减半），2不健康（收益为0）
    fcm_last_login_time = 0,            % 最近登录时间
    fcm_write_state = 0,                % 本地是否有数据
    fcm_name = <<>>,                    % 注册姓名
    fcm_id_card_no = <<>>               % 注册身份证
}).

%% 气血包
-record(status_hp, {
    hp_reply = [],                      % 气血回复：[物品类型，单次回复量, 剩余量, 上次回复时间]
    mp_reply = [],                      % 内力回复：[物品类型，单次回复量, 剩余量, 上次回复时间]
    hp_bag = 0,                         % 气血包
    mp_bag = 0,                         % 内力包
    hp_bag_time = 0,                    % 气血包上次回复时间
    mp_bag_time = 0,                    % 内力包上次回复时间
    hp_bag_reply = [],                  % 新气血包 [物品类型ID，单次回复量, 剩余量, 上次回复时间]
    mp_bag_reply = []                   % 新内力包 [物品类型ID，单次回复量, 剩余量, 上次回复时间]
}).

-record(status_sit, {
    sit_down = 0,                       % 打坐，值大于0表示在打坐中，1打坐，2双修
    sit_hp_time = 0,                    % 打坐回血时间
    sit_exp_time = 0,                   % 打坐加经验时间
    sit_llpt_time = 0,                  % 打坐加历练时间
    sit_intimacy_time = 0,              % 打坐加亲密度时间
    sit_role = 0,                       % 双修角色ID
    sit_role_figure = 0,            % 双修角色形象
    sit_role_pid = 0            % 双修角色pid
}).

%% 黄金沙滩
-record(status_hotspring, {
    timerange,            % 活动时间
    lasttime = 0,            % 最后计算收益时间戳
    exittime = 0,            % 最后退出温泉时间戳
    interacttime = 0,        % 最后互动时间戳
    charm_num1 = [],        % 当天前几次恶搞人列表
    charm_num2 = []        % 当天前几次示好人列表
}).


%% 蝴蝶谷
-record(player_butterfly, {
    room = 0,                            %% 房间id
    weekrange = [],                        %% 活动周期
    timerange = [{0, 0}, {0, 0}],        %% 活动开始结束时间
    speed = 0,                            %% 进入蝴蝶谷之前的速度
    score,                                %% 当前积分，默认为undefined，用于判断是否已经初始化
    exp = 0,                            %% 已经获得经验
    llpt = 0,                            %% 已经获得历练
    get_stat = [],                        %% 捕到的蝴蝶列表，格式如：[{蝴蝶id, 蝴蝶数量},...]
    step_award = [],                    %% 领取阶段奖励，格式如：[1,3]
    score_award = 0,                    %% 是否翻过牌，1是，0否
    exittime = 0,                        %% 退出场景时间
    login_day = 0                        %% 当天0点时间戳
}).

%% 记录玩家操作时间，一般可用于判断是否操作过快或其他
-record(status_opt_time, {
    newer_card = 0,                    %% 领取新手卡奖励操作
    card = 0                                %% 通过卡号领取奖励
}).

%% 目标
-record(status_target, {
    id = 0
}).

%% 活跃度
-record(status_active, {
    id = 0
}).

%% 各种活动数据（推荐都放在这里）
-record(status_activity, {
    level_forward                        %% 等级向前冲
}).

%%好友祝福
-record(status_bless, {
    id = 0,
    bless_exp = 0,                       %%经验瓶储存经验
    bless_llpt = 0,                       %%经验瓶储存历练声望
    bless_is_exchange = 0,               %%是否已经兑换
    bless_send = 0,                       %%当天好友祝福发送次数
    bless_friend_used = 0,               %(0:未使用过  1:22使用过  2:29使用过  3:33使用过 )
    bless_send_last_time = "2012-6-1",       %%最后一次发送祝福日期
    bless_accept = dict:new()          %%接受祝福的次数 Key-等级 Value-次数
}).

%%竞技场状态
-record(status_arena, {
    id = 0,                                %玩家ID
    arena_room_lv = 0,
    arena_room_id = 0,
    arena_score_total = 0,                %竞技场总积分
    arena_score_used = 0,                %兑换所用掉的积分
    arena_score_week = 0,                    %竞技场周积分
    arena_score_day = 0,                    %竞技场日积分
    arena_kill_week = 0,                    %竞技场周杀人次数
    arena_kill_day = 0,                    %竞技场日杀人数
    arena_killed_total = 0,                %总被杀次数
    arena_max_continuous_kill_week = 0,    %竞技场周最高连斩数
    arena_max_continuous_kill_day = 0,    %竞技场日最高连斩数
    arena_join_total = 0,                %参与总次数
    arena_last_time = 0                    %竞技场最后一次更新时间
}).

%% 个人帮战积分
-record(status_factionwar, {
    id = 0,                %玩家ID
    war_score = 0,            %个人帮战战功
    war_score_used = 0,     %个人帮战
    war_last_score = 0,        %个人上场帮战战功
    last_kill_num = 0,        %上次帮战杀人记录
    war_add_num = 0,        %参加帮战次数
    war_last_time = 0        %上次参赛时间
}).

%% 个人蟠桃园积分
-record(status_peach, {
    id = 0,                    %玩家ID
    total_score = 0,            %历史总积分
    score = 0,                    %上一场积分
    acquisition = 0,            %上一场采集所得分
    plunder = 0,                %上一场掠夺所得分
    robbed = 0,                    %上一场被抢分
    last_time = 0                %上次参赛时间
}).


%% 个人跨服1v1积分
-record(status_kf_1v1, {
    id = 0,                    %玩家Id
    loop = 0,                %总参与轮次
    win_loop = 0,            %总胜利次数
    hp = 0,                    %总剩余血量
    pt = 0,                    %总声望，注：3v3共用该值
    score = 0,                %总积分，注：3v3共用该值
    loop_week = 0,            %周总参与次数
    win_loop_week = 0,        %周总胜利次数
    hp_week = 0,            %周总剩余血量
    score_week = 0,        %周积分，注：3v3共用该值
    loop_day = 0,            %天总参与轮次
    win_loop_day = 0,        %天总胜利次数
    hp_day = 0,                %天总剩余血量
    score_day = 0,            %日积分，注：3v3共用该值
    last_time = 0            %最后一次参与时间
}).


%% 活动消费返礼
-record(status_consumption, {
    uid = 0,                %玩家ID
    end_time = 0,            %活动结束时间(策划配置活动结束时间)
    eqout_taobao = 0,        %消费额度_淘宝
    times_taobao = 0,        %消费次数_淘宝
    eqout_shangcheng = 0,   %消费额度_商城
    times_shangcheng = 0,    %消费次数_商城
    eqout_petcz = 0,        %消费额度_宠物成长
    times_petcz = 0,        %消费次数_宠物成长
    eqout_petqn = 0,        %消费额度_宠物潜能
    times_petqn = 0,        %消费次数_宠物潜能
    eqout_smsx = 0,        %消费额度_神秘刷新
    times_smsx = 0,            %消费次数_神秘刷新
    eqout_smgm = 0,        %消费额度_神秘购买
    times_smgm = 0,            %消费次数_神秘购买
    eqout_petjn = 0,        %消费额度_宠物技能
    times_petjn = 0,        %消费次数_宠物技能
    eqout_cmsd = 0,        %消费额度_财迷商店
    times_cmsd = 0,            %消费次数_财迷商店
    gift = "",                %已领取奖励
    repeat_count = 0         %重复礼包领取次数
}).

%% 翻牌礼品数量
-record(status_card, {
    peach_gift_num = 0            %%蟠桃礼品1的数量
}).


%% 结婚任务
-record(marriage_task, {
    id = 0,
    male_id = 0,
    female_id = 0,
    app_begin = 0,  % 已完成情缘次数
    task_flag = 1,  % 是否已完成情比金坚任务 1.没有该任务，2.未领取定情信物，3.已领取定情信物，4.已上交定情信物，未完成任务
    task_type = 0,  % 任务类型 1.998 2.3000 3.6000
    finish_task = 0      % 是否已完成结婚任务
}).

%% 结婚信息
-record(status_marriage, {
    id = 0,
    parner_id = 0,       % 伴侣ID
    parner_name = "",    % 伴侣姓名
    register_time = 0,   % 注册时间
    wedding_time = 0,    % 婚宴时间
    cruise_time = 0,     % 巡游时间
    task = #marriage_task{},   % 结婚任务
    is_cruise = 0,       % 是否在巡游状态 0.否 1.是
    divorce = 0,         % 是否已离婚
    divorce_state = 0    % 是否离婚状态 0.否 1.是
}).

%% 夫妻技能
-record(couple_skill, {
    id_1 = 0,  % 技能1Id
    lv_1 = 0,   % 级别
    cd_1 = 0,   % 开始记cd时间
    id_2 = 0,  % 技能2Id
    lv_2 = 0,   % 级别
    cd_2 = 0    % 开始记cd时间
}).
%%记录用户一些常用信息
-record(player_status, {
    skill = #status_skill{},                %% 技能
    goods = #status_goods{},            %% 物品
    guild = #status_guild{},                %% 军团
    vip = #status_vip{},                    %% VIP
    sell = #status_sell{},                %% 交易
    pk = #status_pk{},                    %% PK
    bless = #status_bless{},                %% 好友祝福
    chengjiu = #status_chengjiu{},        %% (待删，旧代码有使用到，暂留，后面再删除)成就
    achieve = #status_achieve{},            %% 成就
    achieve_arr = 0,                    %% 成就影响的血量
    designation = [],                    %% 称号
    pet = #status_pet{},                %% 宠物
    pet_refresh_skill = #status_pet_refresh_skill{}, % 宠物技能刷新
    unreal_figure_activate = [],                % 宠物幻化形象激活列表[#pet_avtivate_figure{},...]
    pet_figure_value = 0,                    % 宠物幻化值，排行榜用
    mount = #status_mount{},            %% 坐骑
    flyer_attr = #status_flyer{},            %飞行器属性加成
    fcm = #status_fcm{},                %% 防沉迷
    hp_bag = #status_hp{},                %% 气血
    sit = #status_sit{},                    %% 打坐
    id = 0,                                            % 用户ID
    accname = [],                        % 平台账号
    nickname = [],                    % 玩家名
    c_rename = 0,                        % 是否可以改名，0不可以，1可以
    last_login_time = 0,                % 最后登陆时间
    sex = 0,                            % 性别 1男 2女
    realm = 0,                        % 阵营
    platform = "",                      % 平台标示
    server_num = 0,                     % 所在的服标示
    llpt = 0,                            % 历练声望
    xwpt = 0,                            % 修为声望
    cjpt = 0,                            % 成就声望（成就点）
    fbpt = 0,                            % 副本声望
    fbpt2 = 0,                            % 副本声望2
    bppt = 0,                            % 军团声望
    gjpt = 0,                            % 国家声望
    whpt = 0,                            % 武魂声望
    mlpt = 0,                            % 魅力声望
    prestige = 0,                    %声望
    experience = 0,                    %阅历
    career = 0,                        % 职业
    jobs = 0,                            % 职位
    lv = 1,                            % 等级
    gm = 0,                            % 是否GM
    gold = 0,                            % 元宝
    bgold = 0,                        % 绑定元宝
    coin = 0,                            % 铜钱
    bcoin = 0,                        % 绑定铜钱
    scene = 0,                        % 场景id
    copy_id = 0,                        % 同一场景不同房间标示（可以数字，字符串任意）
    y = 0,
    x = 0,
    scene_old = 102,                    % 上一次场景id
    copy_id_old = 0,                    % 上一次同一场景不同房间标示（可以数字，字符串任意）
    y_old = 114,
    x_old = 135,
    hp = 200,
    hp_lim = 200,
    mp = 50,
    mp_lim = 50,
    anger = 0,
    anger_lim = 0,
    socket,                            % socket
    pid = none,                        % 玩家服务进程
    tid = none,                        % 任务进程id
    unite_pid = none,                    % 公共线mod_unite进程
    forza = 5,                            % 力量
    agile = 5,                            % 身法
    wit = 5,                            % 灵力
    thew = 5,                            % 体质
    att = 1,                            % 攻击
    def = 100,                        % 防御
    hit = 1,                            % 命中率
    dodge = 1,                        % 躲避
    crit = 5,                            % 暴击
    ten = 10,                            % 坚韧
    broken = 1,                            % 破击
    unbroken = 1,                        % 抗破
    hurt_add_num = 0,                   %% 伤害加深系数
    hurt_del_num = 0,                   %% 伤害减免系数
    combat_power = 0,                % 战斗力
    base_attribute = [],                % 基础一级属性[力量, 身法, 灵力, 体质]
    att_area = 1,                       % 攻击距离
    att_speed = 800,                    % 攻击速度
    speed = 0,                          % 移动速度
    base_speed = 160,                   % 基础移动速度
    exp = 0,
    exp_lim = 0,
    talk_lim = 0,                       % 禁言，0为正常，1为禁言
    talk_lim_time = 0,                  % 禁言截止时间
    talk_lim_right = 0,                 % 禁言权限 0无权限,1有权限
    quickbar = [],                      % 快捷栏
    pid_team = 0,                       % 组队进程
    pid_dungeon_data = 0,               % 副本数据管理进程
    cell_num = 0,                       % 背包格子数
    storage_num = 12,                   % 仓库格子数
    battle_status = [],                 % 战斗状态
    ex_battle_status = [],              % 额外技能战斗状态(宠物等)
    unmove_time = 0,                    % 不能移动的结束时刻
    point = 0,                          % 返利的积分
    figure = 0,                         % 玩家变身形象
    qiling = 0,                         % 器灵形象
    buff_attribute = #attribute{},                  % 加成属性
    is_pra = 0,                         % 玩家是否在离线修炼中
    box_bag = null,                     % 宝箱包裹
    group = 0,                          % 战斗分组
    kf_teamid = 0,                % 跨服3v3自已构造的队伍id
    honour = 0,                         % 荣誉
    online_flag = 0,
    image = 0,
    leader = 0,                            % 是否队长
    greeting_acc_exp = 0,                % 好友祝福累积经验
    greeting_acc_llpt = 0,                % 好友祝福累积历练声望
    is_pay = false,                     % 是否有充值，true为有充值
    reg_time = 0,
    sid = {},
    physical = 0,                        % 体力
    player_meridian,                    % 经脉系统
    sit_time_left,                        % 离线打坐时间
    sit_time_today = 0,                % 打坐修炼时间
    hotspring = #status_hotspring{},    % 温泉
    att_protected = 0,                    % 复活攻击保护时间(5秒)
    last_logout_time = 0,                % 上一次退出游戏时间(unixtime，秒)
    offline_time = 0,                    % 离线挂机时间(小时)
    online_award = [],                    % 在线倒计时奖励
    status_active,
    butterfly = #player_butterfly{},    % 蝴蝶谷
    eb_next_ref_time = 0,                % 皇榜任务下次刷新时间
    opt_time = #status_opt_time{},        % 记录玩家操作时间，一般可用于判断是否操作过快或其他
    status_target,                        % 目标状态
    change_scene_sign = 0,              % 排队换线标志
    activity = #status_activity{},    % 活动相关数据（推荐都放在这里）
    war_end_time = 0,                    % 帮战、竞技场进入时间戳
    wubianhai_buff = [0, 0, 0],            % 南天门保底Buff  [HpLim, Hp, Att]   [气血上限, 气血, 攻击]
    arena = #status_arena{},            % 竞技场状态
    factionwar = #status_factionwar{},  % 帮战状态
    factionwar_stone = 0,               % 身上是否带有军团水晶(0:没带,1:有)
    factionwar_option = [],             % 带有水晶时同时要写上的状态列表
    peach = #status_peach{},            % 蟠桃园状态
    peach_num = 0,                        % 供蟠桃园即时数目(场景广播)
    kf_1v1 = #status_kf_1v1{},        % 跨服1v1
    change_dict = [],                   % 形象转换字典
    wardrobe = [],                      % 衣橱
    exchange_dict = [],                 % 宝箱兑换字典
    parner_id = 0,                      % 伴侣ID
    dailypid = none,                    % 玩家日常进程
    loverun_data = [],                  % 爱情长跑记录的数据(开始小时，开始分钟，结束小时，结束分钟，报名时长)
    loverun_state = 1,                  % 爱情长跑状态 1.未领取 2.已领取未提交 3.已提交
    consumption = #status_consumption{},    % 活动消费返礼,
    wubianhai_time = [],                % 南天门活动时间(开始小时，开始分钟，结束小时，结束分钟)
    all_multiple_data = [],                %所有双倍经验配置数据
    card = #status_card{},            % 翻牌礼品
    server_id = 0,                      % 玩家所在服
    marriage = #status_marriage{},      % 结婚信息
    temp_dict = [],
    player_xianyuan,                    % 仙缘系统
    fame_limit = [],                    % 限时名人堂（活动）
    mergetime = 0,                      % 合服时间，0表示不是合服的区，时间戳即在后台点击开启合服活动使用的时间
    cp_skill = #couple_skill{},            % 夫妻技能
    guild_rela = {[], []},                % 军团关系
    special_image = [],                 % 特殊头像
    hightest_combat_power = 0,          % 历史最高战斗力
    visible = 0,                        % 可见性
    world_level = {0, 0},                % 经验加成{世界等级, 更新时间}
    sys_conf = [],                      % 玩家配置
    city_war_revive_place = [],         % 攻城战复活点
    city_war_exp_buff = [0, 0],         % [领取周，是否已领取]
    city_war_win_num = 0,               % 攻城战连续获胜次数
    off_line_award = [],                % 离线奖励信息列表
    player_buff = []                     % 玩家身上的BUFF
}).

-record(player_status_appointment, {
    id = 0,
    pid = 0,                            % 玩家进程
    sid = {},                            % 发送进程
    sex = 0,
    lv = 0,
    nickname = 0,
    realm = 0,
    career = 0
}).

-record(player_status_sit, {
    mount = 0,
    copy_id = 0,
    scene = 0,                            % 场景id
    y = 0,
    x = 0,
    id = 0,
    sit = #status_sit{},
    pid = 0,                                % 玩家进程
    sid = {},                                % 发送进程
    sex = 0,
    lv = 0,
    nickname = 0,
    realm = 0,
    career = 0,
    figure = 0
}).


-record(player_status_unite, {
    id = 0,
    platform = "",
    server_num = 0,
    name = [],                          % 角色名
    sex = 0,                            % 性别
    lv = 0,                             % 等级
    scene = 0,                          % 场景
    realm = 0,                          % 阵营
    career = 0,                         % 职业
    guild_id = 0,                       % 军团
    guild_name = [],                    % 军团名称
    guild_position = 0,                 % 军团地位
    image = 0,                          % 头像
    last_login_time = 0,                 % 最后登录时间
    gm = 0,
    vip = 0,
    dailypid = none                     % 玩家日常进程
}).

%% 各职业选择情况表
-record(career_count, {sj = 0, tz = 0, ls = 0}).
