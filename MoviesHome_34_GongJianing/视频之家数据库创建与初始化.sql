create database movies;
go
use movies;  --打开数据库
go
create table types 
( id int identity(1,1) primary key,
  tname varchar(50) not null
);
go
create table movielist
(
  id int identity(1,1) primary key,
  mname varchar(100) not null,
  maker varchar(50),
  url varchar(100),
  img varchar(100),
  playtimes int default(0),
  isrecommend bit default(0),
  onlinetime datetime,
  breif text,
  tid int,
  constraint movielist_types_fk foreign key(tid) references types(id)
);
go
--初始化数据
--类别表数据初始化
insert into types values('喜剧');
insert into types values('爱情');
insert into types values('科幻');
insert into types values('伦理');
insert into types values('惊悚');
insert into types values('动作');
--影片列表数据初始化
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('夏洛特烦恼','jan','movies/hu.mp4','images/movies/xltfn.png',187,0,'2015-12-13 12:12:00','昔日校花秋雅的婚礼正在隆重举行，学生时代暗恋秋雅的夏洛看着周围事业成功的老同学，心中泛起酸味，借着七分醉意',1);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('我是证人','Tom','movies/hu.mp4','images/movies/wszr.png',99,0,'2015-12-12 12:12:00','见习女警因自己的失误，亲眼目睹了弟弟的死亡，自己也双目失明。也许是失明刺激了其它感官的活跃',2);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('第三种爱情','jan','movies/hu.mp4','images/movies/dszaq.png',97,0,'2015-12-14 12:12:00','失婚女律师邹雨在回程的飞机上失声痛哭，引来邻座林启正的注意。回家后发现妹妹邹月因单恋致林集团二公子',2);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('小黄人大眼萌','Marry','movies/hu.mp4','images/movies/xhrdym.png',89,0,'2015-12-13 12:12:00','从地球诞生之初，一种奇怪的生物便出现在这颗蓝色的星球上。他们不断进化、蜕变，终于成为我们所熟悉',1);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('有种你爱我','jan','movies/hu.mp4','images/movies/yznaw.png',87,1,'2015-12-13 12:12:00','建筑师左小欣渴望拥有一个只有孩子没有男人的“幸福生活”，机缘巧合结识了人气主持人査义。查义对左小欣颇有好感，却未料到“左小欣”只想要个孩子，两人生下非婚子左松松。为科学抚养，在孩子周岁时，左小欣通知了査义，此刻他才明白自己成了。。。',2);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('小时代3：剌金时代','jan','movies/hu.mp4','images/movies/xsd3.png',87,1,'2015-12-13 12:12:00','《小时代3.0刺金时代》继续讲述林萧、顾里、南湘、唐宛如四位主角，以及顾准、简溪、顾源、宫洺、周崇光、Neil、卫海……这一群人，他们挥手作别青葱校园，日益融入生活的滚滚洪流之中的迷失、怅惘、怀念却又不能不勇往直前的故事。',1);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('疯狂外星人','jan','movies/hu.mp4','images/movies/fkwxr.png',87,1,'2015-12-13 12:12:00','可爱的外星人小欧与他的同伴波波星人一直在寻找一个适宜他们居住的地方，在一次次的尝试并且失败之后，他们登陆了地球并且将地球上的人类进行了转移。因为一个意外，小欧成为了波波星人的全体通缉目标。在逃亡中他遇到了热爱冒险的地球女孩。',1);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('澳门风云2','jan','movies/hu.mp4','images/movies/amfy2.png',87,1,'2015-12-13 12:12:00','闻名赌坛的“魔术手”石一坚在参加好友龙叔的海上生日派对时，突遭来路不明的女杀手伏击，后得知她们受旧敌D.O.A组织派来灭口，而她们的目标不仅是杀死石一坚，更要捉拿携组织一百五十亿美元资金潜逃的会计小马。 为保护小马及粉碎D.O.A的阴谋。',1);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('万万没想到','jan','movies/hu.mp4','images/movies/wwnxd.png',87,0,'2015-12-15 12:18:00','屌丝小妖王大锤，他生来便与常人不同，两耳尖尖，又有些小法力，总是自诩本地妖王。但让他万万没想到的是，在遇到唐僧师徒四人组后，他的命运发生了逆转，而对于唐僧师徒四人组来说，遇见王大锤也是无比郁闷的第八十二难。双方因此上演了一出相爱相杀，令人捧腹的奇幻冒险。',5);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('消失的爱人','jan','movies/hu.mp4','images/movies/xsdar.png',87,0,'2015-12-16 12:12:00','改编自吉莉安·弗琳的同名小说，由大卫·芬奇执导，本·阿弗莱克 、罗莎曼德·派克、尼尔·帕特里克·哈里斯等主演的悬疑惊悚电影。该片讲述了平凡又恩爱的一对夫妻，突然有一天妻子却消失不见，丈夫通过各种方式疯狂寻找，然而在妻子留下的一本日记中却发现，种种线索都表明是丈夫将妻子杀害。',5);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('探灵档案','jan','movies/hu.mp4','images/movies/tlda.png',87,0,'2015-12-15 12:12:00','曾经是“盲点侦探”的房产中介陈博涵，被突然出现的刘欣媛打破了原本平静的生活。原来这个地方流传着一个传说，午夜穿过港湾广场的人可以看到另一个世界。而因为好奇心作祟，刘欣媛和几个闺蜜夜探港湾广场后，居然在家里看到自己死去多年的父亲的身影，于是找到陈博涵寻求帮助',5);
insert into movielist(mname,maker,url,img,playtimes,isrecommend,onlinetime,breif,tid)
values('摩卡行动','jan','movies/hu.mp4','images/movies/mkxd.png',87,0,'2015-12-17 12:12:00','年大治由于网络运作天赋异禀，成为平民特工。孤儿院青梅竹马孟小玲嫌贫爱富，跟随富二代杜豪金前往意大利疯狂购物，杜豪金一掷千金想要收购世博老街，却遭当地人民激烈反对。黑帮蓄谋利用小玲套出杜氏财产密码雇佣黑客设局敛财，大治为追回小玲、侦破大案同赴异国。 富豪李正华受国际刑警之托，通过拯救当地球队成',6);


select * from types;
select * from movielist;